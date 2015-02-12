# adoberepo

#### Table of Contents

1. [Overview](#overview)
1. [Usage](#usage)
1. [Limitations](#limitations)
1. [Development](#development)

## Overview

This module installs and enables the Adobe YUM repository.
When run on a non-RedHat osfamily it exits with no action performed.

[![Build
Status](https://secure.travis-ci.org/juniorsysadmin/puppet-adoberepo.png)](http://travis-ci.org/juniorsysadmin/puppet-adoberepo)

## Usage

```puppet
include  '::adoberepo'
```

or to use a local mirror:

```puppet
class { '::adoberepo':
  adoberepo_baseurl => 'http://localmirror.server.domain/',
}
```

### Parameters

The following parameters are available in the adoberepo module:

#### `adoberepo_baseurl`

Defaults to http://linuxdownload.adobe.com/linux/${::architecture}/.

#### `adoberepo_descr`

Defaults to 'Adobe YUM repository'.

#### `adoberepo_enabled`

Defaults to 1.

#### `adoberepo_gpgcheck`

Defaults to 1

#### `adoberepo_name`

Defaults to adobe-linux-${::architecture}

#### `adoberepo_proxy`

Defaults to absent.  (Uses the yum.conf value if it exists)

## Limitations

This module has received limited testing on:

* CentOS/RHEL 6/7
* Fedora 21

against Puppet 2.7.x and 3.x

## Development

Patches are welcome.
