node["packages"].each do |k,v|
	package "#{k}" do
		action :install
	end
end


node["pip_packages"].each do |k,v|
	Chef::Log.warn(k)
	python_pip k
end
