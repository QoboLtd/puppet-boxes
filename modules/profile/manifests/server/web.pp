# Web server
class profile::server::web {
	include profile::server
	include nginx
	include php
	include mysql::client
}
