class php::composer {
	file { '/usr/bin/composer':
		ensure => file,
		source => 'puppet:///modules/php/composer',
		owner => 'root',
		group => 'root',
		mode => 755
	}
}
