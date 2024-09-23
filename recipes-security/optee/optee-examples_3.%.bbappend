COMPATIBLE_MACHINE = "raspberrypi4-64-optee"

# Remove the patch
SRC_URI:remove = "file://0001-Makefile-Fix-non-portable-sh-check-for-plugins.patch"

# 3.19.0
SRCREV = "f301ee9df2129c0db683e726c91dc2cefe4cdb65"

