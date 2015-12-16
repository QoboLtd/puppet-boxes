class ntp {

	# Stop the service. We use scheduled cron instead
	service { 'ntpd':
		ensure => 'stopped',
		enable => false
	}

	# For synchronizing time over the network
	package { 'ntpdate':
		ensure => 'latest'
	}

	# For hwclock time writing
	package { 'util-linux':
		ensure => 'latest'
	}

	# cron.hourly sync
	file { 'ntpdate':
		path => '/etc/cron.hourly/ntpdate',
		ensure => file,
		source => 'puppet:///modules/ntp/ntpdate',
		owner => 'root',
		group => 'root',
		mode => '755'
	}
}
