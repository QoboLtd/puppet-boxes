class nginx {

	$packages = ['nginx']

	$folders = [
		'/var/cache/nginx/',
		'/var/cache/nginx/fastcgi',
	]

	package { $packages:
		ensure => 'latest'
	}

	service { 'nginx':
		ensure => "running",
		enable => "true"
	}

	file { $folders:
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
		source => 'puppet:///modules/nginx/localhost.crt',
		owner => 'root',
		group => 'root',
		mode => 644,
		require => File['/etc/nginx/ssl'],
		before => File['/etc/nginx/nginx.conf'],
	}

	file { '/etc/nginx/ssl/localhost.key':
		notify => Service['nginx'],
		ensure => file,
		source => 'puppet:///modules/nginx/localhost.key',
		owner => 'root',
		group => 'root',
		mode => 644,
		require => File['/etc/nginx/ssl'],
		before => File['/etc/nginx/nginx.conf'],
	}

	file { '/etc/nginx/fastcgi.conf':
		notify => Service['nginx'],
		ensure => file,
		source => 'puppet:///modules/nginx/fastcgi.conf',
		owner => 'root',
		group => 'root',
		mode => 644,
		before => File['/etc/nginx/nginx.conf'],
	}

	file { '/etc/nginx/restrictions.conf':
		notify => Service['nginx'],
		ensure => file,
		source => 'puppet:///modules/nginx/restrictions.conf',
		owner => 'root',
		group => 'root',
		mode => 644,
		before => File['/etc/nginx/nginx.conf'],
	}

	file { '/etc/nginx/nginx.conf':
		notify => Service['nginx'],
		ensure => file,
		source => 'puppet:///modules/nginx/nginx.conf',
		owner => 'root',
		group => 'root',
		mode => 644,
	}


}
