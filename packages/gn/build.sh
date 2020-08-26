TERMUX_PKG_HOMEPAGE=https://gn.googlesource.com/gn.git
TERMUX_PKG_DESCRIPTION=" GN is a meta-build system that generates build files for Ninja."
TERMUX_PKG_LICENSE="custom"
TERMUX_PKG_LICENSE_FILE="LICENSE"
TERMUX_PKG_VERSION=lastest
TERMUX_PKG_GIT_BRANCH=master
TERMUX_PKG_SRCURL=https://gn.googlesource.com/gn.git
TERMUX_PKG_HOSTBUILD=true
#TERMUX_PKG_SHA256=
#TERMUX_PKG_DEPENDS=""
#TERMUX_PKG_BUILD_IN_SRC=true

termux_step_host_build() {
	termux_setup_ninja
	cd $TERMUX_PKG_SRCDIR
	git fetch --tags
	python build/gen.py
	ninja -C out
}
