Return-Path: vmalerba@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fb476768
 for <wireguard@lists.zx2c4.com>;
 Mon, 18 Jun 2018 12:03:38 +0000 (UTC)
Received: from mail-vk0-x22d.google.com (mail-vk0-x22d.google.com
 [IPv6:2607:f8b0:400c:c05::22d])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6f0710aa
 for <wireguard@lists.zx2c4.com>;
 Mon, 18 Jun 2018 12:03:38 +0000 (UTC)
Received: by mail-vk0-x22d.google.com with SMTP id 128-v6so9342223vkf.8
 for <wireguard@lists.zx2c4.com>; Mon, 18 Jun 2018 05:08:09 -0700 (PDT)
MIME-Version: 1.0
From: Vivien Malerba <vmalerba@gmail.com>
Date: Mon, 18 Jun 2018 14:08:08 +0200
Message-ID: <CAEP1ZN=6aqe3B1sJNhDfB5c86emK+Gk2YJ9d-GaVVYuRzeXYGA@mail.gmail.com>
Subject: Future changes in crypto algorithms
To: wireguard@lists.zx2c4.com
Content-Type: multipart/alternative; boundary="00000000000036594b056ee96b32"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--00000000000036594b056ee96b32
Content-Type: text/plain; charset="UTF-8"

Hi!
My understanding is that the crypto algorithms have been carefully chosen
to avoid having to include ciphers negotiations; with the assumption that
in case a weakness is ever found in one of them, the faulty algorithms will
be "replaced" and all people will have to do is update (the white paper
says "If holes are found in the underlying primitives, all endpoints will
be required to update").

However, for any organization which will use WireGuard, even if admins are
very effective at applying updates, updating all the endpoint systems
simultaneously is not realistic. At the same time, it may be the case that
the organization can't afford the downtime, in which case using WireGuard
will simply not be an option, which is too bad.

Maybe it's too early to think about this at the time, but otherwise I think
including a mechanism which would instruct the system as "for now, use the
new algorithms but still allow for the old ones if the new ones fail while
I update all the endpoints" would answer the problem.

Don't know how to implement that correctly though, but I just wanted to
bring that point to attention.

Best regards,
Vivien

--00000000000036594b056ee96b32
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:arial,he=
lvetica,sans-serif">Hi!</div><div class=3D"gmail_default" style=3D"font-fam=
ily:arial,helvetica,sans-serif">My understanding is that the crypto algorit=
hms have been carefully chosen to avoid having to include ciphers negotiati=
ons; with the assumption that in case a weakness is ever found in one of th=
em, the faulty algorithms will be &quot;replaced&quot; and all people will =
have to do is update (the white paper says &quot;If holes are found in the =
underlying primitives, all endpoints will be required to update&quot;).</di=
v><div class=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-se=
rif"><br></div><div class=3D"gmail_default" style=3D"font-family:arial,helv=
etica,sans-serif">However, for any organization which will use WireGuard, e=
ven if admins are very effective at applying updates, updating all the endp=
oint systems simultaneously is not realistic. At the same time, it may be t=
he case that the organization can&#39;t afford the downtime, in which case =
using WireGuard will simply not be an option, which is too bad.</div><div c=
lass=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif"><br=
></div><div class=3D"gmail_default" style=3D"font-family:arial,helvetica,sa=
ns-serif">Maybe it&#39;s too early to think about this at the time, but oth=
erwise I think including a mechanism which would instruct the system as &qu=
ot;for now, use the new algorithms but still allow for the old ones if the =
new ones fail while I update all the endpoints&quot; would answer the probl=
em.</div><div class=3D"gmail_default" style=3D"font-family:arial,helvetica,=
sans-serif"><br></div><div class=3D"gmail_default" style=3D"font-family:ari=
al,helvetica,sans-serif">Don&#39;t know how to implement that correctly tho=
ugh, but I just wanted to bring that point to attention.<br></div><div clas=
s=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif"><br></=
div><div class=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-=
serif">Best regards,</div><div class=3D"gmail_default" style=3D"font-family=
:arial,helvetica,sans-serif">Vivien<br></div><div class=3D"gmail_default" s=
tyle=3D"font-family:arial,helvetica,sans-serif"><br></div></div>

--00000000000036594b056ee96b32--
