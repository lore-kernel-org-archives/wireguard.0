Return-Path: <SRS0=e2pA=3E=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FEC3C33CB3
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 15 Jan 2020 18:16:53 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33D2D2187F
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 15 Jan 2020 18:16:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=squyres.com header.i=@squyres.com header.b="2OZMl1A9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33D2D2187F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=squyres.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a213323d;
	Wed, 15 Jan 2020 18:16:26 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c2a133de
 for <wireguard@lists.zx2c4.com>;
 Sun, 12 Jan 2020 15:17:13 +0000 (UTC)
Received: from squyres.com (squyres.com [64.253.106.170])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 31ab7858
 for <wireguard@lists.zx2c4.com>;
 Sun, 12 Jan 2020 15:17:13 +0000 (UTC)
X-Debug-Header: memoryhole.net squyres.com
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=squyres.com; h=
 mime-version:from:date:message-id:subject:to:content-type; s=
 default; bh=QUWtA2mYio7+KEIo4/9MX/L30j8=; b=2OZMl1A9IZHmOCyTi0gM
 qUFEcuFirnmHxFtQ9Vpz0BNcVDNG78aPWbN2KpgIWL6EN80Lc/kIv3D9y9MDD6UO
 yALdpgM+juxvdP+MKVt9T86hevCYU+GCwFOzVpm1y+KBF6eIT3WAbT4gOl7dCNjq
 S2UryG61KZ0y/9UCA9D0r0g=
Received: (qmail 21950 invoked by uid 64020); 12 Jan 2020 15:17:11 -0000
Received: from unknown (HELO mail-wr1-f46.google.com) (jeff@209.85.221.46) by 
 squyres.com with ESMTPSA (AES128-SHA encrypted, authenticated); 12 
 Jan 2020 15:17:11 -0000
Received: by mail-wr1-f46.google.com with SMTP id z3so6134630wru.3
 for <wireguard@lists.zx2c4.com>; Sun, 12 Jan 2020 07:17:11 -0800 (PST)
X-Gm-Message-State: APjAAAUfZldawNktf4p4J8esOe8boGVSHHhPhShtI/prUWhfo1Au537f
 IxBJHHMOtQivk3OE6xaBhF/vKQD7sfPRucUjzIs=
X-Google-Smtp-Source: APXvYqy94EvhLGGRRoShV/2sPGNLkIaVacDGR90OcBBw92qHDRbnU+KFgk3AquZzPIXIpGtHvL1bJmFQllWQ6UtV7kk=
X-Received: by 2002:adf:f70b:: with SMTP id r11mr14704742wrp.388.1578842230907; 
 Sun, 12 Jan 2020 07:17:10 -0800 (PST)
MIME-Version: 1.0
From: Jeff Squyres <jeff@squyres.com>
Date: Sun, 12 Jan 2020 10:17:00 -0500
X-Gmail-Original-Message-ID: <CAOmeisV22+6uKgX0ja+i4gnGWo5fUWhk6Je9PiFvf7itcY+3uQ@mail.gmail.com>
Message-ID: <CAOmeisV22+6uKgX0ja+i4gnGWo5fUWhk6Je9PiFvf7itcY+3uQ@mail.gmail.com>
Subject: Problem with iOS WireGuard client
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Wed, 15 Jan 2020 19:16:24 +0100
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
Content-Type: multipart/mixed; boundary="===============3093712795549794684=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============3093712795549794684==
Content-Type: multipart/alternative; boundary="000000000000546a9a059bf2da25"

--000000000000546a9a059bf2da25
Content-Type: text/plain; charset="UTF-8"

Over the past ~2 months, I have been experiencing an intermittent problem
with the iOS WireGuard client: sometimes the WireGuard client gets into a
loop of endlessly-failing handshakes, which therefore stops all traffic.
If I disconnect/reconnect the WireGuard tunnel, the handshakes succeed, and
traffic starts flowing normally again.

This happens multiple times a day.  It has been happening with multiple
versions of iOS starting with 12.x, and now with 13.x.  WireGuard for iOS
version 0.0.20191015(15), Go Backend 0.0.2019.0909.

I can send more details (logs, screenshots / screencast, etc.), but first:
is this the right list to ask questions about the iOS client?  If not, can
someone point me in the right direction?

Additionally, another oddity: when my Wireguard tunnel is connected
properly and I visit whoer.net or zx2c4.com/ip, sometimes I see my
WireGuard endpoint's IPv6 address, and sometimes I see my WireGuard
endpoint's IPv4 address.  This happens regardless of what network my iOS
device (i.e., my phone) is on.  Sometimes when the IPv6 address is shown
and I refresh the page a few times (over the span of a few seconds), it
switches to show the endpoint's IPv4 address.

Thanks!

-- 
{+} Jeff Squyres

--000000000000546a9a059bf2da25
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:arial,he=
lvetica,sans-serif;font-size:small;color:#000000">Over the past ~2 months, =
I have been experiencing an intermittent problem with the iOS WireGuard cli=
ent: sometimes the WireGuard client gets into a loop of endlessly-failing h=
andshakes, which therefore stops all traffic.=C2=A0 If I disconnect/reconne=
ct the WireGuard tunnel, the handshakes succeed, and traffic starts flowing=
 normally again.</div><div class=3D"gmail_default" style=3D"font-family:ari=
al,helvetica,sans-serif;font-size:small;color:#000000"><br></div><div class=
=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif;font-siz=
e:small;color:#000000">This happens multiple times a day.=C2=A0 It has been=
 happening with multiple versions of iOS starting with 12.x, and now with 1=
3.x.=C2=A0 WireGuard for iOS version 0.0.20191015(15), Go Backend 0.0.2019.=
0909.</div><div class=3D"gmail_default" style=3D"font-family:arial,helvetic=
a,sans-serif;font-size:small;color:#000000"><br></div><div class=3D"gmail_d=
efault" style=3D"font-family:arial,helvetica,sans-serif;font-size:small;col=
or:#000000">I can send more details (logs, screenshots / screencast, etc.),=
 but first: is this the right list to ask questions about the iOS client?=
=C2=A0 If not, can someone point me in the right direction?</div><div class=
=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif;font-siz=
e:small;color:#000000"><br></div><div class=3D"gmail_default" style=3D"font=
-family:arial,helvetica,sans-serif;font-size:small;color:#000000">Additiona=
lly, another oddity: when my Wireguard tunnel is connected properly and I v=
isit <a href=3D"http://whoer.net">whoer.net</a> or=C2=A0<a href=3D"http://z=
x2c4.com/ip" rel=3D"noreferrer" target=3D"_blank" style=3D"font-family:Aria=
l,Helvetica,sans-serif">zx2c4.com/ip</a>, sometimes I see my WireGuard endp=
oint&#39;s IPv6 address, and sometimes I see my WireGuard endpoint&#39;s IP=
v4 address.=C2=A0 This happens regardless of what network my iOS device (i.=
e., my phone) is on.=C2=A0 Sometimes when the IPv6 address is shown and I r=
efresh the page a few times (over the span of a few seconds), it switches t=
o show the endpoint&#39;s IPv4 address.</div><div><br></div><div><div class=
=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif;font-siz=
e:small;color:rgb(0,0,0)">Thanks!</div><br></div>-- <br><div dir=3D"ltr" cl=
ass=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"=
>{+} Jeff Squyres</div></div></div>

--000000000000546a9a059bf2da25--

--===============3093712795549794684==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============3093712795549794684==--
