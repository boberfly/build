2.x.x
=====

- Dockerfile :
  - Updated GCC to 9.3.1.

1.3.0
=====

- build.py : Added `--pythonVariant` argument.
- Dockerfile :
  - Added `xcb` packages necessary for building Qt 5.15.
  - Fixed `pip` incompatibility with Python 2.

1.2.0
=====

- Dockerfile :
  - Switched SCL packages to the `7.6.1810` vault.
  - Updated sundry SCL dependency versions.
  - Added automatic `pip` upgrade to latest supported version.
  - Added `libxkb-common-x11-devel` package.
  - Updated `sphinx` to 1.8.1.

1.1.0
=====

- build.py :
  - Added support for building `GafferRenderman`.
  - Moved to GitHub Packages hosted Docker image.
- Dockerfile :
  - Added `git` to the build image.
  - Added `lz4` and `lz4-devel` to the image.
  - Updated package versions to latest.

 1.0.0
 =====

 - Initial release supporting version-locked container build with scl devtoolset-6.
