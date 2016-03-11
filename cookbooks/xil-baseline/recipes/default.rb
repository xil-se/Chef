node["packages"].each do |k,v|
	if v == true
		package "#{k}" do
			action :install
		end
	end

end
