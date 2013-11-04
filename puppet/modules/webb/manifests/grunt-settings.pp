class webb::grunt-settings(
    $user               = $webb::params::user,
    $user_group         = $webb::params::user_group,
    $system_paths       = $webb::params::system_paths,
    $project_name       = $webb::params::project_name,
) inherits webb::params {


  # Need to install npm
    # apt-get install npm

  # Upgrade to node js 0.8 or larger
    # 1: Check your current version of Node.

    # 1
    # $node -v
    # 2
    # v0.6.12
    # 2: Clear your npm cache

    # 1
    # sudo npm cache clean -f
    # 3: Install ‘n’

    # 1
    # sudo npm install -g n
    # 4: Upgrade to a later version (this step can take a while) You can specify a particular version like so:

    # 1
    # sudo n 0.8.11
    # Or you can just tell the manager to install the latest stable version like so:

    # 1
    # sudo n stable
    # 5: Check the running version of Node to verify that it has worked:

    # 1
    # $node -v
    # 2
    # v0.8.11

  # Install grunt 
    # npm install -g grunt-cli



    # # Packages
    # package { 'curl':
    #   ensure => present,
    # }

    # package { 'python-software-properties':
    #   ensure => present,
    # }

    # package { 'ruby1.9.3':
    #   ensure => present,
    # }


    # # Get node
    # exec { 'add node repo':
    #   command => '/usr/bin/apt-add-repository ppa:chris-lea/node.js && /usr/bin/apt-get update',
    #   require => Package['python-software-properties'],
    # }

    # package { 'nodejs': 
    #   ensure => latest,
    #   require => [Exec['apt-get update'], Exec['add node repo']],
    # }


    # # install npm
    # exec { 'npm':
    #   command => '/usr/bin/curl https://npmjs.org/install.sh | /bin/sh',
    #   require => [Package['nodejs'], Package['curl']],
    #   environment => 'clean=yes',
    # }


    # # install sass
    # exec { 'gem install sass': 
    #   command => '/usr/bin/gem install sass',
    #   require => Package['ruby1.9.3'],
    # }


    # # create symlink to stop node-modules foler breaking
    # exec { 'node-modules symlink': 
    #   command => '/bin/rm -rfv /usr/local/node_modules && /bin/rm -rfv /vagrant/node_modules && /bin/mkdir /usr/local/node_modules && /bin/ln -sf /usr/local/node_modules /vagrant/node_modules ',
    # }


    # # finally install grunt
    # exec { 'npm install -g grunt-cli bower':,
    #   command => '/usr/bin/npm install -g grunt-cli bower',
    #   require => Exec['npm'],
    # }

    # exec { 'npm-packages':,
    #   command => '/usr/bin/npm install',
    #   require => [Exec['npm install -g grunt-cli bower'], Exec['node-modules symlink']],
    #   cwd => '/vagrant',
    # }

}