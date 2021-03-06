TERMUX_PKG_HOMEPAGE=https://www.rethinkdb.com/
TERMUX_PKG_DESCRIPTION="The open-source database for the realtime web. "
TERMUX_PKG_LICENSE="Apache-2.0"
TERMUX_PKG_LICENSE_FILE="COPYRIGHT"
TERMUX_PKG_VERSION=v2.4.0-srh-win-1
TERMUX_PKG_SRCURL=https://github.com/rethinkdb/rethinkdb/archive/v$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=e3749b644af0b230685a32ef31317a9dfebfee5582ded47c444c1c0eaa83712e
TERMUX_PKG_DEPENDS="ncurses, libcurl, openssl, libcrypt, python, protobuf, libprotobuf-c, nodejs, libicu"
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_BLACKLISTED_ARCHES="arm, i686, x86_64"

TERMUX_MAKE_PROCESSES=1

termux_step_configure() {
	termux_setup_protobuf

	# Provide 'python' as Python v2.
	mkdir fakebin
	(set -e; cd fakebin && ln -sf "$(command -v python2)" python)
	PATH="$(realpath ./fakebin):$PATH"
	export PATH

	./configure --prefix $TERMUX_PREFIX \
		--sysconfdir $TERMUX_PREFIX/etc \
		--localstatedir $TERMUX_PREFIX/var \
		--fetch coffee \
		--fetch boost \
		--fetch browserify \
		--with-system-malloc \
		CXXFLAGS="$CXXFLAGS $CPPFLAGS" LDFLAGS="$LDFLAGS"
}
