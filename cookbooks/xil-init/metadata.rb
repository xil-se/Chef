name 'xil-init'
maintainer 'Xil'
maintainer_email 'xil@devsn.se'
license 'BSD'
version '0.0.1'


%w{
  xil-xwin
  xil-pacman
  xil-users
}.each do |cb|
  depends cb
end
