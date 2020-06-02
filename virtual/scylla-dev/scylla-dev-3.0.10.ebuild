# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{6,7,8} )

inherit autotools flag-o-matic linux-info python-r1 toolchain-funcs systemd user

LICENSE="AGPL-3"
SLOT="0"
IUSE="doc systemd"
KEYWORDS="amd64"

# NOTE:
# if you want to debug using backtraces, enable the 'splitdebug' FEATURE:
# https://wiki.gentoo.org/wiki/Project:Quality_Assurance/Backtraces
#
# then check out:
# https://github.com/scylladb/scylla/wiki/How-to-resolve-backtrace

RESTRICT="test"

RDEPEND="
	>=dev-libs/thrift-0.11.0
	<dev-util/ragel-7.0
	<sys-apps/hwloc-2.0.0
	>=virtual/jdk-1.8.0
	app-arch/lz4
	app-arch/snappy
	dev-cpp/antlr-cpp:3.5
	dev-cpp/yaml-cpp
	dev-java/antlr:3.5
	dev-libs/boost[nls]
	dev-libs/crypto++
	dev-libs/jsoncpp
	dev-libs/libaio
	dev-libs/libxml2
	dev-libs/protobuf
	dev-python/pyparsing[${PYTHON_USEDEP}]
	dev-python/pyudev[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/urwid[${PYTHON_USEDEP}]
	dev-util/systemtap
	net-libs/gnutls
	net-misc/lksctp-tools
	sys-apps/ethtool
	sys-fs/xfsprogs
	sys-libs/libunwind
	sys-libs/zlib
	sys-process/numactl
	x11-libs/libpciaccess
	systemd? ( sys-apps/systemd )
"
DEPEND="${RDEPEND}
	>=sys-kernel/linux-headers-3.5
	dev-util/ninja
"

