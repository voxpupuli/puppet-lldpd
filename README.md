# puppet-lldpd

[![Build Status](https://travis-ci.org/voxpupuli/puppet-lldpd.svg?branch=master)](https://travis-ci.org/voxpupuli/puppet-lldpd)
[![Puppet Forge](https://img.shields.io/puppetforge/v/puppet/lldpd.svg)](https://forge.puppetlabs.com/puppet/lldpd)
[![Puppet Forge - downloads](https://img.shields.io/puppetforge/dt/puppet/lldpd.svg)](https://forge.puppetlabs.com/puppet/lldpd)
[![Puppet Forge - endorsement](https://img.shields.io/puppetforge/e/puppet/lldpd.svg)](https://forge.puppetlabs.com/puppet/lldpd)
[![Puppet Forge - scores](https://img.shields.io/puppetforge/f/puppet/lldpd.svg)](https://forge.puppetlabs.com/puppet/lldpd)
[![Yard Docs](https://img.shields.io/badge/yard-docs-blue.svg)](https://github.com/voxpupuli/puppet-lldpd/blob/master/REFERENCE.md#reference)
[![AGPL v3 License](https://img.shields.io/github/license/voxpupuli/puppet-lldpd.svg)](LICENSE)

## Table of Contents

* [Overview](#overview)
* [Setup](#setup)
* [Support](#support)
* [Reference](#reference)
* [Limitations](#limitations)
* [Development](#development)
* [Authors](#authors)

----

## Overview

LLDP stands for Link Layer Discovery Protocol. This module manages the LLDP
implementation from [Vincent Bernat](https://vincentbernat.github.io/lldpd/).
[puppet-strings](https://github.com/puppetlabs/puppet-strings#puppet-strings)
docs are available in [/docs](/docs). They are generated before each release.
This module configures the upstream repo if necessary. The LLDP requires a
daemon, which will be started. the command line client has support for json
output. This is used to create a structured fact. It is updated automatically
with a systemd timer (or a cronjob on legacy systems).

The [REFERENCE.md](REFERENCE.md) contains [puppet-strings](https://github.com/puppetlabs/puppet-strings#puppet-strings)
generated docs.

## Setup

This is very easy:

```puppet
include lldpd
```

You can disable the repo management:

```puppet
class{'lldpd':
  manage_repo => false,
}
```

## Support

This module supports the installation on:

* Archlinux
* CentOS 6
* CentOS 7
* Fedora 25
* Fedora 26
* Fedora 27
* Debian 8
* Debian 9
* Ubuntu 16.04
* Ubuntu 18.04
* VirtuozzoLinux 6
* VirtuozzoLinux 7
* Parallels Cloud Server Bare Metal 5
* FreeBSD 11

The fact is present on all Operating Systems except for FreeBSD. Docker
acceptance tests work for CentOS 6 and 7. Vagrant acceptance tests work for
Fedora 25. Other nodesets are currently not present. The module requires at
least Puppet 4.9.4 (this is the first version with proper data-in-modules
support).


## Reference

The main class provides an interface that can be used. It can be configured via
the upcoming parameters. All other classes are internal and can't be accessed
directly.

### `$manage_facts`

This is a boolean, it defaults to true on all systems except for the CentOS
family (see [limitations](#limitations). If true, the module will provide
a script to run lldpctl and save the output as json as structured fact. A
systemd timer or a cronjob will be deployed to execute the script periodically.
This decouples the fact generation from the actual facter/puppet.

### `$manage_service`

Boolean, if true, the module will enable the service. Defaults to true.

### `$manage_repo`

Boolean, if true, the module will setup the upstream repository. Defaults to
true on Debian and CentOS family.

### `$manage_jq`

Boolean. jq is a dependency needed for the fact generation. This module can
install it. Defaults to true on all systems except for CentOS. See also
[limitations](#limitations).

### `$repourl`

String, part of the upstream repository URL. The module provides sane defaults
for all repositories. There should be no need to set this parameter.

### `$gpgkeyfingerprint`
String. The ID from the key that's used to sign the packages. Currently only
used for the apt repo.

### `$ensure`

String, allowed values are present, absent and latest. This sets the status of
the lldpd package.

## Limitations

The facts require [jq](https://stedolan.github.io/jq/) to work. The installation
can be configured with $manage\_jq. This is disabled on CentOS machines. You
can install it on CentOS if you configure the [EPEL](https://fedoraproject.org/wiki/EPEL)
repository.

## Development

This project contains tests for [rspec-puppet](http://rspec-puppet.com/).

Quickstart to run all linter and unit tests:

```bash
bundle install --path .vendor/ --without system_tests --without development --without release
bundle exec rake test
```

For acceptance tests:

```bash
bundle install --path .vendor/ --with system_tests --without development --without release
BEAKER_debug=true PUPPET_INSTALL_TYPE=agent bundle exec rake beaker:fedora-25-x64
BEAKER_debug=true PUPPET_INSTALL_TYPE=agent bundle exec rake acceptance BEAKER_set=docker/centos-7
```

## Authors

puppet-lldpd is maintained by [Vox Pupuli](https://voxpupuli.org), it was written by [Tim 'bastelfreak' Meusel](https://github.com/bastelfreak).
