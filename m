Return-Path: smajor@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d78d025e
 for <wireguard@lists.zx2c4.com>; Thu, 2 Nov 2017 23:57:35 +0000 (UTC)
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ab3fe788
 for <wireguard@lists.zx2c4.com>; Thu, 2 Nov 2017 23:57:34 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id m72so1998374wmc.1
 for <wireguard@lists.zx2c4.com>; Thu, 02 Nov 2017 17:00:13 -0700 (PDT)
MIME-Version: 1.0
From: Stephen Major <smajor@gmail.com>
Date: Thu, 2 Nov 2017 17:00:12 -0700
Message-ID: <CALzTOmKz1qKVC=g4We51da6ZeGL-MxZudNC1eqwX5jYMaU47ZQ@mail.gmail.com>
Subject: Multi Link / VPN Bonding
To: wireguard@lists.zx2c4.com
Content-Type: multipart/alternative; boundary="94eb2c0c3960f236f3055d08c964"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--94eb2c0c3960f236f3055d08c964
Content-Type: text/plain; charset="UTF-8"

Hello,

I just learned about a method called VPN bonding which can bond together
several internet connections and essentially double or triple your
bandwidth. This is especially important for people who live in remote areas
and are subjected to crappy DSL providers.

It is achieved by load balancing packets across each tunnel and then
re-assembling them at the VPN server before sending the request to the
destination.


There are several guides using OpenVPN and other tools like:

https://github.com/zehome/MLVPN
https://www.simonmott.co.uk/2012/03/vpn-bonding/


I was wondering if this is possible with Wireguard as it seems to me the
performance of Wireguard would be much better suited for this application
especially if I was able to integrate it into home firewalls such as
Opnsense or PFSense


Another plus side that I read about this method is it provides an
additional level of security because even if someone successfully MITM
attacks the VPN tunnel the information would be scrambled and unable to be
read.

--94eb2c0c3960f236f3055d08c964
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div><br></div><div>I just learned about a method ca=
lled VPN bonding which can bond together several internet connections and e=
ssentially double or triple=C2=A0your bandwidth. This is especially importa=
nt for people who live in remote areas and are subjected to crappy DSL prov=
iders.</div><div><br></div><div>It is achieved by load balancing packets ac=
ross each tunnel and then re-assembling them at the VPN server before sendi=
ng the request to the destination.</div><div><br></div><div><br></div><div>=
There are several guides using OpenVPN and other tools like:=C2=A0</div><di=
v><br></div><div><a href=3D"https://github.com/zehome/MLVPN">https://github=
.com/zehome/MLVPN</a></div><div><a href=3D"https://www.simonmott.co.uk/2012=
/03/vpn-bonding/">https://www.simonmott.co.uk/2012/03/vpn-bonding/</a><br><=
/div><div><br></div><div><br></div><div>I was wondering if this is possible=
 with Wireguard as it seems to me the performance of Wireguard would be muc=
h better suited for this application especially if I was able to integrate =
it into home firewalls such as Opnsense or PFSense</div><div><br></div><div=
><br></div><div>Another plus side that I read about this method is it provi=
des an additional level of security because even if someone=C2=A0successful=
ly MITM attacks the VPN tunnel the information would be scrambled and unabl=
e to be read.</div></div>

--94eb2c0c3960f236f3055d08c964--
