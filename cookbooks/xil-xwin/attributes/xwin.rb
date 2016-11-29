default['pacman']['packages'].merge!({
	"xf86-input-synaptics" => "upgrade", 
	"xf86-video-vesa" => "upgrade",
	"xorg-font-util" => "upgrade",
	"xorg-server" => "upgrade",
	"xorg-server-utils" => "upgrade",
	"xorg-xinit" => "upgrade",
	"slim" => "upgrade",
        "i3-wm" => "upgrade",
        "dmenu" => "upgrade",
        "i3status" => "upgrade",
        "notion" => "upgrade",
        "xfwm4" => "upgrade",
	"xterm" => "upgrade"
})
