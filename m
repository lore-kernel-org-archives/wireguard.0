Return-Path: <SRS0=YVay=N6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1966C43441
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 19 Nov 2018 15:25:35 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51584206BB
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 19 Nov 2018 15:25:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZC/oBjyK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51584206BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f4bc0473;
	Mon, 19 Nov 2018 15:19:33 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0f9578ed
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Nov 2018 15:19:32 +0000 (UTC)
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b2114dcb
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Nov 2018 15:19:32 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id z28so2610191edi.8
 for <wireguard@lists.zx2c4.com>; Mon, 19 Nov 2018 07:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=cZC4qKE8FFA+b4IjuO7vUFbeY6TIykfMZ69cDVlFL5U=;
 b=ZC/oBjyKqrecHnYlyBf8KJyXK44NCfX23bTTdWLOMlKmfFCiT0IHzpVz6MRWQP57QX
 q5k6cJHYqAEfZJXM92oEEd6VsyrHiyBaX5jI7K8q6SbaMXN0fAg3jClksOvHBYp+wVpV
 K3SIOL7ZIK50Mb5P0DFqOFgvYqewihtPstJ36Lj+6C7jO1gyvILQAtrlYlqW1zxY/SGJ
 e124kMzoBtWlenk/SEBbyb7WKbxs7WmsaHGOdthzIcMP++cr7KNS3YrSVbNUBUdfiIFT
 SpJOkQ6YSY39XWI8p/Nk7ge2EZRYN16DZzkBpk3GPJwBJaxOx5cRpl1sPubiAOMwRzod
 tdcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=cZC4qKE8FFA+b4IjuO7vUFbeY6TIykfMZ69cDVlFL5U=;
 b=XMov0QvL1+Vpx4Ldaepzlo/+c0SrlR4N/IFb1JYUWPQdRxQpCnO1ZHziOmAZR71hdM
 wV2ILpXZCkwh3IGoMVewTmmlSl4JNg6kqeCkGC3ZxpZaiRZdtxGJ/AycDlr2yk+KEXAg
 J31B5c9DfIyL8BN3/SxRy28J+EmmNAXYWns0geXa/3LEm6GmSX/g1es9Yh3ZVT6JEsG2
 qttITwlPXPGeoqF3DtZMcGHxDYbQsSYYJD/k9erU1k3FZkI4P3K5xTIYPbe4TEC5w78Y
 8szJptf9IeV2c2KedGDd5+QnemOdyV9p3dfjrT3bUOgNq6kjw0ALpJNNoKmNml9OEPZ+
 ZomQ==
X-Gm-Message-State: AGRZ1gLX0gBXzsejW5H6pf0gV9Y9DfPufRH96WGmcT06bn7x2XOukpmg
 iE10/JP6Zwbwxmcs34Dnz8h3VRPy8zRHPqPLBVRjlA==
X-Google-Smtp-Source: AJdET5eJOTWiY1pjfLaWOlU4M0/quFAaYizPrUl0AWI1hu3zEheHcEOvw5ZhLd9fh1qZDYf3TNXjPWO8bmHXdv4l1DY=
X-Received: by 2002:a17:906:4ed9:: with SMTP id
 i25-v6mr16875737ejv.75.1542641130591; 
 Mon, 19 Nov 2018 07:25:30 -0800 (PST)
MIME-Version: 1.0
From: Jacob Schooley <jacob.schooley+wgvpn@gmail.com>
Date: Mon, 19 Nov 2018 08:25:18 -0700
Message-ID: <CAHjFYUKdWpEjv2xyHjV15=kpbAMSxyDbGFkD93BMG7xJ09cfWA@mail.gmail.com>
Subject: Re: Traffic on port 53 fails on LTE but works on WiFi
To: wireguard@lists.zx2c4.com
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
Content-Type: multipart/mixed; boundary="===============2641761852736291827=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============2641761852736291827==
Content-Type: multipart/alternative; boundary="0000000000009adaf0057b062093"

--0000000000009adaf0057b062093
Content-Type: text/plain; charset="UTF-8"

Finally, something I can actually help with.

Yes, Verizon is actively blocking data through port 53.

Back in 2015 I discovered by accident that VPN traffic through port 53 on
Verizon was not monitored by whatever they use to calculate data usage.
Even better, it worked on deactivated sim cards for a few months after they
were deactivated. Basically this meant I could dig around in the local
Verizon store's dumpster every few months to find sim cards, pop them into
a portable hotspot, and use a VPN over 53 for completely free, unthrottled
data on Verizon without even having an account with them. I was a broke
high school student and my parents wouldn't allow me to have service on my
phone at the time so this was a life saver.

Fast forward to a couple months ago, someone else gets root on the mifi
6620L, finds the loophole, and decides to sell mifi's with a VPN client or
proxy installed that redirected everything through port 53. Basically
resulting in a seamless experience for free unlimited data. These hacked
devices sold for $300+ on eBay. Of course, after it was in the wild Verizon
started DPIing port 53 and now nothing gets through.



On 11/19/18, John <graysky@archlinux.us> wrote:
> I have a simple WireGuard VPN setup I use running WG on a home Linux
> box and connecting to it with several iOS clients. The server peer is
> setup on port 53 since a the networkadmins of some remote WiFi
> networks my mobile devices seems to block udp traffic on higher ports.
> Encrypted connections work fine on WiFi as I have setup, but do _not_
> work when I connect via LTE (Verizon supplying the data). On LTE, I
> am no longer able to transfer data to/from the server peer but I can
> handshake with it.
>
> If I inspect the output of `sudo wg` on the server peer, I see the
> endpoint IP address changes to reflect my Verizon LTE IP and the time
> since the last handshake reset to a few seconds which is consistent
> with my ability to connect to the WireGuard peer server.
>
> I am unable to transfer data (pull up a web site or check email etc).
> It's as/if Verizon is blocking my data flow on port 53. If I change
> the port from 53 to 123, it seems to work fine although I do not have
> universal connectivity on the various WiFi networks I visit on port
> 123. The optimal port would be 53 for my use case.
>
> So the questions:
> 1) What can I try on the server peer side to diagnose?
> 2) Do people feel that Verizon is actively blocking the connection on port
> 53?
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--0000000000009adaf0057b062093
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div dir=3D"auto">Finally, something I can actually help =
with.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">Yes, Verizon=
 is actively blocking data through port 53.=C2=A0</div><div dir=3D"auto"><b=
r></div><div dir=3D"auto">Back in 2015 I discovered by accident that VPN tr=
affic through port 53 on Verizon was not monitored by whatever they use to =
calculate data usage. Even better, it worked on deactivated sim cards for a=
 few months after they were deactivated. Basically this meant I could dig a=
round in the local Verizon store&#39;s dumpster every few months to find si=
m cards, pop them into a portable hotspot, and use a VPN over 53 for comple=
tely free, unthrottled data on Verizon without even having an account with =
them. I was a broke high school student and my parents wouldn&#39;t allow m=
e to have service on my phone at the time so this was a life saver.=C2=A0</=
div><div dir=3D"auto"><br></div><div dir=3D"auto">Fast forward to a couple =
months ago, someone else gets root on the mifi 6620L, finds the loophole, a=
nd decides to sell mifi&#39;s with a VPN client or proxy installed that red=
irected everything through port 53. Basically resulting in a seamless exper=
ience for free unlimited data. These hacked devices sold for $300+ on eBay.=
 Of course, after it was in the wild Verizon started DPIing port 53 and now=
 nothing gets through.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"a=
uto"><br></div><div dir=3D"auto"><br></div>On 11/19/18, John &lt;<a href=3D=
"mailto:graysky@archlinux.us" target=3D"_blank" rel=3D"noreferrer">graysky@=
archlinux.us</a>&gt; wrote:<div dir=3D"auto">&gt; I have a simple WireGuard=
 VPN setup I use running WG on a home Linux</div><div dir=3D"auto">&gt; box=
 and connecting to it with several iOS clients.  The server peer is</div><d=
iv dir=3D"auto">&gt; setup on port 53 since a the networkadmins of some rem=
ote WiFi</div><div dir=3D"auto">&gt; networks my mobile devices seems to bl=
ock udp traffic on higher ports.</div><div dir=3D"auto">&gt; Encrypted conn=
ections work fine on WiFi as I have setup, but do _not_</div><div dir=3D"au=
to">&gt; work when I connect via LTE (Verizon supplying the data).  On LTE,=
 I</div><div dir=3D"auto">&gt; am no longer able to transfer data to/from t=
he server peer but I can</div><div dir=3D"auto">&gt; handshake with it.</di=
v><div dir=3D"auto">&gt;</div><div dir=3D"auto">&gt; If I inspect the outpu=
t of `sudo wg` on the server peer, I see the</div><div dir=3D"auto">&gt; en=
dpoint IP address changes to reflect my Verizon LTE IP and the time</div><d=
iv dir=3D"auto">&gt; since the last handshake reset to a few seconds which =
is consistent</div><div dir=3D"auto">&gt; with my ability to connect to the=
 WireGuard peer server.</div><div dir=3D"auto">&gt;</div><div dir=3D"auto">=
&gt; I am unable to transfer data (pull up a web site or check email etc).<=
/div><div dir=3D"auto">&gt; It&#39;s as/if Verizon is blocking my data flow=
 on port 53.  If I change</div><div dir=3D"auto">&gt; the port from 53 to 1=
23, it seems to work fine although I do not have</div><div dir=3D"auto">&gt=
; universal connectivity on the various WiFi networks I visit on port</div>=
<div dir=3D"auto">&gt; 123.  The optimal port would be 53 for my use case.<=
/div><div dir=3D"auto">&gt;</div><div dir=3D"auto">&gt; So the questions:</=
div><div dir=3D"auto">&gt; 1) What can I try on the server peer side to dia=
gnose?</div><div dir=3D"auto">&gt; 2) Do people feel that Verizon is active=
ly blocking the connection on port</div><div dir=3D"auto">&gt; 53?</div><di=
v dir=3D"auto">&gt; _______________________________________________</div><d=
iv dir=3D"auto">&gt; WireGuard mailing list</div><div dir=3D"auto">&gt; <a =
href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank" rel=3D"noreferr=
er">WireGuard@lists.zx2c4.com</a></div><div dir=3D"auto">&gt; <a href=3D"ht=
tps://lists.zx2c4.com/mailman/listinfo/wireguard" target=3D"_blank" rel=3D"=
noreferrer">https://lists.zx2c4.com/mailman/listinfo/wireguard</a></div><di=
v dir=3D"auto">&gt;</div></div>

--0000000000009adaf0057b062093--

--===============2641761852736291827==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============2641761852736291827==--
