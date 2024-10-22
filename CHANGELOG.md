# Changelog

## [3.0.0](https://github.com/matteoredz/itax-code/compare/v2.0.5...v3.0.0) (2024-10-22)


### ⚠ BREAKING CHANGES

* remove Validator and merge its logic into Parser ([#32](https://github.com/matteoredz/itax-code/issues/32))
* remove data hash argument from ItaxCode.valid? and ItaxCode::Validator#valid? ([#30](https://github.com/matteoredz/itax-code/issues/30))
* allow empty or partial data argument in ItaxCode.valid? ([#26](https://github.com/matteoredz/itax-code/issues/26))
* raise InvalidControlInternalNumberError on cin mismatch ([#25](https://github.com/matteoredz/itax-code/issues/25))

### Continuous Integration

* add Ruby 3.3.0 to the test matrix ([#50](https://github.com/matteoredz/itax-code/issues/50)) ([2875b20](https://github.com/matteoredz/itax-code/commit/2875b2002d56327a0fbd652b275235093afebd62))
* remove .travis.yml ([#49](https://github.com/matteoredz/itax-code/issues/49)) ([179141c](https://github.com/matteoredz/itax-code/commit/179141c9fc6aedefaad7f38cab70d6aa0d31e478))
* update paambaati/codeclimate-action to v6.0.0 ([#55](https://github.com/matteoredz/itax-code/issues/55)) ([e7aad01](https://github.com/matteoredz/itax-code/commit/e7aad0168aa18df97235171082e9bd40287dee84))


### Miscellaneous Chores

* add missing id to release-please step ([f897aae](https://github.com/matteoredz/itax-code/commit/f897aae24c7c8e126f2fc30c89458cb6ddb4cb90))
* add quality badges + enable branch coverage ([#41](https://github.com/matteoredz/itax-code/issues/41)) ([cd3a950](https://github.com/matteoredz/itax-code/commit/cd3a950d85bf499526e7aa89dd468cb324e60e1b))
* **main:** release 0.3.0 ([#13](https://github.com/matteoredz/itax-code/issues/13)) ([da947ee](https://github.com/matteoredz/itax-code/commit/da947eed273f41137f5ade102d0cc2c2cf7d9624))
* **main:** release 0.4.0 ([#18](https://github.com/matteoredz/itax-code/issues/18)) ([d12ad45](https://github.com/matteoredz/itax-code/commit/d12ad4594fbced36e5b19ad52fa1ec674b44fc7b))
* **main:** release 0.4.1 ([#21](https://github.com/matteoredz/itax-code/issues/21)) ([85cc3fe](https://github.com/matteoredz/itax-code/commit/85cc3fed411fd4e628181934023309d86260b75c))
* **main:** release 1.0.0 ([#23](https://github.com/matteoredz/itax-code/issues/23)) ([116cfd7](https://github.com/matteoredz/itax-code/commit/116cfd70e698819ad1c75e10c16546ede0d2c342))
* **main:** release 1.0.1 ([#28](https://github.com/matteoredz/itax-code/issues/28)) ([a17bbc4](https://github.com/matteoredz/itax-code/commit/a17bbc4d4229928665775368748d2454e222e68c))
* **main:** release 2.0.0 ([#33](https://github.com/matteoredz/itax-code/issues/33)) ([7184cf1](https://github.com/matteoredz/itax-code/commit/7184cf1b5d0691aa5be87feb79ad42ef03d8c2b9))
* **main:** release 2.0.1 ([#35](https://github.com/matteoredz/itax-code/issues/35)) ([d0936b0](https://github.com/matteoredz/itax-code/commit/d0936b0c8ef34b379af7af24df760ccf2a7d5092))
* **main:** release 2.0.2 ([#46](https://github.com/matteoredz/itax-code/issues/46)) ([3daa4fe](https://github.com/matteoredz/itax-code/commit/3daa4fe03c97e2e4d01bc41c1b335dd291760a33))
* **main:** release 2.0.3 ([#52](https://github.com/matteoredz/itax-code/issues/52)) ([ead6fc7](https://github.com/matteoredz/itax-code/commit/ead6fc778129836ef53dfad46f286089269b15b4))
* **main:** release 2.0.4 ([#54](https://github.com/matteoredz/itax-code/issues/54)) ([ffac35c](https://github.com/matteoredz/itax-code/commit/ffac35cc0d1cba1f58a4dd186bcc6c8fd7a04508))
* **main:** release 2.0.5 ([#58](https://github.com/matteoredz/itax-code/issues/58)) ([4411c61](https://github.com/matteoredz/itax-code/commit/4411c6189280478ca4fc63138ac59524c94b1554))
* update checkout action to v3 ([#19](https://github.com/matteoredz/itax-code/issues/19)) ([ed7c1ce](https://github.com/matteoredz/itax-code/commit/ed7c1ce240e27ba03ed6b7347e117edcca901bb2))


### Documentation

* update README.md ([#24](https://github.com/matteoredz/itax-code/issues/24)) ([7d0151e](https://github.com/matteoredz/itax-code/commit/7d0151ecf0293da29a1a4f92f09948a460806828))


### Features

* add ability to decode foreign countries tax codes ([c73e61c](https://github.com/matteoredz/itax-code/commit/c73e61cba1e637bf3aaa952a0a8a4d18aa389004))
* add ability to encode tax code for foreign countries ([b5bae25](https://github.com/matteoredz/itax-code/commit/b5bae252babcbbe01ab4a501439ff31f2ad808ef))
* add custom exceptions for Parser and Encoder class ([385ee32](https://github.com/matteoredz/itax-code/commit/385ee32e8ceba32d66ea51f0a1ffc80b95878297))
* allow empty or partial data argument in ItaxCode.valid? ([#26](https://github.com/matteoredz/itax-code/issues/26)) ([d02da6d](https://github.com/matteoredz/itax-code/commit/d02da6d17a4c04e1a5e07d7dd9d9d966479346bd))
* extract code and test from internal gem ([8023db8](https://github.com/matteoredz/itax-code/commit/8023db87f87dd5cb43b8f58c0239be9a5b950398))
* improve omocodes algo ([0834c43](https://github.com/matteoredz/itax-code/commit/0834c4372d300e29057bc283556b6af532cca722))
* permit Belfiore code as birthplace in Encoder#encode ([#6](https://github.com/matteoredz/itax-code/issues/6)) ([fadd993](https://github.com/matteoredz/itax-code/commit/fadd9932e7b1659281f7075d07e5fd98c1286a91))
* trigger release action on bump ([#9](https://github.com/matteoredz/itax-code/issues/9)) ([412f054](https://github.com/matteoredz/itax-code/commit/412f054a9e93d95bcf86244121c3097c8e76f515))
* update README.md + code doc ([260a22e](https://github.com/matteoredz/itax-code/commit/260a22ecbdf938d1ad27f2e013bfecb5e046fd63))
* update README.md with credits ([26eb69a](https://github.com/matteoredz/itax-code/commit/26eb69afdf32b06b12d9c55c979e659f5571b9f0))


### Bug Fixes

* bundle all gems in build-and-push action ([#3](https://github.com/matteoredz/itax-code/issues/3)) ([056cb49](https://github.com/matteoredz/itax-code/commit/056cb497ab29009a26cf6e774a53fe36603793d0))
* compute omocodes from the original one ([#22](https://github.com/matteoredz/itax-code/issues/22)) ([b8a963f](https://github.com/matteoredz/itax-code/commit/b8a963faba2c46e1d23c0dc643a257aabd648dd9))
* disable MFA as it breaks the CI ([#20](https://github.com/matteoredz/itax-code/issues/20)) ([7c9568e](https://github.com/matteoredz/itax-code/commit/7c9568e66618e324d4da137ddc6d0680b6900daa))
* display all changelog-types ([#47](https://github.com/matteoredz/itax-code/issues/47)) ([d4eddf1](https://github.com/matteoredz/itax-code/commit/d4eddf109fc2bf112ded9f7ee7fca4d188269aaa))
* explicit the workflow permissions ([#17](https://github.com/matteoredz/itax-code/issues/17)) ([41d3515](https://github.com/matteoredz/itax-code/commit/41d35154db7f18622369a0b35ce0eb6b13fe4812))
* fix encoding error in cities.rake and update cities.csv ([#34](https://github.com/matteoredz/itax-code/issues/34)) ([80ff044](https://github.com/matteoredz/itax-code/commit/80ff044cfd4961348304f3d99b3f7bbe96773a4f))
* NoMethodError ([#27](https://github.com/matteoredz/itax-code/issues/27)) ([15470d1](https://github.com/matteoredz/itax-code/commit/15470d104a8c0c958e24de199243692e88a94b92))
* parsing impossible dates ([#56](https://github.com/matteoredz/itax-code/issues/56)) ([4f5cc91](https://github.com/matteoredz/itax-code/commit/4f5cc91805db82f4195b75f677a95b37935d664d))
* pass CC_TEST_REPORTER_ID top-down to test workflow ([#45](https://github.com/matteoredz/itax-code/issues/45)) ([89398f2](https://github.com/matteoredz/itax-code/commit/89398f2fd681f62296268a1aeffd6f0782ccdf95))
* raise InvalidControlInternalNumberError on cin mismatch ([#25](https://github.com/matteoredz/itax-code/issues/25)) ([121cbca](https://github.com/matteoredz/itax-code/commit/121cbcaf75788c99bee4ffd7a997d07783a7fc15))
* remove data hash argument from ItaxCode.valid? and ItaxCode::Validator#valid? ([#30](https://github.com/matteoredz/itax-code/issues/30)) ([997f8b0](https://github.com/matteoredz/itax-code/commit/997f8b0b9f4bc00012475950a84465bf06b73a52))
* require lint and test workflows run also on main ([#43](https://github.com/matteoredz/itax-code/issues/43)) ([f0a0d06](https://github.com/matteoredz/itax-code/commit/f0a0d06cc3682c39b2a5036d7bddc205eb0fc21c))
* require the csv gem as runtime dependency ([#51](https://github.com/matteoredz/itax-code/issues/51)) ([5d3658e](https://github.com/matteoredz/itax-code/commit/5d3658ee8b4394a72555d3538b5ff30a18386491))
* restore release workflow ([#8](https://github.com/matteoredz/itax-code/issues/8)) ([876fc6b](https://github.com/matteoredz/itax-code/commit/876fc6bb69d31e73e611a0e74ee1b27ed2fea966))
* rubocop integration ([97f82e1](https://github.com/matteoredz/itax-code/commit/97f82e1579d10d1d7210b6df1e7fafa10b132642))
* undefined method 'upcase' for nil:NilClass ([15470d1](https://github.com/matteoredz/itax-code/commit/15470d104a8c0c958e24de199243692e88a94b92))
* update rdoc and README.md ([fb3de43](https://github.com/matteoredz/itax-code/commit/fb3de43ae1e117fc46e78aaf9cd7310c27358e81))
* update README.md for SEO ([#48](https://github.com/matteoredz/itax-code/issues/48)) ([04db3eb](https://github.com/matteoredz/itax-code/commit/04db3eb4299e22b598fd13223fb4f8e36da52539))


### Code Refactoring

* automate cities and countries data import ([#14](https://github.com/matteoredz/itax-code/issues/14)) ([57eda12](https://github.com/matteoredz/itax-code/commit/57eda12e4db13320efdf31daa47996b03e1bbe05))
* converted Utils class in module ([#53](https://github.com/matteoredz/itax-code/issues/53)) ([99dddee](https://github.com/matteoredz/itax-code/commit/99dddee715b3bc5deccd27c6734832e7f9ec7cd0))
* improve gh workflows triggers ([#7](https://github.com/matteoredz/itax-code/issues/7)) ([7444786](https://github.com/matteoredz/itax-code/commit/744478687c4c5970b6685cd90e296f9b51bbfda7))
* introduce release-please action ([#12](https://github.com/matteoredz/itax-code/issues/12)) ([fe4a33f](https://github.com/matteoredz/itax-code/commit/fe4a33ff259582d3370b1c527824f12fd14093a0))
* make gem errors inherit from base classes ([#37](https://github.com/matteoredz/itax-code/issues/37)) ([99b00f1](https://github.com/matteoredz/itax-code/commit/99b00f152d9172bebd5f59d4d69e187cf7968a23))
* remove ActiveSupport dependency ([#39](https://github.com/matteoredz/itax-code/issues/39)) ([9302954](https://github.com/matteoredz/itax-code/commit/93029541f510924a92acdf413f33a1b9ea939230))
* remove Validator and merge its logic into Parser ([#32](https://github.com/matteoredz/itax-code/issues/32)) ([348bdd0](https://github.com/matteoredz/itax-code/commit/348bdd003d1709b0dd2d41e58b0307a1b8e23ab1))

## [2.0.5](https://github.com/matteoredz/itax-code/compare/v2.0.4...v2.0.5) (2024-10-22)


### Bug Fixes

* parsing impossible dates ([#56](https://github.com/matteoredz/itax-code/issues/56)) ([4f5cc91](https://github.com/matteoredz/itax-code/commit/4f5cc91805db82f4195b75f677a95b37935d664d))

## [2.0.4](https://github.com/matteoredz/itax-code/compare/v2.0.3...v2.0.4) (2024-05-02)


### Continuous Integration

* update paambaati/codeclimate-action to v6.0.0 ([#55](https://github.com/matteoredz/itax-code/issues/55)) ([e7aad01](https://github.com/matteoredz/itax-code/commit/e7aad0168aa18df97235171082e9bd40287dee84))


### Code Refactoring

* converted Utils class in module ([#53](https://github.com/matteoredz/itax-code/issues/53)) ([99dddee](https://github.com/matteoredz/itax-code/commit/99dddee715b3bc5deccd27c6734832e7f9ec7cd0))

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
