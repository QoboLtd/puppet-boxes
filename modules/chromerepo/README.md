# chromerepo

[![Build Status](https://secure.travis-ci.org/juniorsysadmin/puppet-chromerepo.png)](http://travis-ci.org/juniorsysadmin/puppet-chromerepo)

#### Table of Contents

1. [Overview](#overview)
1. [Usage](#usage)
1. [Limitations](#limitations)
1. [Development](#development)

## Overview

This module installs and enables the Google Chrome YUM or APT repository
depending on the osfamily. When run on a non-RedHat or non-Debian osfamily
it exits with no action performed.

## Usage

```puppet
include  '::chromerepo'
```

Or to use a local mirror for Fedora:

```puppet
class { '::chromerepo':
  chromerepo_baseurl => 'http://localmirror.server.domain',
}
```

Or to use a local mirror for Ubuntu:

```puppet
class { '::chromerepo':
  chromerepo_location => 'http://localmirror.server.domain/',
}
```

### Parameters

The following parameters are available in the chromerepo module:

#### `chromerepo_baseurl`

Used by yumrepo. Defaults to
http://dl.google.com/linux/chrome/rpm/stable/{::architecture}.

#### `chromerepo_descr`

Used by yumrepo. Defaults to 'Google Chrome YUM repository'

#### `chromerepo_enabled`

Used by yumrepo. Defaults to 1.

#### `chromerepo_gpgcheck`

Used by yumrepo. Defaults to 1

#### `chromerepo_include_src`

Used by apt::source. Defaults to false.

#### `chromerepo_key`

Used by apt::source. Defaults to the official Google Chrome repository one.

#### `chromerepo_key_source`

Used by apt::source. Defaults to
http://dl-ssl.google.com/linux/linux_signing_key.pub

#### `chromerepo_location`

Location of Google Chrome repository. Defaults to
http://dl.google.com/linux/chrome/deb/

#### `chromerepo_name`

Used by yumrepo. Defaults to 'google-chrome'

#### `chromerepo_proxy`

Defaults to absent.  (Uses the yum.conf value if it exists)

#### `chromerepo_release`

Used by apt::source. Defaults to stable.

#### `chromerepo_repos`

Used by apt::source. Defaults to main.

## Limitations

This module has received limited testing on:

* Fedora 20
* Ubuntu 14.04

against Puppet 3.x

## Development

Patches are welcome.
