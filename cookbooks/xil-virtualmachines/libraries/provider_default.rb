require 'pp'

class Chef
  class Provider
    class Nspawn < Chef::Provider

      def load_current_resource
        @current_resource ||= Chef::Resource::Nspawn.new(new_resource.name)
        @current_resource

        @current_resource.server_template(new_resource.server_template)
        @current_resource.ip(new_resource.ip)
        @current_resource.forward(new_resource.forward)
        @current_resource.temporary(new_resource.temporary)

      end

      def list_machines
        m = []
        machines =  @current_resource.machine_manager.ListMachines().first
        machines.each do |k|
          m.push(k.first())
        end
        m
      end

      def action_start

        running_machies = list_machines()

        if running_machies.include?(@current_resource.name)
          @new_resource.updated_by_last_action(false)
          return
        end


        if @current_resource.server_template.nil?
          Chef::Application.fatal!("Failed to start #{@current_resource.name}, template missing")
          return
        end

        options = [
                  '/usr/bin/systemd-nspawn',
                  '--quiet',
                  '--keep-unit',
                  '--boot',
                  '--network-bridge=br0',
                  "--machine=#{@current_resource.name}",
                  "--bind-ro=/var/lib/machines/guest-config/#{@current_resource.name}/:/etc/xil.se",
                 ]


        if current_resource.temporary
          extraoptions = [
            "--directory=/var/lib/machines/#{@current_resource.server_template}",
            "-x",
          ]
        else
          extraoptions = [
            "--directory=/var/lib/machines/#{@current_resource.name}",
            "--template=/var/lib/machines/#{@current_resource.server_template}"
          ]
        end





        begin
          path = @current_resource.systemd_manager.StartTransientUnit(
            "systemd-nspawn-#{@current_resource.name}.service",
            'fail',
              [
                ['Type', 'notify'],
                ['ExecStart', DBus.variant('a(sasb)', [[
                  '/usr/bin/systemd-nspawn', options.concat(extraoptions),
                  false]])
                ],
                ['KillMode', 'mixed'],
                ['Delegate', true],
            ],
            [])
          @new_resource.updated_by_last_action(true)

        rescue Exception => e
          Chef::Application.fatal!("Failed to start #{@current_resource.name}, check : systemctl status systemd-nspawn-#{@current_resource.name}.service")
        end

      end

      def action_stop
        running_machies = list_machines()
        if running_machies.include?(@current_resource.name)
          @current_resource.machine_manager.KillMachine(@current_resource.name, "leader", 38)
          #38 = KILLMODE MIN + 4 it seems :D
          @new_resource.updated_by_last_action(true)
        end
      end

      def action_kill
        running_machies = list_machines()
        if running_machies.include?(@current_resource.name)
          @current_resource.machine_manager.TerminateMachine(@current_resource.name)
          @new_resource.updated_by_last_action(true)
        end
      end

    end
  end
end
