TERMUX_PKG_HOMEPAGE=https://www.rethinkdb.com/
TERMUX_PKG_DESCRIPTION="The open-source database for the realtime web. "
TERMUX_PKG_LICENSE="Apache-2.0"
TERMUX_PKG_LICENSE_FILE="COPYRIGHT"
TERMUX_PKG_VERSION=v2.4.0
TERMUX_PKG_SRCURL=https://github.com/rethinkdb/rethinkdb/archive/$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=e3749b644af0b230685a32ef31317a9dfebfee5582ded47c444c1c0eaa83712e
TERMUX_PKG_DEPENDS="ncurses, boost, curl, openssl, libcrypt, python, jemalloc, protobuf,libprotobuf-c, wget, nodejs"
#TERMUX_PKG_EXTRA_CONFIGURE_ARGS="--allow-fecth --prefix $TERMUX_PREFIX --sysconfdir $TERMUX_PREFIX/etc --localstatedir $TERMUX_PREFIX/var"
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_pre_configure() {
        termux_setup_protobuf
              
}