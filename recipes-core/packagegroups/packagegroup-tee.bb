DESCRIPTION = "Packages for interacting with TEE"

PACKAGE_ARCH = "${MACHINE_ARCH}"

inherit packagegroup

PACKAGES = "\
    ${PN}-optee \
    ${PN}-tools \
"

RDEPENDS:${PN}-optee = "\
    optee-client \
    optee-examples \
"

RDEPENDS:${PN}-tools = "\
    libp11 \
    opensc \
    openssl-bin \
"
