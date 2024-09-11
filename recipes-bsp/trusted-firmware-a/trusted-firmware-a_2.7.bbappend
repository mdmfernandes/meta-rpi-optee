FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

# They updated the names of the files here...
SRCREV_tfa = "e2c3611cf109b6d69cbf68de874e034b309ffd73"

LIC_FILES_CHKSUM = "file://docs/license.rst;md5=83b7626b8c7a37263c6a58af8d19bee1"

SRC_URI = " \
    git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=https;name=tfa;branch=master \
    file://0001-add-capability-to-load-bl32-from-0x20000.patch \
"
