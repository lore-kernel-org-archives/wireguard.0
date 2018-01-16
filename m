Return-Path: luizluca@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f4dfc041
 for <wireguard@lists.zx2c4.com>;
 Tue, 16 Jan 2018 23:21:38 +0000 (UTC)
Received: from mail-it0-f46.google.com (mail-it0-f46.google.com
 [209.85.214.46])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ecd94eac
 for <wireguard@lists.zx2c4.com>;
 Tue, 16 Jan 2018 23:21:38 +0000 (UTC)
Received: by mail-it0-f46.google.com with SMTP id q8so6930271itb.2
 for <wireguard@lists.zx2c4.com>; Tue, 16 Jan 2018 15:24:54 -0800 (PST)
MIME-Version: 1.0
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Tue, 16 Jan 2018 23:24:42 +0000
Message-ID: <CAJq09z7WRCpOgF24QztfY2++C4tVD2MkN_w3YLoQpmDtiuh5Dw@mail.gmail.com>
Subject: Sys CPU usage increasing over time
To: wireguard@lists.zx2c4.com
Content-Type: multipart/alternative; boundary="94eb2c0b0c26bc46ab0562ed09ba"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--94eb2c0b0c26bc46ab0562ed09ba
Content-Type: text/plain; charset="UTF-8"

Hello,

I'm testing wireguard with two LEDE (OpenWrt) 17.01.4 nodes. The "server"
is a TL-WR2543ND with 64MB RAM and the "client" (the one with a defined
endpoint address) a poor TL-WR741ND v4 with 32 RAM.
Both are ar71xx systems, arch MIPS 24Kc CPU, with little to no performance
difference.

As TL-WR741ND has only 4 MB or flash, the smaller footprint of wireguard
allowed me to squeeze all needed packages without removing any original
package (as web gui) creating a custom image. That was unimaginable with
openvpn. Thanks wireguard!

Both are using a little bit outdated wireguard module because modules are
only rebuild on new dot releases. Userland can be updated easier.

kmod-wireguard - 4.4.92+0.0.20171017-1
wireguard - 0.0.20171221-1
wireguard-tools - 0.0.20171221-1

Everything seems to work as expected. However, on the client (TL-WR741ND),
I noticed that something between half a day to a couple of days normal
network usage (not VPN) gets slower and slower. Checking the device,
loadavg reaches values as 15 a little bit before the router stops to work
and I need to do a cold restart. top tells me sys usage eats 90% of CPU. If
I restart wireguard interface, nothing changes. The CPU falls drastically
if I remove wireguard module from kernel (rmmod), returning to a normal
loadavg of 0.05.

My VPN link is normally idle, using a couple of MiB per day. The VPN usage
seems to not affect the time needed to manifest the problem, but normal
network usage does seem to make the problem appear sooner.

The strange thing is that the "server" node does not show the same
behavior. Maybe it is related to the fact that it has currently no local
network usage there. Both nodes uses the same wireguard binary code.

Is this a known issue of version 0.0.20171017? Or do I get something new? I
tried to read all changelog since 20171017 but I could not identify any
obvious fix.

Is there anything I can do?

Regards,


-- 

Luiz Angelo Daros de Luca
luizluca@gmail.com

--94eb2c0b0c26bc46ab0562ed09ba
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div><br></div><div>I&#39;m testing wireguard with t=
wo LEDE (OpenWrt) 17.01.4 nodes. The &quot;server&quot; is a=C2=A0TL-WR2543=
ND with 64MB RAM and the &quot;client&quot; (the one with a defined endpoin=
t address) a poor TL-WR741ND v4 with 32 RAM.</div><div>Both are ar71xx syst=
ems, arch MIPS 24Kc CPU, with little to no performance difference.</div><di=
v><br></div><div>As TL-WR741ND has only 4 MB or flash, the smaller footprin=
t of wireguard allowed me to squeeze all needed packages without removing a=
ny original package (as web gui) creating a custom image. That was unimagin=
able with openvpn. Thanks wireguard!</div><div><br></div><div><div>Both are=
 using a little bit outdated wireguard module because modules are only rebu=
ild on new dot releases. Userland can be updated easier.</div><div><br></di=
v><div><div>kmod-wireguard - 4.4.92+0.0.20171017-1</div><div>wireguard - 0.=
0.20171221-1</div><div>wireguard-tools - 0.0.20171221-1</div></div><div><br=
></div></div><div>Everything seems to work as expected. However, on the cli=
ent (TL-WR741ND), I noticed that something between half a day to a couple o=
f days normal network usage (not VPN) gets slower and slower. Checking the =
device, loadavg reaches values as 15 a little bit before the router stops t=
o work and I need to do a cold restart. top tells me sys usage eats 90% of =
CPU. If I restart wireguard interface, nothing changes. The CPU falls drast=
ically if I remove wireguard module from kernel (rmmod), returning to a nor=
mal loadavg of 0.05.</div><div><br></div><div>My VPN link is normally idle,=
 using a couple of MiB per day. The VPN usage seems to not affect the time =
needed to manifest the problem, but normal network usage does seem to make =
the problem appear sooner.</div><div><br></div><div>The strange thing is th=
at the &quot;server&quot; node does not show the same behavior. Maybe it is=
 related to the fact that it has currently no local network usage there. Bo=
th nodes uses the same wireguard binary code.</div><div><br></div><div>Is t=
his a known issue of version 0.0.20171017? Or do I get something new? I tri=
ed to read all changelog since 20171017 but I could not identify any obviou=
s fix.=C2=A0</div><div><br></div><div>Is there anything I can do?</div><div=
><br></div><div>Regards,</div></div><br clear=3D"all"><br>-- <br><div dir=
=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div =
dir=3D"ltr"><p dir=3D"ltr">Luiz Angelo Daros de Luca<br>
<a href=3D"mailto:luizluca@gmail.com">luizluca@gmail.com</a></p>
</div></div>

--94eb2c0b0c26bc46ab0562ed09ba--
