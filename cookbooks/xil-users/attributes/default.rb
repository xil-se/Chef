node.default['xil_users']['users'].merge!({
	"simon" => {
		"uid"=> 3000,
		"gid"=> 3000,
		"shell"=>"/bin/bash",
		"comment" => "Leet haxxor",		
		#"action" => "remove",
		"wm" => "i3",
		"password" => "$1$xyz$X11iz6ox24iPDed6detyU.",
	},
	"frazz" => {
		"uid"=> 3001,
		"gid"=> 3001,
		"shell"=>"/bin/zsh",
		"comment" => "Leet haxxor",		
		"wm" => "notion",
		"password" => "$1$xyz$X11iz6ox24iPDed6detyU.",
	},
	"konrad" => {
		"uid"=> 3002,
		"gid"=> 3002,
		"shell"=>"/bin/zsh",
		"comment" => "Leet haxxor as well",		
		"wm" => "startxfce4",
		"password" => "$1$xyz$X11iz6ox24iPDed6detyU.",
	}
})
