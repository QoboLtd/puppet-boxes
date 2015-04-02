class php::config {

	file_line { 'date.timezone':
		path => '/etc/php.ini',
		line => 'date.timezone = "Asia/Nicosia"',
		match => '^.*date.timezone =.*',
	}

	file_line { 'upload_max_filesize':
		path => '/etc/php.ini',
		line => 'upload_max_filesize = 20M',
		match => '^upload_max_filesize = \d+M',
	}

	file_line { 'post_max_size':
		path => '/etc/php.ini',
		line => 'post_max_size = 20M',
		match => '^post_max_size = \d+M',
	}

}
