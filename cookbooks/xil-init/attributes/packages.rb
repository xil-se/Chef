default['pacman']['packages'].merge!({
	"ctags"		=> "upgrade", 
	"vim"		=> "upgrade", 
	"vim-taglist"	=> "upgrade", 
	"tmux"		=> "upgrade", 
	"curl"		=> "upgrade", 
	"wget"		=> "upgrade", 
	"tcpdump"	=> "upgrade", 
	"net-tools"	=> "upgrade", 
	"htop"		=> "upgrade", 
	"screen"	=> "upgrade", 
	"zsh"		=> "upgrade", 
	"rsync"		=> "upgrade", 
	"mtr"		=> "upgrade", 
	"bzip2"		=> "upgrade", 
	"tar"		=> "upgrade", 
	"unzip"		=> "upgrade", 
	"sudo"		=> "upgrade", 
	"openssh"	=> "upgrade",
	"python"	=> "upgrade",
	"python2"	=> "upgrade",
	"pciutils"	=> "upgrade",
	"iproute2"	=> "upgrade",
	"feh"		=> "upgrade",
	"file"		=> "upgrade",
	"btrfs-progs"	=> "upgrade",
	"procps-ng"	=> "upgrade",
	"psmisc"	=> "upgrade",
	"usbutils"	=> "upgrade",
	"git"		=> "upgrade",	
})


# Base devel expanded
default['pacman']['packages'].merge!({
	"autoconf"	=> "upgrade",
	"automake"	=> "upgrade",
	"binutils"	=> "upgrade",
	"bison"		=> "upgrade",
	"fakeroot"	=> "upgrade",
	"file"		=> "upgrade",
	"findutils"	=> "upgrade",
	"flex"		=> "upgrade",
	"gawk"		=> "upgrade",
	"gcc"		=> "upgrade",
	"gettext"	=> "upgrade",
	"grep"		=> "upgrade",
	"groff"		=> "upgrade",
	"gzip"		=> "upgrade",
	"libtool"	=> "upgrade",
	"m4"		=> "upgrade",
	"make"		=> "upgrade",
	"pacman"	=> "upgrade",
	"patch"		=> "upgrade",
	"pkg-config"	=> "upgrade",
	"sed"		=> "upgrade",
	"sudo"		=> "upgrade",
	"texinfo"	=> "upgrade",
	"util-linux"	=> "upgrade",
	"which"		=> "upgrade",
})
