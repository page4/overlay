# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit gnome2-utils unpacker xdg-utils

DESCRIPTION="hotcat-mt"
HOMEPAGE="https://71.me/get/"
SLOT="0"
SRC_URI="https://hotchat-dl.iqiyi.com/version/linux/${PN}_${PV}_amd64.deb"
KEYWORDS="amd64"
IUSE="gnome +fcitx"

S=${WORKDIR}

# TODO:DEPEND not complete
RDEPEND="
	gnome? ( >=gnome-base/gconf-2.24.0:= )
	fcitx? ( app-i18n/fcitx[gtk2] )
	media-gfx/gnome-screenshot
"

src_install() {
	dodir /
	cd "${ED}" || die
	unpacker
	rm -rf usr/*
}

pkg_preinst() {
	gnome2_icon_savelist
}

pkg_postrm() {
	gnome2_icon_cache_update
	xdg_desktop_database_update
}

pkg_postinst() {
	gnome2_icon_cache_update
	xdg_desktop_database_update
}
