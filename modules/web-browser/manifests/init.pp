class web-browser {
	include  '::chromerepo'
	include  '::adoberepo'

	package { ['flash-plugin', 'firefox', 'google-chrome-stable']:
		ensure => 'latest'
	}
}
