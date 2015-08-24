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
  if v["ensure"] == "running"
    nspawn n do
      action :start
      server_template v["template"]
      temporary v["temporary"]
    end
  end
end


