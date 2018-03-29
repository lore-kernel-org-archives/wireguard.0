Return-Path: lanerussell028@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 87e46a2f
 for <wireguard@lists.zx2c4.com>;
 Thu, 29 Mar 2018 18:33:48 +0000 (UTC)
Received: from mail-lf0-f43.google.com (mail-lf0-f43.google.com
 [209.85.215.43])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 69b5ed86
 for <wireguard@lists.zx2c4.com>;
 Thu, 29 Mar 2018 18:33:47 +0000 (UTC)
Received: by mail-lf0-f43.google.com with SMTP id t132-v6so9750679lfe.2
 for <wireguard@lists.zx2c4.com>; Thu, 29 Mar 2018 11:46:05 -0700 (PDT)
MIME-Version: 1.0
From: Lane Russell <lanerussell028@gmail.com>
Date: Thu, 29 Mar 2018 13:46:03 -0500
Message-ID: <CA+ChcCBv1LNv9VkSMJ77RsQJ4xoS0SzDA4WvD4tO4hY9d82P-A@mail.gmail.com>
Subject: routing table doesn't report wireguard routes
To: wireguard@lists.zx2c4.com
Content-Type: multipart/alternative; boundary="f4f5e80728cc20c4c3056891898e"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--f4f5e80728cc20c4c3056891898e
Content-Type: text/plain; charset="UTF-8"

Ubuntu 16.04.4 LTS

Currently, WireGuard's routes don't seem to show up in the routing table,
at least as viewed via "route -n" and "netstat -rn".

Is this an issue, or am I misunderstanding the mechanism WireGuard uses to
route traffic?

In my case, the client config has "AllowedIPs = 0.0.0.0/0", and this is
working fine, it's just that the routes aren't visible.

--f4f5e80728cc20c4c3056891898e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:tahoma,s=
ans-serif;font-size:small">Ubuntu 16.04.4 LTS<br><br></div><div class=3D"gm=
ail_default" style=3D"font-family:tahoma,sans-serif;font-size:small">Curren=
tly, WireGuard&#39;s routes don&#39;t seem to show up in the routing table,=
 at least as viewed via &quot;route -n&quot; and &quot;netstat -rn&quot;.<b=
r><br></div><div class=3D"gmail_default" style=3D"font-family:tahoma,sans-s=
erif;font-size:small">Is this an issue, or am I misunderstanding the mechan=
ism WireGuard uses to route traffic?<br><br></div><div class=3D"gmail_defau=
lt" style=3D"font-family:tahoma,sans-serif;font-size:small">In my case, the=
 client config has &quot;AllowedIPs =3D <a href=3D"http://0.0.0.0/0">0.0.0.=
0/0</a>&quot;, and this is working fine, it&#39;s just that the routes aren=
&#39;t visible.<br></div></div>

--f4f5e80728cc20c4c3056891898e--
