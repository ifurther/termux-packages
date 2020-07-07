TERMUX_PKG_HOMEPAGE=https://v8.dev/
TERMUX_PKG_DESCRIPTION="V8 is Google’s open source high-performance JavaScript and WebAssembly engine, written in C++."
TERMUX_PKG_LICENSE="BSD"
TERMUX_PKG_VERSION=8.5.197
#TERMUX_PKG_SRCURL=https://github.com/v8/v8/archive/$TERMUX_PKG_VERSION.tar.gz
#TERMUX_PKG_SHA256=82292ac4b8ce61bdcbb37b115ac468fd6a58cf6d1971f49c4966ba77a92036a5
#TERMUX_PKG_DEPENDS=""
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_extract_package() {
	termux_setup_depot_tools
	# Provide 'python' as Python v2.
	mkdir fakebin
	(set -e; cd fakebin && ln -sf "$(command -v python2)" python)
	PATH="$(realpath ./fakebin):$PATH"
	export PATH
	if [ ! -d $TERMUX_PKG_SRCDIR ]; then

		rm -Rf $TERMUX_PKG_SRCDIR
		mkdir -p $TERMUX_PKG_SRCDIR
		gclient config --unmanaged https://chromium.googlesource.com/v8/v8.git
		git clone https://github.com/v8/v8.git \
			$TERMUX_PKG_SRCDIR
		cd $TERMUX_PKG_SRCDIR
		local vserioncommit=$(git rev-parse refs/tags/$TERMUX_PKG_VERSION)
		gclient sync --revision v8@$vserioncommit
	fi
}

termux_step_pre_configure() {
	termux_setup_depot_tools
	#gn gen out/foo --args='is_debug=false target_cpu="x64" v8_target_cpu="arm64" use_goma=true'
	tools/dev/gm.py arm64.release
}
