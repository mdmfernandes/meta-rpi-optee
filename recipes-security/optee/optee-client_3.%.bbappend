FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

DEPENDS:append = " util-linux"

# 3.19.0
SRCREV = "140bf463046071d3ca5ebbde3fb21ee0854e1951"

inherit pkgconfig
EXTRA_OEMAKE += "PKG_CONFIG=pkg-config"

# Install OPTEE-OS TAs in the userland - the package is defined in the OPTEE-OS recipe
RDEPENDS:${PN}:append = " optee-os-ta"
