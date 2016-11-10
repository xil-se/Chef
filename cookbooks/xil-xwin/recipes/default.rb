if(node['platform']['arch'] == "arch")
	packages = %w[
		xf86-input-synaptics
		xf86-video-vesa
		xorg-font-util
		xorg-server
		xorg-server-utils
		xorg-xinit 
		slim
		xterm
		i3-wm
		dmenu
		i3status
	]	
end

packages.each do |k|
	package "#{k}" do
		action :install
	end
end

service "slim" do
	action [ :enable, :start ]
end
