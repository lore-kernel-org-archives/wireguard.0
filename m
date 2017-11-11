Return-Path: kogeler@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cdbe5eb8
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 Nov 2017 21:28:19 +0000 (UTC)
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
 [209.85.223.178])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9ab98c5c
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 Nov 2017 21:28:19 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id 71so1348003ior.7
 for <wireguard@lists.zx2c4.com>; Sat, 11 Nov 2017 13:32:05 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?B?0KDQvtC80LDQvSDQk9Cw0LLRgNC40LvQvtCy?= <kogeler@gmail.com>
Date: Sun, 12 Nov 2017 00:32:03 +0300
Message-ID: <CALpTdxmmm9PwtFEZ7bwHTvCcfB5VEpLTnHi0E-z3skSJvSdSuw@mail.gmail.com>
Subject: bug on armhf
To: wireguard@lists.zx2c4.com
Content-Type: multipart/alternative; boundary="001a11445a8eb2cac6055dbbc488"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a11445a8eb2cac6055dbbc488
Content-Type: text/plain; charset="UTF-8"

Hello!

I have bug on armhf with asm neon instruction.

_________________________________________________________________________________________________________

App install from:
ppa:wireguard/wireguard
on
Ubuntu Xenial 16.04

Hardware: Orange Pi Plus 2E
SOC: Allwinner H3

_________________________________________________________________________________________________________

cat /proc/cpuinfo
processor    : 0
model name    : ARMv7 Processor rev 5 (v7l)
BogoMIPS    : 11.42
Features    : half thumb fastmult vfp edsp neon vfpv3 tls vfpv4 idiva idivt
vfpd32 lpae evtstrm
CPU implementer    : 0x41
CPU architecture: 7
CPU variant    : 0x0
CPU part    : 0xc07
CPU revision    : 5

processor    : 1
model name    : ARMv7 Processor rev 5 (v7l)
BogoMIPS    : 11.42
Features    : half thumb fastmult vfp edsp neon vfpv3 tls vfpv4 idiva idivt
vfpd32 lpae evtstrm
CPU implementer    : 0x41
CPU architecture: 7
CPU variant    : 0x0
CPU part    : 0xc07
CPU revision    : 5

processor    : 2
model name    : ARMv7 Processor rev 5 (v7l)
BogoMIPS    : 11.42
Features    : half thumb fastmult vfp edsp neon vfpv3 tls vfpv4 idiva idivt
vfpd32 lpae evtstrm
CPU implementer    : 0x41
CPU architecture: 7
CPU variant    : 0x0
CPU part    : 0xc07
CPU revision    : 5

processor    : 3
model name    : ARMv7 Processor rev 5 (v7l)
BogoMIPS    : 11.42
Features    : half thumb fastmult vfp edsp neon vfpv3 tls vfpv4 idiva idivt
vfpd32 lpae evtstrm
CPU implementer    : 0x41
CPU architecture: 7
CPU variant    : 0x0
CPU part    : 0xc07
CPU revision    : 5

Hardware    : Allwinner sun8i Family
Revision    : 0000
Serial        : 02c0008149ab5a29

_________________________________________________________________________________________________________

uname -a
Linux LAB-HOME-SERVER 4.13.12-sunxi #163 SMP Sat Nov 11 00:09:12 CET 2017
armv7l armv7l armv7l GNU/Linux

_________________________________________________________________________________________________________

dpkg -l | grep wireguard
ii  wireguard-dkms
0.0.20171111-wg1~xenial                    all          fast, modern,
secure kernel VPN tunnel (DKMS version)
ii  wireguard-tools
0.0.20171111-wg1~xenial                    armhf        fast, modern,
secure kernel VPN tunnel (userland utilities)

_________________________________________________________________________________________________________

sudo modprobe wireguard
modprobe: ERROR: could not insert 'wireguard': Exec format error

_________________________________________________________________________________________________________

dmesg | grep wiregu
[  136.246272] wireguard: loading out-of-tree module taints kernel.
[  136.248478] wireguard: section 3 reloc 933 sym 'curve25519_asm_neon':
unsupported interworking call (Thumb -> ARM)

--001a11445a8eb2cac6055dbbc488
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello!<br><br>I have bug on armhf with asm neon instructio=
n.<br><br>_________________________________________________________________=
________________________________________<br><br>App install from:<br>ppa:wi=
reguard/wireguard<br>on<br>Ubuntu Xenial 16.04<br><br>Hardware: Orange Pi P=
lus 2E<br>SOC: Allwinner H3<br><br>________________________________________=
_________________________________________________________________<br><br>ca=
t /proc/cpuinfo<br>processor=C2=A0=C2=A0=C2=A0 : 0<br>model name=C2=A0=C2=
=A0=C2=A0 : ARMv7 Processor rev 5 (v7l)<br>BogoMIPS=C2=A0=C2=A0=C2=A0 : 11.=
42<br>Features=C2=A0=C2=A0=C2=A0 : half thumb fastmult vfp edsp neon vfpv3 =
tls vfpv4 idiva idivt vfpd32 lpae evtstrm <br>CPU implementer=C2=A0=C2=A0=
=C2=A0 : 0x41<br>CPU architecture: 7<br>CPU variant=C2=A0=C2=A0=C2=A0 : 0x0=
<br>CPU part=C2=A0=C2=A0=C2=A0 : 0xc07<br>CPU revision=C2=A0=C2=A0=C2=A0 : =
5<br><br>processor=C2=A0=C2=A0=C2=A0 : 1<br>model name=C2=A0=C2=A0=C2=A0 : =
ARMv7 Processor rev 5 (v7l)<br>BogoMIPS=C2=A0=C2=A0=C2=A0 : 11.42<br>Featur=
es=C2=A0=C2=A0=C2=A0 : half thumb fastmult vfp edsp neon vfpv3 tls vfpv4 id=
iva idivt vfpd32 lpae evtstrm <br>CPU implementer=C2=A0=C2=A0=C2=A0 : 0x41<=
br>CPU architecture: 7<br>CPU variant=C2=A0=C2=A0=C2=A0 : 0x0<br>CPU part=
=C2=A0=C2=A0=C2=A0 : 0xc07<br>CPU revision=C2=A0=C2=A0=C2=A0 : 5<br><br>pro=
cessor=C2=A0=C2=A0=C2=A0 : 2<br>model name=C2=A0=C2=A0=C2=A0 : ARMv7 Proces=
sor rev 5 (v7l)<br>BogoMIPS=C2=A0=C2=A0=C2=A0 : 11.42<br>Features=C2=A0=C2=
=A0=C2=A0 : half thumb fastmult vfp edsp neon vfpv3 tls vfpv4 idiva idivt v=
fpd32 lpae evtstrm <br>CPU implementer=C2=A0=C2=A0=C2=A0 : 0x41<br>CPU arch=
itecture: 7<br>CPU variant=C2=A0=C2=A0=C2=A0 : 0x0<br>CPU part=C2=A0=C2=A0=
=C2=A0 : 0xc07<br>CPU revision=C2=A0=C2=A0=C2=A0 : 5<br><br>processor=C2=A0=
=C2=A0=C2=A0 : 3<br>model name=C2=A0=C2=A0=C2=A0 : ARMv7 Processor rev 5 (v=
7l)<br>BogoMIPS=C2=A0=C2=A0=C2=A0 : 11.42<br>Features=C2=A0=C2=A0=C2=A0 : h=
alf thumb fastmult vfp edsp neon vfpv3 tls vfpv4 idiva idivt vfpd32 lpae ev=
tstrm <br>CPU implementer=C2=A0=C2=A0=C2=A0 : 0x41<br>CPU architecture: 7<b=
r>CPU variant=C2=A0=C2=A0=C2=A0 : 0x0<br>CPU part=C2=A0=C2=A0=C2=A0 : 0xc07=
<br>CPU revision=C2=A0=C2=A0=C2=A0 : 5<br><br>Hardware=C2=A0=C2=A0=C2=A0 : =
Allwinner sun8i Family<br>Revision=C2=A0=C2=A0=C2=A0 : 0000<br>Serial=C2=A0=
=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 : 02c0008149ab5a29<br><br>_________________=
___________________________________________________________________________=
_____________<br><br>uname -a<br>Linux LAB-HOME-SERVER 4.13.12-sunxi #163 S=
MP Sat Nov 11 00:09:12 CET 2017 armv7l armv7l armv7l GNU/Linux<br><br>_____=
___________________________________________________________________________=
_________________________<br><br>dpkg -l | grep wireguard<br>ii=C2=A0 wireg=
uard-dkms=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.0.20171111-wg1~xenial=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 all=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 fast, modern, secure kernel VPN tunnel (DKMS version)<br>ii=
=C2=A0 wireguard-tools=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.0.20171111-wg1~xenial=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 armhf=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 fast, modern, secure kernel VPN tunnel (userland utilities)<br=
><br>______________________________________________________________________=
___________________________________<br><br>sudo modprobe wireguard<br>modpr=
obe: ERROR: could not insert &#39;wireguard&#39;: Exec format error<br><br>=
___________________________________________________________________________=
______________________________<br><br>dmesg | grep wiregu<br>[=C2=A0 136.24=
6272] wireguard: loading out-of-tree module taints kernel.<br>[=C2=A0 136.2=
48478] wireguard: section 3 reloc 933 sym &#39;curve25519_asm_neon&#39;: un=
supported interworking call (Thumb -&gt; ARM)<br></div>

--001a11445a8eb2cac6055dbbc488--
