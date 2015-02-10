class nginx {

	# These are the same packages, sorted alphabetically
	$install_packages = $operatingsystem ? {
		Amazon => [
			'nginx', 
			'php55-cli', 
			'php55-fpm', 
			'php55-gd', 
			'php55-mbstring', 
			'php55-mcrypt',
			'php55-mysqlnd', 
			'php55-pdo', 
			'php55-soap', 
			'php55-xml', 
		],
		Fedora => [
			'nginx', 
			'php-cli', 
			'php-fpm', 
			'php-gd', 
			'php-mbstring', 
			'php-mcrypt',
			'php-mysqlnd', 
			'php-pdo', 
			'php-soap', 
			'php-xml', 
		],
		default => [
			'nginx', 
			'php-cli', 
			'php-fpm', 
			'php-gd', 
			'php-mbstring', 
			'php-mcrypt',
			'php-mysqlnd', 
			'php-pdo', 
			'php-soap', 
			'php-xml', 
		],
	}

	$fpm_service = $operatingsystem ? {
		Fedora => 'php-fpm',
		CentOS => 'php-fpm',
		Amazon => 'php-fpm-5.5',
	}

	$fpm_file_path = $operatingsystem ? {
		Fedora => '/etc/php-fpm.d/www.conf',
		CentOS => '/etc/php-fpm.d/www.conf',
		Amazon => '/etc/php-fpm-5.5.d/www.conf',
	}

	$nginx_folders = [
		'/var/lib/php',
		'/var/lib/php/session',
		'/var/cache/nginx/',
		'/var/cache/nginx/fastcgi',
	]


	service { $fpm_service:
		ensure => "running",
		enable => "true"
	}

	service { 'nginx':
		ensure => "running",
		enable => "true"
	}

	package { $install_packages:
		ensure => 'latest'
	}

	file { $nginx_folders:
		ensure => directory,
		owner => 'nginx',
		group => 'nginx',
		mode => 770
	}

	file { '/etc/nginx/ssl':
		ensure => directory,
		owner => 'root',
		group => 'root',
		mode => 770
	}

	file { '/etc/nginx/ssl/localhost.crt':
		notify => Service['nginx'],
		ensure => file,
		source => 'puppet:///modules/nginx/nginx/localhost.crt',
		owner => 'root',
		group => 'root',
		mode => 644,
		require => File['/etc/nginx/ssl'],
		before => File['/etc/nginx/nginx.conf'],
	}

	file { '/etc/nginx/ssl/localhost.key':
		notify => Service['nginx'],
		ensure => file,
		source => 'puppet:///modules/nginx/nginx/localhost.key',
		owner => 'root',
		group => 'root',
		mode => 644,
		require => File['/etc/nginx/ssl'],
		before => File['/etc/nginx/nginx.conf'],
	}

	file { '/etc/nginx/fastcgi.conf':
		notify => Service['nginx'],
		ensure => file,
		source => 'puppet:///modules/nginx/nginx/fastcgi.conf',
		owner => 'root',
		group => 'root',
		mode => 644,
		before => File['/etc/nginx/nginx.conf'],
	}

	file { '/etc/nginx/restrictions.conf':
		notify => Service['nginx'],
		ensure => file,
		source => 'puppet:///modules/nginx/nginx/restrictions.conf',
		owner => 'root',
		group => 'root',
		mode => 644,
		before => File['/etc/nginx/nginx.conf'],
	}


	file { '/etc/nginx/nginx.conf':
		notify => Service['nginx'],
		ensure => file,
		source => 'puppet:///modules/nginx/nginx/nginx.conf',
		owner => 'root',
		group => 'root',
		mode => 644,
	}


	file { $fpm_file_path:
		notify => Service[$fpm_service],
		ensure => file,
		source => 'puppet:///modules/nginx/php-fpm/www.conf',
		owner => 'root',
		group => 'root',
		mode => 644
	}

	file { '/usr/bin/composer':
		ensure => file,
		source => 'puppet:///modules/nginx/composer',
		owner => 'root',
		group => 'root',
		mode => 755
	}

}
