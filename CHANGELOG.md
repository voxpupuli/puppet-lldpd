# Changelog

All notable changes to this project will be documented in this file.
Each new release typically also includes the latest modulesync defaults.
These should not affect the functionality of the module.

## [v4.0.2](https://github.com/voxpupuli/puppet-lldpd/tree/v4.0.2) (2022-08-28)

[Full Changelog](https://github.com/voxpupuli/puppet-lldpd/compare/v4.0.1...v4.0.2)

**Merged pull requests:**

- puppetlabs/apt: Allow 9.x [\#137](https://github.com/voxpupuli/puppet-lldpd/pull/137) ([bastelfreak](https://github.com/bastelfreak))

## [v4.0.1](https://github.com/voxpupuli/puppet-lldpd/tree/v4.0.1) (2022-07-20)

[Full Changelog](https://github.com/voxpupuli/puppet-lldpd/compare/v4.0.0...v4.0.1)

**Fixed bugs:**

- fix package/service order of operations [\#135](https://github.com/voxpupuli/puppet-lldpd/pull/135) ([jhoblitt](https://github.com/jhoblitt))

## [v4.0.0](https://github.com/voxpupuli/puppet-lldpd/tree/v4.0.0) (2022-07-14)

[Full Changelog](https://github.com/voxpupuli/puppet-lldpd/compare/v3.3.0...v4.0.0)

**Breaking changes:**

- drop legacy timer code [\#133](https://github.com/voxpupuli/puppet-lldpd/pull/133) ([bastelfreak](https://github.com/bastelfreak))
- Drop legacy gpgkeyfingerprint parameter [\#132](https://github.com/voxpupuli/puppet-lldpd/pull/132) ([bastelfreak](https://github.com/bastelfreak))
- restructure fact data, fix filename spelling [\#126](https://github.com/voxpupuli/puppet-lldpd/pull/126) ([foxxx0](https://github.com/foxxx0))

**Implemented enhancements:**

- Add Rocky Linux support [\#127](https://github.com/voxpupuli/puppet-lldpd/pull/127) ([bastelfreak](https://github.com/bastelfreak))

**Fixed bugs:**

- new fact doesn't work on servers with a single interface [\#129](https://github.com/voxpupuli/puppet-lldpd/issues/129)
- fact: Add support for single interfaces [\#131](https://github.com/voxpupuli/puppet-lldpd/pull/131) ([bastelfreak](https://github.com/bastelfreak))
- apt: set gpg key checksum ensure=file [\#130](https://github.com/voxpupuli/puppet-lldpd/pull/130) ([bastelfreak](https://github.com/bastelfreak))

## [v3.3.0](https://github.com/voxpupuli/puppet-lldpd/tree/v3.3.0) (2022-01-07)

[Full Changelog](https://github.com/voxpupuli/puppet-lldpd/compare/v3.2.0...v3.3.0)

**Implemented enhancements:**

- yumrepo: Set gpgcheck to 1 [\#124](https://github.com/voxpupuli/puppet-lldpd/pull/124) ([bastelfreak](https://github.com/bastelfreak))
- Add AlmaLinux support [\#123](https://github.com/voxpupuli/puppet-lldpd/pull/123) ([bastelfreak](https://github.com/bastelfreak))
- Apt: Use gpg repo key only for lldpd repository [\#121](https://github.com/voxpupuli/puppet-lldpd/pull/121) ([bastelfreak](https://github.com/bastelfreak))

**Merged pull requests:**

- Configure external repo for tests and cleanup hiera [\#122](https://github.com/voxpupuli/puppet-lldpd/pull/122) ([bastelfreak](https://github.com/bastelfreak))

## [v3.2.0](https://github.com/voxpupuli/puppet-lldpd/tree/v3.2.0) (2021-12-07)

[Full Changelog](https://github.com/voxpupuli/puppet-lldpd/compare/v3.1.0...v3.2.0)

**Implemented enhancements:**

- Add Debian 11 support [\#118](https://github.com/voxpupuli/puppet-lldpd/pull/118) ([bastelfreak](https://github.com/bastelfreak))
- Add RHEL 8 support [\#117](https://github.com/voxpupuli/puppet-lldpd/pull/117) ([yakatz](https://github.com/yakatz))

**Closed issues:**

- Error handling in `lldp2facts` [\#66](https://github.com/voxpupuli/puppet-lldpd/issues/66)

## [v3.1.0](https://github.com/voxpupuli/puppet-lldpd/tree/v3.1.0) (2021-08-29)

[Full Changelog](https://github.com/voxpupuli/puppet-lldpd/compare/v3.0.3...v3.1.0)

**Implemented enhancements:**

- Enable Gentoo support [\#114](https://github.com/voxpupuli/puppet-lldpd/pull/114) ([bastelfreak](https://github.com/bastelfreak))

## [v3.0.3](https://github.com/voxpupuli/puppet-lldpd/tree/v3.0.3) (2021-08-26)

[Full Changelog](https://github.com/voxpupuli/puppet-lldpd/compare/v3.0.2...v3.0.3)

**Merged pull requests:**

- Allow up-to-date depenencies [\#110](https://github.com/voxpupuli/puppet-lldpd/pull/110) ([smortex](https://github.com/smortex))

## [v3.0.2](https://github.com/voxpupuli/puppet-lldpd/tree/v3.0.2) (2021-07-31)

[Full Changelog](https://github.com/voxpupuli/puppet-lldpd/compare/v3.0.1...v3.0.2)

the 3.0.1 release wasn't successful because the CI pipeline failed. 3.0.2 contains the same Puppet code + a fixed Gemfile

## [v3.0.1](https://github.com/voxpupuli/puppet-lldpd/tree/v3.0.1) (2021-07-30)

[Full Changelog](https://github.com/voxpupuli/puppet-lldpd/compare/v3.0.0...v3.0.1)

**Merged pull requests:**

- switch from camptocamp/systemd to voxpupuli/systemd [\#105](https://github.com/voxpupuli/puppet-lldpd/pull/105) ([bastelfreak](https://github.com/bastelfreak))

## [v3.0.0](https://github.com/voxpupuli/puppet-lldpd/tree/v3.0.0) (2021-06-05)

[Full Changelog](https://github.com/voxpupuli/puppet-lldpd/compare/v2.3.0...v3.0.0)

**Breaking changes:**

- Drop Puppet 5 support; enable Puppet 7 support [\#103](https://github.com/voxpupuli/puppet-lldpd/pull/103) ([bastelfreak](https://github.com/bastelfreak))
- Drop EoL CentOS 6 [\#100](https://github.com/voxpupuli/puppet-lldpd/pull/100) ([bastelfreak](https://github.com/bastelfreak))
- Drop Debian8 \(jessie\) support [\#99](https://github.com/voxpupuli/puppet-lldpd/pull/99) ([b4ldr](https://github.com/b4ldr))

**Implemented enhancements:**

- Allow latest dependencies [\#102](https://github.com/voxpupuli/puppet-lldpd/pull/102) ([bastelfreak](https://github.com/bastelfreak))
- Add FreeBSD 12 support [\#101](https://github.com/voxpupuli/puppet-lldpd/pull/101) ([bastelfreak](https://github.com/bastelfreak))
- rewrite module with native fact [\#97](https://github.com/voxpupuli/puppet-lldpd/pull/97) ([b4ldr](https://github.com/b4ldr))

**Fixed bugs:**

- CentOS 6: Fix mirror URL [\#94](https://github.com/voxpupuli/puppet-lldpd/pull/94) ([bastelfreak](https://github.com/bastelfreak))

**Merged pull requests:**

- regenerate REFERENCE.md / Add puppet-lint-param-docs linter [\#92](https://github.com/voxpupuli/puppet-lldpd/pull/92) ([bastelfreak](https://github.com/bastelfreak))

## [v2.3.0](https://github.com/voxpupuli/puppet-lldpd/tree/v2.3.0) (2020-08-03)

[Full Changelog](https://github.com/voxpupuli/puppet-lldpd/compare/v2.2.0...v2.3.0)

**Implemented enhancements:**

- move common.yaml to init.pp [\#85](https://github.com/voxpupuli/puppet-lldpd/pull/85) ([bastelfreak](https://github.com/bastelfreak))
- Add Debian 10 support [\#84](https://github.com/voxpupuli/puppet-lldpd/pull/84) ([bastelfreak](https://github.com/bastelfreak))

**Closed issues:**

- Debian Repo key has changed, fingerprint needs to be updated [\#87](https://github.com/voxpupuli/puppet-lldpd/issues/87)

**Merged pull requests:**

- modulesync 3.0.0 & puppet-lint updates [\#89](https://github.com/voxpupuli/puppet-lldpd/pull/89) ([bastelfreak](https://github.com/bastelfreak))
- Binaries now exist for 20.04 so use the repo. [\#88](https://github.com/voxpupuli/puppet-lldpd/pull/88) ([jchonig](https://github.com/jchonig))
- Use voxpupuli-acceptance [\#83](https://github.com/voxpupuli/puppet-lldpd/pull/83) ([ekohl](https://github.com/ekohl))
- update repo links to https [\#81](https://github.com/voxpupuli/puppet-lldpd/pull/81) ([bastelfreak](https://github.com/bastelfreak))

## [v2.2.0](https://github.com/voxpupuli/puppet-lldpd/tree/v2.2.0) (2020-01-11)

[Full Changelog](https://github.com/voxpupuli/puppet-lldpd/compare/v2.1.0...v2.2.0)

**Merged pull requests:**

- simplify systemd timer setup [\#79](https://github.com/voxpupuli/puppet-lldpd/pull/79) ([bastelfreak](https://github.com/bastelfreak))

## [v2.1.0](https://github.com/voxpupuli/puppet-lldpd/tree/v2.1.0) (2019-11-07)

[Full Changelog](https://github.com/voxpupuli/puppet-lldpd/compare/v2.0.1...v2.1.0)

**Implemented enhancements:**

- Add VirtuozzoLinux 6 support [\#75](https://github.com/voxpupuli/puppet-lldpd/pull/75) ([kBite](https://github.com/kBite))

**Merged pull requests:**

- Clean up acceptance spec helper [\#74](https://github.com/voxpupuli/puppet-lldpd/pull/74) ([ekohl](https://github.com/ekohl))

## [v2.0.1](https://github.com/voxpupuli/puppet-lldpd/tree/v2.0.1) (2019-10-19)

[Full Changelog](https://github.com/voxpupuli/puppet-lldpd/compare/v2.0.0...v2.0.1)

**Merged pull requests:**

- Update tests for VirtuozzoLinux 7 [\#72](https://github.com/voxpupuli/puppet-lldpd/pull/72) ([bastelfreak](https://github.com/bastelfreak))
- fix docs links in README.md [\#71](https://github.com/voxpupuli/puppet-lldpd/pull/71) ([bastelfreak](https://github.com/bastelfreak))

## [v2.0.0](https://github.com/voxpupuli/puppet-lldpd/tree/v2.0.0) (2019-10-18)

[Full Changelog](https://github.com/voxpupuli/puppet-lldpd/compare/v1.3.1...v2.0.0)

**Breaking changes:**

- drop Ubuntu 14.04 support [\#65](https://github.com/voxpupuli/puppet-lldpd/pull/65) ([bastelfreak](https://github.com/bastelfreak))
- modulesync 2.7.0 and drop puppet 4 [\#62](https://github.com/voxpupuli/puppet-lldpd/pull/62) ([bastelfreak](https://github.com/bastelfreak))

**Implemented enhancements:**

- Add VirtuozzoLinux 7 support [\#69](https://github.com/voxpupuli/puppet-lldpd/pull/69) ([bastelfreak](https://github.com/bastelfreak))
- allow puppetlabs/stdlib 6.x [\#68](https://github.com/voxpupuli/puppet-lldpd/pull/68) ([bastelfreak](https://github.com/bastelfreak))

**Merged pull requests:**

- Allow puppetlabs/apt 7.x [\#64](https://github.com/voxpupuli/puppet-lldpd/pull/64) ([dhoppe](https://github.com/dhoppe))

## [v1.3.1](https://github.com/voxpupuli/puppet-lldpd/tree/v1.3.1) (2018-10-20)

[Full Changelog](https://github.com/voxpupuli/puppet-lldpd/compare/v1.3.0...v1.3.1)

**Merged pull requests:**

- modulesync 2.2.0 and allow puppet 6.x [\#59](https://github.com/voxpupuli/puppet-lldpd/pull/59) ([bastelfreak](https://github.com/bastelfreak))
- add initial REFERENCE.md [\#58](https://github.com/voxpupuli/puppet-lldpd/pull/58) ([bastelfreak](https://github.com/bastelfreak))
- allow puppetlabs/stdlib 5.x and puppetlabs/apt 6.x [\#56](https://github.com/voxpupuli/puppet-lldpd/pull/56) ([bastelfreak](https://github.com/bastelfreak))

## [v1.3.0](https://github.com/voxpupuli/puppet-lldpd/tree/v1.3.0) (2018-08-25)

[Full Changelog](https://github.com/voxpupuli/puppet-lldpd/compare/v1.2.0...v1.3.0)

**Implemented enhancements:**

- Add official ubuntu 18.04 support [\#49](https://github.com/voxpupuli/puppet-lldpd/issues/49)

**Fixed bugs:**

- fix typo in file name; yml -\> yaml [\#53](https://github.com/voxpupuli/puppet-lldpd/pull/53) ([kBite](https://github.com/kBite))

**Merged pull requests:**

- allow puppetlabs/apt 5.x [\#51](https://github.com/voxpupuli/puppet-lldpd/pull/51) ([bastelfreak](https://github.com/bastelfreak))
- drop EOL OSs; fix puppet version range [\#45](https://github.com/voxpupuli/puppet-lldpd/pull/45) ([bastelfreak](https://github.com/bastelfreak))
- Rely on beaker-hostgenerator for docker nodesets [\#44](https://github.com/voxpupuli/puppet-lldpd/pull/44) ([ekohl](https://github.com/ekohl))

## [v1.2.0](https://github.com/voxpupuli/puppet-lldpd/tree/v1.2.0) (2018-05-07)

[Full Changelog](https://github.com/voxpupuli/puppet-lldpd/compare/v1.1.0...v1.2.0)

**Implemented enhancements:**

- add ubuntu 18.04 support [\#39](https://github.com/voxpupuli/puppet-lldpd/pull/39) ([bastelfreak](https://github.com/bastelfreak))

**Merged pull requests:**

- execute travis jobs on newer ruby versions [\#41](https://github.com/voxpupuli/puppet-lldpd/pull/41) ([bastelfreak](https://github.com/bastelfreak))
- fix documentation about FreeBSD 11 support [\#40](https://github.com/voxpupuli/puppet-lldpd/pull/40) ([bastelfreak](https://github.com/bastelfreak))

## [v1.1.0](https://github.com/voxpupuli/puppet-lldpd/tree/v1.1.0) (2018-04-25)

[Full Changelog](https://github.com/voxpupuli/puppet-lldpd/compare/v1.0.1...v1.1.0)

**Merged pull requests:**

- bump puppet version requirement [\#37](https://github.com/voxpupuli/puppet-lldpd/pull/37) ([bastelfreak](https://github.com/bastelfreak))
- run acceptance tests on debian 9 [\#36](https://github.com/voxpupuli/puppet-lldpd/pull/36) ([bastelfreak](https://github.com/bastelfreak))
- switch to relative class scope / update gpg key for apt repos [\#34](https://github.com/voxpupuli/puppet-lldpd/pull/34) ([bastelfreak](https://github.com/bastelfreak))
- allow camptocamp/systemd 2.X [\#33](https://github.com/voxpupuli/puppet-lldpd/pull/33) ([bastelfreak](https://github.com/bastelfreak))

## [v1.0.1](https://github.com/voxpupuli/puppet-lldpd/tree/v1.0.1) (2018-02-21)

[Full Changelog](https://github.com/voxpupuli/puppet-lldpd/compare/v1.0.0...v1.0.1)

**Fixed bugs:**

- use ensure\_packages\(\) to install jq [\#30](https://github.com/voxpupuli/puppet-lldpd/pull/30) ([bastelfreak](https://github.com/bastelfreak))

**Closed issues:**

- Label sync [\#27](https://github.com/voxpupuli/puppet-lldpd/issues/27)

**Merged pull requests:**

- add parameter section to README.md [\#28](https://github.com/voxpupuli/puppet-lldpd/pull/28) ([bastelfreak](https://github.com/bastelfreak))

## [v1.0.0](https://github.com/voxpupuli/puppet-lldpd/tree/v1.0.0) (2017-11-21)

[Full Changelog](https://github.com/voxpupuli/puppet-lldpd/compare/d0082808d2659a820fdffa292c6395e9f8557fe6...v1.0.0)

**Implemented enhancements:**

- add puppet-strings documentation, mark private classes private [\#19](https://github.com/voxpupuli/puppet-lldpd/pull/19) ([bastelfreak](https://github.com/bastelfreak))
- add support for Debian8/9 and Ubuntu14.04/16.04 [\#17](https://github.com/voxpupuli/puppet-lldpd/pull/17) ([bastelfreak](https://github.com/bastelfreak))
- switch to https urls in the repofile [\#12](https://github.com/voxpupuli/puppet-lldpd/pull/12) ([bastelfreak](https://github.com/bastelfreak))
- add support for puppet5 [\#11](https://github.com/voxpupuli/puppet-lldpd/pull/11) ([bastelfreak](https://github.com/bastelfreak))

**Fixed bugs:**

- Repository setup on CentOS 6 is broken [\#16](https://github.com/voxpupuli/puppet-lldpd/issues/16)
- Module tries to install nonexistent package jq on CentOS [\#10](https://github.com/voxpupuli/puppet-lldpd/issues/10)
- Broken repo management [\#6](https://github.com/voxpupuli/puppet-lldpd/issues/6)
- Add missing datafile for RedHat [\#24](https://github.com/voxpupuli/puppet-lldpd/pull/24) ([bastelfreak](https://github.com/bastelfreak))
- fix scope typos in data [\#20](https://github.com/voxpupuli/puppet-lldpd/pull/20) ([bastelfreak](https://github.com/bastelfreak))
- Add unit tests + minor bugfixes [\#5](https://github.com/voxpupuli/puppet-lldpd/pull/5) ([bastelfreak](https://github.com/bastelfreak))
- set correct versions for OSes in metadata.json [\#3](https://github.com/voxpupuli/puppet-lldpd/pull/3) ([bastelfreak](https://github.com/bastelfreak))

**Merged pull requests:**

- update documentation about CentOS [\#26](https://github.com/voxpupuli/puppet-lldpd/pull/26) ([bastelfreak](https://github.com/bastelfreak))
- drop unused config class [\#25](https://github.com/voxpupuli/puppet-lldpd/pull/25) ([bastelfreak](https://github.com/bastelfreak))
- add badges to README.md [\#22](https://github.com/voxpupuli/puppet-lldpd/pull/22) ([bastelfreak](https://github.com/bastelfreak))
- add acceptance tests on centos6 [\#15](https://github.com/voxpupuli/puppet-lldpd/pull/15) ([bastelfreak](https://github.com/bastelfreak))
- update readme [\#14](https://github.com/voxpupuli/puppet-lldpd/pull/14) ([bastelfreak](https://github.com/bastelfreak))
- Clean up the specs [\#13](https://github.com/voxpupuli/puppet-lldpd/pull/13) ([ekohl](https://github.com/ekohl))
- Convert to data-in-modules [\#9](https://github.com/voxpupuli/puppet-lldpd/pull/9) ([bastelfreak](https://github.com/bastelfreak))
- Add acceptance tests [\#8](https://github.com/voxpupuli/puppet-lldpd/pull/8) ([bastelfreak](https://github.com/bastelfreak))
- drop fedora 24, add fedora 26/27 [\#7](https://github.com/voxpupuli/puppet-lldpd/pull/7) ([bastelfreak](https://github.com/bastelfreak))
- bump lower puppet-systemd version to at least 1.0.0 [\#4](https://github.com/voxpupuli/puppet-lldpd/pull/4) ([bastelfreak](https://github.com/bastelfreak))
- add AGPL-3 license [\#1](https://github.com/voxpupuli/puppet-lldpd/pull/1) ([bastelfreak](https://github.com/bastelfreak))



\* *This Changelog was automatically generated by [github_changelog_generator](https://github.com/github-changelog-generator/github-changelog-generator)*
