# Changelog

## [2.0.3](https://github.com/matteoredz/itax-code/compare/v2.0.2...v2.0.3) (2024-02-20)


### Continuous Integration

* add Ruby 3.3.0 to the test matrix ([#50](https://github.com/matteoredz/itax-code/issues/50)) ([2875b20](https://github.com/matteoredz/itax-code/commit/2875b2002d56327a0fbd652b275235093afebd62))


### Bug Fixes

* require the csv gem as runtime dependency ([#51](https://github.com/matteoredz/itax-code/issues/51)) ([5d3658e](https://github.com/matteoredz/itax-code/commit/5d3658ee8b4394a72555d3538b5ff30a18386491))

## [2.0.2](https://github.com/matteoredz/itax-code/compare/v2.0.1...v2.0.2) (2023-11-04)


### Continuous Integration

* remove .travis.yml ([#49](https://github.com/matteoredz/itax-code/issues/49)) ([179141c](https://github.com/matteoredz/itax-code/commit/179141c9fc6aedefaad7f38cab70d6aa0d31e478))


### Miscellaneous Chores

* add quality badges + enable branch coverage ([#41](https://github.com/matteoredz/itax-code/issues/41)) ([cd3a950](https://github.com/matteoredz/itax-code/commit/cd3a950d85bf499526e7aa89dd468cb324e60e1b))


### Bug Fixes

* display all changelog-types ([#47](https://github.com/matteoredz/itax-code/issues/47)) ([d4eddf1](https://github.com/matteoredz/itax-code/commit/d4eddf109fc2bf112ded9f7ee7fca4d188269aaa))
* pass CC_TEST_REPORTER_ID top-down to test workflow ([#45](https://github.com/matteoredz/itax-code/issues/45)) ([89398f2](https://github.com/matteoredz/itax-code/commit/89398f2fd681f62296268a1aeffd6f0782ccdf95))
* require lint and test workflows run also on main ([#43](https://github.com/matteoredz/itax-code/issues/43)) ([f0a0d06](https://github.com/matteoredz/itax-code/commit/f0a0d06cc3682c39b2a5036d7bddc205eb0fc21c))
* update README.md for SEO ([#48](https://github.com/matteoredz/itax-code/issues/48)) ([04db3eb](https://github.com/matteoredz/itax-code/commit/04db3eb4299e22b598fd13223fb4f8e36da52539))


### Code Refactoring

* make gem errors inherit from base classes ([#37](https://github.com/matteoredz/itax-code/issues/37)) ([99b00f1](https://github.com/matteoredz/itax-code/commit/99b00f152d9172bebd5f59d4d69e187cf7968a23))
* remove ActiveSupport dependency ([#39](https://github.com/matteoredz/itax-code/issues/39)) ([9302954](https://github.com/matteoredz/itax-code/commit/93029541f510924a92acdf413f33a1b9ea939230))

## [2.0.1](https://github.com/matteoredz/itax-code/compare/v2.0.0...v2.0.1) (2023-10-06)


### Bug Fixes

* fix encoding error in cities.rake and update cities.csv ([#34](https://github.com/matteoredz/itax-code/issues/34)) ([80ff044](https://github.com/matteoredz/itax-code/commit/80ff044cfd4961348304f3d99b3f7bbe96773a4f))

## [2.0.0](https://github.com/matteoredz/itax-code/compare/v1.0.1...v2.0.0) (2023-10-01)


### ⚠ BREAKING CHANGES

* remove Validator and merge its logic into Parser ([#32](https://github.com/matteoredz/itax-code/issues/32))
* remove data hash argument from ItaxCode.valid? and ItaxCode::Validator#valid? ([#30](https://github.com/matteoredz/itax-code/issues/30))

### Bug Fixes

* remove data hash argument from ItaxCode.valid? and ItaxCode::Validator#valid? ([#30](https://github.com/matteoredz/itax-code/issues/30)) ([997f8b0](https://github.com/matteoredz/itax-code/commit/997f8b0b9f4bc00012475950a84465bf06b73a52))


### Code Refactoring

* remove Validator and merge its logic into Parser ([#32](https://github.com/matteoredz/itax-code/issues/32)) ([348bdd0](https://github.com/matteoredz/itax-code/commit/348bdd003d1709b0dd2d41e58b0307a1b8e23ab1))

## [1.0.1](https://github.com/matteoredz/itax-code/compare/v1.0.0...v1.0.1) (2023-08-31)


### Bug Fixes

* NoMethodError undefined method 'upcase' for nil:NilClass ([#27](https://github.com/matteoredz/itax-code/issues/27)) ([15470d1](https://github.com/matteoredz/itax-code/commit/15470d104a8c0c958e24de199243692e88a94b92))

## [1.0.0](https://github.com/matteoredz/itax-code/compare/v0.4.1...v1.0.0) (2023-08-30)


### ⚠ BREAKING CHANGES

* allow empty or partial data argument in ItaxCode.valid? ([#26](https://github.com/matteoredz/itax-code/issues/26))
* raise InvalidControlInternalNumberError on cin mismatch ([#25](https://github.com/matteoredz/itax-code/issues/25))

### Features

* allow empty or partial data argument in ItaxCode.valid? ([#26](https://github.com/matteoredz/itax-code/issues/26)) ([d02da6d](https://github.com/matteoredz/itax-code/commit/d02da6d17a4c04e1a5e07d7dd9d9d966479346bd))


### Bug Fixes

* compute omocodes from the original one ([#22](https://github.com/matteoredz/itax-code/issues/22)) ([b8a963f](https://github.com/matteoredz/itax-code/commit/b8a963faba2c46e1d23c0dc643a257aabd648dd9))
* raise InvalidControlInternalNumberError on cin mismatch ([#25](https://github.com/matteoredz/itax-code/issues/25)) ([121cbca](https://github.com/matteoredz/itax-code/commit/121cbcaf75788c99bee4ffd7a997d07783a7fc15))

## [0.4.1](https://github.com/matteoredz/itax-code/compare/v0.4.0...v0.4.1) (2023-08-08)


### Bug Fixes

* disable MFA as it breaks the CI ([#20](https://github.com/matteoredz/itax-code/issues/20)) ([7c9568e](https://github.com/matteoredz/itax-code/commit/7c9568e66618e324d4da137ddc6d0680b6900daa))

## [0.4.0](https://github.com/matteoredz/itax-code/compare/v0.3.0...v0.4.0) (2023-08-08)


### Features

* improve omocodes algo ([0834c43](https://github.com/matteoredz/itax-code/commit/0834c4372d300e29057bc283556b6af532cca722))


### Bug Fixes

* explicit the workflow permissions ([#17](https://github.com/matteoredz/itax-code/issues/17)) ([41d3515](https://github.com/matteoredz/itax-code/commit/41d35154db7f18622369a0b35ce0eb6b13fe4812))

## [0.3.0](https://github.com/matteoredz/itax-code/compare/v0.2.0...v0.3.0) (2023-06-30)


### Features

* trigger release action on bump ([#9](https://github.com/matteoredz/itax-code/issues/9)) ([412f054](https://github.com/matteoredz/itax-code/commit/412f054a9e93d95bcf86244121c3097c8e76f515))


### Bug Fixes

* restore release workflow ([#8](https://github.com/matteoredz/itax-code/issues/8)) ([876fc6b](https://github.com/matteoredz/itax-code/commit/876fc6bb69d31e73e611a0e74ee1b27ed2fea966))
