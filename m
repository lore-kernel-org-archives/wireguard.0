Return-Path: <SRS0=7TlJ=W3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5323C3A59F
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 31 Aug 2019 08:20:24 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C66A023697
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 31 Aug 2019 08:20:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="uUjvHqSm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C66A023697
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=honson.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 88a5f2c4;
	Sat, 31 Aug 2019 08:20:06 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0fa06247
 for <wireguard@lists.zx2c4.com>;
 Sat, 31 Aug 2019 08:20:02 +0000 (UTC)
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aa408c9b
 for <wireguard@lists.zx2c4.com>;
 Sat, 31 Aug 2019 08:20:02 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id CBB403F1
 for <wireguard@lists.zx2c4.com>; Sat, 31 Aug 2019 04:20:00 -0400 (EDT)
Received: from imap1 ([10.202.2.51])
 by compute3.internal (MEProxy); Sat, 31 Aug 2019 04:20:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=xU6BqxA/Bu4oZ7hrqkWb+VE1DLWu1
 evvAzBYUtt+4kc=; b=uUjvHqSm7AmR2gtgwwcKMCfIH+lfbjy2rFPOFZHApRGct
 qkjqX0Z0xJEMFYHRXC9AZDVeSRb5yjHeFwzrNtPQ0pOLz99mseM3epcx2aUqRLQe
 TGYDGKaGnpXQ4pk+aYXLFXLnNjwpJjFlQw2ic4Gr+5NBOry3KQwnDdnsLKMnCe3B
 If5aZmYUJ1ujE6Ra6mQst3d8P+4DG0/CsQhmihFMzG/yv7jkG9vlWllqzpxQQ0qk
 jx9H84/QcFHeghF2Zr/JNEyNfAyszaagfYLyEyOktvuh1iA23TuBI9Tu8Gw6J5+9
 LkJ4Uh5R39ReOgsZgT1jVw/7EkhZ01PeMy5TxrIng==
X-ME-Sender: <xms:ry1qXb9yzFxjTp1BDFsSBYnKM6JKeSS2XhemBwrdIUZLGHEfAwPwEw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudeihedgudefgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkfffhvffutgesrgdtre
 erreertdenucfhrhhomhepfdfuthgvvhgvnhcujfhonhhsohhnfdcuoehsthgvvhgvnhes
 hhhonhhsohhnrdhiugdrrghuqeenucfrrghrrghmpehmrghilhhfrhhomhepshhtvghvvg
 hnsehhohhnshhonhdrihgurdgruhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:ry1qXTau3g8B9Qb_HoAgr3zNwNe5HstC9O2av56cNaufyewLAke10g>
 <xmx:ry1qXVeykXB1g4ljHvNhsaj3NcGgq8I8yJ-ublZQgTfdPVeci47vnQ>
 <xmx:ry1qXQnxlAo_lFMOSgilAN7xubPHIFHn8gZ8ZCJ8jL3ZLMfMBtbaTQ>
 <xmx:sC1qXXh7MP8JIMv5CvnN1Ts2-Mep_Rq6CCgnZxE5WIZpMHD3qWsYeQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id EC629C200A4; Sat, 31 Aug 2019 04:19:58 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-154-gfa7592a-fmstable-20190829v1
Mime-Version: 1.0
Message-Id: <7f2230df-ffe2-4072-9970-4fac371deee0@www.fastmail.com>
Date: Sat, 31 Aug 2019 18:18:18 +1000
From: "Steven Honson" <steven@honson.id.au>
To: wireguard@lists.zx2c4.com
Subject: [PATCH] tools: use new name for userspace_has_wireguard_iface
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
Content-Type: multipart/mixed; boundary="===============5026200237658831546=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============5026200237658831546==
Content-Type: multipart/alternative;
 boundary=5be0f5b5ea2a4a00a4ef7867427c393a

--5be0f5b5ea2a4a00a4ef7867427c393a
Content-Type: text/plain

Signed-off-by: Steven Honson <steven@honson.id.au>
---
src/tools/ipc.c | 6 +++---
1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/src/tools/ipc.c b/src/tools/ipc.c
index d3452be..1739c63 100644
--- a/src/tools/ipc.c
+++ b/src/tools/ipc.c
@@ -186,7 +186,7 @@ static int userspace_get_wireguard_interfaces(struct inflatable_buffer *buffer)
if (strncmp(end, SOCK_SUFFIX, strlen(SOCK_SUFFIX)))
continue;
*end = '\0';
- if (!userspace_has_wireguard_interface(ent->d_name))
+ if (!userspace_has_wireguard_iface(ent->d_name))
continue;
buffer->next = strdup(ent->d_name);
buffer->good = true;
@@ -966,7 +966,7 @@ cleanup:
int ipc_get_device(struct wgdevice **dev, const char *iface)
{
#ifdef __linux__
- if (userspace_has_wireguard_interface(iface))
+ if (userspace_has_wireguard_iface(iface))
return userspace_get_device(dev, iface);
return kernel_get_device(dev, iface);
#else
@@ -977,7 +977,7 @@ int ipc_get_device(struct wgdevice **dev, const char *iface)
int ipc_set_device(struct wgdevice *dev)
{
#ifdef __linux__
- if (userspace_has_wireguard_interface(dev->name))
+ if (userspace_has_wireguard_iface(dev->name))
return userspace_set_device(dev);
return kernel_set_device(dev);
#else
--
2.21.0
--5be0f5b5ea2a4a00a4ef7867427c393a
Content-Type: text/html
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head><title></title><style type=3D"text/css">p.Mso=
Normal,p.MsoNoSpacing{margin:0}</style></head><body><div>Signed-off-by: =
Steven Honson &lt;<a href=3D"mailto:steven@honson.id.au">steven@honson.i=
d.au</a>&gt;<br></div><div>---<br></div><div>src/tools/ipc.c | 6 +++---<=
br></div><div>1 file changed, 3 insertions(+), 3 deletions(-)<br></div><=
div><br></div><div>diff --git a/src/tools/ipc.c b/src/tools/ipc.c<br></d=
iv><div>index d3452be..1739c63 100644<br></div><div>--- a/src/tools/ipc.=
c<br></div><div>+++ b/src/tools/ipc.c<br></div><div>@@ -186,7 +186,7 @@ =
static int userspace_get_wireguard_interfaces(struct inflatable_buffer *=
buffer)<br></div><div>if (strncmp(end, SOCK_SUFFIX, strlen(SOCK_SUFFIX))=
)<br></div><div>continue;<br></div><div>*end =3D '\0';<br></div><div>-		=
if (!userspace_has_wireguard_interface(ent-&gt;d_name))<br></div><div>+	=
	if (!userspace_has_wireguard_iface(ent-&gt;d_name))<br></div><div>conti=
nue;<br></div><div>buffer-&gt;next =3D strdup(ent-&gt;d_name);<br></div>=
<div>buffer-&gt;good =3D true;<br></div><div>@@ -966,7 +966,7 @@ cleanup=
:<br></div><div>int ipc_get_device(struct wgdevice **dev, const char *if=
ace)<br></div><div>{<br></div><div>#ifdef __linux__<br></div><div>-	if (=
userspace_has_wireguard_interface(iface))<br></div><div>+	if (userspace_=
has_wireguard_iface(iface))<br></div><div>return userspace_get_device(de=
v, iface);<br></div><div>return kernel_get_device(dev, iface);<br></div>=
<div>#else<br></div><div>@@ -977,7 +977,7 @@ int ipc_get_device(struct w=
gdevice **dev, const char *iface)<br></div><div>int ipc_set_device(struc=
t wgdevice *dev)<br></div><div>{<br></div><div>#ifdef __linux__<br></div=
><div>-	if (userspace_has_wireguard_interface(dev-&gt;name))<br></div><d=
iv>+	if (userspace_has_wireguard_iface(dev-&gt;name))<br></div><div>retu=
rn userspace_set_device(dev);<br></div><div>return kernel_set_device(dev=
);<br></div><div>#else<br></div><div>--<br></div><div>2.21.0<br></div></=
body></html>
--5be0f5b5ea2a4a00a4ef7867427c393a--

--===============5026200237658831546==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============5026200237658831546==--
