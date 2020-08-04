TERMUX_PKG_HOMEPAGE=https://sourceforge.net/projects/minidlna
TERMUX_PKG_DESCRIPTION="Minidlna is a DLNA server."
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_VERSION=1.2.1
TERMUX_PKG_SRCURL=https://downloads.sourceforge.net/sourceforge/minidlna/minidlna-$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=67388ba23ab0c7033557a32084804f796aa2a796db7bb2b770fb76ac2a742eec
TERMUX_PKG_DEPENDS="libexif, libflac, libvorbis, libsqlite, libid3tag, ffmpeg, libjpeg-turbo, libogg"
TERMUX_PKG_BUILD_IN_SRC=true
#TERMUX_PKG_EXTRA_CONFIGURE_ARGS+="--host=$TERMUX_HOST_PLATFORM"

