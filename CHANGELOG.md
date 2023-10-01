# Changelog

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
