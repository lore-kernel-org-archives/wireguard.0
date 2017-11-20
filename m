Return-Path: kogeler@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 89812751
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Nov 2017 19:29:16 +0000 (UTC)
Received: from mail-it0-f48.google.com (mail-it0-f48.google.com
 [209.85.214.48])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2eabcf8d
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Nov 2017 19:29:16 +0000 (UTC)
Received: by mail-it0-f48.google.com with SMTP id x28so13341140ita.0
 for <wireguard@lists.zx2c4.com>; Mon, 20 Nov 2017 11:34:10 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?B?0KDQvtC80LDQvSDQk9Cw0LLRgNC40LvQvtCy?= <kogeler@gmail.com>
Date: Mon, 20 Nov 2017 22:34:09 +0300
Message-ID: <CALpTdxnL6akts71rb4yg+wisxqqs0U2wXPE5c12J9yMHVL6wGw@mail.gmail.com>
Subject: new bug on armhf
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: multipart/alternative; boundary="001a11445a2a9d8096055e6f2b2b"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a11445a2a9d8096055e6f2b2b
Content-Type: text/plain; charset="UTF-8"

Hello!

I have new bug on armhf.

____________________________________________________________

build from:
https://git.zx2c4.com/WireGuard/commit/?id=82cacee3511e5c2f624203487124e5ba0151c84d

____________________________________________________________

software:
Ubuntu Xenial 16.04

hardware:
PC: Orange Pi Plus 2E
SOC: Allwinner H3

____________________________________________________________
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

____________________________________________________________

uname -a
Linux LAB-HOME-SERVER 4.13.14-sunxi #240 SMP Mon Nov 20 00:09:06 CET 2017
armv7l armv7l armv7l GNU/Linux

____________________________________________________________

I use mainline kernel.

Kernel config:
https://drive.google.com/open?id=1H6Vk7P8bCNAktBhmfJpTtGse2rRauRiB

____________________________________________________________

sudo modprobe wireguard
modprobe: ERROR: could not insert 'wireguard': Exec format error

____________________________________________________________

dmesg | grep wiregu
[  532.927236] wireguard: loading out-of-tree module taints kernel.
[  532.930604] wireguard: unknown relocation: 51
[  533.005892] wireguard: unknown relocation: 51

-- 
Thanks,
Roman Gavrilov

--001a11445a2a9d8096055e6f2b2b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello!<br><br>I have new bug on armhf.<br><br>_______=
_______________________<wbr>______________________________<wbr><br><br></di=
v>build from:<br><a href=3D"https://git.zx2c4.com/WireGuard/commit/?id=3D82=
cacee3511e5c2f624203487124e5ba0151c84d">https://git.zx2c4.com/WireGuard/com=
mit/?id=3D82cacee3511e5c2f624203487124e5ba0151c84d</a><br><div><br></div><d=
iv>______________________________<wbr>______________________________<wbr><b=
r><br></div><div>software:<br></div><div>Ubuntu Xenial 16.04<br></div><div>=
<br></div><div>hardware:<br></div><div>PC: Orange Pi Plus 2E<br>SOC: Allwin=
ner H3<br><br>______________________________<wbr>__________________________=
____<wbr><br>cat /proc/cpuinfo<br>processor=C2=A0=C2=A0=C2=A0 : 0<br>model =
name=C2=A0=C2=A0=C2=A0 : ARMv7 Processor rev 5 (v7l)<br>BogoMIPS=C2=A0=C2=
=A0=C2=A0 : 11.42<br>Features=C2=A0=C2=A0=C2=A0 : half thumb fastmult vfp e=
dsp neon vfpv3 tls vfpv4 idiva idivt vfpd32 lpae evtstrm <br>CPU implemente=
r=C2=A0=C2=A0=C2=A0 : 0x41<br>CPU architecture: 7<br>CPU variant=C2=A0=C2=
=A0=C2=A0 : 0x0<br>CPU part=C2=A0=C2=A0=C2=A0 : 0xc07<br>CPU revision=C2=A0=
=C2=A0=C2=A0 : 5<br><br>processor=C2=A0=C2=A0=C2=A0 : 1<br>model name=C2=A0=
=C2=A0=C2=A0 : ARMv7 Processor rev 5 (v7l)<br>BogoMIPS=C2=A0=C2=A0=C2=A0 : =
11.42<br>Features=C2=A0=C2=A0=C2=A0 : half thumb fastmult vfp edsp neon vfp=
v3 tls vfpv4 idiva idivt vfpd32 lpae evtstrm <br>CPU implementer=C2=A0=C2=
=A0=C2=A0 : 0x41<br>CPU architecture: 7<br>CPU variant=C2=A0=C2=A0=C2=A0 : =
0x0<br>CPU part=C2=A0=C2=A0=C2=A0 : 0xc07<br>CPU revision=C2=A0=C2=A0=C2=A0=
 : 5<br><br>processor=C2=A0=C2=A0=C2=A0 : 2<br>model name=C2=A0=C2=A0=C2=A0=
 : ARMv7 Processor rev 5 (v7l)<br>BogoMIPS=C2=A0=C2=A0=C2=A0 : 11.42<br>Fea=
tures=C2=A0=C2=A0=C2=A0 : half thumb fastmult vfp edsp neon vfpv3 tls vfpv4=
 idiva idivt vfpd32 lpae evtstrm <br>CPU implementer=C2=A0=C2=A0=C2=A0 : 0x=
41<br>CPU architecture: 7<br>CPU variant=C2=A0=C2=A0=C2=A0 : 0x0<br>CPU par=
t=C2=A0=C2=A0=C2=A0 : 0xc07<br>CPU revision=C2=A0=C2=A0=C2=A0 : 5<br><br>pr=
ocessor=C2=A0=C2=A0=C2=A0 : 3<br>model name=C2=A0=C2=A0=C2=A0 : ARMv7 Proce=
ssor rev 5 (v7l)<br>BogoMIPS=C2=A0=C2=A0=C2=A0 : 11.42<br>Features=C2=A0=C2=
=A0=C2=A0 : half thumb fastmult vfp edsp neon vfpv3 tls vfpv4 idiva idivt v=
fpd32 lpae evtstrm <br>CPU implementer=C2=A0=C2=A0=C2=A0 : 0x41<br>CPU arch=
itecture: 7<br>CPU variant=C2=A0=C2=A0=C2=A0 : 0x0<br>CPU part=C2=A0=C2=A0=
=C2=A0 : 0xc07<br>CPU revision=C2=A0=C2=A0=C2=A0 : 5<br><br>Hardware=C2=A0=
=C2=A0=C2=A0 : Allwinner sun8i Family<br>Revision=C2=A0=C2=A0=C2=A0 : 0000<=
br>Serial=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 : 02c0008149ab5a29<br><br>__=
____________________________<wbr>______________________________<wbr><br><br=
>uname -a<br>Linux LAB-HOME-SERVER 4.13.14-sunxi #240 SMP Mon Nov 20 00:09:=
06 CET 2017 armv7l armv7l armv7l GNU/Linux<br><br>_________________________=
_____<wbr>______________________________<wbr><br><br></div><div>I use mainl=
ine kernel.</div><div><br></div><div>Kernel config:</div><div><a href=3D"ht=
tps://drive.google.com/open?id=3D1H6Vk7P8bCNAktBhmfJpTtGse2rRauRiB">https:/=
/drive.google.com/open?id=3D1H6Vk7P8bCNAktBhmfJpTtGse2rRauRiB</a><br></div>=
<div><br>______________________________<wbr>______________________________<=
wbr></div><div><br>sudo modprobe wireguard<br>modprobe: ERROR: could not in=
sert &#39;wireguard&#39;: Exec format error<br><br>________________________=
______<wbr>______________________________<wbr></div><div><br>dmesg | grep w=
iregu<br>[=C2=A0 532.927236] wireguard: loading out-of-tree module taints k=
ernel.<br>[=C2=A0 532.930604] wireguard: unknown relocation: 51<br>[=C2=A0 =
533.005892] wireguard: unknown relocation: 51<br clear=3D"all"><br><span cl=
ass=3D"gmail-HOEnZb gmail-adL"><font color=3D"#888888"><span class=3D"gmail=
-m_6581058282960491625gmail-HOEnZb gmail-m_6581058282960491625gmail-adL"><f=
ont color=3D"#888888">-- <br><div class=3D"gmail-m_6581058282960491625gmail=
-m_5673561690374840175gmail-m_4963248276163928978gmail-m_-35770533906720339=
49gmail_signature"><div dir=3D"ltr">Thanks,</div><div>Roman Gavrilov</div><=
/div></font></span></font></span></div></div>

--001a11445a2a9d8096055e6f2b2b--
