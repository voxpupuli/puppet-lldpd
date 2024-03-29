# Reference

<!-- DO NOT EDIT: This document was generated by Puppet Strings -->

## Table of Contents

### Classes

* [`lldpd`](#lldpd): A module to manage lldpd and related facts

## Classes

### <a name="lldpd"></a>`lldpd`

lldpd

#### Examples

##### Basic usage

```puppet
include lldpd
```

#### Parameters

The following parameters are available in the `lldpd` class:

* [`ensure`](#-lldpd--ensure)
* [`manage_service`](#-lldpd--manage_service)
* [`manage_repo`](#-lldpd--manage_repo)
* [`repourl`](#-lldpd--repourl)
* [`apt_key_hash`](#-lldpd--apt_key_hash)

##### <a name="-lldpd--ensure"></a>`ensure`

Data type: `Enum['present', 'absent', 'latest']`

Install or deinstall all related components

Default value: `'present'`

##### <a name="-lldpd--manage_service"></a>`manage_service`

Data type: `Boolean`

Enable or disable the service management

Default value: `true`

##### <a name="-lldpd--manage_repo"></a>`manage_repo`

Data type: `Boolean`

Enable or disable the repository setup

Default value: `false`

##### <a name="-lldpd--repourl"></a>`repourl`

Data type: `Optional[String[1]]`

String that completes the url for the upstream repository

Default value: `undef`

##### <a name="-lldpd--apt_key_hash"></a>`apt_key_hash`

Data type: `String[1]`

the sha256 hashsum for the GPG key file that was used to sign the packages

Default value: `'4f9e668fbdaaedf4fc8d83f4eb98db33553d7f4e1f0bca212d0a7ccc9f1a6adf'`

