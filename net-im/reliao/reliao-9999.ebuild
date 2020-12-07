# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit unpacker xdg-utils

DESCRIPTION="hotcat-mt"
HOMEPAGE="https://71.me/get/"
SLOT="0"
SRC_URI="https://hotchat-mt.iqiyi.com/version/api/ex/update/linux  -> ${PN}_${PV}_amd64.deb"
KEYWORDS="amd64"
IUSE="gnome"

RESTRICT="mirror"
#RESTRICT="network-sandbox"

S=${WORKDIR}

# TODO:DEPEND not complete
RDEPEND="
	gnome? ( >=gnome-base/gconf-2.24.0:= )
	media-gfx/gnome-screenshot
	media-video/ffmpeg[chromium]
	x11-libs/gtk+:3
"

src_install() {
	cd "${ED}" || die
	unpacker

	RELIAO_DIR=${ED}/opt/Reliao

	rm -rf ${ED}/usr/share/doc

	# use system ffmpeg
	ln -sf "/usr/$(get_libdir)/chromium/libffmpeg.so" ${RELIAO_DIR}/libffmpeg.so || die

	# use system mesa
	rm -f ${RELIAO_DIR}/libEGL.so || die
	rm -f ${RELIAO_DIR}/libGLESv2.so || die
	rm -f ${RELIAO_DIR}/swiftshader/*.so || die
	rm -f ${DISTDIR}/{PN}* || die
}

pkg_postinst() {
	xdg_icon_cache_update
	xdg_desktop_database_update
}

pkg_postrm() {
	xdg_icon_cache_update
	xdg_desktop_database_update
}

