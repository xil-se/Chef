nspawn "mymachine" do
  action :start
  server_template "arch1"
  temporary true
end

nspawn "mymachine2" do
  action :start
  server_template "arch1"
end

