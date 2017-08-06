Return-Path: sg5414@g.rit.edu
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aa883a5e
 for <wireguard@lists.zx2c4.com>; Sun, 6 Aug 2017 16:09:14 +0000 (UTC)
Received: from mx03a-out01ag.rit.edu (mx03a-out01ag.rit.edu [129.21.3.134])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9e688f1b
 for <wireguard@lists.zx2c4.com>; Sun, 6 Aug 2017 16:09:14 +0000 (UTC)
From: Sahil Gupta <sg5414@rit.edu>
Received: by mail-pg0-f71.google.com with SMTP id r133so69394895pgr.6
 for <wireguard@lists.zx2c4.com>; Sun, 06 Aug 2017 09:30:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAA8CD9t8YCR__Ee2F3Sb5H=78O9PTi5j+K1iXHsU7PS4pTKAwA@mail.gmail.com>
References: <CAA8CD9t8YCR__Ee2F3Sb5H=78O9PTi5j+K1iXHsU7PS4pTKAwA@mail.gmail.com>
Date: Sun, 6 Aug 2017 12:30:45 -0400
Message-ID: <CAA8CD9sAT8PW8B1HSqR9utNvjmFB6Tn4U0bESBGO7QWVSVqX3w@mail.gmail.com>
Subject: Re: RTNETLINK answers: Operation not supported
To: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Eric Light <eric@ericlight.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: multipart/alternative; boundary="f403045c6a1e970d840556184071"
Reply-To: sg5414@rit.edu
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--f403045c6a1e970d840556184071
Content-Type: text/plain; charset="UTF-8"

I have tried to install linux headers but still showing the same error.

Here's the stack to process.
"
pi@raspberrypi:~ $ sudo dpkg -i
linux-headers-4.9.31-v7+_4.9.31-v7+-2_armhf.deb
Selecting previously unselected package linux-headers-4.9.31-v7+.
(Reading database ... 132946 files and directories currently installed.)
Preparing to unpack linux-headers-4.9.31-v7+_4.9.31-v7+-2_armhf.deb ...
Unpacking linux-headers-4.9.31-v7+ (4.9.31-v7+-2) ...
dpkg: dependency problems prevent configuration of linux-headers-4.9.31-v7+:
 linux-headers-4.9.31-v7+ depends on bc; however:
  Package bc is not installed.

dpkg: error processing package linux-headers-4.9.31-v7+ (--install):
 dependency problems - leaving unconfigured
Errors were encountered while processing:
 linux-headers-4.9.31-v7+
pi@raspberrypi:~ $ lsmod | grep wireguard
pi@raspberrypi:~ $ sudo apt-get install wireguard-dkms wireguard-tools
Reading package lists... Done
Building dependency tree
Reading state information... Done
wireguard-dkms is already the newest version (0.0.20170726-1).
wireguard-tools is already the newest version (0.0.20170726-1).
You might want to run 'apt --fix-broken install' to correct these.
The following packages have unmet dependencies:
 linux-headers-4.9.31-v7+ : Depends: bc but it is not going to be installed
E: Unmet dependencies. Try 'apt --fix-broken install' with no packages (or
specify a solution).
pi@raspberrypi:~ $ sudo apt --fix-broken install
Reading package lists... Done
Building dependency tree
Reading state information... Done
Correcting dependencies... Done
The following additional packages will be installed:
  bc
The following NEW packages will be installed:
  bc
0 upgraded, 1 newly installed, 0 to remove and 855 not upgraded.
1 not fully installed or removed.
Need to get 101 kB of archives.
After this operation, 212 kB of additional disk space will be used.
Do you want to continue? [Y/n] Y
WARNING: The following packages cannot be authenticated!
  bc
Install these packages without verification? [y/N] y
Get:1 http://deb.debian.org/debian unstable/main armhf bc armhf
1.06.95-9+b3 [101 kB]
Fetched 101 kB in 0s (226 kB/s)
Selecting previously unselected package bc.
(Reading database ... 148260 files and directories currently installed.)
Preparing to unpack .../bc_1.06.95-9+b3_armhf.deb ...
Unpacking bc (1.06.95-9+b3) ...
Processing triggers for install-info (5.2.0.dfsg.1-6) ...
Processing triggers for man-db (2.7.5-1~bpo8+1) ...
Setting up bc (1.06.95-9+b3) ...
Setting up linux-headers-4.9.31-v7+ (4.9.31-v7+-2) ...
make: Entering directory '/usr/src/linux-headers-4.9.31-v7+'
  HOSTCC  scripts/basic/fixdep
  HOSTCC  scripts/basic/bin2c
  HOSTCC  scripts/kconfig/conf.o
  HOSTCC  scripts/kconfig/zconf.tab.o
  HOSTLD  scripts/kconfig/conf
*** Default configuration is based on 'bcm2709_defconfig'
#
# configuration written to .config
#
make: Leaving directory '/usr/src/linux-headers-4.9.31-v7+'
make: Entering directory '/usr/src/linux-headers-4.9.31-v7+'
scripts/kconfig/conf  --silentoldconfig Kconfig
  CHK     include/config/kernel.release
  UPD     include/config/kernel.release
  WRAP    arch/arm/include/generated/asm/bitsperlong.h
  WRAP    arch/arm/include/generated/asm/clkdev.h
  WRAP    arch/arm/include/generated/asm/cputime.h
  WRAP    arch/arm/include/generated/asm/current.h
  WRAP    arch/arm/include/generated/asm/early_ioremap.h
  WRAP    arch/arm/include/generated/asm/emergency-restart.h
  WRAP    arch/arm/include/generated/asm/errno.h
  WRAP    arch/arm/include/generated/asm/exec.h
  WRAP    arch/arm/include/generated/asm/ioctl.h
  WRAP    arch/arm/include/generated/asm/ipcbuf.h
  WRAP    arch/arm/include/generated/asm/irq_regs.h
  WRAP    arch/arm/include/generated/asm/kdebug.h
  WRAP    arch/arm/include/generated/asm/local.h
  WRAP    arch/arm/include/generated/asm/local64.h
  WRAP    arch/arm/include/generated/asm/mm-arch-hooks.h
  WRAP    arch/arm/include/generated/asm/msgbuf.h
  WRAP    arch/arm/include/generated/asm/msi.h
  WRAP    arch/arm/include/generated/asm/param.h
  WRAP    arch/arm/include/generated/asm/parport.h
  WRAP    arch/arm/include/generated/asm/poll.h
  WRAP    arch/arm/include/generated/asm/preempt.h
  WRAP    arch/arm/include/generated/asm/resource.h
  WRAP    arch/arm/include/generated/asm/rwsem.h
  WRAP    arch/arm/include/generated/asm/seccomp.h
  WRAP    arch/arm/include/generated/asm/segment.h
  WRAP    arch/arm/include/generated/asm/sembuf.h
  WRAP    arch/arm/include/generated/asm/serial.h
  WRAP    arch/arm/include/generated/asm/shmbuf.h
  WRAP    arch/arm/include/generated/asm/siginfo.h
  WRAP    arch/arm/include/generated/asm/simd.h
  WRAP    arch/arm/include/generated/asm/sizes.h
  WRAP    arch/arm/include/generated/asm/socket.h
  WRAP    arch/arm/include/generated/asm/sockios.h
  WRAP    arch/arm/include/generated/asm/termbits.h
  WRAP    arch/arm/include/generated/asm/termios.h
  WRAP    arch/arm/include/generated/asm/timex.h
  WRAP    arch/arm/include/generated/asm/trace_clock.h
  WRAP    arch/arm/include/generated/asm/unaligned.h
  CHK     include/generated/uapi/linux/version.h
  UPD     include/generated/uapi/linux/version.h
  CHK     include/generated/utsrelease.h
  UPD     include/generated/utsrelease.h
  GEN     include/generated/mach-types.h
  CC      kernel/bounds.s
  CHK     include/generated/bounds.h
  UPD     include/generated/bounds.h
  CHK     include/generated/timeconst.h
  UPD     include/generated/timeconst.h
  CC      arch/arm/kernel/asm-offsets.s
  CHK     include/generated/asm-offsets.h
  UPD     include/generated/asm-offsets.h
  CALL    scripts/checksyscalls.sh
grep: scripts/../arch/x86/entry/syscalls/syscall_32.tbl: No such file or
directory
  HOSTCC  scripts/dtc/dtc.o
  HOSTCC  scripts/dtc/flattree.o
  HOSTCC  scripts/dtc/fstree.o
  HOSTCC  scripts/dtc/data.o
  HOSTCC  scripts/dtc/livetree.o
  HOSTCC  scripts/dtc/treesource.o
  HOSTCC  scripts/dtc/srcpos.o
  HOSTCC  scripts/dtc/checks.o
  HOSTCC  scripts/dtc/util.o
  HOSTCC  scripts/dtc/dtc-lexer.lex.o
  HOSTCC  scripts/dtc/dtc-parser.tab.o
  HOSTLD  scripts/dtc/dtc
  HOSTCC  scripts/genksyms/genksyms.o
  HOSTCC  scripts/genksyms/parse.tab.o
  SHIPPED scripts/genksyms/lex.lex.c
  HOSTCC  scripts/genksyms/lex.lex.o
  HOSTLD  scripts/genksyms/genksyms
  CC      scripts/mod/empty.o
  HOSTCC  scripts/mod/mk_elfconfig
  MKELF   scripts/mod/elfconfig.h
  HOSTCC  scripts/mod/modpost.o
  CC      scripts/mod/devicetable-offsets.s
  GEN     scripts/mod/devicetable-offsets.h
  HOSTCC  scripts/mod/file2alias.o
  HOSTCC  scripts/mod/sumversion.o
  HOSTLD  scripts/mod/modpost
  HOSTCC  scripts/kallsyms
  HOSTCC  scripts/pnmtologo
  HOSTCC  scripts/conmakehash
  HOSTCC  scripts/recordmcount
  HOSTCC  scripts/sortextable
make: Leaving directory '/usr/src/linux-headers-4.9.31-v7+'

-------- Uninstall Beginning --------
Module:  wireguard
Version: 0.0.20170726-1
Kernel:  4.9.35+ (armv7l)
-------------------------------------

Status: Before uninstall, this module version was ACTIVE on this kernel.

wireguard.ko:
 - Uninstallation
   - Deleting from: /lib/modules/4.9.35+/kernel/net/
 - Original module
   - No original module was found for this module on this kernel.
   - Use the dkms install command to reinstall any previous module version.

depmod...

DKMS: uninstall completed.

-------- Uninstall Beginning --------
Module:  wireguard
Version: 0.0.20170726-1
Kernel:  4.9.35-v7+ (armv7l)
-------------------------------------

Status: Before uninstall, this module version was ACTIVE on this kernel.

wireguard.ko:
 - Uninstallation
   - Deleting from: /lib/modules/4.9.35-v7+/kernel/net/
 - Original module
   - No original module was found for this module on this kernel.
   - Use the dkms install command to reinstall any previous module version.

depmod...

DKMS: uninstall completed.

------------------------------
Deleting module version: 0.0.20170726-1
completely from the DKMS tree.
------------------------------
Done.
Loading new wireguard-0.0.20170726-1 DKMS files...
It is likely that 4.9.35-v7+ belongs to a chroot's host
Building for 3.6-trunk-rpi, 4.9.31-v7+, 4.9.35+ and 4.9.35-v7+
Building initial module for 3.6-trunk-rpi
Error!  The dkms.conf for this module includes a BUILD_EXCLUSIVE directive
which
does not match this kernel/arch.  This indicates that it should not be
built.
Skipped.
Building initial module for 4.9.31-v7+
Done.

wireguard:
Running module version sanity check.
 - Original module
   - No original module exists within this kernel
 - Installation
   - Installing to /lib/modules/4.9.31-v7+/kernel/net/

depmod...

DKMS: install completed.
Building initial module for 4.9.35+
Done.

wireguard:
Running module version sanity check.
 - Original module
   - No original module exists within this kernel
 - Installation
   - Installing to /lib/modules/4.9.35+/kernel/net/

depmod...

DKMS: install completed.
Building initial module for 4.9.35-v7+
Done.

wireguard:
Running module version sanity check.
 - Original module
   - No original module exists within this kernel
 - Installation
   - Installing to /lib/modules/4.9.35-v7+/kernel/net/

depmod...

DKMS: install completed.

-------- Uninstall Beginning --------
Module:  wireguard
Version: 0.0.20170726-1
Kernel:  4.9.31-v7+ (armv7l)
-------------------------------------

Status: Before uninstall, this module version was ACTIVE on this kernel.

wireguard.ko:
 - Uninstallation
   - Deleting from: /lib/modules/4.9.31-v7+/kernel/net/
 - Original module
   - No original module was found for this module on this kernel.
   - Use the dkms install command to reinstall any previous module version.

depmod...

DKMS: uninstall completed.

-------- Uninstall Beginning --------
Module:  wireguard
Version: 0.0.20170726-1
Kernel:  4.9.35+ (armv7l)
-------------------------------------

Status: Before uninstall, this module version was ACTIVE on this kernel.

wireguard.ko:
 - Uninstallation
   - Deleting from: /lib/modules/4.9.35+/kernel/net/
 - Original module
   - No original module was found for this module on this kernel.
   - Use the dkms install command to reinstall any previous module version.

depmod...

DKMS: uninstall completed.

-------- Uninstall Beginning --------
Module:  wireguard
Version: 0.0.20170726-1
Kernel:  4.9.35-v7+ (armv7l)
-------------------------------------

Status: Before uninstall, this module version was ACTIVE on this kernel.

wireguard.ko:
 - Uninstallation
   - Deleting from: /lib/modules/4.9.35-v7+/kernel/net/
 - Original module
   - No original module was found for this module on this kernel.
   - Use the dkms install command to reinstall any previous module version.

depmod...

DKMS: uninstall completed.

------------------------------
Deleting module version: 0.0.20170726-1
completely from the DKMS tree.
------------------------------
Done.
Loading new wireguard-0.0.20170726-1 DKMS files...
It is likely that 4.9.35-v7+ belongs to a chroot's host
Building for 3.6-trunk-rpi, 4.9.31-v7+, 4.9.35+ and 4.9.35-v7+
Building initial module for 3.6-trunk-rpi
Error!  The dkms.conf for this module includes a BUILD_EXCLUSIVE directive
which
does not match this kernel/arch.  This indicates that it should not be
built.
Skipped.
Building initial module for 4.9.31-v7+
Done.

wireguard:
Running module version sanity check.
 - Original module
   - No original module exists within this kernel
 - Installation
   - Installing to /lib/modules/4.9.31-v7+/kernel/net/

depmod...

DKMS: install completed.
Building initial module for 4.9.35+
Done.

wireguard:
Running module version sanity check.
 - Original module
   - No original module exists within this kernel
 - Installation
   - Installing to /lib/modules/4.9.35+/kernel/net/

depmod...

DKMS: install completed.
Building initial module for 4.9.35-v7+
Done.

wireguard:
Running module version sanity check.
 - Original module
   - No original module exists within this kernel
 - Installation
   - Installing to /lib/modules/4.9.35-v7+/kernel/net/

depmod...

DKMS: install completed.
pi@raspberrypi:~ $ lsmod | grep wireguard
pi@raspberrypi:~ $ ip link add dev wg0 type wireguard
RTNETLINK answers: Operation not permitted
pi@raspberrypi:~ $ sudo apt-get install wireguard-dkms wireguard-tools
Reading package lists... Done
Building dependency tree
Reading state information... Done
wireguard-dkms is already the newest version (0.0.20170726-1).
wireguard-tools is already the newest version (0.0.20170726-1).
0 upgraded, 0 newly installed, 0 to remove and 855 not upgraded.
pi@raspberrypi:~ $ lsmod | grep wireguard
pi@raspberrypi:~ $ ip link add dev wg0 type wireguard
RTNETLINK answers: Operation not permitted
pi@raspberrypi:~ $ sudo apt-get purge wireguard-dkms wireguard-tools
Reading package lists... Done
Building dependency tree
Reading state information... Done
The following packages were automatically installed and are no longer
required:
  dkms libmnl0 linux-headers-3.6-trunk-common linux-headers-3.6-trunk-rpi
linux-kbuild-3.6
Use 'sudo apt autoremove' to remove them.
The following packages will be REMOVED:
  wireguard-dkms* wireguard-tools*
0 upgraded, 0 newly installed, 2 to remove and 855 not upgraded.
After this operation, 918 kB disk space will be freed.
Do you want to continue? [Y/n] Y
(Reading database ... 148279 files and directories currently installed.)
Removing wireguard-dkms (0.0.20170726-1) ...

-------- Uninstall Beginning --------
Module:  wireguard
Version: 0.0.20170726-1
Kernel:  4.9.31-v7+ (armv7l)
-------------------------------------

Status: Before uninstall, this module version was ACTIVE on this kernel.

wireguard.ko:
 - Uninstallation
   - Deleting from: /lib/modules/4.9.31-v7+/kernel/net/
 - Original module
   - No original module was found for this module on this kernel.
   - Use the dkms install command to reinstall any previous module version.

depmod...

DKMS: uninstall completed.

-------- Uninstall Beginning --------
Module:  wireguard
Version: 0.0.20170726-1
Kernel:  4.9.35+ (armv7l)
-------------------------------------

Status: Before uninstall, this module version was ACTIVE on this kernel.

wireguard.ko:
 - Uninstallation
   - Deleting from: /lib/modules/4.9.35+/kernel/net/
 - Original module
   - No original module was found for this module on this kernel.
   - Use the dkms install command to reinstall any previous module version.

depmod...

DKMS: uninstall completed.

-------- Uninstall Beginning --------
Module:  wireguard
Version: 0.0.20170726-1
Kernel:  4.9.35-v7+ (armv7l)
-------------------------------------

Status: Before uninstall, this module version was ACTIVE on this kernel.

wireguard.ko:
 - Uninstallation
   - Deleting from: /lib/modules/4.9.35-v7+/kernel/net/
 - Original module
   - No original module was found for this module on this kernel.
   - Use the dkms install command to reinstall any previous module version.

depmod...

DKMS: uninstall completed.

------------------------------
Deleting module version: 0.0.20170726-1
completely from the DKMS tree.
------------------------------
Done.
Removing wireguard-tools (0.0.20170726-1) ...
dpkg: warning: while removing wireguard-tools, directory '/etc/wireguard'
not empty so not removed
Processing triggers for man-db (2.7.5-1~bpo8+1) ...

"

On Sat, Aug 5, 2017 at 3:38 PM, Sahil Gupta <sg5414@g.rit.edu> wrote:

> Hi,
> I am not able to setup Wireguard interface on Raspberry pi.
>
> Error:
> RTNETLINK answers: Operation not supported
>
>
> See the stack:
> "
> pi@raspberrypi:~ $ cd /etc/wireguard/
> pi@raspberrypi:/etc/wireguard $ l
> -bash: l: command not found
> pi@raspberrypi:/etc/wireguard $ ls
> publickey  wg0.conf
> pi@raspberrypi:/etc/wireguard $ history | grep wg0
>    15  history | grep wg0
> pi@raspberrypi:/etc/wireguard $ ip link add wg0 type wireguard
> RTNETLINK answers: Operation not permitted
> pi@raspberrypi:/etc/wireguard $ sudo su
> root@raspberrypi:/etc/wireguard# wg-quick up wg0
> Warning: `/etc/wireguard/wg0.conf' is world accessible
> [#] ip link add wg0 type wireguard
> RTNETLINK answers: Operation not supported
> `wg0` is not a valid WireGuard interface
> Usage: wg show { <interface> | all | interfaces } [public-key |
> private-key | listen-port | fwmark | peers | preshared-keys | endpoints |
> allowed-ips | latest-handshakes | transfer | persistent-keepalive | dump]
> root@raspberrypi:/etc/wireguard# wg show
> root@raspberrypi:/etc/wireguard# wg show all
> root@raspberrypi:/etc/wireguard#
>
> "
>
> Any pointers will be appreciated.
>
> Thanks
> Sahil Gupta
>

--f403045c6a1e970d840556184071
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I have tried to install linux headers but still showing th=
e same error.<div><br>Here&#39;s the stack to process.<br>&quot;<div><div>p=
i@raspberrypi:~ $ sudo dpkg -i linux-headers-4.9.31-v7+_4.9.31-v7+-2_armhf.=
deb=C2=A0</div><div>Selecting previously unselected package linux-headers-4=
.9.31-v7+.</div><div>(Reading database ... 132946 files and directories cur=
rently installed.)</div><div>Preparing to unpack linux-headers-4.9.31-v7+_4=
.9.31-v7+-2_armhf.deb ...</div><div>Unpacking linux-headers-4.9.31-v7+ (4.9=
.31-v7+-2) ...</div><div>dpkg: dependency problems prevent configuration of=
 linux-headers-4.9.31-v7+:</div><div>=C2=A0linux-headers-4.9.31-v7+ depends=
 on bc; however:</div><div>=C2=A0 Package bc is not installed.</div><div><b=
r></div><div>dpkg: error processing package linux-headers-4.9.31-v7+ (--ins=
tall):</div><div>=C2=A0dependency problems - leaving unconfigured</div><div=
>Errors were encountered while processing:</div><div>=C2=A0linux-headers-4.=
9.31-v7+</div><div>pi@raspberrypi:~ $ lsmod | grep wireguard</div><div>pi@r=
aspberrypi:~ $ sudo apt-get install wireguard-dkms wireguard-tools</div><di=
v>Reading package lists... Done</div><div>Building dependency tree =C2=A0 =
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
ttp://deb.debian.org/debian">http://deb.debian.org/debian</a> unstable/main=
 armhf bc armhf 1.06.95-9+b3 [101 kB]</div><div>Fetched 101 kB in 0s (226 k=
B/s)</div><div>Selecting previously unselected package bc.</div><div>(Readi=
ng database ... 148260 files and directories currently installed.)</div><di=
v>Preparing to unpack .../bc_1.06.95-9+b3_armhf.deb ...</div><div>Unpacking=
 bc (1.06.95-9+b3) ...</div><div>Processing triggers for install-info (5.2.=
0.dfsg.1-6) ...</div><div>Processing triggers for man-db (2.7.5-1~bpo8+1) .=
..</div><div>Setting up bc (1.06.95-9+b3) ...</div><div>Setting up linux-he=
aders-4.9.31-v7+ (4.9.31-v7+-2) ...</div><div>make: Entering directory &#39=
;/usr/src/linux-headers-4.9.31-v7+&#39;</div><div>=C2=A0 HOSTCC =C2=A0scrip=
ts/basic/fixdep</div><div>=C2=A0 HOSTCC =C2=A0scripts/basic/bin2c</div><div=
>=C2=A0 HOSTCC =C2=A0scripts/kconfig/conf.o</div><div>=C2=A0 HOSTCC =C2=A0s=
cripts/kconfig/zconf.tab.o</div><div>=C2=A0 HOSTLD =C2=A0scripts/kconfig/co=
nf</div><div>*** Default configuration is based on &#39;bcm2709_defconfig&#=
39;</div><div>#</div><div># configuration written to .config</div><div>#</d=
iv><div>make: Leaving directory &#39;/usr/src/linux-headers-4.9.31-v7+&#39;=
</div><div>make: Entering directory &#39;/usr/src/linux-headers-4.9.31-v7+&=
#39;</div><div>scripts/kconfig/conf =C2=A0--silentoldconfig Kconfig</div><d=
iv>=C2=A0 CHK =C2=A0 =C2=A0 include/config/kernel.release</div><div>=C2=A0 =
UPD =C2=A0 =C2=A0 include/config/kernel.release</div><div>=C2=A0 WRAP =C2=
=A0 =C2=A0arch/arm/include/generated/asm/bitsperlong.h</div><div>=C2=A0 WRA=
P =C2=A0 =C2=A0arch/arm/include/generated/asm/clkdev.h</div><div>=C2=A0 WRA=
P =C2=A0 =C2=A0arch/arm/include/generated/asm/cputime.h</div><div>=C2=A0 WR=
AP =C2=A0 =C2=A0arch/arm/include/generated/asm/current.h</div><div>=C2=A0 W=
RAP =C2=A0 =C2=A0arch/arm/include/generated/asm/early_ioremap.h</div><div>=
=C2=A0 WRAP =C2=A0 =C2=A0arch/arm/include/generated/asm/emergency-restart.h=
</div><div>=C2=A0 WRAP =C2=A0 =C2=A0arch/arm/include/generated/asm/errno.h<=
/div><div>=C2=A0 WRAP =C2=A0 =C2=A0arch/arm/include/generated/asm/exec.h</d=
iv><div>=C2=A0 WRAP =C2=A0 =C2=A0arch/arm/include/generated/asm/ioctl.h</di=
v><div>=C2=A0 WRAP =C2=A0 =C2=A0arch/arm/include/generated/asm/ipcbuf.h</di=
v><div>=C2=A0 WRAP =C2=A0 =C2=A0arch/arm/include/generated/asm/irq_regs.h</=
div><div>=C2=A0 WRAP =C2=A0 =C2=A0arch/arm/include/generated/asm/kdebug.h</=
div><div>=C2=A0 WRAP =C2=A0 =C2=A0arch/arm/include/generated/asm/local.h</d=
iv><div>=C2=A0 WRAP =C2=A0 =C2=A0arch/arm/include/generated/asm/local64.h</=
div><div>=C2=A0 WRAP =C2=A0 =C2=A0arch/arm/include/generated/asm/mm-arch-ho=
oks.h</div><div>=C2=A0 WRAP =C2=A0 =C2=A0arch/arm/include/generated/asm/msg=
buf.h</div><div>=C2=A0 WRAP =C2=A0 =C2=A0arch/arm/include/generated/asm/msi=
.h</div><div>=C2=A0 WRAP =C2=A0 =C2=A0arch/arm/include/generated/asm/param.=
h</div><div>=C2=A0 WRAP =C2=A0 =C2=A0arch/arm/include/generated/asm/parport=
.h</div><div>=C2=A0 WRAP =C2=A0 =C2=A0arch/arm/include/generated/asm/poll.h=
</div><div>=C2=A0 WRAP =C2=A0 =C2=A0arch/arm/include/generated/asm/preempt.=
h</div><div>=C2=A0 WRAP =C2=A0 =C2=A0arch/arm/include/generated/asm/resourc=
e.h</div><div>=C2=A0 WRAP =C2=A0 =C2=A0arch/arm/include/generated/asm/rwsem=
.h</div><div>=C2=A0 WRAP =C2=A0 =C2=A0arch/arm/include/generated/asm/seccom=
p.h</div><div>=C2=A0 WRAP =C2=A0 =C2=A0arch/arm/include/generated/asm/segme=
nt.h</div><div>=C2=A0 WRAP =C2=A0 =C2=A0arch/arm/include/generated/asm/semb=
uf.h</div><div>=C2=A0 WRAP =C2=A0 =C2=A0arch/arm/include/generated/asm/seri=
al.h</div><div>=C2=A0 WRAP =C2=A0 =C2=A0arch/arm/include/generated/asm/shmb=
uf.h</div><div>=C2=A0 WRAP =C2=A0 =C2=A0arch/arm/include/generated/asm/sigi=
nfo.h</div><div>=C2=A0 WRAP =C2=A0 =C2=A0arch/arm/include/generated/asm/sim=
d.h</div><div>=C2=A0 WRAP =C2=A0 =C2=A0arch/arm/include/generated/asm/sizes=
.h</div><div>=C2=A0 WRAP =C2=A0 =C2=A0arch/arm/include/generated/asm/socket=
.h</div><div>=C2=A0 WRAP =C2=A0 =C2=A0arch/arm/include/generated/asm/sockio=
s.h</div><div>=C2=A0 WRAP =C2=A0 =C2=A0arch/arm/include/generated/asm/termb=
its.h</div><div>=C2=A0 WRAP =C2=A0 =C2=A0arch/arm/include/generated/asm/ter=
mios.h</div><div>=C2=A0 WRAP =C2=A0 =C2=A0arch/arm/include/generated/asm/ti=
mex.h</div><div>=C2=A0 WRAP =C2=A0 =C2=A0arch/arm/include/generated/asm/tra=
ce_clock.h</div><div>=C2=A0 WRAP =C2=A0 =C2=A0arch/arm/include/generated/as=
m/unaligned.h</div><div>=C2=A0 CHK =C2=A0 =C2=A0 include/generated/uapi/lin=
ux/version.h</div><div>=C2=A0 UPD =C2=A0 =C2=A0 include/generated/uapi/linu=
x/version.h</div><div>=C2=A0 CHK =C2=A0 =C2=A0 include/generated/utsrelease=
.h</div><div>=C2=A0 UPD =C2=A0 =C2=A0 include/generated/utsrelease.h</div><=
div>=C2=A0 GEN =C2=A0 =C2=A0 include/generated/mach-types.h</div><div>=C2=
=A0 CC =C2=A0 =C2=A0 =C2=A0kernel/bounds.s</div><div>=C2=A0 CHK =C2=A0 =C2=
=A0 include/generated/bounds.h</div><div>=C2=A0 UPD =C2=A0 =C2=A0 include/g=
enerated/bounds.h</div><div>=C2=A0 CHK =C2=A0 =C2=A0 include/generated/time=
const.h</div><div>=C2=A0 UPD =C2=A0 =C2=A0 include/generated/timeconst.h</d=
iv><div>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0arch/arm/kernel/asm-offsets.s</div><d=
iv>=C2=A0 CHK =C2=A0 =C2=A0 include/generated/asm-offsets.h</div><div>=C2=
=A0 UPD =C2=A0 =C2=A0 include/generated/asm-offsets.h</div><div>=C2=A0 CALL=
 =C2=A0 =C2=A0scripts/checksyscalls.sh</div><div>grep: scripts/../arch/x86/=
entry/syscalls/syscall_32.tbl: No such file or directory</div><div>=C2=A0 H=
OSTCC =C2=A0scripts/dtc/dtc.o</div><div>=C2=A0 HOSTCC =C2=A0scripts/dtc/fla=
ttree.o</div><div>=C2=A0 HOSTCC =C2=A0scripts/dtc/fstree.o</div><div>=C2=A0=
 HOSTCC =C2=A0scripts/dtc/data.o</div><div>=C2=A0 HOSTCC =C2=A0scripts/dtc/=
livetree.o</div><div>=C2=A0 HOSTCC =C2=A0scripts/dtc/treesource.o</div><div=
>=C2=A0 HOSTCC =C2=A0scripts/dtc/srcpos.o</div><div>=C2=A0 HOSTCC =C2=A0scr=
ipts/dtc/checks.o</div><div>=C2=A0 HOSTCC =C2=A0scripts/dtc/util.o</div><di=
v>=C2=A0 HOSTCC =C2=A0scripts/dtc/dtc-lexer.lex.o</div><div>=C2=A0 HOSTCC =
=C2=A0scripts/dtc/dtc-parser.tab.o</div><div>=C2=A0 HOSTLD =C2=A0scripts/dt=
c/dtc</div><div>=C2=A0 HOSTCC =C2=A0scripts/genksyms/genksyms.o</div><div>=
=C2=A0 HOSTCC =C2=A0scripts/genksyms/parse.tab.o</div><div>=C2=A0 SHIPPED s=
cripts/genksyms/lex.lex.c</div><div>=C2=A0 HOSTCC =C2=A0scripts/genksyms/le=
x.lex.o</div><div>=C2=A0 HOSTLD =C2=A0scripts/genksyms/genksyms</div><div>=
=C2=A0 CC =C2=A0 =C2=A0 =C2=A0scripts/mod/empty.o</div><div>=C2=A0 HOSTCC =
=C2=A0scripts/mod/mk_elfconfig</div><div>=C2=A0 MKELF =C2=A0 scripts/mod/el=
fconfig.h</div><div>=C2=A0 HOSTCC =C2=A0scripts/mod/modpost.o</div><div>=C2=
=A0 CC =C2=A0 =C2=A0 =C2=A0scripts/mod/devicetable-offsets.s</div><div>=C2=
=A0 GEN =C2=A0 =C2=A0 scripts/mod/devicetable-offsets.h</div><div>=C2=A0 HO=
STCC =C2=A0scripts/mod/file2alias.o</div><div>=C2=A0 HOSTCC =C2=A0scripts/m=
od/sumversion.o</div><div>=C2=A0 HOSTLD =C2=A0scripts/mod/modpost</div><div=
>=C2=A0 HOSTCC =C2=A0scripts/kallsyms</div><div>=C2=A0 HOSTCC =C2=A0scripts=
/pnmtologo</div><div>=C2=A0 HOSTCC =C2=A0scripts/conmakehash</div><div>=C2=
=A0 HOSTCC =C2=A0scripts/recordmcount</div><div>=C2=A0 HOSTCC =C2=A0scripts=
/sortextable</div><div>make: Leaving directory &#39;/usr/src/linux-headers-=
4.9.31-v7+&#39;</div><div><br></div><div>-------- Uninstall Beginning -----=
---</div><div>Module: =C2=A0wireguard</div><div>Version: 0.0.20170726-1</di=
v><div>Kernel: =C2=A04.9.35+ (armv7l)</div><div>---------------------------=
----------</div><div><br></div><div>Status: Before uninstall, this module v=
ersion was ACTIVE on this kernel.</div><div><br></div><div>wireguard.ko:</d=
iv><div>=C2=A0- Uninstallation</div><div>=C2=A0 =C2=A0- Deleting from: /lib=
/modules/4.9.35+/kernel/net/</div><div>=C2=A0- Original module</div><div>=
=C2=A0 =C2=A0- No original module was found for this module on this kernel.=
</div><div>=C2=A0 =C2=A0- Use the dkms install command to reinstall any pre=
vious module version.</div><div><br></div><div>depmod...</div><div><br></di=
v><div>DKMS: uninstall completed.</div><div><br></div><div>-------- Uninsta=
ll Beginning --------</div><div>Module: =C2=A0wireguard</div><div>Version: =
0.0.20170726-1</div><div>Kernel: =C2=A04.9.35-v7+ (armv7l)</div><div>------=
-------------------------------</div><div><br></div><div>Status: Before uni=
nstall, this module version was ACTIVE on this kernel.</div><div><br></div>=
<div>wireguard.ko:</div><div>=C2=A0- Uninstallation</div><div>=C2=A0 =C2=A0=
- Deleting from: /lib/modules/4.9.35-v7+/kernel/net/</div><div>=C2=A0- Orig=
inal module</div><div>=C2=A0 =C2=A0- No original module was found for this =
module on this kernel.</div><div>=C2=A0 =C2=A0- Use the dkms install comman=
d to reinstall any previous module version.</div><div><br></div><div>depmod=
...</div><div><br></div><div>DKMS: uninstall completed.</div><div><br></div=
><div>------------------------------</div><div>Deleting module version: 0.0=
.20170726-1</div><div>completely from the DKMS tree.</div><div>------------=
------------------</div><div>Done.</div><div>Loading new wireguard-0.0.2017=
0726-1 DKMS files...</div><div>It is likely that 4.9.35-v7+ belongs to a ch=
root&#39;s host</div><div>Building for 3.6-trunk-rpi, 4.9.31-v7+, 4.9.35+ a=
nd 4.9.35-v7+</div><div>Building initial module for 3.6-trunk-rpi</div><div=
>Error!=C2=A0 The dkms.conf for this module includes a BUILD_EXCLUSIVE dire=
ctive which</div><div>does not match this kernel/arch.=C2=A0 This indicates=
 that it should not be built.</div><div>Skipped.</div><div>Building initial=
 module for 4.9.31-v7+</div><div>Done.</div><div><br></div><div>wireguard:<=
/div><div>Running module version sanity check.</div><div>=C2=A0- Original m=
odule</div><div>=C2=A0 =C2=A0- No original module exists within this kernel=
</div><div>=C2=A0- Installation</div><div>=C2=A0 =C2=A0- Installing to /lib=
/modules/4.9.31-v7+/kernel/net/</div><div><br></div><div>depmod...</div><di=
v><br></div><div>DKMS: install completed.</div><div>Building initial module=
 for 4.9.35+</div><div>Done.</div><div><br></div><div>wireguard:</div><div>=
Running module version sanity check.</div><div>=C2=A0- Original module</div=
><div>=C2=A0 =C2=A0- No original module exists within this kernel</div><div=
>=C2=A0- Installation</div><div>=C2=A0 =C2=A0- Installing to /lib/modules/4=
.9.35+/kernel/net/</div><div><br></div><div>depmod...</div><div><br></div><=
div>DKMS: install completed.</div><div>Building initial module for 4.9.35-v=
7+</div><div>Done.</div><div><br></div><div>wireguard:</div><div>Running mo=
dule version sanity check.</div><div>=C2=A0- Original module</div><div>=C2=
=A0 =C2=A0- No original module exists within this kernel</div><div>=C2=A0- =
Installation</div><div>=C2=A0 =C2=A0- Installing to /lib/modules/4.9.35-v7+=
/kernel/net/</div><div><br></div><div>depmod...</div><div><br></div><div>DK=
MS: install completed.</div><div><br></div><div>-------- Uninstall Beginnin=
g --------</div><div>Module: =C2=A0wireguard</div><div>Version: 0.0.2017072=
6-1</div><div>Kernel: =C2=A04.9.31-v7+ (armv7l)</div><div>-----------------=
--------------------</div><div><br></div><div>Status: Before uninstall, thi=
s module version was ACTIVE on this kernel.</div><div><br></div><div>wiregu=
ard.ko:</div><div>=C2=A0- Uninstallation</div><div>=C2=A0 =C2=A0- Deleting =
from: /lib/modules/4.9.31-v7+/kernel/net/</div><div>=C2=A0- Original module=
</div><div>=C2=A0 =C2=A0- No original module was found for this module on t=
his kernel.</div><div>=C2=A0 =C2=A0- Use the dkms install command to reinst=
all any previous module version.</div><div><br></div><div>depmod...</div><d=
iv><br></div><div>DKMS: uninstall completed.</div><div><br></div><div>-----=
--- Uninstall Beginning --------</div><div>Module: =C2=A0wireguard</div><di=
v>Version: 0.0.20170726-1</div><div>Kernel: =C2=A04.9.35+ (armv7l)</div><di=
v>-------------------------------------</div><div><br></div><div>Status: Be=
fore uninstall, this module version was ACTIVE on this kernel.</div><div><b=
r></div><div>wireguard.ko:</div><div>=C2=A0- Uninstallation</div><div>=C2=
=A0 =C2=A0- Deleting from: /lib/modules/4.9.35+/kernel/net/</div><div>=C2=
=A0- Original module</div><div>=C2=A0 =C2=A0- No original module was found =
for this module on this kernel.</div><div>=C2=A0 =C2=A0- Use the dkms insta=
ll command to reinstall any previous module version.</div><div><br></div><d=
iv>depmod...</div><div><br></div><div>DKMS: uninstall completed.</div><div>=
<br></div><div>-------- Uninstall Beginning --------</div><div>Module: =C2=
=A0wireguard</div><div>Version: 0.0.20170726-1</div><div>Kernel: =C2=A04.9.=
35-v7+ (armv7l)</div><div>-------------------------------------</div><div><=
br></div><div>Status: Before uninstall, this module version was ACTIVE on t=
his kernel.</div><div><br></div><div>wireguard.ko:</div><div>=C2=A0- Uninst=
allation</div><div>=C2=A0 =C2=A0- Deleting from: /lib/modules/4.9.35-v7+/ke=
rnel/net/</div><div>=C2=A0- Original module</div><div>=C2=A0 =C2=A0- No ori=
ginal module was found for this module on this kernel.</div><div>=C2=A0 =C2=
=A0- Use the dkms install command to reinstall any previous module version.=
</div><div><br></div><div>depmod...</div><div><br></div><div>DKMS: uninstal=
l completed.</div><div><br></div><div>------------------------------</div><=
div>Deleting module version: 0.0.20170726-1</div><div>completely from the D=
KMS tree.</div><div>------------------------------</div><div>Done.</div><di=
v>Loading new wireguard-0.0.20170726-1 DKMS files...</div><div>It is likely=
 that 4.9.35-v7+ belongs to a chroot&#39;s host</div><div>Building for 3.6-=
trunk-rpi, 4.9.31-v7+, 4.9.35+ and 4.9.35-v7+</div><div>Building initial mo=
dule for 3.6-trunk-rpi</div><div>Error!=C2=A0 The dkms.conf for this module=
 includes a BUILD_EXCLUSIVE directive which</div><div>does not match this k=
ernel/arch.=C2=A0 This indicates that it should not be built.</div><div>Ski=
pped.</div><div>Building initial module for 4.9.31-v7+</div><div>Done.</div=
><div><br></div><div>wireguard:</div><div>Running module version sanity che=
ck.</div><div>=C2=A0- Original module</div><div>=C2=A0 =C2=A0- No original =
module exists within this kernel</div><div>=C2=A0- Installation</div><div>=
=C2=A0 =C2=A0- Installing to /lib/modules/4.9.31-v7+/kernel/net/</div><div>=
<br></div><div>depmod...</div><div><br></div><div>DKMS: install completed.<=
/div><div>Building initial module for 4.9.35+</div><div>Done.</div><div><br=
></div><div>wireguard:</div><div>Running module version sanity check.</div>=
<div>=C2=A0- Original module</div><div>=C2=A0 =C2=A0- No original module ex=
ists within this kernel</div><div>=C2=A0- Installation</div><div>=C2=A0 =C2=
=A0- Installing to /lib/modules/4.9.35+/kernel/net/</div><div><br></div><di=
v>depmod...</div><div><br></div><div>DKMS: install completed.</div><div>Bui=
lding initial module for 4.9.35-v7+</div><div>Done.</div><div><br></div><di=
v>wireguard:</div><div>Running module version sanity check.</div><div>=C2=
=A0- Original module</div><div>=C2=A0 =C2=A0- No original module exists wit=
hin this kernel</div><div>=C2=A0- Installation</div><div>=C2=A0 =C2=A0- Ins=
talling to /lib/modules/4.9.35-v7+/kernel/net/</div><div><br></div><div>dep=
mod...</div><div><br></div><div>DKMS: install completed.</div><div>pi@raspb=
errypi:~ $ lsmod | grep wireguard</div><div>pi@raspberrypi:~ $ ip link add =
dev wg0 type wireguard</div><div>RTNETLINK answers: Operation not permitted=
</div><div>pi@raspberrypi:~ $ sudo apt-get install wireguard-dkms wireguard=
-tools</div><div>Reading package lists... Done</div><div>Building dependenc=
y tree =C2=A0 =C2=A0 =C2=A0=C2=A0</div><div>Reading state information... Do=
ne</div><div>wireguard-dkms is already the newest version (0.0.20170726-1).=
</div><div>wireguard-tools is already the newest version (0.0.20170726-1).<=
/div><div>0 upgraded, 0 newly installed, 0 to remove and 855 not upgraded.<=
/div><div>pi@raspberrypi:~ $ lsmod | grep wireguard</div><div>pi@raspberryp=
i:~ $ ip link add dev wg0 type wireguard</div><div>RTNETLINK answers: Opera=
tion not permitted</div><div>pi@raspberrypi:~ $ sudo apt-get purge wireguar=
d-dkms wireguard-tools</div><div>Reading package lists... Done</div><div>Bu=
ilding dependency tree =C2=A0 =C2=A0 =C2=A0=C2=A0</div><div>Reading state i=
nformation... Done</div><div>The following packages were automatically inst=
alled and are no longer required:</div><div>=C2=A0 dkms libmnl0 linux-heade=
rs-3.6-trunk-common linux-headers-3.6-trunk-rpi linux-kbuild-3.6</div><div>=
Use &#39;sudo apt autoremove&#39; to remove them.</div><div>The following p=
ackages will be REMOVED:</div><div>=C2=A0 wireguard-dkms* wireguard-tools*<=
/div><div>0 upgraded, 0 newly installed, 2 to remove and 855 not upgraded.<=
/div><div>After this operation, 918 kB disk space will be freed.</div><div>=
Do you want to continue? [Y/n] Y</div><div>(Reading database ... 148279 fil=
es and directories currently installed.)</div><div>Removing wireguard-dkms =
(0.0.20170726-1) ...</div><div><br></div><div>-------- Uninstall Beginning =
--------</div><div>Module: =C2=A0wireguard</div><div>Version: 0.0.20170726-=
1</div><div>Kernel: =C2=A04.9.31-v7+ (armv7l)</div><div>-------------------=
------------------</div><div><br></div><div>Status: Before uninstall, this =
module version was ACTIVE on this kernel.</div><div><br></div><div>wireguar=
d.ko:</div><div>=C2=A0- Uninstallation</div><div>=C2=A0 =C2=A0- Deleting fr=
om: /lib/modules/4.9.31-v7+/kernel/net/</div><div>=C2=A0- Original module</=
div><div>=C2=A0 =C2=A0- No original module was found for this module on thi=
s kernel.</div><div>=C2=A0 =C2=A0- Use the dkms install command to reinstal=
l any previous module version.</div><div><br></div><div>depmod...</div><div=
><br></div><div>DKMS: uninstall completed.</div><div><br></div><div>-------=
- Uninstall Beginning --------</div><div>Module: =C2=A0wireguard</div><div>=
Version: 0.0.20170726-1</div><div>Kernel: =C2=A04.9.35+ (armv7l)</div><div>=
-------------------------------------</div><div><br></div><div>Status: Befo=
re uninstall, this module version was ACTIVE on this kernel.</div><div><br>=
</div><div>wireguard.ko:</div><div>=C2=A0- Uninstallation</div><div>=C2=A0 =
=C2=A0- Deleting from: /lib/modules/4.9.35+/kernel/net/</div><div>=C2=A0- O=
riginal module</div><div>=C2=A0 =C2=A0- No original module was found for th=
is module on this kernel.</div><div>=C2=A0 =C2=A0- Use the dkms install com=
mand to reinstall any previous module version.</div><div><br></div><div>dep=
mod...</div><div><br></div><div>DKMS: uninstall completed.</div><div><br></=
div><div>-------- Uninstall Beginning --------</div><div>Module: =C2=A0wire=
guard</div><div>Version: 0.0.20170726-1</div><div>Kernel: =C2=A04.9.35-v7+ =
(armv7l)</div><div>-------------------------------------</div><div><br></di=
v><div>Status: Before uninstall, this module version was ACTIVE on this ker=
nel.</div><div><br></div><div>wireguard.ko:</div><div>=C2=A0- Uninstallatio=
n</div><div>=C2=A0 =C2=A0- Deleting from: /lib/modules/4.9.35-v7+/kernel/ne=
t/</div><div>=C2=A0- Original module</div><div>=C2=A0 =C2=A0- No original m=
odule was found for this module on this kernel.</div><div>=C2=A0 =C2=A0- Us=
e the dkms install command to reinstall any previous module version.</div><=
div><br></div><div>depmod...</div><div><br></div><div>DKMS: uninstall compl=
eted.</div><div><br></div><div>------------------------------</div><div>Del=
eting module version: 0.0.20170726-1</div><div>completely from the DKMS tre=
e.</div><div>------------------------------</div><div>Done.</div><div>Remov=
ing wireguard-tools (0.0.20170726-1) ...</div><div>dpkg: warning: while rem=
oving wireguard-tools, directory &#39;/etc/wireguard&#39; not empty so not =
removed</div><div>Processing triggers for man-db (2.7.5-1~bpo8+1) ...</div>=
</div><div><br></div><div>&quot;</div></div></div><div class=3D"gmail_extra=
"><br><div class=3D"gmail_quote">On Sat, Aug 5, 2017 at 3:38 PM, Sahil Gupt=
a <span dir=3D"ltr">&lt;<a href=3D"mailto:sg5414@g.rit.edu" target=3D"_blan=
k">sg5414@g.rit.edu</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
><div dir=3D"ltr">Hi,<br>I am not able to setup Wireguard interface on Rasp=
berry pi.<br><br>Error:<br>RTNETLINK answers: Operation not supported<div><=
br><br>See the stack:<br>&quot;<div><div>pi@raspberrypi:~ $ cd /etc/wiregua=
rd/</div><div>pi@raspberrypi:/etc/wireguard $ l</div><div>-bash: l: command=
 not found</div><div>pi@raspberrypi:/etc/wireguard $ ls</div><div>publickey=
 =C2=A0wg0.conf</div><div>pi@raspberrypi:/etc/wireguard $ history | grep wg=
0</div><div>=C2=A0 =C2=A015 =C2=A0history | grep wg0</div><div>pi@raspberry=
pi:/etc/wireguard $ ip link add wg0 type wireguard</div><div>RTNETLINK answ=
ers: Operation not permitted</div><div>pi@raspberrypi:/etc/wireguard $ sudo=
 su</div><div>root@raspberrypi:/etc/<wbr>wireguard# wg-quick up wg0</div><d=
iv>Warning: `/etc/wireguard/wg0.conf&#39; is world accessible</div><div>[#]=
 ip link add wg0 type wireguard</div><div>RTNETLINK answers: Operation not =
supported</div><div>`wg0` is not a valid WireGuard interface</div><div>Usag=
e: wg show { &lt;interface&gt; | all | interfaces } [public-key | private-k=
ey | listen-port | fwmark | peers | preshared-keys | endpoints | allowed-ip=
s | latest-handshakes | transfer | persistent-keepalive | dump]</div><div>r=
oot@raspberrypi:/etc/<wbr>wireguard# wg show</div><div>root@raspberrypi:/et=
c/<wbr>wireguard# wg show all</div><div>root@raspberrypi:/etc/<wbr>wireguar=
d#=C2=A0</div></div><div><br></div><div>&quot;</div><div><br></div><div>Any=
 pointers will be appreciated.</div><div><br></div><div>Thanks<span class=
=3D"HOEnZb"><font color=3D"#888888"><br>Sahil Gupta</font></span></div></di=
v></div>
</blockquote></div><br></div>

--f403045c6a1e970d840556184071--
