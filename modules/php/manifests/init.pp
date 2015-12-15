class php {

	include php::config
	include php::fpm

	$folders = [
		'/var/lib/php',
		'/var/lib/php/session',
	]

	$packages = $operatingsystem ? {
		Amazon => [
			'php56-cli',
			'php56-gd',
			'php56-mbstring',
			'php56-mcrypt',
			'php56-mysqlnd',
			'php56-opcache',
			'php56-pdo',
			'php56-soap',
			'php56-xml',
		],
		default => [
			'php-cli', 
			'php-gd', 
			'php-mbstring', 
			'php-mcrypt',
			'php-mysqlnd', 
			'php-opcache',
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

	class { '::composer':
		command_name => 'composer',
		target_dir   => '/usr/bin',
		auto_update  => true
	}

}
