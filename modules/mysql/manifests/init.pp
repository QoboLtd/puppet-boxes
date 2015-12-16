# MySQL server and client
class mysql {

	include mysql::client

	$packages = $operatingsystem ? {
		Amazon => ['mysql55-server'],
		default => ['mariadb-server']
	}

	$service = $operatingsystem ? {
		Fedora => 'mariadb',
		default => 'mysqld',
	}


	service { $service:
		ensure => "running",
		enable => "true"
	}

	package { $packages:
		ensure => 'latest',
		notify => Service[$service],
	}

	file { 'my.cnf':
		notify => Service[$service],
		path => '/etc/my.cnf',
		ensure => file,
		source => 'puppet:///modules/mysql/my.cnf',
		owner => 'root',
		group => 'root',
		mode => 644
	}

}
