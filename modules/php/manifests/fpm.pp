class php::fpm {

	$packages = $operatingsystem ? {
		Amazon => ['php55-fpm'],
		default => ['php-fpm'],
	}

	$service = 'php-fpm'

	$pool_file = $operatingsystem ? {
		Amazon => '/etc/php-fpm-5.5.d/www.conf',
		default => '/etc/php-fpm.d/www.conf',
	}

	package { $packages:
		ensure => 'latest',
		notify => Service[$service],
	}

	service { $service:
		ensure => "running",
		enable => true,
	}

	file { $pool_file:
		notify => Service[$service],
		ensure => file,
		source => 'puppet:///modules/php/php-fpm/www.conf',
		owner => 'root',
		group => 'root',
		mode => 644,
	}
}
