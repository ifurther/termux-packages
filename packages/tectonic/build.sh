TERMUX_PKG_HOMEPAGE=https://tectonic-typesetting.github.io/en-US/index.html
TERMUX_PKG_DESCRIPTION="Tectonic is a modernized, complete, self-contained TeX/LaTeX engine."
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_VERSION=0.1.12
TERMUX_PKG_SRCURL=https://github.com/tectonic-typesetting/tectonic/archive/v$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=30d2e0fe31145a10097368f11a00540ba201be43d28e7ad580699f47bfa70bf4
TERMUX_PKG_DEPENDS="fontconfig, libgraphite, libicu, harfbuzz, openssl, zlib"
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_pre_configure() {
	termux_setup_rust
	LDFLAGS+=" -fno-rtti -fuse-ld=lld"	
}
