# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

EGIT_REPO_URI="https://gitlab.freedesktop.org/virgl/virglrenderer.git"
inherit git-r3

DESCRIPTION="Library used implement a virtual 3D GPU used by qemu"
HOMEPAGE="https://virgil3d.github.io/"

LICENSE="MIT"
SLOT="0"
IUSE="static-libs test"
# Most of the testsuite cannot run in our sandboxed environment, just don't
# deal with it for now.
RESTRICT="!test? ( test ) test"

RDEPEND="
	>=x11-libs/libdrm-2.4.125
	media-libs/libepoxy
"
DEPEND="
	${RDEPEND}
	sys-kernel/linux-headers
"

src_configure() {
	local emesonargs=(
		-Ddefault_library=$(usex static-libs both shared)
		-Ddrm-renderers=msm,amdgpu-experimental
		-Dvenus=true
		$(meson_use test tests)
	)

	meson_src_configure
}
