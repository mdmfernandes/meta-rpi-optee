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
Read start4.elf bytes  2249280 hnd 0x00003633
Read fixup4.dat bytes     5399 hnd 0x00000199
Firmware: 102f1e848393c2112206fadffaaf86db04e98326 Aug 26 2022 14:03:16
0x00d03114 0x00000000 0x00001fff
MEM GPU: 76 ARM: 948 TOTAL: 1024
Starting start4.elf @ 0xfec00200 partition 0
PCI reset
Stop display
Display stopped
+

MESS:00:00:24.087601:0: arasan: arasan_emmc_open
MESS:00:00:24.260822:0: brfs: File read: /mfs/sd/config.txt
MESS:00:00:24.264590:0: brfs: File read: 2483 bytes
MESS:00:00:24.289170:0: HDMI0:EDID error reading EDID block 0 attempt 0
MESS:00:00:24.293673:0: HDMI0:EDID giving up on reading EDID block 0
MESS:00:00:24.310527:0: HDMI1:EDID error reading EDID block 0 attempt 0
MESS:00:00:24.315034:0: HDMI1:EDID giving up on reading EDID block 0
MESS:00:00:24.323276:0: brfs: File read: /mfs/sd/config.txt
MESS:00:00:24.822269:0: gpioman: gpioman_get_pin_num: pin DISPLAY_DSI_PORT not defined
MESS:00:00:24.829585:0: *** Restart logging
MESS:00:00:24.830993:0: brfs: File read: 2483 bytes
MESS:00:00:24.840811:0: hdmi: HDMI0:EDID error reading EDID block 0 attempt 0
MESS:00:00:24.845841:0: hdmi: HDMI0:EDID giving up on reading EDID block 0
MESS:00:00:24.856465:0: hdmi: HDMI0:EDID error reading EDID block 0 attempt 0
MESS:00:00:24.861489:0: hdmi: HDMI0:EDID giving up on reading EDID block 0
MESS:00:00:24.867088:0: hdmi: HDMI:hdmi_get_state is deprecated, use hdmi_get_display_state instead
MESS:00:00:24.880879:0: hdmi: HDMI1:EDID error reading EDID block 0 attempt 0
MESS:00:00:24.885902:0: hdmi: HDMI1:EDID giving up on reading EDID block 0
MESS:00:00:24.896524:0: hdmi: HDMI1:EDID error reading EDID block 0 attempt 0
MESS:00:00:24.901553:0: hdmi: HDMI1:EDID giving up on reading EDID block 0
MESS:00:00:24.907151:0: hdmi: HDMI:hdmi_get_state is deprecated, use hdmi_get_display_state instead
MESS:00:00:24.915915:0: HDMI0: hdmi_pixel_encoding: 300000000
MESS:00:00:24.921383:0: HDMI1: hdmi_pixel_encoding: 300000000
MESS:00:00:24.931448:0: dtb_file 'bcm2711-rpi-4-b.dtb'
MESS:00:00:24.940499:0: brfs: File read: /mfs/sd/bcm2711-rpi-4-b.dtb
MESS:00:00:24.943747:0: Loaded 'bcm2711-rpi-4-b.dtb' to 0x2bd00f00 size 0xd5b3
MESS:00:00:24.964184:0: brfs: File read: 54707 bytes
MESS:00:00:24.970235:0: brfs: File read: /mfs/sd/overlays/overlay_map.dtb
MESS:00:00:25.042133:0: brfs: File read: 4943 bytes
MESS:00:00:25.046756:0: brfs: File read: /mfs/sd/config.txt
MESS:00:00:25.051041:0: brfs: File read: 2483 bytes
MESS:00:00:25.058186:0: brfs: File read: /mfs/sd/overlays/vc4-kms-v3d-pi4.dtbo
MESS:00:00:25.124387:0: Loaded overlay 'vc4-kms-v3d'
MESS:00:00:25.275944:0: brfs: File read: 3913 bytes
MESS:00:00:25.281757:0: brfs: File read: /mfs/sd/overlays/optee-fix.dtbo
MESS:00:00:25.285593:0: Loaded overlay 'optee-fix'
MESS:00:00:25.305502:0: brfs: File read: 242 bytes
MESS:00:00:25.309554:0: brfs: File read: /mfs/sd/cmdline.txt
MESS:00:00:25.312578:0: Read command line from file 'cmdline.txt':
MESS:00:00:25.318459:0: 'dwc_otg.lpm_enable=0 console=serial0,115200 root=/dev/mmcblk0p2 rootfstype=ext4 rootwait'
MESS:00:00:25.441689:0: brfs: File read: 89 bytes
MESS:00:00:25.493067:0: brfs: File read: /mfs/sd/bl31-optee.bin
MESS:00:00:25.495877:0: Loaded 'bl31-optee.bin' to 0x0 size 0x91de8
MESS:00:00:25.501883:0: brfs: File read: 597480 bytes
MESS:00:00:27.291148:0: brfs: File read: /mfs/sd/kernel8.img
MESS:00:00:27.293702:0: Loaded 'kernel8.img' to 0x200000 size 0x1744200
MESS:00:00:27.300055:0: Device tree loaded to 0x2bd00f00 (size 0xda0f)
MESS:00:00:27.307898:0: uart: Set PL011 baud rate to 103448.300000 Hz
MESS:00:00:27.315355:0: uart: Baud rate change done...
MESS:00:00:27.317377:0:NOTICE:  BL31: v2.11.0(debug):v2.11.0-581-ge2c3611cf1-dirty
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
I/TC:
I/TC: No non-secure external DT
I/TC: OP-TEE version: 4.3.0 (gcc version 11.4.0 (GCC)) #1 Fri Jul 12 08:42:35 UTC 2024 aarch64
I/TC: WARNING: This OP-TEE configuration might be insecure!
I/TC: WARNING: Please check https://optee.readthedocs.io/en/latest/architecture/porting_guidelines.html
I/TC: Primary CPU initializing
I/TC: Primary CPU switching to normal world boot
INFO:    BL31: Preparing for EL3 exit to normal world
INFO:    Entry point address = 0x200000
INFO:    SPSR = 0x3c9
I/TC: Secondary CPU 1 initializing
I/TC: Secondary CPU 1 switching to normal world boot
I/TC: Secondary CPU 2 initializing
I/TC: Secondary CPU 2 switching to normal world boot
I/TC: Secondary CPU 3 initializing
I/TC: Secondary CPU 3 switching to normal world boot
I/TC: Reserved shared memory is enabled
I/TC: Dynamic shared memory is disabled
I/TC: Normal World virtualization support is disabled
I/TC: Asynchronous notifications are disabled
[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd083]
[    0.000000] Linux version 6.1.77-v8 (oe-user@oe-host) (aarch64-poky-linux-gcc (GCC) 11.4.0, GNU ld (GNU Binutils) 2.38.20220708) #1 SMP PREEMPT Thu Feb  8 15:07:10 UTC 2024
[    0.000000] random: crng init done
[    0.000000] Machine model: Raspberry Pi 4 Model B Rev 1.4
[    0.000000] efi: UEFI not found.
[    0.000000] Reserved memory: created CMA memory pool at 0x000000000bc00000, size 512 MiB
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
[    0.000000] On node 0, zone DMA32: 19456 pages in unavailable ranges
[    0.000000] On node 0, zone Normal: 16384 pages in unavailable ranges
[    0.000000] psci: probing for conduit method from DT.
[    0.000000] psci: PSCIv1.1 detected in firmware.
[    0.000000] psci: Using standard PSCI v0.2 function IDs
[    0.000000] psci: Trusted OS migration not required
[    0.000000] psci: SMC Calling Convention v1.5
[    0.000000] percpu: Embedded 29 pages/cpu s79720 r8192 d30872 u118784
[    0.000000] Detected PIPT I-cache on CPU0
[    0.000000] CPU features: detected: Spectre-v2
[    0.000000] CPU features: detected: Spectre-v3a
[    0.000000] CPU features: detected: Spectre-BHB
[    0.000000] CPU features: kernel page table isolation forced ON by KASLR
[    0.000000] CPU features: detected: Kernel page table isolation (KPTI)
[    0.000000] CPU features: detected: ARM erratum 1742098
[    0.000000] CPU features: detected: ARM errata 1165522, 1319367, or 1530923
[    0.000000] alternatives: applying boot alternatives
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 2028848
[    0.000000] Kernel command line: coherent_pool=1M 8250.nr_uarts=1 snd_bcm2835.enable_headphones=0 snd_bcm2835.enable_hdmi=0  smsc95xx.macaddr=DC:A6:32:EE:BC:C6 vc_mem.mem_base=0x3ec00000 vc_mem.mem_size=0x40000000  dwc_otg.lpm_enable=0 console=ttyS0,115200 root=/dev/mmcblk0p2 rootfstype=ext4 rootwait
[    0.000000] Dentry cache hash table entries: 1048576 (order: 11, 8388608 bytes, linear)
[    0.000000] Inode-cache hash table entries: 524288 (order: 10, 4194304 bytes, linear)
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] software IO TLB: area num 4.
[    0.000000] software IO TLB: mapped [mem 0x0000000037400000-0x000000003b400000] (64MB)
[    0.000000] Memory: 7468864K/8245248K available (12864K kernel code, 2192K rwdata, 4208K rodata, 4416K init, 1091K bss, 252096K reserved, 524288K cma-reserved)
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
[    0.000000] ftrace: allocating 41946 entries in 164 pages
[    0.000000] ftrace: allocated 164 pages with 3 groups
[    0.000000] trace event string verifier disabled
[    0.000000] rcu: Preemptible hierarchical RCU implementation.
[    0.000000] rcu:     RCU event tracing is enabled.
[    0.000000] rcu:     RCU restricting CPUs from NR_CPUS=256 to nr_cpu_ids=4.
[    0.000000]  Trampoline variant of Tasks RCU enabled.
[    0.000000]  Rude variant of Tasks RCU enabled.
[    0.000000]  Tracing variant of Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=4
[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
[    0.000000] Root IRQ handler: gic_handle_irq
[    0.000000] GIC: Using split EOI/Deactivate mode
[    0.000000] rcu: srcu_init: Setting srcu_struct sizes based on contention.
[    0.000000] arch_timer: cp15 timer(s) running at 54.00MHz (phys).
[    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cycles: 0xc743ce346, max_idle_ns: 440795203123 ns
[    0.000000] sched_clock: 56 bits at 54MHz, resolution 18ns, wraps every 4398046511102ns
[    0.000255] Console: colour dummy device 80x25
[    0.000308] Calibrating delay loop (skipped), value calculated using timer frequency.. 108.00 BogoMIPS (lpj=216000)
[    0.000323] pid_max: default: 32768 minimum: 301
[    0.000412] LSM: Security Framework initializing
[    0.000596] Mount-cache hash table entries: 16384 (order: 5, 131072 bytes, linear)
[    0.000670] Mountpoint-cache hash table entries: 16384 (order: 5, 131072 bytes, linear)
[    0.001534] cgroup: Disabling memory control group subsystem
[    0.002763] cblist_init_generic: Setting adjustable number of callback queues.
[    0.002772] cblist_init_generic: Setting shift to 2 and lim to 1.
[    0.002873] cblist_init_generic: Setting adjustable number of callback queues.
[    0.002880] cblist_init_generic: Setting shift to 2 and lim to 1.
[    0.002974] cblist_init_generic: Setting adjustable number of callback queues.
[    0.002981] cblist_init_generic: Setting shift to 2 and lim to 1.
[    0.003227] rcu: Hierarchical SRCU implementation.
[    0.003234] rcu:     Max phase no-delay instances is 1000.
[    0.005039] EFI services will not be available.
[    0.005338] smp: Bringing up secondary CPUs ...
[    0.013949] Detected PIPT I-cache on CPU1
[    0.014086] CPU1: Booted secondary processor 0x0000000001 [0x410fd083]
[    0.022731] Detected PIPT I-cache on CPU2
[    0.022859] CPU2: Booted secondary processor 0x0000000002 [0x410fd083]
[    0.031491] Detected PIPT I-cache on CPU3
[    0.031617] CPU3: Booted secondary processor 0x0000000003 [0x410fd083]
[    0.031725] smp: Brought up 1 node, 4 CPUs
[    0.031736] SMP: Total of 4 processors activated.
[    0.031744] CPU features: detected: 32-bit EL0 Support
[    0.031748] CPU features: detected: 32-bit EL1 Support
[    0.031755] CPU features: detected: CRC32 instructions
[    0.031849] CPU: All CPU(s) started at EL2
[    0.031863] alternatives: applying system-wide alternatives
[    0.033691] devtmpfs: initialized
[    0.042361] Enabled cp15_barrier support
[    0.042382] Enabled setend support
[    0.042640] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.042659] futex hash table entries: 1024 (order: 4, 65536 bytes, linear)
[    0.056993] pinctrl core: initialized pinctrl subsystem
[    0.057577] DMI not present or invalid.
[    0.058045] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.059582] DMA: preallocated 1024 KiB GFP_KERNEL pool for atomic allocations
[    0.059834] DMA: preallocated 1024 KiB GFP_KERNEL|GFP_DMA pool for atomic allocations
[    0.060272] DMA: preallocated 1024 KiB GFP_KERNEL|GFP_DMA32 pool for atomic allocations
[    0.060336] audit: initializing netlink subsys (disabled)
[    0.060494] audit: type=2000 audit(0.056:1): state=initialized audit_enabled=0 res=1
[    0.060988] thermal_sys: Registered thermal governor 'step_wise'
[    0.061044] cpuidle: using governor menu
[    0.061214] hw-breakpoint: found 6 breakpoint and 4 watchpoint registers.
[    0.061330] ASID allocator initialised with 32768 entries
[    0.062185] Serial: AMBA PL011 UART driver
[    0.068215] bcm2835-mbox fe00b880.mailbox: mailbox enabled
[    0.080712] raspberrypi-firmware soc:firmware: Attached to firmware from 2022-08-26T14:03:16, variant start
[    0.084725] raspberrypi-firmware soc:firmware: Firmware hash is 102f1e848393c2112206fadffaaf86db04e98326
[    0.094218] KASLR enabled
[    0.119795] bcm2835-dma fe007000.dma: DMA legacy API manager, dmachans=0x1
[    0.122361] iommu: Default domain type: Translated
[    0.122371] iommu: DMA domain TLB invalidation policy: strict mode
[    0.122686] SCSI subsystem initialized
[    0.122865] usbcore: registered new interface driver usbfs
[    0.122906] usbcore: registered new interface driver hub
[    0.122942] usbcore: registered new device driver usb
[    0.123091] usb_phy_generic phy: supply vcc not found, using dummy regulator
[    0.123415] pps_core: LinuxPPS API ver. 1 registered
[    0.123422] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
[    0.123437] PTP clock support registered
[    0.123655] Advanced Linux Sound Architecture Driver Initialized.
[    0.124287] vgaarb: loaded
[    0.124667] clocksource: Switched to clocksource arch_sys_counter
[    0.125141] VFS: Disk quotas dquot_6.6.0
[    0.125195] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    0.125283] FS-Cache: Loaded
[    0.125415] CacheFiles: Loaded
[    0.132640] NET: Registered PF_INET protocol family
[    0.133423] IP idents hash table entries: 131072 (order: 8, 1048576 bytes, linear)
[    0.142025] tcp_listen_portaddr_hash hash table entries: 4096 (order: 4, 65536 bytes, linear)
[    0.142130] Table-perturb hash table entries: 65536 (order: 6, 262144 bytes, linear)
[    0.142153] TCP established hash table entries: 65536 (order: 7, 524288 bytes, linear)
[    0.142849] TCP bind hash table entries: 65536 (order: 9, 2097152 bytes, linear)
[    0.145513] TCP: Hash tables configured (established 65536 bind 65536)
[    0.145902] MPTCP token hash table entries: 8192 (order: 5, 196608 bytes, linear)
[    0.146173] UDP hash table entries: 4096 (order: 5, 131072 bytes, linear)
[    0.146435] UDP-Lite hash table entries: 4096 (order: 5, 131072 bytes, linear)
[    0.146850] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.147382] RPC: Registered named UNIX socket transport module.
[    0.147391] RPC: Registered udp transport module.
[    0.147396] RPC: Registered tcp transport module.
[    0.147401] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.147412] PCI: CLS 0 bytes, default 64
[    0.148969] hw perfevents: enabled with armv8_cortex_a72 PMU driver, 7 counters available
[    0.149212] kvm [1]: IPA Size Limit: 44 bits
[    0.150445] kvm [1]: vgic interrupt IRQ9
[    0.150576] kvm [1]: Hyp mode initialized successfully
[    1.144210] Initialise system trusted keyrings
[    1.144543] workingset: timestamp_bits=46 max_order=21 bucket_order=0
[    1.150558] zbud: loaded
[    1.152708] NFS: Registering the id_resolver key type
[    1.152733] Key type id_resolver registered
[    1.152738] Key type id_legacy registered
[    1.152824] nfs4filelayout_init: NFSv4 File Layout Driver Registering...
[    1.152833] nfs4flexfilelayout_init: NFSv4 Flexfile Layout Driver Registering...
[    1.153864] Key type asymmetric registered
[    1.153874] Asymmetric key parser 'x509' registered
[    1.153937] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 246)
[    1.154332] io scheduler mq-deadline registered
[    1.154341] io scheduler kyber registered
[    1.155769] irq_brcmstb_l2: registered L2 intc (/soc/interrupt-controller@7ef00100, parent irq: 27)
[    1.160542] brcm-pcie fd500000.pcie: host bridge /scb/pcie@7d500000 ranges:
[    1.160568] brcm-pcie fd500000.pcie:   No bus range found for /scb/pcie@7d500000, using [bus 00-ff]
[    1.160607] brcm-pcie fd500000.pcie:      MEM 0x0600000000..0x063fffffff -> 0x00c0000000
[    1.160641] brcm-pcie fd500000.pcie:   IB MEM 0x0000000000..0x00bfffffff -> 0x0400000000
[    1.161173] brcm-pcie fd500000.pcie: setting SCB_ACCESS_EN, READ_UR_MODE, MAX_BURST_SIZE
[    1.161462] brcm-pcie fd500000.pcie: PCI host bridge to bus 0000:00
[    1.161473] pci_bus 0000:00: root bus resource [bus 00-ff]
[    1.161487] pci_bus 0000:00: root bus resource [mem 0x600000000-0x63fffffff] (bus address [0xc0000000-0xffffffff])
[    1.161525] pci 0000:00:00.0: [14e4:2711] type 01 class 0x060400
[    1.161605] pci 0000:00:00.0: PME# supported from D0 D3hot
[    1.165244] pci_bus 0000:01: supply vpcie3v3 not found, using dummy regulator
[    1.165369] pci_bus 0000:01: supply vpcie3v3aux not found, using dummy regulator
[    1.165421] pci_bus 0000:01: supply vpcie12v not found, using dummy regulator
[    1.274758] brcm-pcie fd500000.pcie: link up, 5.0 GT/s PCIe x1 (SSC)
[    1.274858] pci 0000:01:00.0: [1106:3483] type 00 class 0x0c0330
[    1.274947] pci 0000:01:00.0: reg 0x10: [mem 0x00000000-0x00000fff 64bit]
[    1.275224] pci 0000:01:00.0: PME# supported from D0 D3hot
[    1.284774] pci 0000:00:00.0: BAR 8: assigned [mem 0x600000000-0x6000fffff]
[    1.284794] pci 0000:01:00.0: BAR 0: assigned [mem 0x600000000-0x600000fff 64bit]
[    1.284851] pci 0000:00:00.0: PCI bridge to [bus 01]
[    1.284862] pci 0000:00:00.0:   bridge window [mem 0x600000000-0x6000fffff]
[    1.285056] pcieport 0000:00:00.0: enabling device (0000 -> 0002)
[    1.285191] pcieport 0000:00:00.0: PME: Signaling with IRQ 31
[    1.285493] pcieport 0000:00:00.0: AER: enabled with IRQ 31
[    1.290873] Serial: 8250/16550 driver, 1 ports, IRQ sharing enabled
[    1.292716] iproc-rng200 fe104000.rng: hwrng registered
[    1.292988] vc-mem: phys_addr:0x00000000 mem_base=0x3ec00000 mem_size:0x40000000(1024 MiB)
[    1.302901] brd: module loaded
[    1.308783] loop: module loaded
[    1.309325] Loading iSCSI transport class v2.0-870.
[    1.312940] bcmgenet fd580000.ethernet: GENET 5.0 EPHY: 0x0000
[    1.408742] unimac-mdio unimac-mdio.-19: Broadcom UniMAC MDIO bus
[    1.409516] usbcore: registered new device driver r8152-cfgselector
[    1.409559] usbcore: registered new interface driver r8152
[    1.409606] usbcore: registered new interface driver lan78xx
[    1.409651] usbcore: registered new interface driver smsc95xx
[    1.455588] xhci_hcd 0000:01:00.0: xHCI Host Controller
[    1.455615] xhci_hcd 0000:01:00.0: new USB bus registered, assigned bus number 1
[    1.456056] xhci_hcd 0000:01:00.0: hcc params 0x002841eb hci version 0x100 quirks 0x0f00040000000890
[    1.456821] xhci_hcd 0000:01:00.0: xHCI Host Controller
[    1.456837] xhci_hcd 0000:01:00.0: new USB bus registered, assigned bus number 2
[    1.456852] xhci_hcd 0000:01:00.0: Host supports USB 3.0 SuperSpeed
[    1.457089] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 6.01
[    1.457104] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.457114] usb usb1: Product: xHCI Host Controller
[    1.457121] usb usb1: Manufacturer: Linux 6.1.77-v8 xhci-hcd
[    1.457129] usb usb1: SerialNumber: 0000:01:00.0
[    1.457618] hub 1-0:1.0: USB hub found
[    1.457661] hub 1-0:1.0: 1 port detected
[    1.458170] usb usb2: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 6.01
[    1.458185] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.458194] usb usb2: Product: xHCI Host Controller
[    1.458202] usb usb2: Manufacturer: Linux 6.1.77-v8 xhci-hcd
[    1.458210] usb usb2: SerialNumber: 0000:01:00.0
[    1.458663] hub 2-0:1.0: USB hub found
[    1.458705] hub 2-0:1.0: 4 ports detected
[    1.459640] dwc_otg: version 3.00a 10-AUG-2012 (platform bus)
[    1.460406] usbcore: registered new interface driver uas
[    1.460472] usbcore: registered new interface driver usb-storage
[    1.460926] mousedev: PS/2 mouse device common for all mice
[    1.464288] sdhci: Secure Digital Host Controller Interface driver
[    1.464297] sdhci: Copyright(c) Pierre Ossman
[    1.464520] sdhci-pltfm: SDHCI platform and OF driver helper
[    1.468141] ledtrig-cpu: registered to indicate activity on CPUs
[    1.468245] SMCCC: SOC_ID: ARCH_SOC_ID not implemented, skipping ....
[    1.468270] hid: raw HID events driver (C) Jiri Kosina
[    1.468346] usbcore: registered new interface driver usbhid
[    1.468349] usbhid: USB HID core driver
[    1.471076] optee: probing for conduit method.
[    1.471106] optee: revision 4.3 (1c0d52ace3c237ca)
[    1.487737] optee: initialized driver
[    1.488179] NET: Registered PF_PACKET protocol family
[    1.488214] Key type dns_resolver registered
[    1.488614] registered taskstats version 1
[    1.488638] Loading compiled-in X.509 certificates
[    1.488980] Key type .fscrypt registered
[    1.488984] Key type fscrypt-provisioning registered
[    1.494834] uart-pl011 fe201000.serial: there is not valid maps for state default
[    1.495074] uart-pl011 fe201000.serial: cts_event_workaround enabled
[    1.495152] fe201000.serial: ttyAMA1 at MMIO 0xfe201000 (irq = 36, base_baud = 0) is a PL011 rev2
[    1.495261] serial serial0: tty port ttyAMA1 registered
[    1.501995] bcm2835-aux-uart fe215040.serial: there is not valid maps for state default
[    1.502225] printk: console [ttyS0] disabled
[    1.502260] fe215040.serial: ttyS0 at MMIO 0xfe215040 (irq = 37, base_baud = 62500000) is a 16550
[    1.720668] usb 1-1: new high-speed USB device number 2 using xhci_hcd
[    1.741272] printk: console [ttyS0] enabled
[    1.972254] usb 1-1: New USB device found, idVendor=2109, idProduct=3431, bcdDevice= 4.21
[    1.986624] bcm2835-wdt bcm2835-wdt: Poweroff handler already present!
[    1.992195] usb 1-1: New USB device strings: Mfr=0, Product=1, SerialNumber=0
[    1.996840] bcm2835-wdt bcm2835-wdt: Broadcom BCM2835 watchdog timer
[    2.002125] usb 1-1: Product: USB2.0 Hub
[    2.006827] bcm2835-power bcm2835-power: Broadcom BCM2835 power domains driver
[    2.012449] hub 1-1:1.0: USB hub found
[    2.015763] mmc-bcm2835 fe300000.mmcnr: mmc_debug:0 mmc_debug2:0
[    2.022281] hub 1-1:1.0: 4 ports detected
[    2.026061] mmc-bcm2835 fe300000.mmcnr: DMA channel allocated
[    2.053087] of_cfs_init
[    2.089184] mmc0: SDHCI controller on fe340000.mmc [fe340000.mmc] using ADMA
[    2.098431] of_cfs_init: OK
[    2.176006] mmc1: new high speed SDIO card at address 0001
[    2.179958] ALSA device list:
[    2.205375] mmc0: new ultra high speed DDR50 SDHC card at address aaaa
[    2.208833]   No soundcards found.
[    2.211870] mmcblk0: mmc0:aaaa SL32G 29.7 GiB
[    3.128926]  mmcblk0: p1 p2
[    3.131953] mmcblk0: mmc0:aaaa SL32G 29.7 GiB (quirks 0x00004000)
[    3.143282] EXT4-fs (mmcblk0p2): mounted filesystem with ordered data mode. Quota mode: none.
[    3.151992] VFS: Mounted root (ext4 filesystem) readonly on device 179:2.
[    3.161404] devtmpfs: mounted
[    3.167958] Freeing unused kernel memory: 4416K
[    3.172663] Run /sbin/init as init process
INIT: version 3.01 booting
Starting udev
[    3.460513] udevd[145]: starting version 3.2.10
[    3.485195] udevd[146]: starting eudev-3.2.10
[    3.638719] EXT4-fs (mmcblk0p2): re-mounted. Quota mode: none.
Fri Mar  9 12:34:56 UTC 2018
Configuring packages on first boot....
 (This may take several minutes. Please do not power off the machine.)
Running postinst /etc/rpm-postinsts/100-sysvinit-inittab...
update-rc.d: /etc/init.d/run-postinsts exists during rc.d purge (continuing)
INIT: Entering runlevel: 5
Configuring network interfaces... [    4.064562] bcmgenet fd580000.ethernet: configuring instance for external RGMII (RX delay)
[    4.073642] bcmgenet fd580000.ethernet eth0: Link is Down
udhcpc: started, v1.35.0
udhcpc: broadcasting discover
udhcpc: broadcasting discover
udhcpc: broadcasting discover
udhcpc: no lease, forking to background
done.
Starting OpenBSD Secure Shell server: sshd
  generating ssh RSA host key...
  generating ssh ECDSA host key...
  generating ssh ED25519 host key...
done.
Starting OP-TEE Supplicant: tee-supplicant.
Starting syslogd/klogd: done

Poky (Yocto Project Reference Distro) 4.0.20 raspberrypi4-64-optee /dev/ttyS0

raspberrypi4-64-optee login: root
root@raspberrypi4-64-optee:~# optee_example_hello_world
I/TC: WARNING (insecure configuration): Failed to get monotonic counter for REE FS, using 0
I/TC: WARNING (insecure configuration): Failed to commit dirh counter 2
D/TA:  TA_CreateEntryPoint:39 has been called
D/TA:  __GP11_TA_OpenSessionEntryPoint:68 has been called
I/TA: Hello World!
InvokingD/TA:  inc_value:105 has been called
 TA to iI/TA: Got value: 42 from NW
ncrementI/TA: Increase value to: 43
 42
I/TA: Goodbye!
TA increD/TA:  TA_DestroyEntryPoint:50 has been called
mented value to 43
root@raspberrypi4-64-optee:~#
```

## References

- [joaopeixoto13/OPTEE-RPI4](https://github.com/joaopeixoto13/OPTEE-RPI4)
- [Jachm11/optee-os_raspberry_pi_4_port](https://github.com/Jachm11/optee-os_raspberry_pi_4_port)
