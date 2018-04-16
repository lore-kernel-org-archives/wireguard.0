Return-Path: cedrickienzler1@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cb2c6238
 for <wireguard@lists.zx2c4.com>;
 Mon, 16 Apr 2018 09:11:38 +0000 (UTC)
Received: from mail-vk0-f46.google.com (mail-vk0-f46.google.com
 [209.85.213.46])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d78a1ebd
 for <wireguard@lists.zx2c4.com>;
 Mon, 16 Apr 2018 09:11:38 +0000 (UTC)
Received: by mail-vk0-f46.google.com with SMTP id x204so9028522vkd.7
 for <wireguard@lists.zx2c4.com>; Mon, 16 Apr 2018 02:26:09 -0700 (PDT)
MIME-Version: 1.0
From: cedric Kienzler <cedrickienzler1@gmail.com>
Date: Mon, 16 Apr 2018 11:26:08 +0200
Message-ID: <CAApANAYEwJfsopDUvDOHv5jZ62oz88wHsggVPLPgjzUMzaWCkA@mail.gmail.com>
Subject: Bird OSPF Problems
To: wireguard@lists.zx2c4.com
Content-Type: multipart/alternative; boundary="001a1141d542da17550569f3cff5"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a1141d542da17550569f3cff5
Content-Type: text/plain; charset="UTF-8"

Hey List,

i'm currently facing issues with OSPF over the wireguard tunnel.

I use both, IPv4 and IPv6 and everything works fine. I can ping through the
tunnel, traffic flows perfectly, but when i try to configure OSPF using the
Bird routing daemon, i didn't even see a HELLO message. Also when trying to
list the interface using 'show ospf interfaces' i didn't even see the
Interface.

For IPv6 i use 2a03.... as prefix.
Should i configure multicast IPv6 (fe80::) on the interface too to get OSPF
working?

Interesting fact: BGB using Bird works just fine.

Anyone here that could help me?


Thanks a lot.

Best regards,
Cedi

--001a1141d542da17550569f3cff5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div><div><div><div><div>Hey List,<br>=
<br></div>i&#39;m currently facing issues with OSPF over the wireguard tunn=
el.<br><br></div>I use both, IPv4 and IPv6 and everything works fine. I can=
 ping through the tunnel, traffic flows perfectly, but when i try to config=
ure OSPF using the Bird routing daemon, i didn&#39;t even see a HELLO messa=
ge. Also when trying to list the interface using &#39;show ospf interfaces&=
#39; i didn&#39;t even see the Interface.<br><br></div>For IPv6 i use 2a03.=
... as prefix.<br></div>Should i configure multicast IPv6 (fe80::) on the i=
nterface too to get OSPF working?<br><br></div>Interesting fact: BGB using =
Bird works just fine.<br><br></div>Anyone here that could help me?<br><br><=
br></div>Thanks a lot.<br><br></div>Best regards,<br></div>Cedi<br></div>

--001a1141d542da17550569f3cff5--
