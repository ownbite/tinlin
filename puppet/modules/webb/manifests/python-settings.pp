class webb::python-settings(
	$user   			= $webb::params::user,
  	$user_group     	= $webb::params::user_group,
  	$system_paths		= $webb::params::system_paths,
  	$virtenvwrap_workon = $webb::params::virtenvwrap_workon,
  	$project_name	    = $webb::params::project_name,
) inherits webb::params {

	package { "python-software-properties":
		ensure	=> "present"
	}

	exec { "add-python-repo":
		path 		=> $system_paths,
		command 	=> "add-apt-repository ppa:fkrull/deadsnakes",
		require		=> [ Exec["apt-update"], Package["python-software-properties"] ],
		logoutput 	=> on_failure,
	}


	# Install python and pip
	class { "python":
	  version   => "3.3",
	  dev       => true,
	  pip 		=> true,
	  require	=> Exec["add-python-repo"],
	}

	# Install virtualenvwrapper
	exec { "install-virtualenvwrapper":
		path 		=> $system_paths,
		command 	=> "pip install virtualenvwrapper",
		unless 		=> "pip freeze | grep 'virtualenvwrapper'",
		require 	=> [ Class["python"], Package["python-pip"] ],
		logoutput 	=> on_failure,
	}	

	# Set virtualenvwrapper global variable
	file { "/etc/environment":
        content => inline_template("WORKON_HOME='${virtenvwrap_workon}'"),
        require => [ Exec["install-virtualenvwrapper"] ],
    }
	
	# Set ensure that current directory is available
	file { "/home/vagrant/envs":
		ensure 		=> directory,
		owner		=> $user,
		group		=> $user_group,
		require 	=> [ Exec["install-virtualenvwrapper"] ],
	}


}