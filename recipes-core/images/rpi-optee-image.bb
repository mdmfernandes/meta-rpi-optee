require recipes-core/images/core-image-minimal.bb

DESCRIPTION = "Raspberry Pi with OPTEE image"

IMAGE_INSTALL:append = " libstdc++ mtd-utils"
IMAGE_INSTALL:append = " openssh openssl openssh-sftp-server"

# Install TEE package groups in the image
IMAGE_INSTALL:append = " packagegroup-tee-optee packagegroup-tee-tools"
