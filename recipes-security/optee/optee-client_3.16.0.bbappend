FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

DEPENDS:append = " util-linux"

# 4.1.0
SRCREV = "f7e4ced15d1fefd073bbfc484fe0e1f74afe96c2"

inherit pkgconfig
EXTRA_OEMAKE += "PKG_CONFIG=pkg-config"

# Install OPTEE-OS TAs in the userland
RDEPENDS:${PN}:append = " optee-os-ta"
