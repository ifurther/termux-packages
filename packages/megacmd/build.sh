TERMUX_PKG_HOMEPAGE=https://mega.nz/cmd
TERMUX_PKG_DESCRIPTION="MEGAcmd provides non UI access to MEGA services."
TERMUX_PKG_LICENSE="custom"
TERMUX_PKG_LICENSE_FILE=LICENSE
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=1.4.0
TERMUX_PKG_SRCURL=https://github.com/meganz/MEGAcmd.git
TERMUX_PKG_GIT_BRANCH=${TERMUX_PKG_VERSION}_Linux
TERMUX_PKG_DEPENDS="freeimage, c-ares, readline, cryptopp, curl, openssl, libcrypt, libsodium, libsqlite, libuv, pcre, zlib"
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="--with-freeimage=no"
termux_step_pre_configure() {
	git submodule update --init --recursive
	./autogen.sh
}
