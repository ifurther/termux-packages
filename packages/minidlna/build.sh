TERMUX_PKG_HOMEPAGE=https://sourceforge.net/projects/minidlna
TERMUX_PKG_DESCRIPTION="Minidlna is a DLNA server."
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_VERSION=1.2.1
TERMUX_PKG_SRCURL=https://downloads.sourceforge.net/sourceforge/minidlna/minidlna-$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=af3f8a08512f1f14484ad4fb207044592cd0699f3ad1a502222fd5577a598e37
TERMUX_PKG_DEPENDS="libexif, libflac, libvorbis, libsqlite, libid3tag, ffmpeg, libjpeg-turbo, libogg"
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_EXTRA_MAKE_ARGS="DESTDIR=${TERMUX_PREFIX}/../"
TERMUX_PKG_MAKE_INSTALL_TARGET="DESTDIR=${TERMUX_PREFIX}/../ install"

termux_step_pre_make() {
	sed 's/\/usr/\$TERMUX_PREFIX/g' -i genconfig.sh
	sed 's/\/usr/\$TERMUX_PREFIX/g' -i Makefile
}
