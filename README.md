# Chef cookbooks for the xil-team
## Filesystem
We're using https://github.com/One-com/running_sushi for delivery from git to chef.

We use the following folder structure:

	...
	|-- {nodes, clients}
	|   |-- pod1 ex. vps1
	|   |   |-- server1.phy.vps.xil.se
	|   |   `-- server1.vrt.vps.xil.se
	|   `-- pod2 ex. dev1
	|       |-- server1.phy.dev1.xil.se
	|
	...



All cookbooks end up on all chef servers and are located in the cookbooks folder.


You can find full delivery doc. on https://github.com/One-com/running_sushi/blob/master/README.md
