TERMUX_PKG_HOMEPAGE=https://www.spinellis.gr/sw/dgsh/
TERMUX_PKG_DESCRIPTION="dgsh is an advanced shell for programming higly complex pipe constructs for data flow in shell scripting. And hence it is the most essential tool for programmers, scripters, and system administrators. Having it on termux is highly needed."
TERMUX_PKG_LICENSE="Apache-2.0"
TERMUX_PKG_VERSION=1.0.0
TERMUX_PKG_SRCURL=https://github.com/dspinellis/dgsh.git
TERMUX_PKG_SHA256=
TERMUX_PKG_DEPENDS="fftw,rsync,libcheck,libelf"
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_configure() {
	cd $TERMUX_PKG_SRCDIR
	sed 's/\.\/configure\ --prefix=$(PREFIX)/\.\/configure\ --prefix=$(PREFIX)\ --host=$(TERMUX_HOST_PLATFORM)/g' -i Makefile
	sed 's/\.\/configure\ --prefix=$(PREFIX)/\.\/configure\ --prefix=$(PREFIX)\ --host=$(TERMUX_HOST_PLATFORM)/g' -i unix-tools/Makefile
	make PREFIX=$TERMUX_PREFIX TERMUX_HOST_PLATFORM=$TERMUX_HOST_PLATFORM config
}
