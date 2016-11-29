cookbook_file "/usr/share/slim/themes/default/background.jpg" do
	source "logo.png"
	notifies :restart, 'service[slim]'
end


service "slim" do
	action [ :enable, :start ]
end

