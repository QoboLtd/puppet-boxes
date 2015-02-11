class php {

	include php::config
	include php::composer
	include php::fpm

	$folders = [
		'/var/lib/php',
		'/var/lib/php/session',
	]

	$packages = $operatingsystem ? {
		Amazon => [
			'php55-cli', 
			'php55-gd', 
			'php55-mbstring', 
			'php55-mcrypt',
			'php55-mysqlnd', 
			'php55-pdo', 
			'php55-soap', 
			'php55-xml', 
		],
		default => [
			'php-cli', 
			'php-gd', 
			'php-mbstring', 
			'php-mcrypt',
			'php-mysqlnd', 
			'php-pdo', 
			'php-soap', 
			'php-xml', 
		],
	}

	file { $folders:
		ensure => directory,
		owner => 'nginx',
		group => 'nginx',
		mode => 770,
		require => Package['nginx']
	}
}
