Return-Path: gzxmx94@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 312733c2
 for <wireguard@lists.zx2c4.com>;
 Thu, 25 Jan 2018 10:19:27 +0000 (UTC)
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b111044a
 for <wireguard@lists.zx2c4.com>;
 Thu, 25 Jan 2018 10:19:27 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id f3so13933542wmc.1
 for <wireguard@lists.zx2c4.com>; Thu, 25 Jan 2018 02:23:46 -0800 (PST)
MIME-Version: 1.0
Sender: gzxmx94@gmail.com
From: =?UTF-8?Q?Rafa=C5=82_Grasman?= <grasmanek94@gmail.com>
Date: Thu, 25 Jan 2018 11:23:45 +0100
Message-ID: <CAMEMCsKxKHtn2ARFchYVTrj2r_ArHQ4DeqaaSYUh96ZKrVk3GA@mail.gmail.com>
Subject: Bridging wg and normal interfaces?
To: wireguard@lists.zx2c4.com
Content-Type: multipart/alternative; boundary="f403045c2688c69a910563972cfa"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--f403045c2688c69a910563972cfa
Content-Type: text/plain; charset="UTF-8"

Hello,

I would like to bridge my LAN and WireGuard interfaces so I can make a
site-to-site VPN with the gateway/router being at the other site.

But when using brctl to add wg0 to a bridge, the operation is not supported.

This is the setup I am aiming for:

Isolated VM virteth0 - preferably dhcp 172.16.0.2/24 from remote site
(gateway 172.16.0.1/24)

Switch VM - wg0 with 172.16.0.254/24 and eth0 with 192.168.1.254/24 (for
internet access through gw 192.168.1.1/24) and virteth0 (manual, no ip, no
dhcp), I want to bridge virteth0 and wg0.

Remote machine with wg0 172.16.0.1/24 and a public ip on eth0 (e.g.
11.22.33.44/32)

both virteth0's are connected together on the host machine.

Is this somehow possible with wireguard? As for now the Switch VM isn't a
switch, it acts as a router which does work but is not something I want
(and forces me to have a different ip on virteth0 on SwitchVM than wg0 has,
this forces me to make everything look like it came from SwitchVM instead
of the real addresses, because both the remote machine and Switch VM have
to act as routers, I want only 1 router in this setup - the remote machine).

Thanks in advance for your time and help :)

--f403045c2688c69a910563972cfa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div><br></div><div>I would like to bridge my LAN an=
d WireGuard interfaces so I can make a site-to-site VPN with the gateway/ro=
uter being at the other site.</div><div><br></div><div>But when using brctl=
 to add wg0 to a bridge, the operation is not supported.</div><div><br></di=
v><div>This is the setup I am aiming for:</div><div><br></div><div>Isolated=
 VM virteth0 - preferably dhcp <a href=3D"http://172.16.0.2/24">172.16.0.2/=
24</a> from remote site (gateway <a href=3D"http://172.16.0.1/24">172.16.0.=
1/24</a>)</div><div><br></div><div>Switch VM - wg0 with <a href=3D"http://1=
72.16.0.254/24">172.16.0.254/24</a> and eth0 with <a href=3D"http://192.168=
.1.254/24">192.168.1.254/24</a> (for internet access through gw <a href=3D"=
http://192.168.1.1/24">192.168.1.1/24</a>) and virteth0 (manual, no ip, no =
dhcp), I want to bridge virteth0 and wg0.</div><div><br></div><div>Remote m=
achine with wg0 <a href=3D"http://172.16.0.1/24">172.16.0.1/24</a> and a pu=
blic ip on eth0 (e.g. <a href=3D"http://11.22.33.44/32">11.22.33.44/32</a>)=
</div><div><br></div><div>both virteth0&#39;s are connected together on the=
 host machine.</div><div><br></div><div>Is this somehow possible with wireg=
uard? As for now the Switch VM isn&#39;t a switch, it acts as a router whic=
h does work but is not something I want (and forces me to have a different =
ip on virteth0 on SwitchVM than wg0 has, this forces me to make everything =
look like it came from SwitchVM instead of the real addresses, because both=
 the remote machine and Switch VM have to act as routers, I want only 1 rou=
ter in this setup - the remote machine).</div><div><br></div><div>Thanks in=
 advance for your time and help :)</div></div>

--f403045c2688c69a910563972cfa--
