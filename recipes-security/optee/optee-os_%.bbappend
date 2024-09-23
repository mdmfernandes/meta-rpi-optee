require optee-os-rpi.inc

# OPTEE is compatible with our machine
COMPATIBLE_MACHINE = "raspberrypi4-64-optee"

# Install the TAs provided by OPTEE-OS
do_install:append() {
    install -d ${D}${nonarch_base_libdir}/optee_armtz
    install -m 0644 ${B}/export-ta_arm64/ta/*.ta ${D}/${nonarch_base_libdir}/optee_armtz/
}

# This recipe generates a package with the TAs
SUMMARY:${PN}-ta = "OPTEE-OS Trusted Applications"
PACKAGES:append = " ${PN}-ta"

# TAs to include in the package
# - fd02c9da-306c-48c7-a49c-bbd827ae86ee: PKCS#11
# - 80a4c275-0a47-4905-8285-1486a9771a08: remoteproc
# - f04a0fe7-1f5d-4b9b-abf7-619b85b4ce8c: trusted keys
# - 023f8f1a-292a-432b-8fc4-de8471358067: avb
FILES:${PN}-ta:append = " \
    ${nonarch_base_libdir}/optee_armtz/fd02c9da-306c-48c7-a49c-bbd827ae86ee.ta \
    ${nonarch_base_libdir}/optee_armtz/80a4c275-0a47-4905-8285-1486a9771a08.ta \
    ${nonarch_base_libdir}/optee_armtz/f04a0fe7-1f5d-4b9b-abf7-619b85b4ce8c.ta \
    ${nonarch_base_libdir}/optee_armtz/023f8f1a-292a-432b-8fc4-de8471358067.ta \
"
