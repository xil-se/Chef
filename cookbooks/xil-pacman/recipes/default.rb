template '/etc/pacman.conf' do
  source 'pacman.conf.erb'
  owner 'root'
  group 'root'
  mode '0755'
  notifies :run, 'execute[pacman-update]', :immediately
end

execute 'pacman-update' do
  command 'pacman -Syy'
  action :nothing
end


