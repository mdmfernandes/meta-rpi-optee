require recipes-core/images/core-image-minimal.bb

DESCRIPTION = "Raspberry Pi with OPTEE image"

IMAGE_FEATURES:append = " ssh-server-openssh"

IMAGE_INSTALL:append = " libstdc++ mtd-utils openssl"

# Install TEE package groups in the image
IMAGE_INSTALL:append = " packagegroup-tee-optee packagegroup-tee-tools"
