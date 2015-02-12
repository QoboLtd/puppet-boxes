class web-browser {
	include  '::chromerepo'
	include flash-plugin

	package { ['firefox', 'google-chrome-stable']:
		ensure => 'latest'
	}
}
