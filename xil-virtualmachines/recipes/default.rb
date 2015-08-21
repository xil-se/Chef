


nspawn "mymachine" do
  action :start
  server_template "arch"
  temporary true
end

