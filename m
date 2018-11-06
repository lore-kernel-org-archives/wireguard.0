Return-Path: <SRS0=8Q1O=NR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D788DC32789
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  6 Nov 2018 19:45:15 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3BEF020830
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  6 Nov 2018 19:45:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WO9bhKod"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3BEF020830
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 44255c95;
	Tue, 6 Nov 2018 19:40:50 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b4110611
 for <wireguard@lists.zx2c4.com>; Tue, 6 Nov 2018 07:57:21 +0000 (UTC)
Received: from mail-it1-x133.google.com (mail-it1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3cad749a
 for <wireguard@lists.zx2c4.com>; Tue, 6 Nov 2018 07:57:21 +0000 (UTC)
Received: by mail-it1-x133.google.com with SMTP id k206-v6so16649734ite.0
 for <wireguard@lists.zx2c4.com>; Tue, 06 Nov 2018 00:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=4pliJsF/RKEWfvuSJM9BM/XATGObN3/p68ztYzbNW9U=;
 b=WO9bhKod8F1qel8KxN7zAYKN0CSaiKiZLGEemnxyw1t1baSdD4hNr//AlyzzbiryMC
 JHXdkqEZihBMwXQtbyNBqd3e8KPpTC+pwjqQG/W6t8vkNW3JhdH239BSMOiVG2Aibffy
 ZLBUgui6ZrCeAbqgEl0IQqXwdnhoZgK+sRBZbkJpnx0bcj4OZHypB0HjVfOBCO2ALElF
 pku8DbojX6+wey0qauNNLZmN38ToNswPnV9CbsCTJjRU9NsUE2fqvAtmPDZrZd1sky0y
 e+LpLbM1za94gNtGJ1RGIfUIAXY9s77rDR7P+WDrLAJs0tnJAnjZKZmcNhZZdHQLKBw3
 NPJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=4pliJsF/RKEWfvuSJM9BM/XATGObN3/p68ztYzbNW9U=;
 b=o2LQBd7qBwpuHCUnUEjHj6XPs9iNaJBTmR1IHI3zMoFMRo9rWXXa5KoNCZKcG0+ZCF
 NCYO2k6xk8bnt34/27+M4s6yF47wx/LtGWliDNtR4mi891bP9ZPe3GEgfZoVpKhdLTwF
 xap6qqwLCmO3A2QEQVO7K49/AHgbnEpUXe7p7FQXKq/ctPPTfpZBvfurJgz7s/6QlFFw
 j2d0VH3xYPHP0Iwr2AQoEK8UR+ZwgTyEhdLmTDOv5rwo7lWVngKcHIpUtZxxc1XdyjvK
 7iY6rukllrS54ckcCcCPykCC73KCIWnzx3vQcgUg3JPQfGVO7vUmMr59HujfAHkximl6
 rszA==
X-Gm-Message-State: AGRZ1gLVBpQ2ZEwrgOjHUr+iCuLfhSXL12lrQu2ZRmyhHSSPxtL1Na1K
 hj7OllX8H+aZ1e+haU8mFeCHmkZ6DqilPXTGTtgK6Q==
X-Google-Smtp-Source: AJdET5daVIeyBCZwjeg5csTJzr/J9OH7S8oPZxTXWVO0W6R898Equ+V193+QarDk9iQ9rS70P4NF8NwbatEIOTd+vAI=
X-Received: by 2002:a24:81c1:: with SMTP id
 q184-v6mr1203689itd.152.1541491299194; 
 Tue, 06 Nov 2018 00:01:39 -0800 (PST)
MIME-Version: 1.0
From: Lars Francke <lars.francke@gmail.com>
Date: Tue, 6 Nov 2018 09:01:02 +0100
Message-ID: <CAD-Ua_hRW4RyOMrP3jX3hAAVLJCLHXYPvYY_PaK0y-=r_HhTQQ@mail.gmail.com>
Subject: Question about AllowedIPs and proper "mesh" setup
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Tue, 06 Nov 2018 20:40:49 +0100
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1112050002000314930=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============1112050002000314930==
Content-Type: multipart/alternative; boundary="000000000000501ee30579fa69c0"

--000000000000501ee30579fa69c0
Content-Type: text/plain; charset="UTF-8"

Hi,

I've been playing around with WireGuard recently. Thank you for all your
work on it.

It all mostly works but I have one thing that I can't grasp properly:

My setup are a bunch of servers that need to communicate securely over an
unsecured network. Like a mesh. So I have three servers and each of them
has a connection to the other two (i.e. two Peers). This all works
beautifully.

Now I want to add an outside client into the mix (e.g. my laptop). I want
to be able to connect to just one of those hosts and have that host forward
my packages to the others.

I can get it to work if I pick _one_ specific jump host but I haven't
managed to set it up in a way that I can connect to any of them.

(I'm leaving out Private & Public Key, Ports and Endpoints to make the
examples shorter.

Client wg0.conf:
[Interface]
Address = 10.0.1.1

# Server 1
[Peer]
AllowedIPs = 10.0.0.1/24


Server 1 wg0.conf:
[Interface]
Address    = 10.0.0.1

# Client
[Peer]
AllowedIPs = 10.0.1.1/32

# Server 2
[Peer]
AllowedIPs = 10.0.0.2, __10.0.1.1/32__

# Server 3
[Peer]
AllowedIPs = 10.0.0.3, __10.0.1.1/32__


Server 2 wg0.conf:
[Interface]
Address    = 10.0.0.2

# Client
[Peer]
AllowedIPs = 10.0.1.1/32

# Server 1
[Peer]
AllowedIPs = 10.0.0.1, __10.0.1.1/32__

# Server 3
[Peer]
AllowedIPs = 10.0.0.3, __10.0.1.1/32__


Server 3 etc. are similar.
This way I can connect with my client to any of the Servers and I can ping
them (e.g. ping 10.0.0.1) but I can _not_ ping the others: So when I
connect to server-1 I can not reach server-2 from my client (IP forwarding
etc. is enabled).

This only works when I remove the second IP from AllowedIPs (the one marked
with underscores) from the server I connect to (e.g. server 1). The other
servers (e.g. server 2 & 3) need it though because of course they'll see
traffic from 10.0.1.1 being forwarded to them so it needs to be in their
AllowedIPs.

That means I can get everything to work if I pick one special host that
Clients connect to.

I might just fundamentally misunderstand how AllowedIPs works. Any help is
greatly appreciated


An unrelated question: Should wg-quick up be allowed to be called with just
a file name?
e.g. wg-quick up wg0.conf?
I understand the man page that it should but I think the behavior is broken
on MacOS/Darwin because it tries to cd into the file which fails.


Cheers,
Lars

--000000000000501ee30579fa69c0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Hi,<div=
><br></div><div>I&#39;ve been playing around with WireGuard recently. Thank=
 you for all your work on it.</div><div><br></div><div>It all mostly works =
but I have one thing that I can&#39;t grasp properly:</div><div><br></div><=
div>My setup are a bunch of servers that need to communicate securely over =
an unsecured network. Like a mesh. So I have three servers and each of them=
 has a connection to the other two (i.e. two Peers). This all works beautif=
ully.</div><div><br></div><div>Now I want to add an outside client into the=
 mix (e.g. my laptop). I want to be able to connect to just one of those ho=
sts and have that host forward my packages to the others.</div><div><br></d=
iv><div>I can get it to work if I pick _one_ specific jump host but I haven=
&#39;t managed to set it up in a way that I can connect to any of them.</di=
v><div><br></div><div>(I&#39;m leaving out Private &amp; Public Key, Ports =
and Endpoints to make the examples shorter.</div><div><br></div><div>Client=
 wg0.conf:</div><div><div>[Interface]</div><div>Address =3D 10.0.1.1</div><=
div><br></div><div># Server 1</div><div>[Peer]</div><div>AllowedIPs =3D <a =
href=3D"http://10.0.0.1/24" target=3D"_blank">10.0.0.1/24</a><br></div><div=
><br></div></div><div><br></div><div>Server 1 wg0.conf:</div><div><div>[Int=
erface]</div><div>Address=C2=A0 =C2=A0 =3D 10.0.0.1</div><div><br></div><di=
v># Client</div><div>[Peer]</div><div>AllowedIPs =3D <a href=3D"http://10.0=
.1.1/32" target=3D"_blank">10.0.1.1/32</a><br></div><div><br></div><div># S=
erver 2</div><div>[Peer]</div><div>AllowedIPs =3D 10.0.0.2, __<a href=3D"ht=
tp://10.0.1.1/32__" target=3D"_blank">10.0.1.1/32__</a><br></div><div><br><=
/div><div># Server 3</div><div>[Peer]</div><div>AllowedIPs =3D 10.0.0.3, __=
<a href=3D"http://10.0.1.1/32__" target=3D"_blank">10.0.1.1/32__</a><br></d=
iv><div><br></div></div><div><br></div><div>Server 2 wg0.conf:</div><div><d=
iv><div>[Interface]</div><div>Address=C2=A0 =C2=A0 =3D 10.0.0.2</div><div><=
br></div><div># Client</div><div>[Peer]</div><div>AllowedIPs =3D <a href=3D=
"http://10.0.1.1/32" target=3D"_blank">10.0.1.1/32</a><br></div><div><br></=
div><div># Server 1</div><div>[Peer]</div><div>AllowedIPs =3D 10.0.0.1, __<=
a href=3D"http://10.0.1.1/32__" target=3D"_blank">10.0.1.1/32__</a></div><d=
iv><br></div><div># Server 3</div><div>[Peer]</div><div>AllowedIPs =3D 10.0=
.0.3, __<a href=3D"http://10.0.1.1/32__" target=3D"_blank">10.0.1.1/32__</a=
><br></div><br class=3D"m_2874486856306739988m_8964412997326980321gmail-App=
le-interchange-newline"></div></div><div><br></div><div>Server 3 etc. are s=
imilar.</div><div>This way I can connect with my client to any of the Serve=
rs and I can ping them (e.g. ping 10.0.0.1) but I can _not_ ping the others=
: So when I connect to server-1 I can not reach server-2 from my client (IP=
 forwarding etc. is enabled).</div><div><br></div><div>This only works when=
 I remove the second IP from AllowedIPs (the one marked with underscores) f=
rom the server I connect to (e.g. server 1). The other servers (e.g. server=
 2 &amp; 3) need it though because of course they&#39;ll see traffic from 1=
0.0.1.1 being forwarded to them so it needs to be in their AllowedIPs.</div=
><div><br></div><div>That means I can get everything to work if I pick one =
special host that Clients connect to.</div><div><br></div><div>I might just=
 fundamentally misunderstand how AllowedIPs works. Any help is greatly appr=
eciated<br></div><div><br></div><div><br></div><div>An unrelated question: =
Should wg-quick up be allowed to be called with just a file name?=C2=A0</di=
v><div>e.g. wg-quick up wg0.conf?</div><div>I understand the man page that =
it should but I think the behavior is broken on MacOS/Darwin because it tri=
es to cd into the file which fails.</div><div><br></div><div><br></div><div=
>Cheers,</div><div>Lars</div></div></div></div></div>

--000000000000501ee30579fa69c0--

--===============1112050002000314930==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============1112050002000314930==--
