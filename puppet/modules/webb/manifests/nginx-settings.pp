
class webb::nginx-settings(
	$base_path           = $webb::params::base_path,
	$owner 			     = $webb::params::owner,
	$vagrant_base_path   = $webb::params::vagrant_base_path,

) inherits webb::params {
	
	class { "nginx": }

	file { [ "/etc/nginx/conf.d/default.conf" ]:
		source => "puppet:///modules/webb/default.conf",
	}

	exec { "restart-nginx":
		command => "/etc/init.d/nginx restart",
		user => root,
	}
	
	service { "php5-fpm":
	    ensure => running,
	    enable => true,
	    hasstatus => true,
	    hasrestart => true,
	    subscribe => Exec["restart-nginx"],
	}

	Class["nginx"] -> File["/etc/nginx/conf.d/default.conf"] -> Exec["restart-nginx"]
}