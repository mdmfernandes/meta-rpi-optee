require recipes-core/images/core-image-minimal.bb

IMAGE_INSTALL:append = " libstdc++ mtd-utils"
IMAGE_INSTALL:append = " openssh openssl openssh-sftp-server"

# OPTEE
IMAGE_INSTALL:append = " optee-client optee-examples"

# Build ATF (but don't install in the image)
EXTRA_IMAGEDEPENDS:append = " trusted-firmware-a"
