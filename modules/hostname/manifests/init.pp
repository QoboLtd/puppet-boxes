# Lookup hostname using a web service
# 
# This is useful for Amazon EC2 nodes in VPC, where reverse DNS is not
# supported.  The web service should return just the hostname in
# plain/text type.  The lookup can be done by the remote IP.
class hostname ($hostname_lookup_url = 'https://api.qobo.biz/aws/hostname') {

	$required = $operatingsystem ? {
		'Amazon => ['bash', 'wget', 'perl', 'net-tools'],
		default => ['bash', 'wget', 'perl', 'hostname'],
	}

	case $operatingsystem {
		/(?i:RedHat|CentOS|Amazon|Fedora)/: {
			package { $required :
				ensure => "present"
			}

			file { "/etc/cron.hourly/hostname.sh":
				content => template('hostname/hostname.sh.erb'),
				ensure => "present",
				mode => 755,
				owner => "root",
				group => "root"
			}

		}
		default: {
			notice("Operating system [$operatingsystem] is not supported")
		}
	}

}
