# Development desktop
class profile::desktop::dev {
	include profile::desktop
	include nginx
	include php
	include mysql
}
