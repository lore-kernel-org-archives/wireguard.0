Return-Path: gbojsza@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8db9e5bb
 for <wireguard@lists.zx2c4.com>; Sat, 5 May 2018 22:32:39 +0000 (UTC)
Received: from mail-pf0-x22f.google.com (mail-pf0-x22f.google.com
 [IPv6:2607:f8b0:400e:c00::22f])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 91af94e0
 for <wireguard@lists.zx2c4.com>; Sat, 5 May 2018 22:32:39 +0000 (UTC)
Received: by mail-pf0-x22f.google.com with SMTP id j20so5718779pff.10
 for <wireguard@lists.zx2c4.com>; Sat, 05 May 2018 15:34:48 -0700 (PDT)
MIME-Version: 1.0
From: Glen Bojsza <gbojsza@gmail.com>
Date: Sat, 5 May 2018 18:34:27 -0400
Message-ID: <CACW8NbAnCtceEQLqgJ6vaCHexH3dH_uq82TTPuYKeb-C55NM-Q@mail.gmail.com>
Subject: Wireguard client not roaming
To: wireguard@lists.zx2c4.com
Content-Type: multipart/alternative; boundary="0000000000004631e2056b7d0b62"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--0000000000004631e2056b7d0b62
Content-Type: text/plain; charset="UTF-8"

Hello,

I have two open-wrt routers running wireguard.

B1300 wireguard Client and B1300 wireguard server.

I leave the B1300 wireguard server at the main location and take the B1300
wireguard client to different locations for testing speeds against
different ISPs.

The B1300 wireguard client fails to connect when moved from site to site
unless the B1300 wireguard server is rebooted?

To get the testing I need done for speeds I had to have someone reboot the
B1300 wireguard server...once it came up the B1300 wireguard client would
connect without any other issues and I did my testing (side note - the
speeds tested showed excellent speeds compared to my OpenVPN server back at
the main location).

There must be a configuration parameter that tells the wireguard server to
look for a new connection on wg0 interface ...I am guessing that the keep
alive timer (set for 25 seconds) locks the wg0 interface up...or not.

I am hoping for any advice that can help me to fix this issue given I have
a long trip coming up in a few weeks and I would prefer wireguard to
OpenVPN given it's speed.

thanks.

--0000000000004631e2056b7d0b62
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div><br></div><div>I have two open-wrt routers runn=
ing wireguard.</div><div><br></div><div>B1300 wireguard Client and B1300 wi=
reguard server.</div><div><br></div><div>I leave the B1300 wireguard server=
 at the main location and take the B1300 wireguard client to different loca=
tions for testing speeds against different ISPs.</div><div><br></div><div>T=
he B1300 wireguard client fails to connect when moved from site to site unl=
ess the B1300 wireguard server is rebooted?</div><div><br></div><div>To get=
 the testing I need done for speeds I had to have someone reboot the B1300 =
wireguard server...once it came up the B1300 wireguard client would connect=
 without any other issues and I did my testing (side note - the speeds test=
ed showed excellent speeds compared to my OpenVPN server back at the main l=
ocation).</div><div><br></div><div>There must be a configuration parameter =
that tells the wireguard server to look for a new connection on wg0 interfa=
ce ...I am guessing that the keep alive timer (set for 25 seconds) locks th=
e wg0 interface up...or not.</div><div><br></div><div>I am hoping for any a=
dvice that can help me to fix this issue given I have a long trip coming up=
 in a few weeks and I would prefer wireguard to OpenVPN given it&#39;s spee=
d.</div><div><br></div><div>thanks.</div></div>

--0000000000004631e2056b7d0b62--
