TERMUX_PKG_HOMEPAGE=https://v8.dev/
TERMUX_PKG_DESCRIPTION="V8 is Google’s open source high-performance JavaScript and WebAssembly engine, written in C++."
TERMUX_PKG_LICENSE="BSD"
TERMUX_PKG_VERSION=8.5.197
#TERMUX_PKG_SRCURL=https://github.com/v8/v8/archive/$TERMUX_PKG_VERSION.tar.gz
#TERMUX_PKG_SHA256=82292ac4b8ce61bdcbb37b115ac468fd6a58cf6d1971f49c4966ba77a92036a5
#TERMUX_PKG_DEPENDS=""
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_extract_package() {
	# Provide 'python' as Python v2.
	if [ ! -e fakebin ];then mkdir fakebin; fi
	(set -e; cd fakebin && ln -sf "$(command -v python2)" python)
	PATH="$(realpath ./fakebin):$PATH"
	export PATH

	mkdir -p $TERMUX_PKG_SRCDIR
	cd $TERMUX_PKG_SRCDIR

	git clone --depth=1 https://chromium.googlesource.com/chromium/tools/depot_tools.git
	export PATH="$(pwd)/depot_tools:${PATH}"

	fetch v8

	cd v8
	git checkout $TERMUX_PKG_VERSION
	cd ../

	echo "target_os = ['android']" >> .gclient
	gclient sync -D --force --reset

}

termux_step_pre_configure() {
	cd v8

	local DEST_CPU
	if [ $TERMUX_ARCH = "arm" ]; then
		DEST_CPU="arm"
	elif [ $TERMUX_ARCH = "i686" ]; then
		DEST_CPU="ia32"
	elif [ $TERMUX_ARCH = "aarch64" ]; then
		DEST_CPU="arm64"
	elif [ $TERMUX_ARCH = "x86_64" ]; then
		DEST_CPU="x64"
	else
		termux_error_exit "Unsupported arch '$TERMUX_ARCH'"
	fi

	#gn gen out/foo --args='is_debug=false target_cpu="x64" v8_target_cpu="arm64" use_goma=true'
	tools/dev/gm.py $DEST_CPU.release
}

termux_step_make() {
	cd v8

	local DEST_CPU
	if [ $TERMUX_ARCH = "arm" ]; then
		DEST_CPU="arm"
	elif [ $TERMUX_ARCH = "i686" ]; then
		DEST_CPU="ia32"
	elif [ $TERMUX_ARCH = "aarch64" ]; then
		DEST_CPU="arm64"
	elif [ $TERMUX_ARCH = "x86_64" ]; then
		DEST_CPU="x64"
	else
		termux_error_exit "Unsupported arch '$TERMUX_ARCH'"
	fi

	rm -f ./out/*/args.gn
	ninja -C out.gn/$DEST_CPU.releas
}

termux_step_make_install() {
	cd v8

	local DEST_CPU
	if [ $TERMUX_ARCH = "arm" ]; then
		DEST_CPU="ARM"
	elif [ $TERMUX_ARCH = "i686" ]; then
		DEST_CPU="IA32"
	elif [ $TERMUX_ARCH = "aarch64" ]; then
		DEST_CPU="ARM64"
	elif [ $TERMUX_ARCH = "x86_64" ]; then
		DEST_CPU="X64"
	else
		termux_error_exit "Unsupported arch '$TERMUX_ARCH'"
	fi	
	
	chmod +x ./.out.gn/${DEST_CPU}.release/d8
	cp -r ./.out.gn/${DEST_CPU}.release/ ${TERMUX_PREFIX}/lib/V8
}


