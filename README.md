# meta-rpi-optee

WARNING: Currently it only supports RaspberryPi 64-bit

## Dependencies

- [openembedded-core](https://git.openembedded.org/openembedded-core)
- [meta-arm](https://git.yoctoproject.org/meta-arm)
- [meta-raspberrypi](https://git.yoctoproject.org/meta-raspberrypi)

## Build image

```bash
cd <build-dir>

source oe-init-build-env

# Optional
bitbake -c cleanall rpi-optee-image

bitbake rpi-optee-image
```

## Flash the SDCARD

Considering that the SDCARD is */dev/sda*.

```bash
cd <build-dir>

bmaptool copy --bmap tmp/deploy/images/raspberrypi4-64-optee/rpi-optee-image-raspberrypi4-64-optee.wic.bmap tmp/deploy/images/raspberrypi4-64-optee/rpi-optee-image-raspberrypi4-64-optee.wic.bz2 /dev/sda

```

## Expected boot logs

```text
Read start4.elf bytes  2249280 hnd 0x00003252
Read fixup4.dat bytes     5399 hnd 0x0000017b
Firmware: 102f1e848393c2112206fadffaaf86db04e98326 Aug 26 2022 14:03:16
0x00d03114 0x00000000 0x00001fff
MEM GPU: 76 ARM: 948 TOTAL: 1024
Starting start4.elf @ 0xfec00200 partition 0
PCI reset
Stop display
Display stopped
+

MESS:00:00:24.090424:0: arasan: arasan_emmc_open
MESS:00:00:24.265171:0: brfs: File read: /mfs/sd/config.txt
MESS:00:00:24.268946:0: brfs: File read: 2483 bytes
MESS:00:00:24.293528:0: HDMI0:EDID error reading EDID block 0 attempt 0
MESS:00:00:24.298031:0: HDMI0:EDID giving up on reading EDID block 0
MESS:00:00:24.314886:0: HDMI1:EDID error reading EDID block 0 attempt 0
MESS:00:00:24.319395:0: HDMI1:EDID giving up on reading EDID block 0
MESS:00:00:24.328005:0: brfs: File read: /mfs/sd/config.txt
MESS:00:00:24.793387:0: gpioman: gpioman_get_pin_num: pin DISPLAY_DSI_PORT not defined
MESS:00:00:24.800701:0: *** Restart logging
MESS:00:00:24.802110:0: brfs: File read: 2483 bytes
MESS:00:00:24.811929:0: hdmi: HDMI0:EDID error reading EDID block 0 attempt 0
MESS:00:00:24.816959:0: hdmi: HDMI0:EDID giving up on reading EDID block 0
MESS:00:00:24.827583:0: hdmi: HDMI0:EDID error reading EDID block 0 attempt 0
MESS:00:00:24.832607:0: hdmi: HDMI0:EDID giving up on reading EDID block 0
MESS:00:00:24.838206:0: hdmi: HDMI:hdmi_get_state is deprecated, use hdmi_get_display_state instead
MESS:00:00:24.851997:0: hdmi: HDMI1:EDID error reading EDID block 0 attempt 0
MESS:00:00:24.857019:0: hdmi: HDMI1:EDID giving up on reading EDID block 0
MESS:00:00:24.867642:0: hdmi: HDMI1:EDID error reading EDID block 0 attempt 0
MESS:00:00:24.872671:0: hdmi: HDMI1:EDID giving up on reading EDID block 0
MESS:00:00:24.878269:0: hdmi: HDMI:hdmi_get_state is deprecated, use hdmi_get_display_state instead
MESS:00:00:24.887034:0: HDMI0: hdmi_pixel_encoding: 300000000
MESS:00:00:24.892501:0: HDMI1: hdmi_pixel_encoding: 300000000
MESS:00:00:24.902562:0: dtb_file 'bcm2711-rpi-4-b.dtb'
MESS:00:00:24.911630:0: brfs: File read: /mfs/sd/bcm2711-rpi-4-b.dtb
MESS:00:00:24.914878:0: Loaded 'bcm2711-rpi-4-b.dtb' to 0x2bd00f00 size 0xcc23
MESS:00:00:24.935002:0: brfs: File read: 52259 bytes
MESS:00:00:24.941135:0: brfs: File read: /mfs/sd/overlays/overlay_map.dtb
MESS:00:00:25.017430:0: brfs: File read: 1783 bytes
MESS:00:00:25.022410:0: brfs: File read: /mfs/sd/config.txt
MESS:00:00:25.026107:0: brfs: File read: 2483 bytes
MESS:00:00:25.033726:0: brfs: File read: /mfs/sd/overlays/vc4-kms-v3d-pi4.dtbo
MESS:00:00:25.102414:0: Loaded overlay 'vc4-kms-v3d'
MESS:00:00:25.262387:0: brfs: File read: 3823 bytes
MESS:00:00:25.266830:0: brfs: File read: /mfs/sd/overlays/optee-fix.dtbo
MESS:00:00:25.270830:0: Loaded overlay 'optee-fix'
MESS:00:00:25.290756:0: brfs: File read: 242 bytes
MESS:00:00:25.294888:0: brfs: File read: /mfs/sd/cmdline.txt
MESS:00:00:25.297832:0: Read command line from file 'cmdline.txt':
MESS:00:00:25.303713:0: 'dwc_otg.lpm_enable=0 console=serial0,115200 root=/dev/mmcblk0p2 rootfstype=ext4 rootwait'
MESS:00:00:25.424837:0: brfs: File read: 89 bytes
MESS:00:00:25.472480:0: brfs: File read: /mfs/sd/bl31-optee.bin
MESS:00:00:25.475291:0: Loaded 'bl31-optee.bin' to 0x0 size 0x84960
MESS:00:00:25.481297:0: brfs: File read: 543072 bytes
MESS:00:00:27.125803:0: brfs: File read: /mfs/sd/kernel8.img
MESS:00:00:27.128358:0: Loaded 'kernel8.img' to 0x200000 size 0x156c200
MESS:00:00:27.134710:0: Device tree loaded to 0x2bd00f00 (size 0xd1e6)
MESS:00:00:27.142558:0: uart: Set PL011 baud rate to 103448.300000 Hz
MESS:00:00:27.150010:0: uart: Baud rate change done...
MESS:00:00:27.152032:0:NOTICE:  BL31: v2.11.0(debug):v2.11.0-581-ge2c3611cf1-dirty
NOTICE:  BL31: Built : 15:12:01, Sep  2 2024
INFO:    ARM GICv2 driver initialized
INFO:    Changed device tree to advertise PSCI.
INFO:    BL31: Initializing runtime services
INFO:    BL31: cortex_a72: CPU workaround for erratum 859971 was applied
WARNING: BL31: cortex_a72: CPU workaround for erratum 1319367 was missing!
INFO:    BL31: cortex_a72: CPU workaround for CVE 2017_5715 was applied
INFO:    BL31: cortex_a72: CPU workaround for CVE 2018_3639 was applied
INFO:    BL31: cortex_a72: CPU workaround for CVE 2022_23960 was applied
INFO:    BL31: Initializing BL32
D/TC:0   plat_get_aslr_seed:111 Warning: no ASLR seed
D/TC:0   add_phys_mem:635 ROUNDDOWN(0xfe215040, CORE_MMU_PGDIR_SIZE) type IO_NSEC 0xfe200000 size 0x00200000
D/TC:0   add_phys_mem:635 TEE_SHMEM_START type NSEC_SHM 0x08000000 size 0x00400000
D/TC:0   add_phys_mem:635 TA_RAM_START type TA_RAM 0x10800000 size 0x00800000
D/TC:0   add_phys_mem:635 VCORE_UNPG_RW_PA type TEE_RAM_RW 0x10161000 size 0x0069f000
D/TC:0   add_phys_mem:635 VCORE_UNPG_RX_PA type TEE_RAM_RX 0x10100000 size 0x00061000
D/TC:0   add_va_space:675 type RES_VASPACE size 0x00a00000
D/TC:0   add_va_space:675 type SHM_VASPACE size 0x02000000
D/TC:0   dump_mmap_table:800 type TEE_RAM_RX   va 0x10100000..0x10160fff pa 0x10100000..0x10160fff size 0x00061000 (smallpg)
D/TC:0   dump_mmap_table:800 type TEE_RAM_RW   va 0x10161000..0x107fffff pa 0x10161000..0x107fffff size 0x0069f000 (smallpg)
D/TC:0   dump_mmap_table:800 type RES_VASPACE  va 0x10800000..0x111fffff pa 0x00000000..0x009fffff size 0x00a00000 (pgdir)
D/TC:0   dump_mmap_table:800 type SHM_VASPACE  va 0x11200000..0x131fffff pa 0x00000000..0x01ffffff size 0x02000000 (pgdir)
D/TC:0   dump_mmap_table:800 type NSEC_SHM     va 0x13200000..0x135fffff pa 0x08000000..0x083fffff size 0x00400000 (pgdir)
D/TC:0   dump_mmap_table:800 type TA_RAM       va 0x13600000..0x13dfffff pa 0x10800000..0x10ffffff size 0x00800000 (pgdir)
D/TC:0   dump_mmap_table:800 type IO_NSEC      va 0x13e00000..0x13ffffff pa 0xfe200000..0xfe3fffff size 0x00200000 (pgdir)
D/TC:0   core_mmu_xlat_table_alloc:526 xlat tables used 1 / 8
D/TC:0   core_mmu_xlat_table_alloc:526 xlat tables used 2 / 8
I/TC:
D/TC:0 0 select_vector_wa_spectre_v2:624 SMCCC_ARCH_WORKAROUND_1 (0x80008000) available
D/TC:0 0 select_vector_wa_spectre_v2:626 SMC Workaround for CVE-2017-5715 used
I/TC: OP-TEE version: 3.19.0 (gcc version 11.4.0 (GCC)) #1 Fri Oct 14 19:00:05 UTC 2022 aarch64
I/TC: WARNING: This OP-TEE configuration might be insecure!
I/TC: WARNING: Please check https://optee.readthedocs.io/en/latest/architecture/porting_guidelines.html
I/TC: Primary CPU initializing
D/TC:0 0 boot_init_primary_late:1334 Executing at offset 0 with virtual load address 0x10100000
D/TC:0 0 call_preinitcalls:21 level 2 mobj_mapped_shm_init()
D/TC:0 0 mobj_mapped_shm_init:463 Shared memory address range: 11200000, 13200000
D/TC:0 0 call_initcalls:40 level 1 register_time_source()
D/TC:0 0 call_initcalls:40 level 1 teecore_init_pub_ram()
D/TC:0 0 call_initcalls:40 level 3 check_ta_store()
D/TC:0 0 check_ta_store:407 TA store: "Secure Storage TA"
D/TC:0 0 check_ta_store:407 TA store: "REE"
D/TC:0 0 call_initcalls:40 level 3 verify_pseudo_tas_conformance()
D/TC:0 0 call_initcalls:40 level 3 tee_cryp_init()
D/TC:0 0 call_initcalls:40 level 4 tee_fs_init_key_manager()
D/TC:0 0 call_initcalls:40 level 6 mobj_init()
D/TC:0 0 call_initcalls:40 level 6 default_mobj_init()
I/TC: Primary CPU switching to normal world boot
INFO:    BL31: Preparing for EL3 exit to normal world
INFO:    Entry point address = 0x200000
INFO:    SPSR = 0x3c9
I/TC: Secondary CPU 1 initializing
D/TC:1   select_vector_wa_spectre_v2:624 SMCCC_ARCH_WORKAROUND_1 (0x80008000) available
D/TC:1   select_vector_wa_spectre_v2:626 SMC Workaround for CVE-2017-5715 used
I/TC: Secondary CPU 1 switching to normal world boot
I/TC: Secondary CPU 2 initializing
D/TC:2   select_vector_wa_spectre_v2:624 SMCCC_ARCH_WORKAROUND_1 (0x80008000) available
D/TC:2   select_vector_wa_spectre_v2:626 SMC Workaround for CVE-2017-5715 used
I/TC: Secondary CPU 2 switching to normal world boot
I/TC: Secondary CPU 3 initializing
D/TC:3   select_vector_wa_spectre_v2:624 SMCCC_ARCH_WORKAROUND_1 (0x80008000) available
D/TC:3   select_vector_wa_spectre_v2:626 SMC Workaround for CVE-2017-5715 used
I/TC: Secondary CPU 3 switching to normal world boot
D/TC:3   tee_entry_exchange_capabilities:100 Asynchronous notifications are disabled
D/TC:3   tee_entry_exchange_capabilities:109 Dynamic shared memory is disabled
D/TC:? 0 tee_ta_init_pseudo_ta_session:296 Lookup pseudo TA 7011a688-ddde-4053-a5a9-7b3c4ddf13b8
D/TC:? 0 tee_ta_init_pseudo_ta_session:309 Open device.pta
D/TC:? 0 tee_ta_init_pseudo_ta_session:326 device.pta : 7011a688-ddde-4053-a5a9-7b3c4ddf13b8
D/TC:? 0 tee_ta_close_session:510 csess 0x1017fb20 id 1
D/TC:? 0 tee_ta_close_session:529 Destroy session
[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd083]
[    0.000000] Linux version 5.10.110-v8 (oe-user@oe-host) (aarch64-poky-linux-gcc (GCC) 11.4.0, GNU ld (GNU Binutils) 2.38.20220708) #1 SMP PREEMPT Fri Apr 8 16:29:17 UTC 2022
[    0.000000] random: fast init done
[    0.000000] Machine model: Raspberry Pi 4 Model B Rev 1.4
[    0.000000] efi: UEFI not found.
[    0.000000] Reserved memory: created CMA memory pool at 0x0000000017c00000, size 320 MiB
[    0.000000] OF: reserved mem: initialized node linux,cma, compatible id shared-dma-pool
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000000000000-0x000000003fffffff]
[    0.000000]   DMA32    [mem 0x0000000040000000-0x00000000ffffffff]
[    0.000000]   Normal   [mem 0x0000000100000000-0x00000001ffffffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000000000-0x000000000007ffff]
[    0.000000]   node   0: [mem 0x0000000000080000-0x000000003b3fffff]
[    0.000000]   node   0: [mem 0x0000000040000000-0x00000000fbffffff]
[    0.000000]   node   0: [mem 0x0000000100000000-0x00000001ffffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000000000000-0x00000001ffffffff]
[    0.000000] psci: probing for conduit method from DT.
[    0.000000] psci: PSCIv1.1 detected in firmware.
[    0.000000] psci: Using standard PSCI v0.2 function IDs
[    0.000000] psci: Trusted OS migration not required
[    0.000000] psci: SMC Calling Convention v1.5
[    0.000000] percpu: Embedded 32 pages/cpu s91992 r8192 d30888 u131072
[    0.000000] Detected PIPT I-cache on CPU0
[    0.000000] CPU features: detected: Spectre-v2
[    0.000000] CPU features: detected: ARM errata 1165522, 1319367, or 1530923
[    0.000000] CPU features: detected: Spectre-BHB
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 2028848
[    0.000000] Kernel command line: coherent_pool=1M 8250.nr_uarts=1 snd_bcm2835.enable_compat_alsa=0 snd_bcm2835.enable_hdmi=1  smsc95xx.macaddr=DC:A6:32:EE:BC:C6 vc_mem.mem_base=0x3ec00000 vc_mem.mem_size=0x40000000  dwc_otg.lpm_enable=0 console=ttyS0,115200 root=/dev/mmcblk0p2 rootfstype=ext4 rootwait
[    0.000000] Dentry cache hash table entries: 1048576 (order: 11, 8388608 bytes, linear)
[    0.000000] Inode-cache hash table entries: 524288 (order: 10, 4194304 bytes, linear)
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] software IO TLB: mapped [mem 0x0000000037400000-0x000000003b400000] (64MB)
[    0.000000] Memory: 7667572K/8245248K available (11904K kernel code, 1968K rwdata, 4100K rodata, 3840K init, 1262K bss, 249996K reserved, 327680K cma-reserved)
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
[    0.000000] ftrace: allocating 37306 entries in 146 pages
[    0.000000] ftrace: allocated 146 pages with 3 groups
[    0.000000] rcu: Preemptible hierarchical RCU implementation.
[    0.000000] rcu:     RCU event tracing is enabled.
[    0.000000] rcu:     RCU restricting CPUs from NR_CPUS=256 to nr_cpu_ids=4.
[    0.000000]  Trampoline variant of Tasks RCU enabled.
[    0.000000]  Rude variant of Tasks RCU enabled.
[    0.000000]  Tracing variant of Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=4
[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
[    0.000000] GIC: Using split EOI/Deactivate mode
[    0.000000] irq_brcmstb_l2: registered L2 intc (/soc/interrupt-controller@7ef00100, parent irq: 10)
[    0.000000] random: get_random_bytes called from start_kernel+0x3b8/0x57c with crng_init=1
[    0.000000] arch_timer: cp15 timer(s) running at 54.00MHz (phys).
[    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cycles: 0xc743ce346, max_idle_ns: 440795203123 ns
[    0.000005] sched_clock: 56 bits at 54MHz, resolution 18ns, wraps every 4398046511102ns
[    0.000243] Console: colour dummy device 80x25
[    0.000306] Calibrating delay loop (skipped), value calculated using timer frequency.. 108.00 BogoMIPS (lpj=216000)
[    0.000335] pid_max: default: 32768 minimum: 301
[    0.000483] LSM: Security Framework initializing
[    0.000720] Mount-cache hash table entries: 16384 (order: 5, 131072 bytes, linear)
[    0.000801] Mountpoint-cache hash table entries: 16384 (order: 5, 131072 bytes, linear)
[    0.002045] cgroup: Disabling memory control group subsystem
[    0.004304] rcu: Hierarchical SRCU implementation.
[    0.005312] EFI services will not be available.
[    0.005807] smp: Bringing up secondary CPUs ...
[    0.029633] Detected PIPT I-cache on CPU1
[    0.029697] CPU1: Booted secondary processor 0x0000000001 [0x410fd083]
[    0.053611] Detected PIPT I-cache on CPU2
[    0.053660] CPU2: Booted secondary processor 0x0000000002 [0x410fd083]
[    0.077600] Detected PIPT I-cache on CPU3
[    0.077648] CPU3: Booted secondary processor 0x0000000003 [0x410fd083]
[    0.077841] smp: Brought up 1 node, 4 CPUs
[    0.077884] SMP: Total of 4 processors activated.
[    0.077902] CPU features: detected: 32-bit EL0 Support
[    0.077919] CPU features: detected: CRC32 instructions
[    0.077935] CPU features: detected: 32-bit EL1 Support
[    0.111973] CPU: All CPU(s) started at EL2
[    0.112043] alternatives: patching kernel code
[    0.113843] devtmpfs: initialized
[    0.124243] Enabled cp15_barrier support
[    0.124284] Enabled setend support
[    0.124654] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.124683] futex hash table entries: 1024 (order: 4, 65536 bytes, linear)
[    0.133000] pinctrl core: initialized pinctrl subsystem
[    0.133739] DMI not present or invalid.
[    0.134116] NET: Registered protocol family 16
[    0.137046] DMA: preallocated 1024 KiB GFP_KERNEL pool for atomic allocations
[    0.137311] DMA: preallocated 1024 KiB GFP_KERNEL|GFP_DMA pool for atomic allocations
[    0.138226] DMA: preallocated 1024 KiB GFP_KERNEL|GFP_DMA32 pool for atomic allocations
[    0.138328] audit: initializing netlink subsys (disabled)
[    0.138682] audit: type=2000 audit(0.136:1): state=initialized audit_enabled=0 res=1
[    0.139189] thermal_sys: Registered thermal governor 'step_wise'
[    0.139638] cpuidle: using governor menu
[    0.139820] hw-breakpoint: found 6 breakpoint and 4 watchpoint registers.
[    0.139996] ASID allocator initialised with 65536 entries
[    0.140147] Serial: AMBA PL011 UART driver
[    0.180009] bcm2835-mbox fe00b880.mailbox: mailbox enabled
[    0.188646] raspberrypi-firmware soc:firmware: Attached to firmware from 2022-08-26T14:03:16, variant start
[    0.192659] raspberrypi-firmware soc:firmware: Firmware hash is 102f1e848393c2112206fadffaaf86db04e98326
[    0.226615] bcm2835-dma fe007000.dma: DMA legacy API manager, dmachans=0x1
[    0.231230] vgaarb: loaded
[    0.231638] SCSI subsystem initialized
[    0.231859] usbcore: registered new interface driver usbfs
[    0.231926] usbcore: registered new interface driver hub
[    0.232006] usbcore: registered new device driver usb
[    0.232370] usb_phy_generic phy: supply vcc not found, using dummy regulator
[    0.233122] Advanced Linux Sound Architecture Driver Initialized.
[    0.234157] clocksource: Switched to clocksource arch_sys_counter
[    1.251141] VFS: Disk quotas dquot_6.6.0
[    1.251248] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    1.251419] FS-Cache: Loaded
[    1.251633] CacheFiles: Loaded
[    1.263135] NET: Registered protocol family 2
[    1.263820] IP idents hash table entries: 131072 (order: 8, 1048576 bytes, linear)
[    1.269479] tcp_listen_portaddr_hash hash table entries: 4096 (order: 4, 65536 bytes, linear)
[    1.269739] TCP established hash table entries: 65536 (order: 7, 524288 bytes, linear)
[    1.270466] TCP bind hash table entries: 65536 (order: 8, 1048576 bytes, linear)
[    1.271799] TCP: Hash tables configured (established 65536 bind 65536)
[    1.272059] UDP hash table entries: 4096 (order: 5, 131072 bytes, linear)
[    1.272335] UDP-Lite hash table entries: 4096 (order: 5, 131072 bytes, linear)
[    1.272843] NET: Registered protocol family 1
[    1.273759] RPC: Registered named UNIX socket transport module.
[    1.273778] RPC: Registered udp transport module.
[    1.273792] RPC: Registered tcp transport module.
[    1.273806] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    1.273829] PCI: CLS 0 bytes, default 64
[    1.275999] hw perfevents: enabled with armv8_cortex_a72 PMU driver, 7 counters available
[    1.276291] kvm [1]: IPA Size Limit: 44 bits
[    1.277435] kvm [1]: vgic interrupt IRQ9
[    1.277710] kvm [1]: Hyp mode initialized successfully
[    1.280310] Initialise system trusted keyrings
[    1.280628] workingset: timestamp_bits=46 max_order=21 bucket_order=0
[    1.286816] zbud: loaded
[    1.288496] FS-Cache: Netfs 'nfs' registered for caching
[    1.289171] NFS: Registering the id_resolver key type
[    1.289209] Key type id_resolver registered
[    1.289224] Key type id_legacy registered
[    1.289349] nfs4filelayout_init: NFSv4 File Layout Driver Registering...
[    1.289367] nfs4flexfilelayout_init: NFSv4 Flexfile Layout Driver Registering...
[    1.290514] Key type asymmetric registered
[    1.290533] Asymmetric key parser 'x509' registered
[    1.290584] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 248)
[    1.290846] io scheduler mq-deadline registered
[    1.290864] io scheduler kyber registered
[    1.295116] brcm-pcie fd500000.pcie: host bridge /scb/pcie@7d500000 ranges:
[    1.295150] brcm-pcie fd500000.pcie:   No bus range found for /scb/pcie@7d500000, using [bus 00-ff]
[    1.295223] brcm-pcie fd500000.pcie:      MEM 0x0600000000..0x063fffffff -> 0x00c0000000
[    1.295305] brcm-pcie fd500000.pcie:   IB MEM 0x0000000000..0x00bfffffff -> 0x0400000000
[    1.360259] brcm-pcie fd500000.pcie: link up, 5.0 GT/s PCIe x1 (SSC)
[    1.360635] brcm-pcie fd500000.pcie: PCI host bridge to bus 0000:00
[    1.360658] pci_bus 0000:00: root bus resource [bus 00-ff]
[    1.360680] pci_bus 0000:00: root bus resource [mem 0x600000000-0x63fffffff] (bus address [0xc0000000-0xffffffff])
[    1.360764] pci 0000:00:00.0: [14e4:2711] type 01 class 0x060400
[    1.360999] pci 0000:00:00.0: PME# supported from D0 D3hot
[    1.364997] pci 0000:01:00.0: [1106:3483] type 00 class 0x0c0330
[    1.365123] pci 0000:01:00.0: reg 0x10: [mem 0x00000000-0x00000fff 64bit]
[    1.365577] pci 0000:01:00.0: PME# supported from D0 D3hot
[    1.369317] pci 0000:00:00.0: BAR 8: assigned [mem 0x600000000-0x6000fffff]
[    1.369344] pci 0000:01:00.0: BAR 0: assigned [mem 0x600000000-0x600000fff 64bit]
[    1.369384] pci 0000:00:00.0: PCI bridge to [bus 01]
[    1.369408] pci 0000:00:00.0:   bridge window [mem 0x600000000-0x6000fffff]
[    1.375757] Serial: 8250/16550 driver, 1 ports, IRQ sharing enabled
[    1.376673] bcm2835-aux-uart fe215040.serial: there is not valid maps for state default
[    1.379092] iproc-rng200 fe104000.rng: hwrng registered
[    1.379438] vc-mem: phys_addr:0x00000000 mem_base=0x3ec00000 mem_size:0x40000000(1024 MiB)
[    1.380828] gpiomem-bcm2835 fe200000.gpiomem: Initialised: Registers at 0xfe200000
[    1.393520] brd: module loaded
[    1.405555] loop: module loaded
[    1.407633] Loading iSCSI transport class v2.0-870.
[    1.412435] bcmgenet fd580000.ethernet: GENET 5.0 EPHY: 0x0000
[    1.470297] unimac-mdio unimac-mdio.-19: Broadcom UniMAC MDIO bus
[    1.471366] usbcore: registered new interface driver r8152
[    1.471436] usbcore: registered new interface driver lan78xx
[    1.471493] usbcore: registered new interface driver smsc95xx
[    1.517326] pci 0000:00:00.0: enabling device (0000 -> 0002)
[    1.517515] xhci_hcd 0000:01:00.0: xHCI Host Controller
[    1.517552] xhci_hcd 0000:01:00.0: new USB bus registered, assigned bus number 1
[    1.518261] xhci_hcd 0000:01:00.0: hcc params 0x002841eb hci version 0x100 quirks 0x00001e0000000890
[    1.519523] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.10
[    1.519545] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.519562] usb usb1: Product: xHCI Host Controller
[    1.519578] usb usb1: Manufacturer: Linux 5.10.110-v8 xhci-hcd
[    1.519594] usb usb1: SerialNumber: 0000:01:00.0
[    1.520299] hub 1-0:1.0: USB hub found
[    1.520399] hub 1-0:1.0: 1 port detected
[    1.521134] xhci_hcd 0000:01:00.0: xHCI Host Controller
[    1.521163] xhci_hcd 0000:01:00.0: new USB bus registered, assigned bus number 2
[    1.521193] xhci_hcd 0000:01:00.0: Host supports USB 3.0 SuperSpeed
[    1.521604] usb usb2: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 5.10
[    1.521623] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.521639] usb usb2: Product: xHCI Host Controller
[    1.521655] usb usb2: Manufacturer: Linux 5.10.110-v8 xhci-hcd
[    1.521670] usb usb2: SerialNumber: 0000:01:00.0
[    1.522386] hub 2-0:1.0: USB hub found
[    1.522458] hub 2-0:1.0: 4 ports detected
[    1.524064] dwc_otg: version 3.00a 10-AUG-2012 (platform bus)
[    1.524939] usbcore: registered new interface driver uas
[    1.525041] usbcore: registered new interface driver usb-storage
[    1.525241] mousedev: PS/2 mouse device common for all mice
[    1.527698] bcm2835-wdt bcm2835-wdt: Broadcom BCM2835 watchdog timer
[    1.531101] sdhci: Secure Digital Host Controller Interface driver
[    1.531119] sdhci: Copyright(c) Pierre Ossman
[    1.531885] mmc-bcm2835 fe300000.mmcnr: could not get clk, deferring probe
[    1.534219] sdhci-pltfm: SDHCI platform and OF driver helper
[    1.537188] ledtrig-cpu: registered to indicate activity on CPUs
[    1.537327] SMCCC: SOC_ID: ARCH_SOC_ID not implemented, skipping ....
[    1.537365] hid: raw HID events driver (C) Jiri Kosina
[    1.537493] usbcore: registered new interface driver usbhid
[    1.537502] usbhid: USB HID core driver
[    1.537755] ashmem: initialized
[    1.542334] optee: probing for conduit method.
[    1.542369] optee: revision 3.19 (afacf356)
[    1.589039] optee: initialized driver
[    1.589755] Initializing XFRM netlink socket
[    1.589774] NET: Registered protocol family 17
[    1.589834] Key type dns_resolver registered
[    1.590034] registered taskstats version 1
[    1.590049] Loading compiled-in X.509 certificates
[    1.590319] Key type ._fscrypt registered
[    1.590327] Key type .fscrypt registered
[    1.590334] Key type fscrypt-provisioning registered
[    1.596989] uart-pl011 fe201000.serial: there is not valid maps for state default
[    1.597140] uart-pl011 fe201000.serial: cts_event_workaround enabled
[    1.597197] fe201000.serial: ttyAMA0 at MMIO 0xfe201000 (irq = 23, base_baud = 0) is a PL011 rev2
[    1.603265] bcm2835-aux-uart fe215040.serial: there is not valid maps for state default
[    1.603613] printk: console [ttyS0] disabled
[    1.603677] fe215040.serial: ttyS0 at MMIO 0xfe215040 (irq = 24, base_baud = 62500000) is a 16550
[    1.774155] usb 1-1: new high-speed USB device number 2 using xhci_hcd
[    1.774540] printk: console [ttyS0] enabled
[    1.948724] usb 1-1: New USB device found, idVendor=2109, idProduct=3431, bcdDevice= 4.21
[    1.955312] bcm2835-power bcm2835-power: Broadcom BCM2835 power domains driver
[    1.963016] usb 1-1: New USB device strings: Mfr=0, Product=1, SerialNumber=0
[    1.963020] usb 1-1: Product: USB2.0 Hub
[    1.967979] mmc-bcm2835 fe300000.mmcnr: mmc_debug:0 mmc_debug2:0
[    1.979224] hub 1-1:1.0: USB hub found
[    1.982804] mmc-bcm2835 fe300000.mmcnr: DMA channel allocated
[    2.010258] of_cfs_init
[    2.014143] hub 1-1:1.0: 4 ports detected
[    2.018533] of_cfs_init: OK
[    2.029974] mmc1: queuing unknown CIS tuple 0x80 (2 bytes)
[    2.046623] mmc0: SDHCI controller on fe340000.mmc [fe340000.mmc] using ADMA
[    2.050054] mmc1: queuing unknown CIS tuple 0x80 (3 bytes)
[    2.055706] ALSA device list:
[    2.060920] mmc1: queuing unknown CIS tuple 0x80 (3 bytes)
[    2.064077]   No soundcards found.
[    2.072072] mmc1: queuing unknown CIS tuple 0x80 (7 bytes)
[    2.163166] mmc0: new ultra high speed DDR50 SDHC card at address aaaa
[    2.167801] mmc1: queuing unknown CIS tuple 0x80 (3 bytes)
[    2.172860] mmcblk0: mmc0:aaaa SL32G 29.7 GiB
[    2.232598] mmc1: new high speed SDIO card at address 0001
[    2.241607]  mmcblk0: p1 p2
[    3.088538] EXT4-fs (mmcblk0p2): INFO: recovery required on readonly filesystem
[    3.096030] EXT4-fs (mmcblk0p2): write access will be enabled during recovery
[    3.203649] EXT4-fs (mmcblk0p2): recovery complete
[    3.211237] EXT4-fs (mmcblk0p2): mounted filesystem with ordered data mode. Opts: (null)
[    3.219508] VFS: Mounted root (ext4 filesystem) readonly on device 179:2.
[    3.226498] devtmpfs: mounted
[    3.234441] Freeing unused kernel memory: 3840K
[    3.239179] Run /sbin/init as init process
INIT: version 3.01 booting
[    3.432319] FAT-fs (mmcblk0p1): Volume was not properly unmounted. Some data may be corrupt. Please run fsck.
Starting udev
[    3.544013] udevd[140]: starting version 3.2.10
[    3.551719] random: udevd: uninitialized urandom read (16 bytes read)
[    3.559388] random: udevd: uninitialized urandom read (16 bytes read)
[    3.566015] random: udevd: uninitialized urandom read (16 bytes read)
[    3.596216] udevd[141]: starting eudev-3.2.10
[    3.793132] EXT4-fs (mmcblk0p2): re-mounted. Opts: (null)
Fri Mar  9 12:34:56 UTC 2018
INIT: Entering runlevel: 5
Configuring network interfaces... [    4.077366] bcmgenet fd580000.ethernet: configuring instance for external RGMII (RX delay)
[    4.086099] bcmgenet fd580000.ethernet eth0: Link is Down
udhcpc: started, v1.35.0
udhcpc: broadcasting discover
udhcpc: broadcasting discover
udhcpc: broadcasting discover
udhcpc: no lease, forking to background
done.
[   15.746163] random: crng init done
[   15.749616] random: 3 urandom warning(s) missed due to ratelimiting
Starting OpenBSD Secure Shell server: sshd
done.
Starting OP-TEE Supplicant: D/TC:? 0 tee_ta_init_session_with_context:605 Re-open TA 7011a688-ddde-4053-a5a9-7b3c4ddf13b8
tee-supplicant.
D/TC:? 0 tee_ta_close_session:510 csess 0x1017fa00 id 1
D/TC:? 0 tee_ta_close_session:529 Destroy session
Starting syslogd/klogd: done

Poky (Yocto Project Reference Distro) 4.0.20 raspberrypi4-64-optee /dev/ttyS0

raspberrypi4-64-optee login: root
root@raspberrypi4-64-optee:~# optee_example_hello_world [   33.762229] cam-dummy-reg: disabling

D/TC:? 0 tee_ta_init_pseudo_ta_session:296 Lookup pseudo TA 8aaaf200-2450-11e4-abe2-0002a5d5c51b
D/TC:? 0 ldelf_load_ldelf:96 ldelf load address 0x40006000
D/LD:  ldelf:134 Loading TS 8aaaf200-2450-11e4-abe2-0002a5d5c51b
D/TC:? 0 ldelf_syscall_open_bin:142 Lookup user TA ELF 8aaaf200-2450-11e4-abe2-0002a5d5c51b (Secure Storage TA)
D/TC:? 0 ldelf_syscall_open_bin:146 res=0xffff0008
D/TC:? 0 ldelf_syscall_open_bin:142 Lookup user TA ELF 8aaaf200-2450-11e4-abe2-0002a5d5c51b (REE)
D/TC:? 0 ldelf_syscall_open_bin:146 res=0
D/LD:  ldelf:168 ELF (8aaaf200-2450-11e4-abe2-0002a5d5c51b) at 0x40090000
D/TA:  TA_CreateEntryPoint:39 has been called
D/TA:  TA_OpenSessionEntryPoint:68 has been called
I/TA: Hello World!
Invoking TA to increment 42
D/TA:  inc_value:105 has been called
I/TA: Got value: 42 from NW
I/TA: Increase value to: 43
TA incremented value to 43
D/TC:? 0 tee_ta_close_session:510 csess 0x1017fa00 id 1
D/TC:? 0 tee_ta_close_session:529 Destroy session
I/TA: Goodbye!
D/TA:  TA_DestroyEntryPoint:50 has been called
D/TC:? 0 destroy_context:307 Destroy TA ctx (0x1017f9a0)
root@raspberrypi4-64-optee:~# pkcs11-tool --list-slots
D/TC:? 0 tee_ta_init_pseudo_ta_session:296 Lookup pseudo TA fd02c9da-306c-48c7-a49c-bbd827ae86ee
D/TC:? 0 ldelf_load_ldelf:96 ldelf load address 0x40006000
D/LD:  ldelf:134 Loading TS fd02c9da-306c-48c7-a49c-bbd827ae86ee
D/TC:? 0 ldelf_syscall_open_bin:142 Lookup user TA ELF fd02c9da-306c-48c7-a49c-bbd827ae86ee (Secure Storage TA)
D/TC:? 0 ldelf_syscall_open_bin:146 res=0xffff0008
D/TC:? 0 ldelf_syscall_open_bin:142 Lookup user TA ELF fd02c9da-306c-48c7-a49c-bbd827ae86ee (REE)
D/TC:? 0 ldelf_syscall_open_bin:146 res=0
D/LD:  ldelf:168 ELF (fd02c9da-306c-48c7-a49c-bbd827ae86ee) at 0x40078000
Available slots:
Slot 0 (0x0): OP-TEE PKCS11 TA - TEE UUID 94e9ab89-4c43-56ea-8b35-45dc07226830
  token state:   uninitialized
Slot 1 (0x1): OP-TEE PKCS11 TA - TEE UUID 94e9ab89-4c43-56ea-8b35-45dc07226830
  token state:   uninitialized
Slot 2 (0x2): OP-TEE PKCS11 TA - TEE UUID 94e9ab89-4c43-56ea-8b35-45dc07226830
  token state:   uninitialized
D/TC:? 0 tee_ta_close_session:510 csess 0x1017ef30 id 1
D/TC:? 0 tee_ta_close_session:529 Destroy session
```

## References

- [joaopeixoto13/OPTEE-RPI4](https://github.com/joaopeixoto13/OPTEE-RPI4)
- [Jachm11/optee-os_raspberry_pi_4_port](https://github.com/Jachm11/optee-os_raspberry_pi_4_port)
