require recipes-core/images/core-image-minimal.bb

DESCRIPTION = "Raspberry Pi with OPTEE image"

IMAGE_INSTALL:append = " libstdc++ mtd-utils"
IMAGE_INSTALL:append = " openssh openssl openssh-sftp-server"

# OPTEE user-space components
IMAGE_INSTALL:append = " optee-client optee-examples"
