node.default['xil_users']['groups'].merge!({
	"xiladmin" => {
		"gid" => 2000
	}
})

admin_groups = ["uucp", "adm", "disk", "audio", "network", "video"]

node.default['xil_users']['users'].merge!({
	"simon" => {
		"uid"=> 3000,
		"gid"=> 3000,
		"shell"=>"/bin/bash",
		"comment" => "Leet haxxor",		
		"wm" => "i3",
		"sudo" => true,
		"groups" => admin_groups,
		"password" => "$1$xyz$X11iz6ox24iPDed6detyU.",
	},
	"frazz" => {
		"uid"=> 3001,
		"gid"=> 3001,
		"shell"=>"/bin/zsh",
		"comment" => "Leet haxxor",		
		"wm" => "notion",
		"groups" => admin_groups,
		"password" => "$1$xyz$X11iz6ox24iPDed6detyU.",
	},
	"konrad" => {
		"uid"=> 3002,
		"gid"=> 3002,
		"shell"=>"/bin/zsh",
		"comment" => "Leet haxxor as well",		
		"wm" => "startxfce4",
		"groups" => admin_groups,
		"password" => "$1$xyz$X11iz6ox24iPDed6detyU.",
		"dotgit" => "https://github.com/kbeckmann/config.git",

	},
	"david" => {
		"uid"=> 3003,
		"gid"=> 3003,
		"shell"=>"/bin/zsh",
		"comment" => "Leet haxxor",		
		"wm" => "i3",
		"groups" => admin_groups,
		"password" => "$1$xyz$X11iz6ox24iPDed6detyU.",
	},
})
