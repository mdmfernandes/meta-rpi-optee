# meta-rpi-optee

`meta-rpi-optee` provides Raspberry Pi 4 64-bit OP-TEE BSP support for Yocto builds.

This layer should be treated as board-support metadata. Product distro policy and image contents should live in a separate product layer, such as `meta-homelab`.

## Supported Target

Currently supported machine:

```bitbake
MACHINE = "raspberrypi4-64-optee"
```

This machine inherits the standard Raspberry Pi 4 64-bit machine and adds OP-TEE boot integration.

## Responsibilities

This layer provides:

- `conf/machine/raspberrypi4-64-optee.conf`
- Raspberry Pi firmware configuration for booting through `bl31-optee.bin`
- TF-A / BL31 integration for OP-TEE
- OP-TEE OS integration
- OP-TEE client integration
- Linux kernel OP-TEE config
- Device-tree overlay support for OP-TEE
- Optional sample image and test/demo packages

This layer should not own product-specific distro policy.

## Dependencies

Required layers:

- `meta-openembedded/meta-oe`
- `meta-arm/meta-arm`
- `meta-arm/meta-arm-toolchain`
- `meta-raspberrypi`

The exact branches and recipe versions must match the Yocto release being used.

## Integration

Use this layer from a product layer by selecting the OP-TEE machine:

```bitbake
MACHINE = "raspberrypi4-64-optee"
DISTRO = "<your-distro>"
```

## Image Usage

This layer includes a sample image:

```text
recipes-core/images/rpi-optee-image.bb
```

That image is useful as a smoke-test or reference image. Product images should normally live outside this BSP layer.

For example, `meta-homelab` provides:

```text
meta-homelab/recipes-core/images/homelab-image.bb
```

## Key Files

```text
conf/machine/raspberrypi4-64-optee.conf
recipes-bsp/trusted-firmware-a/
recipes-kernel/linux/
recipes-security/optee/
recipes-core/packagegroups/packagegroup-tee.bb
recipes-core/images/rpi-optee-image.bb
```

## Porting Notes

This layer was originally created around an older OP-TEE/Raspberry Pi stack. When moving to a newer Yocto release, keep these areas aligned with the dependency layers:

- `trusted-firmware-a` recipe version
- `linux-raspberrypi` recipe version
- `optee-os`, `optee-client`, `optee-test`, and `optee-examples` recipe versions
- TF-A platform patches
- kernel overlay handling

Use machine-scoped overrides for recipe changes that are only valid for `raspberrypi4-64-optee`, for example:

```bitbake
COMPATIBLE_MACHINE:raspberrypi4-64-optee = "raspberrypi4-64-optee"
TFA_PLATFORM:raspberrypi4-64-optee = "rpi4"
TFA_SPD:raspberrypi4-64-optee = "opteed"
```

## Boot Flow

The OP-TEE boot flow is:

```text
Raspberry Pi firmware
  -> bl31-optee.bin
  -> OP-TEE OS as BL32
  -> Linux kernel as normal world
```

The machine config adds Raspberry Pi firmware settings such as:

```text
armstub=bl31-optee.bin
dtoverlay=optee-fix
kernel_address=0x200000
device_tree_address=0x2bd00f00
device_tree_end=0x2bd10f00
```

## Flashing

After building an image, flash the generated `.wic` image from the build directory.

Example, assuming the target device is `/dev/sda`:

```bash
bmaptool copy \
  --bmap tmp/deploy/images/raspberrypi4-64-optee/<image>-raspberrypi4-64-optee.wic.bmap \
  tmp/deploy/images/raspberrypi4-64-optee/<image>-raspberrypi4-64-optee.wic.bz2 \
  /dev/sda
```

Replace `<image>` with the image recipe name.

This command requires root privileges.

## Runtime Validation

Check that OP-TEE initialized:

```bash
dmesg | grep -i optee
```

Expected kernel output includes:

```text
optee: probing for conduit method
optee: initialized driver
```

If test packages are installed, useful checks include:

```bash
optee_example_hello_world
xtest
pkcs11-tool --list-slots
```

`optee_example_hello_world` and `xtest` are bring-up tools, not required for production images.

## References

- [OP-TEE documentation](https://optee.readthedocs.io/)
- [meta-arm](https://git.yoctoproject.org/meta-arm)
- [meta-raspberrypi](https://git.yoctoproject.org/meta-raspberrypi)
- [joaopeixoto13/OPTEE-RPI4](https://github.com/joaopeixoto13/OPTEE-RPI4)
- [Jachm11/optee-os_raspberry_pi_4_port](https://github.com/Jachm11/optee-os_raspberry_pi_4_port)
