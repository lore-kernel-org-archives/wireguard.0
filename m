Return-Path: me.kalin@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c6bcd1b0
 for <wireguard@lists.zx2c4.com>;
 Thu, 16 Aug 2018 19:28:23 +0000 (UTC)
Received: from mail-oi0-x22d.google.com (mail-oi0-x22d.google.com
 [IPv6:2607:f8b0:4003:c06::22d])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 873b9130
 for <wireguard@lists.zx2c4.com>;
 Thu, 16 Aug 2018 19:28:23 +0000 (UTC)
Received: by mail-oi0-x22d.google.com with SMTP id q11-v6so10096590oic.12
 for <wireguard@lists.zx2c4.com>; Thu, 16 Aug 2018 12:40:34 -0700 (PDT)
MIME-Version: 1.0
References: <20180815091700.0d1d5923@web.de>
In-Reply-To: <20180815091700.0d1d5923@web.de>
From: Kalin KOZHUHAROV <me.kalin@gmail.com>
Date: Thu, 16 Aug 2018 21:40:20 +0200
Message-ID: <CAKXLc7dAUQbM_v3xhTzzamQ=O10W1eiVkke6augaFSJZ9RhH_g@mail.gmail.com>
Subject: Re: Connection between two clients
To: Andreas Fink <finkandreas@web.de>
Content-Type: multipart/alternative; boundary="000000000000cbcfbc0573929d04"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--000000000000cbcfbc0573929d04
Content-Type: text/plain; charset="UTF-8"

Probanly a routing problem, check `ip route show` on (one) client and
server.

Also you might need to enable ip forwarding on server (usually enabled on
firewalls and routers). No iptables are not necessary if everything is one
subnet.

Cheers,
Kalin.

--000000000000cbcfbc0573929d04
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Probanly a routing problem, check `ip route show` on=
 (one) client and server.</div><div dir=3D"auto"><br><div dir=3D"auto">Also=
 you might need to enable ip forwarding on server (usually enabled on firew=
alls and routers). No iptables are not necessary if everything is one subne=
t.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Cheers,<br><div dir=
=3D"auto">Kalin.</div></div></div></div>

--000000000000cbcfbc0573929d04--
