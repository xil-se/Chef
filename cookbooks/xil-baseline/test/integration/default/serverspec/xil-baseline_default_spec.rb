require "serverspec"

set :backend, :exec

describe "xil-baseline default" do

  describe command("fixmefixmefixme") do
    it { should return_exit_status 0 }
  end

end
