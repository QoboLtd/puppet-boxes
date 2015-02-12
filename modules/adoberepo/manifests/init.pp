# == Class: adoberepo
#
# This module installs and enables the Adobe YUM repository. When run on a
# non-RedHat osfamily it exits with no action performed.
#
# === Parameters
#
# [*adoberepo_baseurl*]
# Defaults to http://linuxdownload.adobe.com/linux/${::architecture}/
#
# [*adoberepo_descr*]
# Defaults to 'Adobe YUM repository'
#
# [*adoberepo_enabled*]
# Defaults to 1
#
# [*adoberepo_gpgcheck*]
# Defaults to 1
#
# [*adoberepo_name*]
# Defaults to adobe-linux-${::architecture}
#
# [*adoberepo_proxy*]
# Defaults to absent. (Uses the yum.conf value if it exists)
#
# === Usage
#
# include '::adoberepo'
#
# or to use a local mirror:
#
#  class { 'adoberepo':
#    adoberepo_baseurl => 'http://localmirror.server.domain',
#  }
#
class adoberepo (
  $adoberepo_baseurl  = $adoberepo::params::adoberepo_baseurl,
  $adoberepo_descr    = $adoberepo::params::adoberepo_descr,
  $adoberepo_enabled  = $adoberepo::params::adoberepo_enabled,
  $adoberepo_gpgcheck = $adoberepo::params::adoberepo_gpgcheck,
  $adoberepo_name     = $adoberepo::params::adoberepo_name,
  $adoberepo_proxy    = $adoberepo::params::adoberepo_proxy,
) inherits adoberepo::params {

  if ($::osfamily == 'RedHat') {

    yumrepo { $adoberepo_name:
      baseurl  => $adoberepo_baseurl,
      descr    => $adoberepo_descr,
      enabled  => $adoberepo_enabled,
      gpgcheck => $adoberepo_gpgcheck,
      gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-adobe-linux',
      proxy    => $adoberepo_proxy,
    }

    file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-adobe-linux':
      ensure => present,
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
      source => 'puppet:///modules/adoberepo/RPM-GPG-KEY-adobe-linux',
    }

    gpg_key{ $adoberepo_name:
      path   => '/etc/pki/rpm-gpg/RPM-GPG-KEY-adobe-linux',
      before => Yumrepo[$adoberepo_name]
    }

  }

  else {
    notice ("Your operating system ${::operatingsystem} will not have the Adobe YUM repository applied")
  }

}
