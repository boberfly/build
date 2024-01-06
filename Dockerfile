# We start with `aswf/ci-base` as it provides a Rocky 8 environment that meets
# the glibc requirements of VFXPlatform 2023 (2.28 or lower), with many of our
# build dependencies already pre-installed.

FROM aswf/ci-base:2023.2

# As we don't want to inadvertently grab newer versions of our yum-installed
# packages, we use yum-versionlock to keep them pinned. We track the list of
# image packages here, then compare after our install steps to see what was
# added, and only lock those. This saves us storing redundant entires for
# packages installed in the base image.

# To unlock versions, just make sure yum-versionlock.list is empty in the repo
COPY versionlock.sh ./
COPY yum-versionlock.list /etc/yum/pluginconf.d/versionlock.list

RUN yum install -y 'dnf-command(versionlock)' && \
	./versionlock.sh list-installed /tmp/packages && \
#
#
# NOTE: If you add a new yum package here, make sure you update the version
# lock files as follows and commit the changes to yum-versionlock.list:
#
#   ./build-docker.py --update-version-locks --new-only
#
#	We install SCons via `pip install` rather than by
#	`yum install` because this prevents a Cortex build failure
#	caused by SCons picking up the wrong Python version and being
#	unable to find its own modules.
#
	pip install scons==3.1.2 && \
#
#	Install Appleseed dependencies
#
	yum install -y \
		lz4 lz4-devel && \
#
# Install packages needed to generate the
# Gaffer documentation.
#
	yum install -y \
		mesa-dri-drivers.x86_64 \
		metacity \
		gnome-themes-standard && \
# Note: When updating these, also update the MacOS setup in .github/workflows/main.yaml
# (in GafferHQ/gaffer).
	pip install \
		sphinx==4.3.1 \
		sphinx_rtd_theme==1.0.0 \
		myst-parser==0.15.2 \
		docutils==0.17.1 && \
#
	yum install -y inkscape && \
#
# Now we've installed all our packages, update yum-versionlock for all the
# new packages so we can copy the versionlock.list out of the container when we
# want to update the build env.
# If there were already locks in the list from the source checkout then the
# correct version will already be installed and we just ignore this...
	./versionlock.sh lock-new /tmp/packages

# ci-base sets PYTHONPATH, so we override it back to nothing for our env
ENV PYTHONPATH=
