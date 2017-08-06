Return-Path: sg5414@g.rit.edu
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9e3f1655
 for <wireguard@lists.zx2c4.com>; Sun, 6 Aug 2017 16:11:27 +0000 (UTC)
Received: from mx03b-out01ag.rit.edu (mx03b-out01ag.rit.edu [129.21.3.135])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c0659874
 for <wireguard@lists.zx2c4.com>; Sun, 6 Aug 2017 16:11:27 +0000 (UTC)
From: Sahil Gupta <sg5414@rit.edu>
Received: by mail-pf0-f198.google.com with SMTP id b66so71487314pfe.9
 for <wireguard@lists.zx2c4.com>; Sun, 06 Aug 2017 09:33:02 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAA8CD9sAT8PW8B1HSqR9utNvjmFB6Tn4U0bESBGO7QWVSVqX3w@mail.gmail.com>
References: <CAA8CD9t8YCR__Ee2F3Sb5H=78O9PTi5j+K1iXHsU7PS4pTKAwA@mail.gmail.com>
 <CAA8CD9sAT8PW8B1HSqR9utNvjmFB6Tn4U0bESBGO7QWVSVqX3w@mail.gmail.com>
Date: Sun, 6 Aug 2017 12:33:00 -0400
Message-ID: <CAA8CD9tHsB5tPkeUsuVA1V3SM7bQdFKjWV6c+NM6hh_o1N5HHg@mail.gmail.com>
Subject: Re: RTNETLINK answers: Operation not supported
To: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Eric Light <eric@ericlight.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: multipart/alternative; boundary="94eb2c12fa0897ebc905561848bc"
Reply-To: sg5414@rit.edu
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--94eb2c12fa0897ebc905561848bc
Content-Type: text/plain; charset="UTF-8"

If I am correct to make wireguard work.
You require three components
1. wireguard-dkms
2. wireguard-tools
3. linux headers

I tried "linux-headers-4.9.31-v7+_4.9.31-v7+-2_armhf.deb"
Please correct me if I am using wrong linux header for compilation.

Thanks
Sahil


On Sun, Aug 6, 2017 at 12:30 PM, Sahil Gupta <sg5414@g.rit.edu> wrote:

> I have tried to install linux headers but still showing the same error.
>
> Here's the stack to process.
> "
> pi@raspberrypi:~ $ sudo dpkg -i linux-headers-4.9.31-v7+_4.9.
> 31-v7+-2_armhf.deb
> Selecting previously unselected package linux-headers-4.9.31-v7+.
> (Reading database ... 132946 files and directories currently installed.)
> Preparing to unpack linux-headers-4.9.31-v7+_4.9.31-v7+-2_armhf.deb ...
> Unpacking linux-headers-4.9.31-v7+ (4.9.31-v7+-2) ...
> dpkg: dependency problems prevent configuration of
> linux-headers-4.9.31-v7+:
>  linux-headers-4.9.31-v7+ depends on bc; however:
>   Package bc is not installed.
>
> dpkg: error processing package linux-headers-4.9.31-v7+ (--install):
>  dependency problems - leaving unconfigured
> Errors were encountered while processing:
>  linux-headers-4.9.31-v7+
> pi@raspberrypi:~ $ lsmod | grep wireguard
> pi@raspberrypi:~ $ sudo apt-get install wireguard-dkms wireguard-tools
> Reading package lists... Done
> Building dependency tree
> Reading state information... Done
> wireguard-dkms is already the newest version (0.0.20170726-1).
> wireguard-tools is already the newest version (0.0.20170726-1).
> You might want to run 'apt --fix-broken install' to correct these.
> The following packages have unmet dependencies:
>  linux-headers-4.9.31-v7+ : Depends: bc but it is not going to be installed
> E: Unmet dependencies. Try 'apt --fix-broken install' with no packages (or
> specify a solution).
> pi@raspberrypi:~ $ sudo apt --fix-broken install
> Reading package lists... Done
> Building dependency tree
> Reading state information... Done
> Correcting dependencies... Done
> The following additional packages will be installed:
>   bc
> The following NEW packages will be installed:
>   bc
> 0 upgraded, 1 newly installed, 0 to remove and 855 not upgraded.
> 1 not fully installed or removed.
> Need to get 101 kB of archives.
> After this operation, 212 kB of additional disk space will be used.
> Do you want to continue? [Y/n] Y
> WARNING: The following packages cannot be authenticated!
>   bc
> Install these packages without verification? [y/N] y
> Get:1 http://deb.debian.org/debian unstable/main armhf bc armhf
> 1.06.95-9+b3 [101 kB]
> Fetched 101 kB in 0s (226 kB/s)
> Selecting previously unselected package bc.
> (Reading database ... 148260 files and directories currently installed.)
> Preparing to unpack .../bc_1.06.95-9+b3_armhf.deb ...
> Unpacking bc (1.06.95-9+b3) ...
> Processing triggers for install-info (5.2.0.dfsg.1-6) ...
> Processing triggers for man-db (2.7.5-1~bpo8+1) ...
> Setting up bc (1.06.95-9+b3) ...
> Setting up linux-headers-4.9.31-v7+ (4.9.31-v7+-2) ...
> make: Entering directory '/usr/src/linux-headers-4.9.31-v7+'
>   HOSTCC  scripts/basic/fixdep
>   HOSTCC  scripts/basic/bin2c
>   HOSTCC  scripts/kconfig/conf.o
>   HOSTCC  scripts/kconfig/zconf.tab.o
>   HOSTLD  scripts/kconfig/conf
> *** Default configuration is based on 'bcm2709_defconfig'
> #
> # configuration written to .config
> #
> make: Leaving directory '/usr/src/linux-headers-4.9.31-v7+'
> make: Entering directory '/usr/src/linux-headers-4.9.31-v7+'
> scripts/kconfig/conf  --silentoldconfig Kconfig
>   CHK     include/config/kernel.release
>   UPD     include/config/kernel.release
>   WRAP    arch/arm/include/generated/asm/bitsperlong.h
>   WRAP    arch/arm/include/generated/asm/clkdev.h
>   WRAP    arch/arm/include/generated/asm/cputime.h
>   WRAP    arch/arm/include/generated/asm/current.h
>   WRAP    arch/arm/include/generated/asm/early_ioremap.h
>   WRAP    arch/arm/include/generated/asm/emergency-restart.h
>   WRAP    arch/arm/include/generated/asm/errno.h
>   WRAP    arch/arm/include/generated/asm/exec.h
>   WRAP    arch/arm/include/generated/asm/ioctl.h
>   WRAP    arch/arm/include/generated/asm/ipcbuf.h
>   WRAP    arch/arm/include/generated/asm/irq_regs.h
>   WRAP    arch/arm/include/generated/asm/kdebug.h
>   WRAP    arch/arm/include/generated/asm/local.h
>   WRAP    arch/arm/include/generated/asm/local64.h
>   WRAP    arch/arm/include/generated/asm/mm-arch-hooks.h
>   WRAP    arch/arm/include/generated/asm/msgbuf.h
>   WRAP    arch/arm/include/generated/asm/msi.h
>   WRAP    arch/arm/include/generated/asm/param.h
>   WRAP    arch/arm/include/generated/asm/parport.h
>   WRAP    arch/arm/include/generated/asm/poll.h
>   WRAP    arch/arm/include/generated/asm/preempt.h
>   WRAP    arch/arm/include/generated/asm/resource.h
>   WRAP    arch/arm/include/generated/asm/rwsem.h
>   WRAP    arch/arm/include/generated/asm/seccomp.h
>   WRAP    arch/arm/include/generated/asm/segment.h
>   WRAP    arch/arm/include/generated/asm/sembuf.h
>   WRAP    arch/arm/include/generated/asm/serial.h
>   WRAP    arch/arm/include/generated/asm/shmbuf.h
>   WRAP    arch/arm/include/generated/asm/siginfo.h
>   WRAP    arch/arm/include/generated/asm/simd.h
>   WRAP    arch/arm/include/generated/asm/sizes.h
>   WRAP    arch/arm/include/generated/asm/socket.h
>   WRAP    arch/arm/include/generated/asm/sockios.h
>   WRAP    arch/arm/include/generated/asm/termbits.h
>   WRAP    arch/arm/include/generated/asm/termios.h
>   WRAP    arch/arm/include/generated/asm/timex.h
>   WRAP    arch/arm/include/generated/asm/trace_clock.h
>   WRAP    arch/arm/include/generated/asm/unaligned.h
>   CHK     include/generated/uapi/linux/version.h
>   UPD     include/generated/uapi/linux/version.h
>   CHK     include/generated/utsrelease.h
>   UPD     include/generated/utsrelease.h
>   GEN     include/generated/mach-types.h
>   CC      kernel/bounds.s
>   CHK     include/generated/bounds.h
>   UPD     include/generated/bounds.h
>   CHK     include/generated/timeconst.h
>   UPD     include/generated/timeconst.h
>   CC      arch/arm/kernel/asm-offsets.s
>   CHK     include/generated/asm-offsets.h
>   UPD     include/generated/asm-offsets.h
>   CALL    scripts/checksyscalls.sh
> grep: scripts/../arch/x86/entry/syscalls/syscall_32.tbl: No such file or
> directory
>   HOSTCC  scripts/dtc/dtc.o
>   HOSTCC  scripts/dtc/flattree.o
>   HOSTCC  scripts/dtc/fstree.o
>   HOSTCC  scripts/dtc/data.o
>   HOSTCC  scripts/dtc/livetree.o
>   HOSTCC  scripts/dtc/treesource.o
>   HOSTCC  scripts/dtc/srcpos.o
>   HOSTCC  scripts/dtc/checks.o
>   HOSTCC  scripts/dtc/util.o
>   HOSTCC  scripts/dtc/dtc-lexer.lex.o
>   HOSTCC  scripts/dtc/dtc-parser.tab.o
>   HOSTLD  scripts/dtc/dtc
>   HOSTCC  scripts/genksyms/genksyms.o
>   HOSTCC  scripts/genksyms/parse.tab.o
>   SHIPPED scripts/genksyms/lex.lex.c
>   HOSTCC  scripts/genksyms/lex.lex.o
>   HOSTLD  scripts/genksyms/genksyms
>   CC      scripts/mod/empty.o
>   HOSTCC  scripts/mod/mk_elfconfig
>   MKELF   scripts/mod/elfconfig.h
>   HOSTCC  scripts/mod/modpost.o
>   CC      scripts/mod/devicetable-offsets.s
>   GEN     scripts/mod/devicetable-offsets.h
>   HOSTCC  scripts/mod/file2alias.o
>   HOSTCC  scripts/mod/sumversion.o
>   HOSTLD  scripts/mod/modpost
>   HOSTCC  scripts/kallsyms
>   HOSTCC  scripts/pnmtologo
>   HOSTCC  scripts/conmakehash
>   HOSTCC  scripts/recordmcount
>   HOSTCC  scripts/sortextable
> make: Leaving directory '/usr/src/linux-headers-4.9.31-v7+'
>
> -------- Uninstall Beginning --------
> Module:  wireguard
> Version: 0.0.20170726-1
> Kernel:  4.9.35+ (armv7l)
> -------------------------------------
>
> Status: Before uninstall, this module version was ACTIVE on this kernel.
>
> wireguard.ko:
>  - Uninstallation
>    - Deleting from: /lib/modules/4.9.35+/kernel/net/
>  - Original module
>    - No original module was found for this module on this kernel.
>    - Use the dkms install command to reinstall any previous module version.
>
> depmod...
>
> DKMS: uninstall completed.
>
> -------- Uninstall Beginning --------
> Module:  wireguard
> Version: 0.0.20170726-1
> Kernel:  4.9.35-v7+ (armv7l)
> -------------------------------------
>
> Status: Before uninstall, this module version was ACTIVE on this kernel.
>
> wireguard.ko:
>  - Uninstallation
>    - Deleting from: /lib/modules/4.9.35-v7+/kernel/net/
>  - Original module
>    - No original module was found for this module on this kernel.
>    - Use the dkms install command to reinstall any previous module version.
>
> depmod...
>
> DKMS: uninstall completed.
>
> ------------------------------
> Deleting module version: 0.0.20170726-1
> completely from the DKMS tree.
> ------------------------------
> Done.
> Loading new wireguard-0.0.20170726-1 DKMS files...
> It is likely that 4.9.35-v7+ belongs to a chroot's host
> Building for 3.6-trunk-rpi, 4.9.31-v7+, 4.9.35+ and 4.9.35-v7+
> Building initial module for 3.6-trunk-rpi
> Error!  The dkms.conf for this module includes a BUILD_EXCLUSIVE directive
> which
> does not match this kernel/arch.  This indicates that it should not be
> built.
> Skipped.
> Building initial module for 4.9.31-v7+
> Done.
>
> wireguard:
> Running module version sanity check.
>  - Original module
>    - No original module exists within this kernel
>  - Installation
>    - Installing to /lib/modules/4.9.31-v7+/kernel/net/
>
> depmod...
>
> DKMS: install completed.
> Building initial module for 4.9.35+
> Done.
>
> wireguard:
> Running module version sanity check.
>  - Original module
>    - No original module exists within this kernel
>  - Installation
>    - Installing to /lib/modules/4.9.35+/kernel/net/
>
> depmod...
>
> DKMS: install completed.
> Building initial module for 4.9.35-v7+
> Done.
>
> wireguard:
> Running module version sanity check.
>  - Original module
>    - No original module exists within this kernel
>  - Installation
>    - Installing to /lib/modules/4.9.35-v7+/kernel/net/
>
> depmod...
>
> DKMS: install completed.
>
> -------- Uninstall Beginning --------
> Module:  wireguard
> Version: 0.0.20170726-1
> Kernel:  4.9.31-v7+ (armv7l)
> -------------------------------------
>
> Status: Before uninstall, this module version was ACTIVE on this kernel.
>
> wireguard.ko:
>  - Uninstallation
>    - Deleting from: /lib/modules/4.9.31-v7+/kernel/net/
>  - Original module
>    - No original module was found for this module on this kernel.
>    - Use the dkms install command to reinstall any previous module version.
>
> depmod...
>
> DKMS: uninstall completed.
>
> -------- Uninstall Beginning --------
> Module:  wireguard
> Version: 0.0.20170726-1
> Kernel:  4.9.35+ (armv7l)
> -------------------------------------
>
> Status: Before uninstall, this module version was ACTIVE on this kernel.
>
> wireguard.ko:
>  - Uninstallation
>    - Deleting from: /lib/modules/4.9.35+/kernel/net/
>  - Original module
>    - No original module was found for this module on this kernel.
>    - Use the dkms install command to reinstall any previous module version.
>
> depmod...
>
> DKMS: uninstall completed.
>
> -------- Uninstall Beginning --------
> Module:  wireguard
> Version: 0.0.20170726-1
> Kernel:  4.9.35-v7+ (armv7l)
> -------------------------------------
>
> Status: Before uninstall, this module version was ACTIVE on this kernel.
>
> wireguard.ko:
>  - Uninstallation
>    - Deleting from: /lib/modules/4.9.35-v7+/kernel/net/
>  - Original module
>    - No original module was found for this module on this kernel.
>    - Use the dkms install command to reinstall any previous module version.
>
> depmod...
>
> DKMS: uninstall completed.
>
> ------------------------------
> Deleting module version: 0.0.20170726-1
> completely from the DKMS tree.
> ------------------------------
> Done.
> Loading new wireguard-0.0.20170726-1 DKMS files...
> It is likely that 4.9.35-v7+ belongs to a chroot's host
> Building for 3.6-trunk-rpi, 4.9.31-v7+, 4.9.35+ and 4.9.35-v7+
> Building initial module for 3.6-trunk-rpi
> Error!  The dkms.conf for this module includes a BUILD_EXCLUSIVE directive
> which
> does not match this kernel/arch.  This indicates that it should not be
> built.
> Skipped.
> Building initial module for 4.9.31-v7+
> Done.
>
> wireguard:
> Running module version sanity check.
>  - Original module
>    - No original module exists within this kernel
>  - Installation
>    - Installing to /lib/modules/4.9.31-v7+/kernel/net/
>
> depmod...
>
> DKMS: install completed.
> Building initial module for 4.9.35+
> Done.
>
> wireguard:
> Running module version sanity check.
>  - Original module
>    - No original module exists within this kernel
>  - Installation
>    - Installing to /lib/modules/4.9.35+/kernel/net/
>
> depmod...
>
> DKMS: install completed.
> Building initial module for 4.9.35-v7+
> Done.
>
> wireguard:
> Running module version sanity check.
>  - Original module
>    - No original module exists within this kernel
>  - Installation
>    - Installing to /lib/modules/4.9.35-v7+/kernel/net/
>
> depmod...
>
> DKMS: install completed.
> pi@raspberrypi:~ $ lsmod | grep wireguard
> pi@raspberrypi:~ $ ip link add dev wg0 type wireguard
> RTNETLINK answers: Operation not permitted
> pi@raspberrypi:~ $ sudo apt-get install wireguard-dkms wireguard-tools
> Reading package lists... Done
> Building dependency tree
> Reading state information... Done
> wireguard-dkms is already the newest version (0.0.20170726-1).
> wireguard-tools is already the newest version (0.0.20170726-1).
> 0 upgraded, 0 newly installed, 0 to remove and 855 not upgraded.
> pi@raspberrypi:~ $ lsmod | grep wireguard
> pi@raspberrypi:~ $ ip link add dev wg0 type wireguard
> RTNETLINK answers: Operation not permitted
> pi@raspberrypi:~ $ sudo apt-get purge wireguard-dkms wireguard-tools
> Reading package lists... Done
> Building dependency tree
> Reading state information... Done
> The following packages were automatically installed and are no longer
> required:
>   dkms libmnl0 linux-headers-3.6-trunk-common linux-headers-3.6-trunk-rpi
> linux-kbuild-3.6
> Use 'sudo apt autoremove' to remove them.
> The following packages will be REMOVED:
>   wireguard-dkms* wireguard-tools*
> 0 upgraded, 0 newly installed, 2 to remove and 855 not upgraded.
> After this operation, 918 kB disk space will be freed.
> Do you want to continue? [Y/n] Y
> (Reading database ... 148279 files and directories currently installed.)
> Removing wireguard-dkms (0.0.20170726-1) ...
>
> -------- Uninstall Beginning --------
> Module:  wireguard
> Version: 0.0.20170726-1
> Kernel:  4.9.31-v7+ (armv7l)
> -------------------------------------
>
> Status: Before uninstall, this module version was ACTIVE on this kernel.
>
> wireguard.ko:
>  - Uninstallation
>    - Deleting from: /lib/modules/4.9.31-v7+/kernel/net/
>  - Original module
>    - No original module was found for this module on this kernel.
>    - Use the dkms install command to reinstall any previous module version.
>
> depmod...
>
> DKMS: uninstall completed.
>
> -------- Uninstall Beginning --------
> Module:  wireguard
> Version: 0.0.20170726-1
> Kernel:  4.9.35+ (armv7l)
> -------------------------------------
>
> Status: Before uninstall, this module version was ACTIVE on this kernel.
>
> wireguard.ko:
>  - Uninstallation
>    - Deleting from: /lib/modules/4.9.35+/kernel/net/
>  - Original module
>    - No original module was found for this module on this kernel.
>    - Use the dkms install command to reinstall any previous module version.
>
> depmod...
>
> DKMS: uninstall completed.
>
> -------- Uninstall Beginning --------
> Module:  wireguard
> Version: 0.0.20170726-1
> Kernel:  4.9.35-v7+ (armv7l)
> -------------------------------------
>
> Status: Before uninstall, this module version was ACTIVE on this kernel.
>
> wireguard.ko:
>  - Uninstallation
>    - Deleting from: /lib/modules/4.9.35-v7+/kernel/net/
>  - Original module
>    - No original module was found for this module on this kernel.
>    - Use the dkms install command to reinstall any previous module version.
>
> depmod...
>
> DKMS: uninstall completed.
>
> ------------------------------
> Deleting module version: 0.0.20170726-1
> completely from the DKMS tree.
> ------------------------------
> Done.
> Removing wireguard-tools (0.0.20170726-1) ...
> dpkg: warning: while removing wireguard-tools, directory '/etc/wireguard'
> not empty so not removed
> Processing triggers for man-db (2.7.5-1~bpo8+1) ...
>
> "
>
> On Sat, Aug 5, 2017 at 3:38 PM, Sahil Gupta <sg5414@g.rit.edu> wrote:
>
>> Hi,
>> I am not able to setup Wireguard interface on Raspberry pi.
>>
>> Error:
>> RTNETLINK answers: Operation not supported
>>
>>
>> See the stack:
>> "
>> pi@raspberrypi:~ $ cd /etc/wireguard/
>> pi@raspberrypi:/etc/wireguard $ l
>> -bash: l: command not found
>> pi@raspberrypi:/etc/wireguard $ ls
>> publickey  wg0.conf
>> pi@raspberrypi:/etc/wireguard $ history | grep wg0
>>    15  history | grep wg0
>> pi@raspberrypi:/etc/wireguard $ ip link add wg0 type wireguard
>> RTNETLINK answers: Operation not permitted
>> pi@raspberrypi:/etc/wireguard $ sudo su
>> root@raspberrypi:/etc/wireguard# wg-quick up wg0
>> Warning: `/etc/wireguard/wg0.conf' is world accessible
>> [#] ip link add wg0 type wireguard
>> RTNETLINK answers: Operation not supported
>> `wg0` is not a valid WireGuard interface
>> Usage: wg show { <interface> | all | interfaces } [public-key |
>> private-key | listen-port | fwmark | peers | preshared-keys | endpoints |
>> allowed-ips | latest-handshakes | transfer | persistent-keepalive | dump]
>> root@raspberrypi:/etc/wireguard# wg show
>> root@raspberrypi:/etc/wireguard# wg show all
>> root@raspberrypi:/etc/wireguard#
>>
>> "
>>
>> Any pointers will be appreciated.
>>
>> Thanks
>> Sahil Gupta
>>
>
>

--94eb2c12fa0897ebc905561848bc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">If I am correct to make wireguard work.<br>You require thr=
ee components<br>1. wireguard-dkms=C2=A0<div>2. wireguard-tools</div><div>3=
. linux headers</div><div><br></div><div>I tried &quot;linux-headers-4.9.31=
-v7+_4.9.31-v7+-2_armhf.deb&quot;</div><div>Please correct me if I am using=
 wrong linux header for compilation.</div><div><br></div><div>Thanks<br>Sah=
il=C2=A0</div><div><br></div></div><div class=3D"gmail_extra"><br><div clas=
s=3D"gmail_quote">On Sun, Aug 6, 2017 at 12:30 PM, Sahil Gupta <span dir=3D=
"ltr">&lt;<a href=3D"mailto:sg5414@g.rit.edu" target=3D"_blank">sg5414@g.ri=
t.edu</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"l=
tr">I have tried to install linux headers but still showing the same error.=
<div><br>Here&#39;s the stack to process.<br>&quot;<div><div>pi@raspberrypi=
:~ $ sudo dpkg -i linux-headers-4.9.31-v7+_4.9.<wbr>31-v7+-2_armhf.deb=C2=
=A0</div><div>Selecting previously unselected package linux-headers-4.9.31-=
v7+.</div><div>(Reading database ... 132946 files and directories currently=
 installed.)</div><div>Preparing to unpack linux-headers-4.9.31-v7+_4.9.<wb=
r>31-v7+-2_armhf.deb ...</div><div>Unpacking linux-headers-4.9.31-v7+ (4.9.=
31-v7+-2) ...</div><div>dpkg: dependency problems prevent configuration of =
linux-headers-4.9.31-v7+:</div><div>=C2=A0linux-headers-4.9.31-v7+ depends =
on bc; however:</div><div>=C2=A0 Package bc is not installed.</div><div><br=
></div><div>dpkg: error processing package linux-headers-4.9.31-v7+ (--inst=
all):</div><div>=C2=A0dependency problems - leaving unconfigured</div><div>=
Errors were encountered while processing:</div><div>=C2=A0linux-headers-4.9=
.31-v7+</div><div>pi@raspberrypi:~ $ lsmod | grep wireguard</div><div>pi@ra=
spberrypi:~ $ sudo apt-get install wireguard-dkms wireguard-tools</div><div=
>Reading package lists... Done</div><div>Building dependency tree =C2=A0 =
=C2=A0 =C2=A0=C2=A0</div><div>Reading state information... Done</div><div>w=
ireguard-dkms is already the newest version (0.0.20170726-1).</div><div>wir=
eguard-tools is already the newest version (0.0.20170726-1).</div><div>You =
might want to run &#39;apt --fix-broken install&#39; to correct these.</div=
><div>The following packages have unmet dependencies:</div><div>=C2=A0linux=
-headers-4.9.31-v7+ : Depends: bc but it is not going to be installed</div>=
<div>E: Unmet dependencies. Try &#39;apt --fix-broken install&#39; with no =
packages (or specify a solution).</div><div>pi@raspberrypi:~ $ sudo apt --f=
ix-broken install</div><div>Reading package lists... Done</div><div>Buildin=
g dependency tree =C2=A0 =C2=A0 =C2=A0=C2=A0</div><div>Reading state inform=
ation... Done</div><div>Correcting dependencies... Done</div><div>The follo=
wing additional packages will be installed:</div><div>=C2=A0 bc</div><div>T=
he following NEW packages will be installed:</div><div>=C2=A0 bc</div><div>=
0 upgraded, 1 newly installed, 0 to remove and 855 not upgraded.</div><div>=
1 not fully installed or removed.</div><div>Need to get 101 kB of archives.=
</div><div>After this operation, 212 kB of additional disk space will be us=
ed.</div><div>Do you want to continue? [Y/n] Y</div><div>WARNING: The follo=
wing packages cannot be authenticated!</div><div>=C2=A0 bc</div><div>Instal=
l these packages without verification? [y/N] y</div><div>Get:1 <a href=3D"h=
ttp://deb.debian.org/debian" target=3D"_blank">http://deb.debian.org/debian=
</a> unstable/main armhf bc armhf 1.06.95-9+b3 [101 kB]</div><div>Fetched 1=
01 kB in 0s (226 kB/s)</div><div>Selecting previously unselected package bc=
.</div><div>(Reading database ... 148260 files and directories currently in=
stalled.)</div><div>Preparing to unpack .../bc_1.06.95-9+b3_armhf.deb ...</=
div><div>Unpacking bc (1.06.95-9+b3) ...</div><div>Processing triggers for =
install-info (5.2.0.dfsg.1-6) ...</div><div>Processing triggers for man-db =
(2.7.5-1~bpo8+1) ...</div><div>Setting up bc (1.06.95-9+b3) ...</div><div>S=
etting up linux-headers-4.9.31-v7+ (4.9.31-v7+-2) ...</div><div>make: Enter=
ing directory &#39;/usr/src/linux-headers-4.9.<wbr>31-v7+&#39;</div><div>=
=C2=A0 HOSTCC =C2=A0scripts/basic/fixdep</div><div>=C2=A0 HOSTCC =C2=A0scri=
pts/basic/bin2c</div><div>=C2=A0 HOSTCC =C2=A0scripts/kconfig/conf.o</div><=
div>=C2=A0 HOSTCC =C2=A0scripts/kconfig/zconf.tab.o</div><div>=C2=A0 HOSTLD=
 =C2=A0scripts/kconfig/conf</div><div>*** Default configuration is based on=
 &#39;bcm2709_defconfig&#39;</div><div>#</div><div># configuration written =
to .config</div><div>#</div><div>make: Leaving directory &#39;/usr/src/linu=
x-headers-4.9.<wbr>31-v7+&#39;</div><div>make: Entering directory &#39;/usr=
/src/linux-headers-4.9.<wbr>31-v7+&#39;</div><div>scripts/kconfig/conf =C2=
=A0--silentoldconfig Kconfig</div><div>=C2=A0 CHK =C2=A0 =C2=A0 include/con=
fig/kernel.release</div><div>=C2=A0 UPD =C2=A0 =C2=A0 include/config/kernel=
.release</div><div>=C2=A0 WRAP =C2=A0 =C2=A0arch/arm/include/generated/<wbr=
>asm/bitsperlong.h</div><div>=C2=A0 WRAP =C2=A0 =C2=A0arch/arm/include/gene=
rated/<wbr>asm/clkdev.h</div><div>=C2=A0 WRAP =C2=A0 =C2=A0arch/arm/include=
/generated/<wbr>asm/cputime.h</div><div>=C2=A0 WRAP =C2=A0 =C2=A0arch/arm/i=
nclude/generated/<wbr>asm/current.h</div><div>=C2=A0 WRAP =C2=A0 =C2=A0arch=
/arm/include/generated/<wbr>asm/early_ioremap.h</div><div>=C2=A0 WRAP =C2=
=A0 =C2=A0arch/arm/include/generated/<wbr>asm/emergency-restart.h</div><div=
>=C2=A0 WRAP =C2=A0 =C2=A0arch/arm/include/generated/<wbr>asm/errno.h</div>=
<div>=C2=A0 WRAP =C2=A0 =C2=A0arch/arm/include/generated/<wbr>asm/exec.h</d=
iv><div>=C2=A0 WRAP =C2=A0 =C2=A0arch/arm/include/generated/<wbr>asm/ioctl.=
h</div><div>=C2=A0 WRAP =C2=A0 =C2=A0arch/arm/include/generated/<wbr>asm/ip=
cbuf.h</div><div>=C2=A0 WRAP =C2=A0 =C2=A0arch/arm/include/generated/<wbr>a=
sm/irq_regs.h</div><div>=C2=A0 WRAP =C2=A0 =C2=A0arch/arm/include/generated=
/<wbr>asm/kdebug.h</div><div>=C2=A0 WRAP =C2=A0 =C2=A0arch/arm/include/gene=
rated/<wbr>asm/local.h</div><div>=C2=A0 WRAP =C2=A0 =C2=A0arch/arm/include/=
generated/<wbr>asm/local64.h</div><div>=C2=A0 WRAP =C2=A0 =C2=A0arch/arm/in=
clude/generated/<wbr>asm/mm-arch-hooks.h</div><div>=C2=A0 WRAP =C2=A0 =C2=
=A0arch/arm/include/generated/<wbr>asm/msgbuf.h</div><div>=C2=A0 WRAP =C2=
=A0 =C2=A0arch/arm/include/generated/<wbr>asm/msi.h</div><div>=C2=A0 WRAP =
=C2=A0 =C2=A0arch/arm/include/generated/<wbr>asm/param.h</div><div>=C2=A0 W=
RAP =C2=A0 =C2=A0arch/arm/include/generated/<wbr>asm/parport.h</div><div>=
=C2=A0 WRAP =C2=A0 =C2=A0arch/arm/include/generated/<wbr>asm/poll.h</div><d=
iv>=C2=A0 WRAP =C2=A0 =C2=A0arch/arm/include/generated/<wbr>asm/preempt.h</=
div><div>=C2=A0 WRAP =C2=A0 =C2=A0arch/arm/include/generated/<wbr>asm/resou=
rce.h</div><div>=C2=A0 WRAP =C2=A0 =C2=A0arch/arm/include/generated/<wbr>as=
m/rwsem.h</div><div>=C2=A0 WRAP =C2=A0 =C2=A0arch/arm/include/generated/<wb=
r>asm/seccomp.h</div><div>=C2=A0 WRAP =C2=A0 =C2=A0arch/arm/include/generat=
ed/<wbr>asm/segment.h</div><div>=C2=A0 WRAP =C2=A0 =C2=A0arch/arm/include/g=
enerated/<wbr>asm/sembuf.h</div><div>=C2=A0 WRAP =C2=A0 =C2=A0arch/arm/incl=
ude/generated/<wbr>asm/serial.h</div><div>=C2=A0 WRAP =C2=A0 =C2=A0arch/arm=
/include/generated/<wbr>asm/shmbuf.h</div><div>=C2=A0 WRAP =C2=A0 =C2=A0arc=
h/arm/include/generated/<wbr>asm/siginfo.h</div><div>=C2=A0 WRAP =C2=A0 =C2=
=A0arch/arm/include/generated/<wbr>asm/simd.h</div><div>=C2=A0 WRAP =C2=A0 =
=C2=A0arch/arm/include/generated/<wbr>asm/sizes.h</div><div>=C2=A0 WRAP =C2=
=A0 =C2=A0arch/arm/include/generated/<wbr>asm/socket.h</div><div>=C2=A0 WRA=
P =C2=A0 =C2=A0arch/arm/include/generated/<wbr>asm/sockios.h</div><div>=C2=
=A0 WRAP =C2=A0 =C2=A0arch/arm/include/generated/<wbr>asm/termbits.h</div><=
div>=C2=A0 WRAP =C2=A0 =C2=A0arch/arm/include/generated/<wbr>asm/termios.h<=
/div><div>=C2=A0 WRAP =C2=A0 =C2=A0arch/arm/include/generated/<wbr>asm/time=
x.h</div><div>=C2=A0 WRAP =C2=A0 =C2=A0arch/arm/include/generated/<wbr>asm/=
trace_clock.h</div><div>=C2=A0 WRAP =C2=A0 =C2=A0arch/arm/include/generated=
/<wbr>asm/unaligned.h</div><div>=C2=A0 CHK =C2=A0 =C2=A0 include/generated/=
uapi/linux/<wbr>version.h</div><div>=C2=A0 UPD =C2=A0 =C2=A0 include/genera=
ted/uapi/linux/<wbr>version.h</div><div>=C2=A0 CHK =C2=A0 =C2=A0 include/ge=
nerated/utsrelease.h</div><div>=C2=A0 UPD =C2=A0 =C2=A0 include/generated/u=
tsrelease.h</div><div>=C2=A0 GEN =C2=A0 =C2=A0 include/generated/mach-types=
.h</div><div>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0kernel/bounds.s</div><div>=C2=A0=
 CHK =C2=A0 =C2=A0 include/generated/bounds.h</div><div>=C2=A0 UPD =C2=A0 =
=C2=A0 include/generated/bounds.h</div><div>=C2=A0 CHK =C2=A0 =C2=A0 includ=
e/generated/timeconst.h</div><div>=C2=A0 UPD =C2=A0 =C2=A0 include/generate=
d/timeconst.h</div><div>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0arch/arm/kernel/asm-o=
ffsets.s</div><div>=C2=A0 CHK =C2=A0 =C2=A0 include/generated/asm-offsets.<=
wbr>h</div><div>=C2=A0 UPD =C2=A0 =C2=A0 include/generated/asm-offsets.<wbr=
>h</div><div>=C2=A0 CALL =C2=A0 =C2=A0scripts/checksyscalls.sh</div><div>gr=
ep: scripts/../arch/x86/entry/<wbr>syscalls/syscall_32.tbl: No such file or=
 directory</div><div>=C2=A0 HOSTCC =C2=A0scripts/dtc/dtc.o</div><div>=C2=A0=
 HOSTCC =C2=A0scripts/dtc/flattree.o</div><div>=C2=A0 HOSTCC =C2=A0scripts/=
dtc/fstree.o</div><div>=C2=A0 HOSTCC =C2=A0scripts/dtc/data.o</div><div>=C2=
=A0 HOSTCC =C2=A0scripts/dtc/livetree.o</div><div>=C2=A0 HOSTCC =C2=A0scrip=
ts/dtc/treesource.o</div><div>=C2=A0 HOSTCC =C2=A0scripts/dtc/srcpos.o</div=
><div>=C2=A0 HOSTCC =C2=A0scripts/dtc/checks.o</div><div>=C2=A0 HOSTCC =C2=
=A0scripts/dtc/util.o</div><div>=C2=A0 HOSTCC =C2=A0scripts/dtc/dtc-lexer.l=
ex.o</div><div>=C2=A0 HOSTCC =C2=A0scripts/dtc/dtc-parser.tab.o</div><div>=
=C2=A0 HOSTLD =C2=A0scripts/dtc/dtc</div><div>=C2=A0 HOSTCC =C2=A0scripts/g=
enksyms/genksyms.o</div><div>=C2=A0 HOSTCC =C2=A0scripts/genksyms/parse.tab=
.o</div><div>=C2=A0 SHIPPED scripts/genksyms/lex.lex.c</div><div>=C2=A0 HOS=
TCC =C2=A0scripts/genksyms/lex.lex.o</div><div>=C2=A0 HOSTLD =C2=A0scripts/=
genksyms/genksyms</div><div>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0scripts/mod/empty=
.o</div><div>=C2=A0 HOSTCC =C2=A0scripts/mod/mk_elfconfig</div><div>=C2=A0 =
MKELF =C2=A0 scripts/mod/elfconfig.h</div><div>=C2=A0 HOSTCC =C2=A0scripts/=
mod/modpost.o</div><div>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0scripts/mod/devicetab=
le-<wbr>offsets.s</div><div>=C2=A0 GEN =C2=A0 =C2=A0 scripts/mod/devicetabl=
e-<wbr>offsets.h</div><div>=C2=A0 HOSTCC =C2=A0scripts/mod/file2alias.o</di=
v><div>=C2=A0 HOSTCC =C2=A0scripts/mod/sumversion.o</div><div>=C2=A0 HOSTLD=
 =C2=A0scripts/mod/modpost</div><div>=C2=A0 HOSTCC =C2=A0scripts/kallsyms</=
div><div>=C2=A0 HOSTCC =C2=A0scripts/pnmtologo</div><div>=C2=A0 HOSTCC =C2=
=A0scripts/conmakehash</div><div>=C2=A0 HOSTCC =C2=A0scripts/recordmcount</=
div><div>=C2=A0 HOSTCC =C2=A0scripts/sortextable</div><div>make: Leaving di=
rectory &#39;/usr/src/linux-headers-4.9.<wbr>31-v7+&#39;</div><div><br></di=
v><div>-------- Uninstall Beginning --------</div><div>Module: =C2=A0wiregu=
ard</div><div>Version: 0.0.20170726-1</div><div>Kernel: =C2=A04.9.35+ (armv=
7l)</div><div>------------------------------<wbr>-------</div><div><br></di=
v><div>Status: Before uninstall, this module version was ACTIVE on this ker=
nel.</div><div><br></div><div>wireguard.ko:</div><div>=C2=A0- Uninstallatio=
n</div><div>=C2=A0 =C2=A0- Deleting from: /lib/modules/4.9.35+/kernel/<wbr>=
net/</div><div>=C2=A0- Original module</div><div>=C2=A0 =C2=A0- No original=
 module was found for this module on this kernel.</div><div>=C2=A0 =C2=A0- =
Use the dkms install command to reinstall any previous module version.</div=
><div><br></div><div>depmod...</div><div><br></div><div>DKMS: uninstall com=
pleted.</div><div><br></div><div>-------- Uninstall Beginning --------</div=
><div>Module: =C2=A0wireguard</div><div>Version: 0.0.20170726-1</div><div>K=
ernel: =C2=A04.9.35-v7+ (armv7l)</div><div>------------------------------<w=
br>-------</div><div><br></div><div>Status: Before uninstall, this module v=
ersion was ACTIVE on this kernel.</div><div><br></div><div>wireguard.ko:</d=
iv><div>=C2=A0- Uninstallation</div><div>=C2=A0 =C2=A0- Deleting from: /lib=
/modules/4.9.35-v7+/<wbr>kernel/net/</div><div>=C2=A0- Original module</div=
><div>=C2=A0 =C2=A0- No original module was found for this module on this k=
ernel.</div><div>=C2=A0 =C2=A0- Use the dkms install command to reinstall a=
ny previous module version.</div><div><br></div><div>depmod...</div><div><b=
r></div><div>DKMS: uninstall completed.</div><div><br></div><div>----------=
--------------------</div><div>Deleting module version: 0.0.20170726-1</div=
><div>completely from the DKMS tree.</div><div>----------------------------=
--</div><div>Done.</div><div>Loading new wireguard-0.0.20170726-1 DKMS file=
s...</div><div>It is likely that 4.9.35-v7+ belongs to a chroot&#39;s host<=
/div><div>Building for 3.6-trunk-rpi, 4.9.31-v7+, 4.9.35+ and 4.9.35-v7+</d=
iv><div>Building initial module for 3.6-trunk-rpi</div><div>Error!=C2=A0 Th=
e dkms.conf for this module includes a BUILD_EXCLUSIVE directive which</div=
><div>does not match this kernel/arch.=C2=A0 This indicates that it should =
not be built.</div><div>Skipped.</div><div>Building initial module for 4.9.=
31-v7+</div><div>Done.</div><div><br></div><div>wireguard:</div><div>Runnin=
g module version sanity check.</div><div>=C2=A0- Original module</div><div>=
=C2=A0 =C2=A0- No original module exists within this kernel</div><div>=C2=
=A0- Installation</div><div>=C2=A0 =C2=A0- Installing to /lib/modules/4.9.3=
1-v7+/<wbr>kernel/net/</div><div><br></div><div>depmod...</div><div><br></d=
iv><div>DKMS: install completed.</div><div>Building initial module for 4.9.=
35+</div><div>Done.</div><div><br></div><div>wireguard:</div><div>Running m=
odule version sanity check.</div><div>=C2=A0- Original module</div><div>=C2=
=A0 =C2=A0- No original module exists within this kernel</div><div>=C2=A0- =
Installation</div><div>=C2=A0 =C2=A0- Installing to /lib/modules/4.9.35+/ke=
rnel/<wbr>net/</div><div><br></div><div>depmod...</div><div><br></div><div>=
DKMS: install completed.</div><div>Building initial module for 4.9.35-v7+</=
div><div>Done.</div><div><br></div><div>wireguard:</div><div>Running module=
 version sanity check.</div><div>=C2=A0- Original module</div><div>=C2=A0 =
=C2=A0- No original module exists within this kernel</div><div>=C2=A0- Inst=
allation</div><div>=C2=A0 =C2=A0- Installing to /lib/modules/4.9.35-v7+/<wb=
r>kernel/net/</div><div><br></div><div>depmod...</div><div><br></div><div>D=
KMS: install completed.</div><div><br></div><div>-------- Uninstall Beginni=
ng --------</div><div>Module: =C2=A0wireguard</div><div>Version: 0.0.201707=
26-1</div><div>Kernel: =C2=A04.9.31-v7+ (armv7l)</div><div>----------------=
--------------<wbr>-------</div><div><br></div><div>Status: Before uninstal=
l, this module version was ACTIVE on this kernel.</div><div><br></div><div>=
wireguard.ko:</div><div>=C2=A0- Uninstallation</div><div>=C2=A0 =C2=A0- Del=
eting from: /lib/modules/4.9.31-v7+/<wbr>kernel/net/</div><div>=C2=A0- Orig=
inal module</div><div>=C2=A0 =C2=A0- No original module was found for this =
module on this kernel.</div><div>=C2=A0 =C2=A0- Use the dkms install comman=
d to reinstall any previous module version.</div><div><br></div><div>depmod=
...</div><div><br></div><div>DKMS: uninstall completed.</div><div><br></div=
><div>-------- Uninstall Beginning --------</div><div>Module: =C2=A0wiregua=
rd</div><div>Version: 0.0.20170726-1</div><div>Kernel: =C2=A04.9.35+ (armv7=
l)</div><div>------------------------------<wbr>-------</div><div><br></div=
><div>Status: Before uninstall, this module version was ACTIVE on this kern=
el.</div><div><br></div><div>wireguard.ko:</div><div>=C2=A0- Uninstallation=
</div><div>=C2=A0 =C2=A0- Deleting from: /lib/modules/4.9.35+/kernel/<wbr>n=
et/</div><div>=C2=A0- Original module</div><div>=C2=A0 =C2=A0- No original =
module was found for this module on this kernel.</div><div>=C2=A0 =C2=A0- U=
se the dkms install command to reinstall any previous module version.</div>=
<div><br></div><div>depmod...</div><div><br></div><div>DKMS: uninstall comp=
leted.</div><div><br></div><div>-------- Uninstall Beginning --------</div>=
<div>Module: =C2=A0wireguard</div><div>Version: 0.0.20170726-1</div><div>Ke=
rnel: =C2=A04.9.35-v7+ (armv7l)</div><div>------------------------------<wb=
r>-------</div><div><br></div><div>Status: Before uninstall, this module ve=
rsion was ACTIVE on this kernel.</div><div><br></div><div>wireguard.ko:</di=
v><div>=C2=A0- Uninstallation</div><div>=C2=A0 =C2=A0- Deleting from: /lib/=
modules/4.9.35-v7+/<wbr>kernel/net/</div><div>=C2=A0- Original module</div>=
<div>=C2=A0 =C2=A0- No original module was found for this module on this ke=
rnel.</div><div>=C2=A0 =C2=A0- Use the dkms install command to reinstall an=
y previous module version.</div><div><br></div><div>depmod...</div><div><br=
></div><div>DKMS: uninstall completed.</div><div><br></div><div>-----------=
-------------------</div><div>Deleting module version: 0.0.20170726-1</div>=
<div>completely from the DKMS tree.</div><div>-----------------------------=
-</div><div>Done.</div><div>Loading new wireguard-0.0.20170726-1 DKMS files=
...</div><div>It is likely that 4.9.35-v7+ belongs to a chroot&#39;s host</=
div><div>Building for 3.6-trunk-rpi, 4.9.31-v7+, 4.9.35+ and 4.9.35-v7+</di=
v><div>Building initial module for 3.6-trunk-rpi</div><div>Error!=C2=A0 The=
 dkms.conf for this module includes a BUILD_EXCLUSIVE directive which</div>=
<div>does not match this kernel/arch.=C2=A0 This indicates that it should n=
ot be built.</div><div>Skipped.</div><div>Building initial module for 4.9.3=
1-v7+</div><div>Done.</div><div><br></div><div>wireguard:</div><div>Running=
 module version sanity check.</div><div>=C2=A0- Original module</div><div>=
=C2=A0 =C2=A0- No original module exists within this kernel</div><div>=C2=
=A0- Installation</div><div>=C2=A0 =C2=A0- Installing to /lib/modules/4.9.3=
1-v7+/<wbr>kernel/net/</div><div><br></div><div>depmod...</div><div><br></d=
iv><div>DKMS: install completed.</div><div>Building initial module for 4.9.=
35+</div><div>Done.</div><div><br></div><div>wireguard:</div><div>Running m=
odule version sanity check.</div><div>=C2=A0- Original module</div><div>=C2=
=A0 =C2=A0- No original module exists within this kernel</div><div>=C2=A0- =
Installation</div><div>=C2=A0 =C2=A0- Installing to /lib/modules/4.9.35+/ke=
rnel/<wbr>net/</div><div><br></div><div>depmod...</div><div><br></div><div>=
DKMS: install completed.</div><div>Building initial module for 4.9.35-v7+</=
div><div>Done.</div><div><br></div><div>wireguard:</div><div>Running module=
 version sanity check.</div><div>=C2=A0- Original module</div><div>=C2=A0 =
=C2=A0- No original module exists within this kernel</div><div>=C2=A0- Inst=
allation</div><div>=C2=A0 =C2=A0- Installing to /lib/modules/4.9.35-v7+/<wb=
r>kernel/net/</div><div><br></div><div>depmod...</div><div><br></div><div>D=
KMS: install completed.</div><div>pi@raspberrypi:~ $ lsmod | grep wireguard=
</div><div>pi@raspberrypi:~ $ ip link add dev wg0 type wireguard</div><span=
 class=3D""><div>RTNETLINK answers: Operation not permitted</div></span><di=
v>pi@raspberrypi:~ $ sudo apt-get install wireguard-dkms wireguard-tools</d=
iv><div>Reading package lists... Done</div><div>Building dependency tree =
=C2=A0 =C2=A0 =C2=A0=C2=A0</div><div>Reading state information... Done</div=
><div>wireguard-dkms is already the newest version (0.0.20170726-1).</div><=
div>wireguard-tools is already the newest version (0.0.20170726-1).</div><d=
iv>0 upgraded, 0 newly installed, 0 to remove and 855 not upgraded.</div><d=
iv>pi@raspberrypi:~ $ lsmod | grep wireguard</div><div>pi@raspberrypi:~ $ i=
p link add dev wg0 type wireguard</div><span class=3D""><div>RTNETLINK answ=
ers: Operation not permitted</div></span><div>pi@raspberrypi:~ $ sudo apt-g=
et purge wireguard-dkms wireguard-tools</div><div>Reading package lists... =
Done</div><div>Building dependency tree =C2=A0 =C2=A0 =C2=A0=C2=A0</div><di=
v>Reading state information... Done</div><div>The following packages were a=
utomatically installed and are no longer required:</div><div>=C2=A0 dkms li=
bmnl0 linux-headers-3.6-trunk-common linux-headers-3.6-trunk-rpi linux-kbui=
ld-3.6</div><div>Use &#39;sudo apt autoremove&#39; to remove them.</div><di=
v>The following packages will be REMOVED:</div><div>=C2=A0 wireguard-dkms* =
wireguard-tools*</div><div>0 upgraded, 0 newly installed, 2 to remove and 8=
55 not upgraded.</div><div>After this operation, 918 kB disk space will be =
freed.</div><div>Do you want to continue? [Y/n] Y</div><div>(Reading databa=
se ... 148279 files and directories currently installed.)</div><div>Removin=
g wireguard-dkms (0.0.20170726-1) ...</div><div><br></div><div>-------- Uni=
nstall Beginning --------</div><div>Module: =C2=A0wireguard</div><div>Versi=
on: 0.0.20170726-1</div><div>Kernel: =C2=A04.9.31-v7+ (armv7l)</div><div>--=
----------------------------<wbr>-------</div><div><br></div><div>Status: B=
efore uninstall, this module version was ACTIVE on this kernel.</div><div><=
br></div><div>wireguard.ko:</div><div>=C2=A0- Uninstallation</div><div>=C2=
=A0 =C2=A0- Deleting from: /lib/modules/4.9.31-v7+/<wbr>kernel/net/</div><d=
iv>=C2=A0- Original module</div><div>=C2=A0 =C2=A0- No original module was =
found for this module on this kernel.</div><div>=C2=A0 =C2=A0- Use the dkms=
 install command to reinstall any previous module version.</div><div><br></=
div><div>depmod...</div><div><br></div><div>DKMS: uninstall completed.</div=
><div><br></div><div>-------- Uninstall Beginning --------</div><div>Module=
: =C2=A0wireguard</div><div>Version: 0.0.20170726-1</div><div>Kernel: =C2=
=A04.9.35+ (armv7l)</div><div>------------------------------<wbr>-------</d=
iv><div><br></div><div>Status: Before uninstall, this module version was AC=
TIVE on this kernel.</div><div><br></div><div>wireguard.ko:</div><div>=C2=
=A0- Uninstallation</div><div>=C2=A0 =C2=A0- Deleting from: /lib/modules/4.=
9.35+/kernel/<wbr>net/</div><div>=C2=A0- Original module</div><div>=C2=A0 =
=C2=A0- No original module was found for this module on this kernel.</div><=
div>=C2=A0 =C2=A0- Use the dkms install command to reinstall any previous m=
odule version.</div><div><br></div><div>depmod...</div><div><br></div><div>=
DKMS: uninstall completed.</div><div><br></div><div>-------- Uninstall Begi=
nning --------</div><div>Module: =C2=A0wireguard</div><div>Version: 0.0.201=
70726-1</div><div>Kernel: =C2=A04.9.35-v7+ (armv7l)</div><div>-------------=
-----------------<wbr>-------</div><div><br></div><div>Status: Before unins=
tall, this module version was ACTIVE on this kernel.</div><div><br></div><d=
iv>wireguard.ko:</div><div>=C2=A0- Uninstallation</div><div>=C2=A0 =C2=A0- =
Deleting from: /lib/modules/4.9.35-v7+/<wbr>kernel/net/</div><div>=C2=A0- O=
riginal module</div><div>=C2=A0 =C2=A0- No original module was found for th=
is module on this kernel.</div><div>=C2=A0 =C2=A0- Use the dkms install com=
mand to reinstall any previous module version.</div><div><br></div><div>dep=
mod...</div><div><br></div><div>DKMS: uninstall completed.</div><div><br></=
div><div>------------------------------</div><div>Deleting module version: =
0.0.20170726-1</div><div>completely from the DKMS tree.</div><div>---------=
---------------------</div><div>Done.</div><div>Removing wireguard-tools (0=
.0.20170726-1) ...</div><div>dpkg: warning: while removing wireguard-tools,=
 directory &#39;/etc/wireguard&#39; not empty so not removed</div><div>Proc=
essing triggers for man-db (2.7.5-1~bpo8+1) ...</div></div><div><br></div><=
div>&quot;</div></div></div><div class=3D"HOEnZb"><div class=3D"h5"><div cl=
ass=3D"gmail_extra"><br><div class=3D"gmail_quote">On Sat, Aug 5, 2017 at 3=
:38 PM, Sahil Gupta <span dir=3D"ltr">&lt;<a href=3D"mailto:sg5414@g.rit.ed=
u" target=3D"_blank">sg5414@g.rit.edu</a>&gt;</span> wrote:<br><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex"><div dir=3D"ltr">Hi,<br>I am not able to setup Wireguard=
 interface on Raspberry pi.<br><br>Error:<br>RTNETLINK answers: Operation n=
ot supported<div><br><br>See the stack:<br>&quot;<div><div>pi@raspberrypi:~=
 $ cd /etc/wireguard/</div><div>pi@raspberrypi:/etc/wireguard $ l</div><div=
>-bash: l: command not found</div><div>pi@raspberrypi:/etc/wireguard $ ls</=
div><div>publickey =C2=A0wg0.conf</div><div>pi@raspberrypi:/etc/wireguard $=
 history | grep wg0</div><div>=C2=A0 =C2=A015 =C2=A0history | grep wg0</div=
><div>pi@raspberrypi:/etc/wireguard $ ip link add wg0 type wireguard</div><=
div>RTNETLINK answers: Operation not permitted</div><div>pi@raspberrypi:/et=
c/wireguard $ sudo su</div><div>root@raspberrypi:/etc/wireguar<wbr>d# wg-qu=
ick up wg0</div><div>Warning: `/etc/wireguard/wg0.conf&#39; is world access=
ible</div><div>[#] ip link add wg0 type wireguard</div><div>RTNETLINK answe=
rs: Operation not supported</div><div>`wg0` is not a valid WireGuard interf=
ace</div><div>Usage: wg show { &lt;interface&gt; | all | interfaces } [publ=
ic-key | private-key | listen-port | fwmark | peers | preshared-keys | endp=
oints | allowed-ips | latest-handshakes | transfer | persistent-keepalive |=
 dump]</div><div>root@raspberrypi:/etc/wireguar<wbr>d# wg show</div><div>ro=
ot@raspberrypi:/etc/wireguar<wbr>d# wg show all</div><div>root@raspberrypi:=
/etc/wireguar<wbr>d#=C2=A0</div></div><div><br></div><div>&quot;</div><div>=
<br></div><div>Any pointers will be appreciated.</div><div><br></div><div>T=
hanks<span class=3D"m_-6789122730682524698HOEnZb"><font color=3D"#888888"><=
br>Sahil Gupta</font></span></div></div></div>
</blockquote></div><br></div>
</div></div></blockquote></div><br></div>

--94eb2c12fa0897ebc905561848bc--
