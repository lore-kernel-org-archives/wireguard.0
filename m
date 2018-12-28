Return-Path: <SRS0=mIIS=PF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B1D6C43387
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 28 Dec 2018 10:28:32 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FF7C20874
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 28 Dec 2018 10:28:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=chmd-fr.20150623.gappssmtp.com header.i=@chmd-fr.20150623.gappssmtp.com header.b="DoLMAezF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2FF7C20874
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chmd.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8ef4498d;
	Fri, 28 Dec 2018 10:26:30 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 012c3029
 for <wireguard@lists.zx2c4.com>;
 Fri, 28 Dec 2018 10:26:28 +0000 (UTC)
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6fb0bd32
 for <wireguard@lists.zx2c4.com>;
 Fri, 28 Dec 2018 10:26:28 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id f23so17214772edb.3
 for <wireguard@lists.zx2c4.com>; Fri, 28 Dec 2018 02:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chmd-fr.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=tFa0qlzpnVKl+zARubISScHEcHHdm78WHsVSMcuH5sc=;
 b=DoLMAezFz9qDeFzHyuoEFykVK5pMnH35Qe6PQ/JKov2DKYkmteMULR0ui9aL5BLFHo
 X3+LEDX4TlwggUcuZcBhhXWdT2gP9t419fnsLV6LPZwYtEj268MQvlSFv5lBmIP9kVgh
 CMmPVTHOSzGdBc5HGqm/91WqP1xfesbQTwifo2LTvq0p7comoCdZgsBqraqC1a5B3RjQ
 9t0fn22HpAGXKrlOkzyPueDutcNFOGE6SLhBwXFyOhuUAtpwsZOD6rGhdLrOpqPFI+h1
 sbCkmwte21qbEC7MP7BPtL/u3DuwsVqvgr3oq9KRIF7eiOBAsqDOrzSUOux815zkTSnh
 4l9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=tFa0qlzpnVKl+zARubISScHEcHHdm78WHsVSMcuH5sc=;
 b=lDDa4NuVTpPP48cC3wTyeQ1OksJGVoBSRAGZADahRWGC2JwQqSMd9ICW/yweAyAtPs
 vzgp57JpmpSQ+wGTUpGtLDBuevFhMmmSIB6G2OZ9hQmZ544HniuoEDZfL9oEgvblKGic
 B9+TmGLpG7bkuvA8qA7W1vZSiSfBjm+ACzzEdzQOQunrtAfgV4+bMYbjZCofe6y0JhK+
 KHkcI6mb20HHSQWcsq+GMtBHNe+goEzfDdZQJPPouzSk5fyIlUBvKZLQo/lS7ElLYHdY
 d2uxngyJzLK1UL8ax8RhhxBojP5Q/Z2TCyEQ3Hd6xLQflgfbfjYPoh0Ej+8bCt+/TD1z
 iQCA==
X-Gm-Message-State: AA+aEWYZv2VLhjsOFzwnt/RCflEBA5RK0s+o6nuys/F8BIKqv1P+o5sQ
 lrUwejzKqCIy6Gm380BZYjeEAZlc917geR14+q1mKs2e
X-Google-Smtp-Source: AFSGD/XGfUZuAE+uLxerXyVlfLoGRlQo2e97QcsIqOYBHiqR1yNb2rQP9GLyFye4N6UOThQD4O46cP8OcgtwFifEWZ8=
X-Received: by 2002:a05:6402:1816:: with SMTP id
 g22mr22440735edy.191.1545992890044; 
 Fri, 28 Dec 2018 02:28:10 -0800 (PST)
MIME-Version: 1.0
From: Christophe-Marie Duquesne <chmd@chmd.fr>
Date: Fri, 28 Dec 2018 11:27:59 +0100
Message-ID: <CAHLp1YkibRSvohY9FJ5G+FXaEw4tFU52rLsbWLSP8oiL0K=rhQ@mail.gmail.com>
Subject: [Android app] Can't connect to a chromecast when wireguard is running
To: wireguard <wireguard@lists.zx2c4.com>
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
Content-Type: multipart/mixed; boundary="===============2352488946798012335=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============2352488946798012335==
Content-Type: multipart/alternative; boundary="0000000000000953ff057e128532"

--0000000000000953ff057e128532
Content-Type: text/plain; charset="UTF-8"

Hi!

I have been using the android app for a while now (non rooted phone,
android 8.0, I installed the app from the play store). It works very well.

I am here to report a little problem: I find myself unable to use a
chromecast while wireguard is running. I tried to exclude Spotify and
Google home from the applications tunneled by wireguard, but that doesn't
work.

The application which notifies me about the chromecast status is "Google
play services". However, this particular app is not part of the list of
applications I can exclude from being tunneled by wireguard.

Has anyone experienced a similar problem? How did you solve it?

Best,
Christophe-Marie

--0000000000000953ff057e128532
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi!</div><div><br></div><div>I have been using the an=
droid app for a while now (non rooted phone, android 8.0, I installed the a=
pp from the play store). It works very well.</div><div><br></div><div>I am =
here to report a little problem: I find myself unable to use a chromecast w=
hile wireguard is running. I tried to exclude Spotify and Google home from =
the applications tunneled by wireguard, but that doesn&#39;t work.</div><di=
v><br></div><div>The application which notifies me about the chromecast sta=
tus is &quot;Google play services&quot;. However, this particular app is no=
t part of the list of applications I can exclude from being tunneled by wir=
eguard.</div><div><br></div><div>Has anyone experienced a similar problem? =
How did you solve it?</div><div><br></div><div>Best,</div><div>Christophe-M=
arie<br></div></div>

--0000000000000953ff057e128532--

--===============2352488946798012335==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============2352488946798012335==--
