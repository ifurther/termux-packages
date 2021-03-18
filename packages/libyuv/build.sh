TERMUX_PKG_HOMEPAGE=http://code.google.com/p/libyuv
TERMUX_PKG_DESCRIPTION="An open source project that includes YUV conversion and scaling functionality."
TERMUX_PKG_LICENSE="BSD 4-clause"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=
TERMUX_PKG_SRCURL=
TERMUX_PKG_SHA256=
#TERMUX_PKG_DEPENDS=""
#TERMUX_PKG_BUILD_IN_SRC=true

termux_step_get_source() {
	mkdir -p $TERMUX_PKG_SRCDIR
	cd $TERMUX_PKG_SRCDIR

	git clone --depth=1 https://chromium.googlesource.com/chromium/tools/depot_tools.git
	mkdir -p depot_tools/fakebin
	ln -sfr /usr/bin/python2 depot_tools/fakebin/python
	export PATH="$(pwd)/depot_tools/fakebin:$(pwd)/depot_tools:${PATH}"

	gclient config --name src https://chromium.googlesource.com/libyuv/libyuv
	gclient sync

	git checkout $TERMUX_PKG_VERSION

	echo "target_os = ['android']" >> .gclient
	gclient sync -D --force --reset
}

termux_step_configure() {
	termux_setup_cmake
}
