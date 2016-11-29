home_basedir = '/home'

node["xil_users"]["users"].each do |user, options|
	
	home_dir = (options['home'] ? options['home'] : "#{home_basedir}/#{user}")
	manage_home = (home_dir == '/dev/null' ? false : true)


	if options["action"] == "remove"
		user "#{user}" do
			action :remove
		end
		next
	end

	group "#{user}" do
		gid options["gid"]
		only_if { options['gid'] && options['gid'].is_a?(Numeric) }
	end

	user "#{user}" do
		uid options["uid"]	
		gid options["gid"] if options["gid"] 
		shell options['shell']
		comment options['comment']
		password options['password'] if options['password']
		salt options['salt'] if options['salt']
		iterations options['iterations'] if options['iterations']
		manage_home manage_home
		home home_dir
		action options['action'] if options['action']
	end
	
	if manage_home 
		Chef::Log.debug("Managing home files for #{user}")
		# Do xinitrc here.


		template "#{home_dir}/.xinitrc" do
			source "xinitrc.erb"
			owner options["uid"]
			group options["gid"] if options["gid"]
			mode '0700'
			variables wm: options['wm']
			only_if { ! options['wm'].nil? }
		end
	end

end
