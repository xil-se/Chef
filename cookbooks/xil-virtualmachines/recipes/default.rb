#nspawn "mymachine" do
#  action :start
#  server_template "arch1"
#  temporary true
#end

#nspawn "mymachine2" do
#  action :start
#  server_template "arch1"
#end


node['xil']['virtualmachines'].each do |n,v|
  directory "/var/lib/machines/guest-config/#{n}/network/" do
    owner 'root'
    group 'root'
    mode '0755'
    recursive true
    action :create
  end

  template "/var/lib/machines/guest-config/#{n}/network/wired.conf" do
    source 'wired.conf.erb'
    owner 'root'
    group 'root'
    mode '0644'
    variables(v)
  end

  if v["ensure"] == "running"
    nspawn n do
      action :start
      server_template v["template"]
      temporary v["temporary"]
    end
  end
end


