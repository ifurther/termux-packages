TERMUX_PKG_HOMEPAGE="https://salsa.debian.org/apt-team/python-apt"
TERMUX_PKG_DESCRIPTION="Python 3 interface to libapt-pkg"
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_VERSION=1.6.1
TERMUX_PKG_REVISION=1
TERMUX_PKG_SRCURL="https://salsa.debian.org/apt-team/python-apt/-/archive/${TERMUX_PKG_VERSION}/python-apt-${TERMUX_PKG_VERSION}.tar.gz"
TERMUX_PKG_SHA256=e90d7ff95509c940ebc21588859c6aceb5c8e3688af0d75c9ffe80c9e6f2110f
TERMUX_PKG_HOSTBUILD=false
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_DEPENDS="apt, python"
TERMUX_PKG_BUILD_DEPENDS="apt, python"

_PYTHON_VERSION=3.8

termux_step_make() {
	return
}

termux_step_make_install() {
	export PYTHONPATH=$TERMUX_PREFIX/lib/python${_PYTHON_VERSION}/site-packages/
	sed -ri "s|(extra_compile_args=\[)|include_dirs=\['${TERMUX_PREFIX}/include', '${TERMUX_PREFIX}/include/python3.8'\], \1|" setup.py
	python${_PYTHON_VERSION} setup.py install --prefix="$TERMUX_PREFIX" --force
}

termux_step_post_massage() {
	find . -path '*/__pycache__*' -delete
}
