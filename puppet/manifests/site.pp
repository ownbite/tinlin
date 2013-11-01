
node default {
	
	# Exceute the apt-update command
	exec { "apt-update":
		command => "/usr/bin/apt-get update"
	}
	
	# Apt-update will run before any package
	Exec["apt-update"] -> Package <| |>

	# Install the default packages
	package { ["sudo", "wget", "htop", "screen", "vim-common", "git", "vim", "unzip"]:
		ensure => "present",
	}

	# Make sure that the main user vagrant is present and belongs to the group www-data
	user { "vagrant":
		ensure => "present",
		groups => ["www-data"]
	}

}

node "tinlin.se" inherits default {
	class { "webb": }

	Package[["sudo", "wget", "htop", "screen", "vim-common", "git", "vim", "unzip"]] -> User["vagrant"] -> Class["webb"]
}






               
