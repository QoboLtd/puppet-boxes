# MySQL client
class mysql::client {

	$install_packages = $operatingsystem ? {
		Amazon => ['mysql55'],
		default => ['mariadb']
	}

	package { $install_packages:
		ensure => 'latest'
	}

}
