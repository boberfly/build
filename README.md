Overview
--------

This project provides a consistent build environment used for all releases
of GafferHQ/gaffer and GafferHQ/dependencies. It is not necessary to use this
environment to make your own builds, but it may be useful as a reference.

Prerequisites
-------------

- ARNOLD_ROOT environment variable pointing to installation of Arnold 5
- DELIGHT environment variable pointing to installation of 3delight 13
- Docker 17.05 or later

Usage
-----

Build and upload a gaffer release :

`./build.py --version 0.45.0.0 --upload 1`

Build and upload a dependencies release :

`./build.py --project dependencies --version 0.45.0.0 --upload 1`

Make a Linux release using Docker on a Mac :

`./build.py --docker 1 --arnoldRoot /path/to/linux/arnoldRoot --delightRoot /path/to/linux/delightRoot --version 0.46.0.0 --upload 1`

Make the Windows dependencies using Docker :
`./build.py --docker 1 --arnoldRoot /path/to/windows/arnoldRoot --delightRoot /path/to/windows/delightRoot --version 0.46.0.0 --platform windows`

Steps remaining to be automated
-------------------------------

- Update https://github.com/GafferHQ/documentation to include
  the latest docs.
- Update https://github.com/GafferHQ/gafferhq.github.io to point
  to the latest release.

Docker Cheatsheet
-----------------

Remove stopped containers :

`docker ps -aq --no-trunc | xargs docker rm`

Remove old images :

`docker images -q --filter dangling=true | xargs docker rmi`
