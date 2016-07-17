Return-Path: konstantin.menyaev@gmail.com
Received: from mail-oi0-f47.google.com (mail-oi0-f47.google.com
 [209.85.218.47])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bbe1966b
 for <wireguard@lists.zx2c4.com>;
 Sun, 17 Jul 2016 10:15:18 +0000 (UTC)
Received: by mail-oi0-f47.google.com with SMTP id w18so218784841oiw.3
 for <wireguard@lists.zx2c4.com>; Sun, 17 Jul 2016 03:16:43 -0700 (PDT)
MIME-Version: 1.0
From: "vvviperrr00 ." <konstantin.menyaev@gmail.com>
Date: Sun, 17 Jul 2016 13:16:41 +0300
Message-ID: <CAKS1Xx7FuQ6AkPjA3NMzF-iiEcn+EJf_Wo4MHfzO+65W25=bJw@mail.gmail.com>
To: Jason@zx2c4.com
Content-Type: multipart/alternative; boundary=001a113cc326e0e2e30537d2256b
Cc: wireguard@lists.zx2c4.com
Subject: [WireGuard] Android client
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a113cc326e0e2e30537d2256b
Content-Type: text/plain; charset=UTF-8

Hi!

First of all, sry for my lang, not native speaker.

Totally love u work, already use it in my personal needs instead of openvpn
solution. So i started working on android wireguard client (android VpnApi
based on tun driver) in my free time. Already done robust VpnService (glued
with JNI for using userspace wg impl) implementation + activity with simple
UI.

Some thoughts about userspace impl:
1. It must be library, not an app.
2. I think C language is more suitable for library, than rust or go (due to
portability issues).

Library interface could be something like that:
void wg_up(params); // create udp socket, listen for dgrams, etc
void put_data(packet); // send packet through wg (which we received from
tun)
void on_new_data(packet); // callback, wg received new packet (we can put
in into tun)
void wg_down();

The pros of lib solution is pretty clear: portability. We can even use it
without tun driver, create build-in apps with lwip, for instance.

What do you think about that?

--001a113cc326e0e2e30537d2256b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi!<div><br></div><div>First of all, sry for my lang, not =
native speaker.</div><div><br><div>Totally love u work, already use it in m=
y personal needs instead of openvpn solution. So i started working on andro=
id wireguard client (android VpnApi based on tun driver) in my free time. A=
lready done robust VpnService (glued with JNI for using userspace wg impl) =
implementation + activity with simple UI.</div></div><div><br></div><div>So=
me thoughts about userspace impl:<br></div><div>1. It must be library, not =
an app.</div><div>2. I think C language is more suitable for library, than =
rust or go (due to portability issues).</div><div><br></div><div>Library in=
terface could be something like that:</div><div>void wg_up(params); // crea=
te udp socket, listen for dgrams, etc</div><div>void put_data(packet); // s=
end packet through wg (which we received from tun)</div><div>void on_new_da=
ta(packet); // callback, wg received new packet (we can put in into tun)</d=
iv><div>void wg_down();</div><div><br></div><div>The pros of lib solution i=
s pretty clear: portability. We can even use it without tun driver, create =
build-in apps with lwip, for instance.</div><div><br></div><div>What do you=
 think about that?<br></div></div>

--001a113cc326e0e2e30537d2256b--
