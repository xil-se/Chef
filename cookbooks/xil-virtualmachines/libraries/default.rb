require 'chef/resource'
require 'dbus'
class Chef
  class Resource
    class  Nspawn < Chef::Resource

      def initialize(name, run_context=nil)
        super

        #DBUS CRAP ----------------------------
        @resource_name = :nspawn          # Bind ourselves to the name with an underscore
        @provider = Chef::Provider::Nspawn # We need to tie to our provider
        @action = :enable                      # Default Action Goes here
        @allowed_actions = [:start, :stop, :kill]


        @sysbus = DBus.system_bus
        @s   = @sysbus["org.freedesktop.machine1"]
        @o   = @s.object("/org/freedesktop/machine1")
        @o.introspect


        @ssm = @sysbus["org.freedesktop.systemd1"]
        @osm = @ssm.object("/org/freedesktop/systemd1")
        @osm.introspect


        @machine_manager = @o["org.freedesktop.machine1.Manager"]
        @systemd_manager = @osm['org.freedesktop.systemd1.Manager']
        #END OF DBUSCRAP------------------------


        @server_template = nil
        @ip = nil
        @forward = nil
        @temporary = false
      end

      def temporary(arg = nil)
        set_or_return(:temporary, arg, :kind_of => [TrueClass, FalseClass])
      end

      def server_template(arg = nil)
        set_or_return(:server_template, arg, :kind_of => String)
      end

      def ip(arg = nil)
        set_or_return(:ip, arg, :kind_of => String)
      end

      def forward(arg = nil)
        set_or_return(:forward, arg, :kind_of => String)
      end

      def machine_manager(arg = nil)
        set_or_return(:machine_manager, arg, :kind_of => :Dbus)
      end

      def systemd_manager(arg = nil)
        set_or_return(:systemd_manager, arg, :kind_of => :Dbus)
      end

      def start(args=nil)
        set_or_return(:start, arg, :kind_of => String)
      end

    end
  end
end
