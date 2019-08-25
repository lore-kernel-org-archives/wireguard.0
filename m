Return-Path: <SRS0=QHSY=WV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,T_KAM_HTML_FONT_INVALID
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E49CC3A5A3
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 19:24:52 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9691206BA
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 19:24:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=althea.net header.i=@althea.net header.b="Y4f+C4/x";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="xW5OQ+zv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9691206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=althea.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a95b0015;
	Sun, 25 Aug 2019 19:23:15 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3c87cb82
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 19:12:05 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 87c5d5b8
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 19:12:05 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id ED3F921C7A
 for <wireguard@lists.zx2c4.com>; Sun, 25 Aug 2019 15:12:04 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Sun, 25 Aug 2019 15:12:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=althea.net; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm1; bh=W+0/8vvdMWGhZlrPuFILnxWCjFkYFlV
 q0i5hKC3AXo8=; b=Y4f+C4/xmlzv3ER02G39Pd3XBFZw0LciMNDEfykSXqz6TMg
 bASqfqGyx2He6RgILi9Rdg+fgI/w5pi/eHKqYEeQWsbWu4HJBKrWvA6nE0rXSmOb
 8GJF3IY5NJe8+f+1V7klBNw6C08h3ZVfvPDmnVU0CgpJYDtZwnj1s97svxNzc6Ue
 cSypc78z/660faKm5XgHRJ6Niot1XKOHKototkuLNulyBxetLvhfh9RSAXBrtfSf
 fH/cPhD+FIB0qgiaiOfKWXML/CrYRu5p/2t5Hakd3LfKtsSy8nT36PD7jZKVrRXT
 JgJfg5Z/vxEcIDO3hm4ZY+ffHGPt44VXtewNvCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=W+0/8v
 vdMWGhZlrPuFILnxWCjFkYFlVq0i5hKC3AXo8=; b=xW5OQ+zv5SlHKeK1PQXNgn
 EZ0wURD7pFv1kGjSADOK+VKhySX5W1cCAMpgjp/RY6457OvGPvBnaQHKA0Z5kDjF
 mAKy/2S8UTY01ew7oD3WWqcbVNhp9FCT6vryCZi7Bqe6XP5JkvVhSkZDQhKnhGET
 DejfrgqLTsNQPEBSeJIMar02ynyUNc+GXk8mVqXZZo5zKmS5YmiBQJUt6Z2kyhMB
 7U+QafJkX/w+54tdXXdHPBq8eCXzx+KGlh+TdtaPX0MnhQNznPkzURS1YCgzsOgt
 zaX1/p1OfwbqN0r7GP4ZFE+ONg6kTXTwbBPeUPvuLACUUAKCKEMFQ8dboJ7+9IOQ
 ==
X-ME-Sender: <xms:hN1iXYqx9etU-a2uNHkNnteLh7677vHt0ZyUf5X_dJcE7ZzhN2r63Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudehvddgudefiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgesrg
 dtreerreerjeenucfhrhhomhepfdfluhhsthhinhcumfhilhhprghtrhhitghkfdcuoehj
 uhhsthhinhesrghlthhhvggrrdhnvghtqeenucffohhmrghinhepghhithhhuhgsrdgtoh
 hmpdiigidvtgegrdgtohhmnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjuhhsthhinhes
 rghlthhhvggrrdhnvghtnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:hN1iXS4wUVr7xErw96LUpSCp7wW5rV1OwFRmXz62-cMLMmclw7hj5w>
 <xmx:hN1iXQzLk7YTVMw15wpUJ3hvN5erCyDJEI50yxP86tOZbAQ4sVHHFA>
 <xmx:hN1iXfBMlnRD4Uika_Adzq_F92Jzm7NGTNScfuoMhe9qiEXIcoTUgw>
 <xmx:hN1iXTUgzhMSkL6XRxqQXG1rQZyHP2swjyg0OeaiIp7zbjozQM327g>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 6A458E00A3; Sun, 25 Aug 2019 15:12:04 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-916-g49fca03-fmstable-20190821v7
Mime-Version: 1.0
Message-Id: <4bb0af33-4378-4cf0-85b2-2e65297a5760@www.fastmail.com>
In-Reply-To: <CACu-5+1gKi4h0Jft5tMphM5PVOiDhBuqCiE7zbCGMTHvwWW05Q@mail.gmail.com>
References: <CACu-5+1gKi4h0Jft5tMphM5PVOiDhBuqCiE7zbCGMTHvwWW05Q@mail.gmail.com>
Date: Sun, 25 Aug 2019 15:11:44 -0400
From: "Justin Kilpatrick" <justin@althea.net>
To: wireguard@lists.zx2c4.com
Subject: Re: wireguard on openwrt with mwan3 (multi ip address)
X-Mailman-Approved-At: Sun, 25 Aug 2019 21:23:11 +0200
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
Content-Type: multipart/mixed; boundary="===============7200214515588201723=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============7200214515588201723==
Content-Type: multipart/alternative;
 boundary=172b2656565d4bae8473edd7062d838c

--172b2656565d4bae8473edd7062d838c
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable

I have a similar setup, a tunnel routed over several different interface=
s.=20

Configure both ends of the tunnel with all of the connection details and=
 set an aggressive keepalive (5 seconds is what I use).=20


--=20
 Justin Kilpatrick
 justin@althea.net



On Sun, Aug 25, 2019, at 11:49 AM, =E6=9B=B9=E7=85=9C wrote:
> Hi,
> I'm using wireguard on openwrt, and I have multi wan links. When I use=
 wireguard as a server with mwan3, the wireguard client won't handshake =
because inbound interface and outbound interface is different.
>=20
> Details please see:
> https://github.com/openwrt/packages/issues/9538
>=20
> How to fix this issue? Thanks.
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>=20

--172b2656565d4bae8473edd7062d838c
Content-Type: text/html;charset=utf-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head><title></title><style type=3D"text/css">p.Mso=
Normal,p.MsoNoSpacing{margin:0}</style></head><body><div>I have a simila=
r setup, &nbsp;a tunnel routed over several different interfaces. <br></=
div><div><br></div><div>Configure both ends of the tunnel with all of th=
e connection details and set an aggressive keepalive (5 seconds is what =
I use). <br></div><div><br></div><div><br></div><div id=3D"sig65957160">=
<div class=3D"signature">--&nbsp;<br></div><div class=3D"signature">&nbs=
p; Justin Kilpatrick<br></div><div class=3D"signature">&nbsp; justin@alt=
hea.net<br></div><div class=3D"signature"><br></div></div><div><br></div=
><div><br></div><div>On Sun, Aug 25, 2019, at 11:49 AM, =E6=9B=B9=E7=85=9C=
 wrote:<br></div><blockquote type=3D"cite" id=3D"qt"><div dir=3D"ltr"><d=
iv>Hi,<br></div><div><span style=3D"font-family:arial, sans-serif" class=
=3D"font">I'm using wireguard on openwrt, and I have multi wan links. Wh=
en I use wireguard as a server with mwan3, the wireguard client won't ha=
ndshake because&nbsp;<span style=3D"background-color:transparent" class=3D=
"highlight"><span style=3D"color:rgb(36, 41, 46)" class=3D"colour">inbou=
nd interface and outbound interface is different.</span></span></span><b=
r></div><div><br></div><div>Details please see:<br></div><div><a href=3D=
"https://github.com/openwrt/packages/issues/9538">https://github.com/ope=
nwrt/packages/issues/9538</a><br></div><div><div><br></div><div>How to f=
ix this issue? Thanks.<br></div></div></div><div>_______________________=
________________________<br></div><div>WireGuard mailing list<br></div><=
div>WireGuard@lists.zx2c4.com<br></div><div>https://lists.zx2c4.com/mail=
man/listinfo/wireguard<br></div><div><br></div></blockquote><div><br></d=
iv></body></html>
--172b2656565d4bae8473edd7062d838c--

--===============7200214515588201723==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============7200214515588201723==--
