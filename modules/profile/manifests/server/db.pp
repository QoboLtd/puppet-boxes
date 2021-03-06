# DB server
class profile::server::db {

	include profile::server
	include mysql

	class { 'automysqlbackup':
		backup_dir          => '/var/backup',
	}
	automysqlbackup::backup { 'mysql':
		mysql_dump_username => 'root',
		mysql_dump_password => '',
		db_exclude          => ['performance_schema', 'information_schema'],
		table_exclude       => ['mysql.event'],
		mysql_dump_latest => 'yes',
		mysql_dump_latest_clean_filenames => 'yes',
		mysql_dump_use_separate_dirs => 'yes',
	}
}
