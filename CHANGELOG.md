# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [v8.25.1-1] - 2025-12-31
### Changed
- [#42] Update Gotenberg to v8.25.1
- [#42] Update base image to v3.23.0-1

## [v8.23.2-1] - 2025-09-30
### Changed
- [#40] Update Gotenberg to v8.23.2

## [v8.23.1-1] - 2025-09-23
### Changed
- [#38] Update Gotenberg to v8.23.1

## [v8.23.0-2] - 2025-09-19
### Security
- [#34] Fixed [CVE-2025-54874](https://avd.aquasec.com/nvd/2025/cve-2025-54874)
- [#34] Fixed [CVE-2025-58050](https://avd.aquasec.com/nvd/2025/cve-2025-58050)

## [v8.23.0-1] - 2025-09-04
### Changed
- [#34] Update Gotenberg to v8.23.0

## [v8.22.0-1] - 2025-08-20
### Changed
- [#32] Update Gotenberg to v8.22.0
- [#32] Update Makefiles to v10.2.0
### Security
- [#32] Fixed [CVE-2023-45853](https://nvd.nist.gov/vuln/detail/CVE-2023-45853)
- [#32] Fixed [CVE-2024-38428](https://nvd.nist.gov/vuln/detail/CVE-2024-38428)
- [#32] Fixed [CVE-2025-6965](https://nvd.nist.gov/vuln/detail/CVE-2025-6965)
- [#32] Fixed [CVE-2025-49794](https://nvd.nist.gov/vuln/detail/CVE-2025-49794)
- [#32] Fixed [CVE-2025-49796](https://nvd.nist.gov/vuln/detail/CVE-2025-49796)

## [v8.21.1-2] - 2025-07-15
### Fixed
- [#28] Missing permissions to `/var/ces` would cause dogu to crash-loop in multinode

## [v8.21.1-1] - 2025-06-19
### Changed
- [#26] Update Gotenberg to v8.21.1
- [#26] Update base image to v3.22.0-2
- [#26] Added pipe-build-lib
### Security
- [#26] Added to .trivyignore [CVE-2025-49794](https://nvd.nist.gov/vuln/detail/CVE-2025-49794)
- [#26] Added to .trivyignore [CVE-2025-49796](https://nvd.nist.gov/vuln/detail/CVE-2025-49796)

## [v8.21.0-1] - 2025-05-23
### Changed
- [#24] Update Gotenberg to 8.21.0

## [v8.20.1-1] - 2025-05-05
### Changed
- [#22] Update Gotenberg to 8.20.1

## [v8.18.0-2] - 2025-04-24
### Changed
- [#20] Set sensible resource requests and limits

## [v8.18.0-1] - 2025-04-10
### Changed
- [#18] Update Gotenberg to 8.18.0
- [#18] Update Makefiles to 9.9.1
- [#18] Update ces-build-lib to 4.2.0
- [#18] Update dogu-build-lib to 3.2.0

## [v8.15.3-2] - 2025-02-12
### Added
- [#16] Add missing dogu-config in dogu.json

## [v8.15.3-1] - 2025-01-16
- [#14] Upgrade Gotenberg to 8.15.3
- [#12] Update Makefiles to 9.5.0
- Upgrade ces-build-lib to 4.0.1
- Upgrade dogu-build-lib to 3.0.0

## [v8.12.0-1] - 2024-10-22
### Changed
- Upgrade Gotenberg to 8.12.0

## [v8.8.0-3] - 2024-09-18
### Changed
- Relicense to AGPL-3.0-only

## [v8.8.0-2] - 2024-08-06
### Changed
- Upgrade base image to version 3.20.2-1

## [v8.8.0-1] - 2024-07-22
### Changed
- Upgrade Gotenberg to 8.8.0

## [v8.2.0-1] - 2024-03-04
### Changed
- Upgrade Gotenberg to 8.2.0

## [v7.9.2-2] - 2023-10-04
### Fixed
- Re-release dogu to fix [CVE-2023-4863](https://nvd.nist.gov/vuln/detail/CVE-2023-4863)

## [v7.9.2-1] - 2023-10-04
### Changed
- Upgrade Gotenberg to 7.9.2

## [v7.8.3-1] - 2023-07-19
### Changed
- Upgrade Gotenberg to 7.8.3

## [v7.8.2-2] - 2023-05-05
### Added
- Makefiles v7.5.0

### Changed
- Upgrade ces-build-lib to 1.64.2
- Upgrade dogu-build-lib to 2.1.0

## [7.8.2-1]
### Changed
- Upgrade Gotenberg to 7.8.2

## [7.5.2-1]
### Changed
- Improve dogu to fulfill `Definition of Done` ([#2](https://github.com/cloudogu/gotenberg/pull/2))
- Upgrade Gotenberg to 7.5.2

## Fixed
- LibZ CVE by upgrading libraries

## [7.1.0-1]
### Added
- Initial release
