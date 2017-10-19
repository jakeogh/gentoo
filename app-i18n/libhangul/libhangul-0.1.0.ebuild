# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

DESCRIPTION="libhangul is a generalized and portable library for processing hangul"
HOMEPAGE="https://github.com/choehwanjin/libhangul"
SRC_URI="https://libhangul.googlecode.com/files/${P}.tar.gz"

LICENSE="LGPL-2.1+"
SLOT="0/1"
KEYWORDS="amd64 ppc ppc64 x86"
IUSE="nls static-libs test"

RDEPEND="nls? ( virtual/libintl )"
DEPEND="${RDEPEND}
	virtual/pkgconfig
	nls? ( sys-devel/gettext )
	test? ( dev-libs/check )"

DOCS="AUTHORS ChangeLog NEWS README"

src_configure() {
	econf \
		$(use_enable nls) \
		$(use_enable static-libs static)
}

src_test() {
	emake -C test check
}

src_install() {
	default
	rm -f "${ED}"/usr/lib*/libhangul.la
}
