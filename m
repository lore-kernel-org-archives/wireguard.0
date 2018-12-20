Return-Path: <SRS0=QZLZ=PK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	MIME_HTML_MOSTLY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 508D6C43387
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  2 Jan 2019 19:29:11 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3FFB218D3
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  2 Jan 2019 19:29:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G0tzkc1N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3FFB218D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c4ca3b01;
	Wed, 2 Jan 2019 19:26:03 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 26c7f823
 for <wireguard@lists.zx2c4.com>;
 Thu, 20 Dec 2018 04:55:28 +0000 (UTC)
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3cd4caf1
 for <wireguard@lists.zx2c4.com>;
 Thu, 20 Dec 2018 04:55:28 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id g11-v6so368482ljk.3
 for <wireguard@lists.zx2c4.com>; Wed, 19 Dec 2018 20:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=2gn9yaGDRUxyRJSAR9WdUjKYdLlsM4AxcvHhG29wOtM=;
 b=G0tzkc1Nea7s3AMgJf90eGkwL3ZGa5rl46/+GVsz49NcUUfn4GGRAYXoGoERr8hxtH
 Kzf6pKZNzQ5Vy9CBxL6dx089UKSeJTKWD43DEU5kyvlLs2w2GA4bJgcJ0WiJTOe7QK0K
 bwv3jUX7jSvW4runsHyQudEDSQhB2bAorsJynNoU6Xug748jvXbFFnhKpDbxlwf/Wq4F
 423D7A3PQB28OfXMVHL02OApZ0/t0lJnKpq9kjF9t898ZxtgAmNXKAa5WO7fC5F9ZWiQ
 /rHw7O3B5tHjE1Hl2FLSHIA+yHX9u3sfNWM/f+mx4MZlMzDppaAgvSCGFse1AHI15PmJ
 Eoxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=2gn9yaGDRUxyRJSAR9WdUjKYdLlsM4AxcvHhG29wOtM=;
 b=cbg2iLxkAqiUW06+qD8WVteAHY3u8QiOgyZ1PAzh84rcu8QdkibxKcMVY8GEbbVOhL
 OdIuO0gkBVT5lEBPWfF7R9zu2Yd8WW9E8GTr3zHT2AS1w8RR39TR6uJOCmtwBsBrIPbL
 2O27Li1MH4r+xB8wnOY1EEESOw2MNwLLvurjqQS9aiRHyJ3fHdhlLNAs+hATrfcnkXrm
 //bqvJQTW8N8TLn7D8bCXzTXUtAoP3d5CFdkCN9W0CJYlat0QcRc8qcBUdCdZgTDZoG3
 Ei223tzRi+8PjCBVl6b+MsWOo2uUVJv5NTb66pnfNkV21NRSsYX6Tr1tlVLthHJjFoH2
 66Mg==
X-Gm-Message-State: AA+aEWYTatozL7odTIWDSxQNO8zCkAtrr6613oTBoG0XYrk31XlvHtoc
 9J9BZkMM/Of5VKaqW2echnUsmJWzR1jghFAEEeRzNC+6kpqlgg==
X-Google-Smtp-Source: AFSGD/U+g6IU+Ps0yy4aRO/o9ifLQM1dPzvVqIwfqf7kbzj1PiZTnbAuXXw8ZC5+XLOuWQiqAhiPjGhnwqZ3+IykdtA=
X-Received: by 2002:a2e:21a9:: with SMTP id
 h41-v6mr14003854lji.103.1545281766272; 
 Wed, 19 Dec 2018 20:56:06 -0800 (PST)
MIME-Version: 1.0
From: xin li <sadoneli@gmail.com>
Date: Thu, 20 Dec 2018 12:55:24 +0800
Message-ID: <CADZPQWi0+5dh-zK4Tdn_qyyvizfVtBNtUkKMxL6f_VaP9HVHYQ@mail.gmail.com>
Subject: BLOG ERROR blog_request error on ASUS router with kernel 4.1.27
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Wed, 02 Jan 2019 20:26:02 +0100
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
Content-Type: multipart/mixed; boundary="===============4504862425266455082=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============4504862425266455082==
Content-Type: multipart/alternative; boundary="000000000000c1b459057d6cf238"

--000000000000c1b459057d6cf238
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I=E2=80=99am using ASUS GT-AC5300 router, which is broadcom based platform.=
 I build
my own firmware from ASUS  GT-AC5300  GPL source code with wireguard
support in kernel. Wireguard works on my router and the speed is really
fast, However, there are two problem emerged during the configuration and
running.

1. When making keys=EF=BC=8C Bus error happened every time. So I have to ma=
ke my
client key on server side.
admin@GT-AC5300:/tmp/home/root# umask 077
admin@GT-AC5300:/tmp/home/root# wg genkey > private-key
admin@GT-AC5300:/tmp/home/root# wg pubkey < private-key > public-key
Bus error

2. while wireguard running, sometimes it disconnect happened and I
can,t access VPN network=EF=BC=8Cthe flowing message emerged:
41mBLOG ERROR blog_request :blog_key corruption when adding flow
net_p=3Dffffffc02c552380  dir=3D0 old_key=3D0x20000384 new_key=3D0x2000038a
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when adding flow
net_p=3Dffffffc02c552380  dir=3D0 old_key=3D0x2000038a new_key=3D0x200003ae
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when adding flow
net_p=3Dffffffc02b3dddd0  dir=3D0 old_key=3D0x20000433 new_key=3D0x20000436
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when adding flow
net_p=3Dffffffc02b3dddd0  dir=3D0 old_key=3D0x20000436 new_key=3D0x20000469
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when adding flow
net_p=3Dffffffc02b3dddd0  dir=3D0 old_key=3D0x20000469 new_key=3D0x2000046a
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when adding flow
net_p=3Dffffffc02b3dddd0  dir=3D0 old_key=3D0x2000046a new_key=3D0x2000046b
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when adding flow
net_p=3Dffffffc02b3dddd0  dir=3D0 old_key=3D0x2000046b new_key=3D0x2000046c
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when adding flow
net_p=3Dffffffc02b3dddd0  dir=3D0 old_key=3D0x2000046c new_key=3D0x2000046d
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when adding flow
net_p=3Dffffffc02b3dddd0  dir=3D0 old_key=3D0x2000046d new_key=3D0x2000046e
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when adding flow
net_p=3Dffffffc02b3dddd0  dir=3D0 old_key=3D0x2000046e new_key=3D0x20000471
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when adding flow
net_p=3Dffffffc02b3dddd0  dir=3D0 old_key=3D0x20000471 new_key=3D0x20000472
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when adding flow
net_p=3Dffffffc02b3dddd0  dir=3D0 old_key=3D0x20000472 new_key=3D0x20000477
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when adding flow
net_p=3Dffffffc02b3dddd0  dir=3D0 old_key=3D0x20000477 new_key=3D0x20000479
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when adding flow
net_p=3Dffffffc02b3dddd0  dir=3D0 old_key=3D0x20000479 new_key=3D0x2000047a
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when adding flow
net_p=3Dffffffc02b3dddd0  dir=3D0 old_key=3D0x2000047a new_key=3D0x2000047b
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when adding flow
net_p=3Dffffffc02b3dddd0  dir=3D0 old_key=3D0x2000047b new_key=3D0x2000047c
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when adding flow
net_p=3Dffffffc02b3dddd0  dir=3D0 old_key=3D0x2000047c new_key=3D0x20000499
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when adding flow
net_p=3Dffffffc02b3dddd0  dir=3D0 old_key=3D0x20000499 new_key=3D0x20000562
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when deleting flowfor
net_p=3Dffffffc02c552380
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when adding flow
net_p=3Dffffffc02b3dddd0  dir=3D0 old_key=3D0x20000562 new_key=3D0x20000569
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when adding flow
net_p=3Dffffffc02b3dddd0  dir=3D0 old_key=3D0x20000569 new_key=3D0x2000056d
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when adding flow
net_p=3Dffffffc02ac08010  dir=3D0 old_key=3D0x2000058f new_key=3D0x20000590
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when adding flow
net_p=3Dffffffc02ac08010  dir=3D0 old_key=3D0x20000590 new_key=3D0x20000591
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when adding flow
net_p=3Dffffffc02ac08010  dir=3D0 old_key=3D0x20000591 new_key=3D0x20000592
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when adding flow
net_p=3Dffffffc02ac08010  dir=3D0 old_key=3D0x20000592 new_key=3D0x20000594
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when adding flow
net_p=3Dffffffc02ac08010  dir=3D0 old_key=3D0x20000594 new_key=3D0x20000595
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when adding flow
net_p=3Dffffffc02ac08010  dir=3D0 old_key=3D0x20000595 new_key=3D0x20000596
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when adding flow
net_p=3Dffffffc02ac08010  dir=3D0 old_key=3D0x20000596 new_key=3D0x20000598
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when adding flow
net_p=3Dffffffc02ac08010  dir=3D0 old_key=3D0x20000598 new_key=3D0x20000599
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when adding flow
net_p=3Dffffffc02ac08010  dir=3D0 old_key=3D0x20000599 new_key=3D0x2000059a
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when adding flow
net_p=3Dffffffc02ac08010  dir=3D0 old_key=3D0x2000059a new_key=3D0x2000059b
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when adding flow
net_p=3Dffffffc02ac08010  dir=3D0 old_key=3D0x2000059b new_key=3D0x2000059c
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when adding flow
net_p=3Dffffffc02ac08010  dir=3D0 old_key=3D0x2000059c new_key=3D0x2000059d
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when adding flow
net_p=3Dffffffc02ac08010  dir=3D0 old_key=3D0x2000059d new_key=3D0x2000059e
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when adding flow
net_p=3Dffffffc02ac08010  dir=3D0 old_key=3D0x2000059e new_key=3D0x200005a0
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when adding flow
net_p=3Dffffffc02ac08010  dir=3D0 old_key=3D0x200005a0 new_key=3D0x200005a1
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when adding flow
net_p=3Dffffffc02ac08010  dir=3D0 old_key=3D0x200005a1 new_key=3D0x200005a2
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when deleting flowfor
net_p=3Dffffffc02c552380
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when adding flow
net_p=3Dffffffc02e981010  dir=3D0 old_key=3D0x20000604 new_key=3D0x20000605
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when adding flow
net_p=3Dffffffc02e981010  dir=3D0 old_key=3D0x20000605 new_key=3D0x20000606
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when adding flow
net_p=3Dffffffc02e981010  dir=3D0 old_key=3D0x20000606 new_key=3D0x20000607
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when adding flow
net_p=3Dffffffc02e981010  dir=3D0 old_key=3D0x20000607 new_key=3D0x2000060a
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when adding flow
net_p=3Dffffffc02e981010  dir=3D0 old_key=3D0x2000060a new_key=3D0x2000060c
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when adding flow
net_p=3Dffffffc02e981010  dir=3D0 old_key=3D0x2000060c new_key=3D0x2000060e
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when adding flow
net_p=3Dffffffc02e981010  dir=3D0 old_key=3D0x2000060e new_key=3D0x2000060f
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when deleting flowfor
net_p=3Dffffffc02b3dddd0
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when deleting flowfor
net_p=3Dffffffc02b3dddd0
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when deleting flowfor
net_p=3Dffffffc02b3dddd0
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when deleting flowfor
net_p=3Dffffffc02b3dddd0
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when deleting flowfor
net_p=3Dffffffc02b3dddd0
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when deleting flowfor
net_p=3Dffffffc02b3dddd0
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when adding flow
net_p=3Dffffffc02b27c010  dir=3D0 old_key=3D0x20000683 new_key=3D0x20000684
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when deleting flowfor
net_p=3Dffffffc02b3dddd0
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when adding flow
net_p=3Dffffffc02b27c010  dir=3D0 old_key=3D0x20000684 new_key=3D0x20000693
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when adding flow
net_p=3Dffffffc02c4796f0  dir=3D0 old_key=3D0x200006cd new_key=3D0x200006db
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when deleting flowfor
net_p=3Dffffffc02b3dddd0
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when adding flow
net_p=3Dffffffc02c4796f0  dir=3D0 old_key=3D0x200006db new_key=3D0x200006e3
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when deleting flowfor
net_p=3Dffffffc02b3dddd0
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when adding flow
net_p=3Dffffffc02c4796f0  dir=3D0 old_key=3D0x200006e3 new_key=3D0x200006e9
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when adding flow
net_p=3Dffffffc02c4796f0  dir=3D0 old_key=3D0x200006e9 new_key=3D0x200006ea
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when adding flow
net_p=3Dffffffc02c4796f0  dir=3D0 old_key=3D0x200006ea new_key=3D0x200006eb
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when adding flow
net_p=3Dffffffc02c4796f0  dir=3D0 old_key=3D0x200006eb new_key=3D0x200006ec
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when adding flow
net_p=3Dffffffc02c4796f0  dir=3D0 old_key=3D0x200006ec new_key=3D0x200006ed
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when adding flow
net_p=3Dffffffc02c4796f0  dir=3D0 old_key=3D0x200006ed new_key=3D0x200006ee
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when adding flow
net_p=3Dffffffc02c4796f0  dir=3D0 old_key=3D0x200006ee new_key=3D0x200006ef
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when adding flow
net_p=3Dffffffc02c4796f0  dir=3D0 old_key=3D0x200006ef new_key=3D0x200006f0
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when adding flow
net_p=3Dffffffc02c4796f0  dir=3D0 old_key=3D0x200006f0 new_key=3D0x200006f1
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when adding flow
net_p=3Dffffffc02c4796f0  dir=3D0 old_key=3D0x200006f1 new_key=3D0x200006f2
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when adding flow
net_p=3Dffffffc02c4796f0  dir=3D0 old_key=3D0x200006f2 new_key=3D0x200006f3
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when deleting flowfor
net_p=3Dffffffc02b3dddd0
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when deleting flowfor
net_p=3Dffffffc02ac08010
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when deleting flowfor
net_p=3Dffffffc02ac08010
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when deleting flowfor
net_p=3Dffffffc02ac08010
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when deleting flowfor
net_p=3Dffffffc02ac08010
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when deleting flowfor
net_p=3Dffffffc02ac08010
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when deleting flowfor
net_p=3Dffffffc02ac08010
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when deleting flowfor
net_p=3Dffffffc02ac08010
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when deleting flowfor
net_p=3Dffffffc02ac08010
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when deleting flowfor
net_p=3Dffffffc02ac08010
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when deleting flowfor
net_p=3Dffffffc02ac08010
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when deleting flowfor
net_p=3Dffffffc02ac08010
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when deleting flowfor
net_p=3Dffffffc02ac08010
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when deleting flowfor
net_p=3Dffffffc02ac08010
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when deleting flowfor
net_p=3Dffffffc02ac08010
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when deleting flowfor
net_p=3Dffffffc02ac08010
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when deleting flowfor
net_p=3Dffffffc02e981010
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when deleting flowfor
net_p=3Dffffffc02e981010
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when deleting flowfor
net_p=3Dffffffc02e981010
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when deleting flowfor
net_p=3Dffffffc02e981010
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when deleting flowfor
net_p=3Dffffffc02ac08010
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when deleting flowfor
net_p=3Dffffffc02e981010
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when deleting flowfor
net_p=3Dffffffc02e981010
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when deleting flowfor
net_p=3Dffffffc02e981010
[0m
ERR: rdpa_cpu_tx_port_enet_lan#223: rdpa_cpu_tx_port_enet_lan failed.
rdd_rc=3D120 tx_rdd_error_count=3D1
[0;33;41mBLOG ERROR blog_request :blog_key corruption when deleting flowfor
net_p=3Dffffffc02b27c010
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when deleting flowfor
net_p=3Dffffffc02c4796f0
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when deleting flowfor
net_p=3Dffffffc02b3dddd0
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when deleting flowfor
net_p=3Dffffffc02b3dddd0
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when deleting flowfor
net_p=3Dffffffc02c4796f0
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when deleting flowfor
net_p=3Dffffffc02c4796f0
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when deleting flowfor
net_p=3Dffffffc02c4796f0
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when deleting flowfor
net_p=3Dffffffc02c4796f0
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when deleting flowfor
net_p=3Dffffffc02c4796f0
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when deleting flowfor
net_p=3Dffffffc02c4796f0
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when deleting flowfor
net_p=3Dffffffc02c4796f0
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when deleting flowfor
net_p=3Dffffffc02c4796f0
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when deleting flowfor
net_p=3Dffffffc02c4796f0
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when deleting flowfor
net_p=3Dffffffc02c4796f0
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when deleting flowfor
net_p=3Dffffffc02c4796f0
[0m
[0;33;41mBLOG ERROR blog_request :blog_key corruption when deleting flowfor
net_p=3Dffffffc02c4796f0
[0m

-------------------------------------------------------
I don't know how to code and how to solve this
But I do know how to build a embedded firmware from source code (openwrt,
asuswrt ...), and configure vpn on it.
If there is any way to solve this, I would very like to do some testing

--000000000000c1b459057d6cf238
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">I=E2=80=99am using ASUS =
GT-AC5300 router, which is broadcom based platform. I build my own firmware=
 from ASUS=C2=A0

GT-AC5300=C2=A0 GPL source code with wireguard support in kernel. Wireguard=
 works on my router and the speed is really fast, However, there are two pr=
oblem emerged during the configuration and running.</div><div dir=3D"ltr"><=
div><br></div><div>1. When making keys=EF=BC=8C

Bus error=C2=A0happened every time. So I have to make my client key on serv=
er side.<br><div><div><div>admin@GT-AC5300:/tmp/home/root# umask 077</div><=
div>admin@GT-AC5300:/tmp/home/root# wg genkey &gt; private-key</div><div>ad=
min@GT-AC5300:/tmp/home/root# wg pubkey &lt; private-key &gt; public-key</d=
iv><div>Bus error</div></div><div><br></div><div>2. while wireguard running=
, sometimes it disconnect happened and I can,t=C2=A0access VPN=C2=A0network=
=EF=BC=8Cthe=C2=A0flowing=C2=A0message emerged:</div><div><div>41mBLOG ERRO=
R blog_request :blog_key corruption when adding flow net_p=3Dffffffc02c5523=
80=C2=A0 dir=3D0 old_key=3D0x20000384 new_key=3D0x2000038a</div><div> [0m</=
div><div> [0;33;41mBLOG ERROR blog_request :blog_key corruption when adding=
 flow net_p=3Dffffffc02c552380=C2=A0 dir=3D0 old_key=3D0x2000038a new_key=
=3D0x200003ae</div><div> [0m</div><div> [0;33;41mBLOG ERROR blog_request :b=
log_key corruption when adding flow net_p=3Dffffffc02b3dddd0=C2=A0 dir=3D0 =
old_key=3D0x20000433 new_key=3D0x20000436</div><div> [0m</div><div> [0;33;4=
1mBLOG ERROR blog_request :blog_key corruption when adding flow net_p=3Dfff=
fffc02b3dddd0=C2=A0 dir=3D0 old_key=3D0x20000436 new_key=3D0x20000469</div>=
<div> [0m</div><div> [0;33;41mBLOG ERROR blog_request :blog_key corruption =
when adding flow net_p=3Dffffffc02b3dddd0=C2=A0 dir=3D0 old_key=3D0x2000046=
9 new_key=3D0x2000046a</div><div> [0m</div><div> [0;33;41mBLOG ERROR blog_r=
equest :blog_key corruption when adding flow net_p=3Dffffffc02b3dddd0=C2=A0=
 dir=3D0 old_key=3D0x2000046a new_key=3D0x2000046b</div><div> [0m</div><div=
> [0;33;41mBLOG ERROR blog_request :blog_key corruption when adding flow ne=
t_p=3Dffffffc02b3dddd0=C2=A0 dir=3D0 old_key=3D0x2000046b new_key=3D0x20000=
46c</div><div> [0m</div><div> [0;33;41mBLOG ERROR blog_request :blog_key co=
rruption when adding flow net_p=3Dffffffc02b3dddd0=C2=A0 dir=3D0 old_key=3D=
0x2000046c new_key=3D0x2000046d</div><div> [0m</div><div> [0;33;41mBLOG ERR=
OR blog_request :blog_key corruption when adding flow net_p=3Dffffffc02b3dd=
dd0=C2=A0 dir=3D0 old_key=3D0x2000046d new_key=3D0x2000046e</div><div> [0m<=
/div><div> [0;33;41mBLOG ERROR blog_request :blog_key corruption when addin=
g flow net_p=3Dffffffc02b3dddd0=C2=A0 dir=3D0 old_key=3D0x2000046e new_key=
=3D0x20000471</div><div> [0m</div><div> [0;33;41mBLOG ERROR blog_request :b=
log_key corruption when adding flow net_p=3Dffffffc02b3dddd0=C2=A0 dir=3D0 =
old_key=3D0x20000471 new_key=3D0x20000472</div><div> [0m</div><div> [0;33;4=
1mBLOG ERROR blog_request :blog_key corruption when adding flow net_p=3Dfff=
fffc02b3dddd0=C2=A0 dir=3D0 old_key=3D0x20000472 new_key=3D0x20000477</div>=
<div> [0m</div><div> [0;33;41mBLOG ERROR blog_request :blog_key corruption =
when adding flow net_p=3Dffffffc02b3dddd0=C2=A0 dir=3D0 old_key=3D0x2000047=
7 new_key=3D0x20000479</div><div> [0m</div><div> [0;33;41mBLOG ERROR blog_r=
equest :blog_key corruption when adding flow net_p=3Dffffffc02b3dddd0=C2=A0=
 dir=3D0 old_key=3D0x20000479 new_key=3D0x2000047a</div><div> [0m</div><div=
> [0;33;41mBLOG ERROR blog_request :blog_key corruption when adding flow ne=
t_p=3Dffffffc02b3dddd0=C2=A0 dir=3D0 old_key=3D0x2000047a new_key=3D0x20000=
47b</div><div> [0m</div><div> [0;33;41mBLOG ERROR blog_request :blog_key co=
rruption when adding flow net_p=3Dffffffc02b3dddd0=C2=A0 dir=3D0 old_key=3D=
0x2000047b new_key=3D0x2000047c</div><div> [0m</div><div> [0;33;41mBLOG ERR=
OR blog_request :blog_key corruption when adding flow net_p=3Dffffffc02b3dd=
dd0=C2=A0 dir=3D0 old_key=3D0x2000047c new_key=3D0x20000499</div><div> [0m<=
/div><div> [0;33;41mBLOG ERROR blog_request :blog_key corruption when addin=
g flow net_p=3Dffffffc02b3dddd0=C2=A0 dir=3D0 old_key=3D0x20000499 new_key=
=3D0x20000562</div><div> [0m</div><div> [0;33;41mBLOG ERROR blog_request :b=
log_key corruption when deleting flowfor net_p=3Dffffffc02c552380=C2=A0</di=
v><div> [0m</div><div> [0;33;41mBLOG ERROR blog_request :blog_key corruptio=
n when adding flow net_p=3Dffffffc02b3dddd0=C2=A0 dir=3D0 old_key=3D0x20000=
562 new_key=3D0x20000569</div><div> [0m</div><div> [0;33;41mBLOG ERROR blog=
_request :blog_key corruption when adding flow net_p=3Dffffffc02b3dddd0=C2=
=A0 dir=3D0 old_key=3D0x20000569 new_key=3D0x2000056d</div><div> [0m</div><=
div> [0;33;41mBLOG ERROR blog_request :blog_key corruption when adding flow=
 net_p=3Dffffffc02ac08010=C2=A0 dir=3D0 old_key=3D0x2000058f new_key=3D0x20=
000590</div><div> [0m</div><div> [0;33;41mBLOG ERROR blog_request :blog_key=
 corruption when adding flow net_p=3Dffffffc02ac08010=C2=A0 dir=3D0 old_key=
=3D0x20000590 new_key=3D0x20000591</div><div> [0m</div><div> [0;33;41mBLOG =
ERROR blog_request :blog_key corruption when adding flow net_p=3Dffffffc02a=
c08010=C2=A0 dir=3D0 old_key=3D0x20000591 new_key=3D0x20000592</div><div> [=
0m</div><div> [0;33;41mBLOG ERROR blog_request :blog_key corruption when ad=
ding flow net_p=3Dffffffc02ac08010=C2=A0 dir=3D0 old_key=3D0x20000592 new_k=
ey=3D0x20000594</div><div> [0m</div><div> [0;33;41mBLOG ERROR blog_request =
:blog_key corruption when adding flow net_p=3Dffffffc02ac08010=C2=A0 dir=3D=
0 old_key=3D0x20000594 new_key=3D0x20000595</div><div> [0m</div><div> [0;33=
;41mBLOG ERROR blog_request :blog_key corruption when adding flow net_p=3Df=
fffffc02ac08010=C2=A0 dir=3D0 old_key=3D0x20000595 new_key=3D0x20000596</di=
v><div> [0m</div><div> [0;33;41mBLOG ERROR blog_request :blog_key corruptio=
n when adding flow net_p=3Dffffffc02ac08010=C2=A0 dir=3D0 old_key=3D0x20000=
596 new_key=3D0x20000598</div><div> [0m</div><div> [0;33;41mBLOG ERROR blog=
_request :blog_key corruption when adding flow net_p=3Dffffffc02ac08010=C2=
=A0 dir=3D0 old_key=3D0x20000598 new_key=3D0x20000599</div><div> [0m</div><=
div> [0;33;41mBLOG ERROR blog_request :blog_key corruption when adding flow=
 net_p=3Dffffffc02ac08010=C2=A0 dir=3D0 old_key=3D0x20000599 new_key=3D0x20=
00059a</div><div> [0m</div><div> [0;33;41mBLOG ERROR blog_request :blog_key=
 corruption when adding flow net_p=3Dffffffc02ac08010=C2=A0 dir=3D0 old_key=
=3D0x2000059a new_key=3D0x2000059b</div><div> [0m</div><div> [0;33;41mBLOG =
ERROR blog_request :blog_key corruption when adding flow net_p=3Dffffffc02a=
c08010=C2=A0 dir=3D0 old_key=3D0x2000059b new_key=3D0x2000059c</div><div> [=
0m</div><div> [0;33;41mBLOG ERROR blog_request :blog_key corruption when ad=
ding flow net_p=3Dffffffc02ac08010=C2=A0 dir=3D0 old_key=3D0x2000059c new_k=
ey=3D0x2000059d</div><div> [0m</div><div> [0;33;41mBLOG ERROR blog_request =
:blog_key corruption when adding flow net_p=3Dffffffc02ac08010=C2=A0 dir=3D=
0 old_key=3D0x2000059d new_key=3D0x2000059e</div><div> [0m</div><div> [0;33=
;41mBLOG ERROR blog_request :blog_key corruption when adding flow net_p=3Df=
fffffc02ac08010=C2=A0 dir=3D0 old_key=3D0x2000059e new_key=3D0x200005a0</di=
v><div> [0m</div><div> [0;33;41mBLOG ERROR blog_request :blog_key corruptio=
n when adding flow net_p=3Dffffffc02ac08010=C2=A0 dir=3D0 old_key=3D0x20000=
5a0 new_key=3D0x200005a1</div><div> [0m</div><div> [0;33;41mBLOG ERROR blog=
_request :blog_key corruption when adding flow net_p=3Dffffffc02ac08010=C2=
=A0 dir=3D0 old_key=3D0x200005a1 new_key=3D0x200005a2</div><div> [0m</div><=
div> [0;33;41mBLOG ERROR blog_request :blog_key corruption when deleting fl=
owfor net_p=3Dffffffc02c552380=C2=A0</div><div> [0m</div><div> [0;33;41mBLO=
G ERROR blog_request :blog_key corruption when adding flow net_p=3Dffffffc0=
2e981010=C2=A0 dir=3D0 old_key=3D0x20000604 new_key=3D0x20000605</div><div>=
 [0m</div><div> [0;33;41mBLOG ERROR blog_request :blog_key corruption when =
adding flow net_p=3Dffffffc02e981010=C2=A0 dir=3D0 old_key=3D0x20000605 new=
_key=3D0x20000606</div><div> [0m</div><div> [0;33;41mBLOG ERROR blog_reques=
t :blog_key corruption when adding flow net_p=3Dffffffc02e981010=C2=A0 dir=
=3D0 old_key=3D0x20000606 new_key=3D0x20000607</div><div> [0m</div><div> [0=
;33;41mBLOG ERROR blog_request :blog_key corruption when adding flow net_p=
=3Dffffffc02e981010=C2=A0 dir=3D0 old_key=3D0x20000607 new_key=3D0x2000060a=
</div><div> [0m</div><div> [0;33;41mBLOG ERROR blog_request :blog_key corru=
ption when adding flow net_p=3Dffffffc02e981010=C2=A0 dir=3D0 old_key=3D0x2=
000060a new_key=3D0x2000060c</div><div> [0m</div><div> [0;33;41mBLOG ERROR =
blog_request :blog_key corruption when adding flow net_p=3Dffffffc02e981010=
=C2=A0 dir=3D0 old_key=3D0x2000060c new_key=3D0x2000060e</div><div> [0m</di=
v><div> [0;33;41mBLOG ERROR blog_request :blog_key corruption when adding f=
low net_p=3Dffffffc02e981010=C2=A0 dir=3D0 old_key=3D0x2000060e new_key=3D0=
x2000060f</div><div> [0m</div><div> [0;33;41mBLOG ERROR blog_request :blog_=
key corruption when deleting flowfor net_p=3Dffffffc02b3dddd0=C2=A0</div><d=
iv> [0m</div><div> [0;33;41mBLOG ERROR blog_request :blog_key corruption wh=
en deleting flowfor net_p=3Dffffffc02b3dddd0=C2=A0</div><div> [0m</div><div=
> [0;33;41mBLOG ERROR blog_request :blog_key corruption when deleting flowf=
or net_p=3Dffffffc02b3dddd0=C2=A0</div><div> [0m</div><div> [0;33;41mBLOG E=
RROR blog_request :blog_key corruption when deleting flowfor net_p=3Dffffff=
c02b3dddd0=C2=A0</div><div> [0m</div><div> [0;33;41mBLOG ERROR blog_request=
 :blog_key corruption when deleting flowfor net_p=3Dffffffc02b3dddd0=C2=A0<=
/div><div> [0m</div><div> [0;33;41mBLOG ERROR blog_request :blog_key corrup=
tion when deleting flowfor net_p=3Dffffffc02b3dddd0=C2=A0</div><div> [0m</d=
iv><div> [0;33;41mBLOG ERROR blog_request :blog_key corruption when adding =
flow net_p=3Dffffffc02b27c010=C2=A0 dir=3D0 old_key=3D0x20000683 new_key=3D=
0x20000684</div><div> [0m</div><div> [0;33;41mBLOG ERROR blog_request :blog=
_key corruption when deleting flowfor net_p=3Dffffffc02b3dddd0=C2=A0</div><=
div> [0m</div><div> [0;33;41mBLOG ERROR blog_request :blog_key corruption w=
hen adding flow net_p=3Dffffffc02b27c010=C2=A0 dir=3D0 old_key=3D0x20000684=
 new_key=3D0x20000693</div><div> [0m</div><div> [0;33;41mBLOG ERROR blog_re=
quest :blog_key corruption when adding flow net_p=3Dffffffc02c4796f0=C2=A0 =
dir=3D0 old_key=3D0x200006cd new_key=3D0x200006db</div><div> [0m</div><div>=
 [0;33;41mBLOG ERROR blog_request :blog_key corruption when deleting flowfo=
r net_p=3Dffffffc02b3dddd0=C2=A0</div><div> [0m</div><div> [0;33;41mBLOG ER=
ROR blog_request :blog_key corruption when adding flow net_p=3Dffffffc02c47=
96f0=C2=A0 dir=3D0 old_key=3D0x200006db new_key=3D0x200006e3</div><div> [0m=
</div><div> [0;33;41mBLOG ERROR blog_request :blog_key corruption when dele=
ting flowfor net_p=3Dffffffc02b3dddd0=C2=A0</div><div> [0m</div><div> [0;33=
;41mBLOG ERROR blog_request :blog_key corruption when adding flow net_p=3Df=
fffffc02c4796f0=C2=A0 dir=3D0 old_key=3D0x200006e3 new_key=3D0x200006e9</di=
v><div> [0m</div><div> [0;33;41mBLOG ERROR blog_request :blog_key corruptio=
n when adding flow net_p=3Dffffffc02c4796f0=C2=A0 dir=3D0 old_key=3D0x20000=
6e9 new_key=3D0x200006ea</div><div> [0m</div><div> [0;33;41mBLOG ERROR blog=
_request :blog_key corruption when adding flow net_p=3Dffffffc02c4796f0=C2=
=A0 dir=3D0 old_key=3D0x200006ea new_key=3D0x200006eb</div><div> [0m</div><=
div> [0;33;41mBLOG ERROR blog_request :blog_key corruption when adding flow=
 net_p=3Dffffffc02c4796f0=C2=A0 dir=3D0 old_key=3D0x200006eb new_key=3D0x20=
0006ec</div><div> [0m</div><div> [0;33;41mBLOG ERROR blog_request :blog_key=
 corruption when adding flow net_p=3Dffffffc02c4796f0=C2=A0 dir=3D0 old_key=
=3D0x200006ec new_key=3D0x200006ed</div><div> [0m</div><div> [0;33;41mBLOG =
ERROR blog_request :blog_key corruption when adding flow net_p=3Dffffffc02c=
4796f0=C2=A0 dir=3D0 old_key=3D0x200006ed new_key=3D0x200006ee</div><div> [=
0m</div><div> [0;33;41mBLOG ERROR blog_request :blog_key corruption when ad=
ding flow net_p=3Dffffffc02c4796f0=C2=A0 dir=3D0 old_key=3D0x200006ee new_k=
ey=3D0x200006ef</div><div> [0m</div><div> [0;33;41mBLOG ERROR blog_request =
:blog_key corruption when adding flow net_p=3Dffffffc02c4796f0=C2=A0 dir=3D=
0 old_key=3D0x200006ef new_key=3D0x200006f0</div><div> [0m</div><div> [0;33=
;41mBLOG ERROR blog_request :blog_key corruption when adding flow net_p=3Df=
fffffc02c4796f0=C2=A0 dir=3D0 old_key=3D0x200006f0 new_key=3D0x200006f1</di=
v><div> [0m</div><div> [0;33;41mBLOG ERROR blog_request :blog_key corruptio=
n when adding flow net_p=3Dffffffc02c4796f0=C2=A0 dir=3D0 old_key=3D0x20000=
6f1 new_key=3D0x200006f2</div><div> [0m</div><div> [0;33;41mBLOG ERROR blog=
_request :blog_key corruption when adding flow net_p=3Dffffffc02c4796f0=C2=
=A0 dir=3D0 old_key=3D0x200006f2 new_key=3D0x200006f3</div><div> [0m</div><=
div> [0;33;41mBLOG ERROR blog_request :blog_key corruption when deleting fl=
owfor net_p=3Dffffffc02b3dddd0=C2=A0</div><div> [0m</div><div> [0;33;41mBLO=
G ERROR blog_request :blog_key corruption when deleting flowfor net_p=3Dfff=
fffc02ac08010=C2=A0</div><div> [0m</div><div> [0;33;41mBLOG ERROR blog_requ=
est :blog_key corruption when deleting flowfor net_p=3Dffffffc02ac08010=C2=
=A0</div><div> [0m</div><div> [0;33;41mBLOG ERROR blog_request :blog_key co=
rruption when deleting flowfor net_p=3Dffffffc02ac08010=C2=A0</div><div> [0=
m</div><div> [0;33;41mBLOG ERROR blog_request :blog_key corruption when del=
eting flowfor net_p=3Dffffffc02ac08010=C2=A0</div><div> [0m</div><div> [0;3=
3;41mBLOG ERROR blog_request :blog_key corruption when deleting flowfor net=
_p=3Dffffffc02ac08010=C2=A0</div><div> [0m</div><div> [0;33;41mBLOG ERROR b=
log_request :blog_key corruption when deleting flowfor net_p=3Dffffffc02ac0=
8010=C2=A0</div><div> [0m</div><div> [0;33;41mBLOG ERROR blog_request :blog=
_key corruption when deleting flowfor net_p=3Dffffffc02ac08010=C2=A0</div><=
div> [0m</div><div> [0;33;41mBLOG ERROR blog_request :blog_key corruption w=
hen deleting flowfor net_p=3Dffffffc02ac08010=C2=A0</div><div> [0m</div><di=
v> [0;33;41mBLOG ERROR blog_request :blog_key corruption when deleting flow=
for net_p=3Dffffffc02ac08010=C2=A0</div><div> [0m</div><div> [0;33;41mBLOG =
ERROR blog_request :blog_key corruption when deleting flowfor net_p=3Dfffff=
fc02ac08010=C2=A0</div><div> [0m</div><div> [0;33;41mBLOG ERROR blog_reques=
t :blog_key corruption when deleting flowfor net_p=3Dffffffc02ac08010=C2=A0=
</div><div> [0m</div><div> [0;33;41mBLOG ERROR blog_request :blog_key corru=
ption when deleting flowfor net_p=3Dffffffc02ac08010=C2=A0</div><div> [0m</=
div><div> [0;33;41mBLOG ERROR blog_request :blog_key corruption when deleti=
ng flowfor net_p=3Dffffffc02ac08010=C2=A0</div><div> [0m</div><div> [0;33;4=
1mBLOG ERROR blog_request :blog_key corruption when deleting flowfor net_p=
=3Dffffffc02ac08010=C2=A0</div><div> [0m</div><div> [0;33;41mBLOG ERROR blo=
g_request :blog_key corruption when deleting flowfor net_p=3Dffffffc02ac080=
10=C2=A0</div><div> [0m</div><div> [0;33;41mBLOG ERROR blog_request :blog_k=
ey corruption when deleting flowfor net_p=3Dffffffc02e981010=C2=A0</div><di=
v> [0m</div><div> [0;33;41mBLOG ERROR blog_request :blog_key corruption whe=
n deleting flowfor net_p=3Dffffffc02e981010=C2=A0</div><div> [0m</div><div>=
 [0;33;41mBLOG ERROR blog_request :blog_key corruption when deleting flowfo=
r net_p=3Dffffffc02e981010=C2=A0</div><div> [0m</div><div> [0;33;41mBLOG ER=
ROR blog_request :blog_key corruption when deleting flowfor net_p=3Dffffffc=
02e981010=C2=A0</div><div> [0m</div><div> [0;33;41mBLOG ERROR blog_request =
:blog_key corruption when deleting flowfor net_p=3Dffffffc02ac08010=C2=A0</=
div><div> [0m</div><div> [0;33;41mBLOG ERROR blog_request :blog_key corrupt=
ion when deleting flowfor net_p=3Dffffffc02e981010=C2=A0</div><div> [0m</di=
v><div> [0;33;41mBLOG ERROR blog_request :blog_key corruption when deleting=
 flowfor net_p=3Dffffffc02e981010=C2=A0</div><div> [0m</div><div> [0;33;41m=
BLOG ERROR blog_request :blog_key corruption when deleting flowfor net_p=3D=
ffffffc02e981010=C2=A0</div><div> [0m</div><div>ERR: rdpa_cpu_tx_port_enet_=
lan#223: rdpa_cpu_tx_port_enet_lan failed. rdd_rc=3D120 tx_rdd_error_count=
=3D1</div><div> [0;33;41mBLOG ERROR blog_request :blog_key corruption when =
deleting flowfor net_p=3Dffffffc02b27c010=C2=A0</div><div> [0m</div><div> [=
0;33;41mBLOG ERROR blog_request :blog_key corruption when deleting flowfor =
net_p=3Dffffffc02c4796f0=C2=A0</div><div> [0m</div><div> [0;33;41mBLOG ERRO=
R blog_request :blog_key corruption when deleting flowfor net_p=3Dffffffc02=
b3dddd0=C2=A0</div><div> [0m</div><div> [0;33;41mBLOG ERROR blog_request :b=
log_key corruption when deleting flowfor net_p=3Dffffffc02b3dddd0=C2=A0</di=
v><div> [0m</div><div> [0;33;41mBLOG ERROR blog_request :blog_key corruptio=
n when deleting flowfor net_p=3Dffffffc02c4796f0=C2=A0</div><div> [0m</div>=
<div> [0;33;41mBLOG ERROR blog_request :blog_key corruption when deleting f=
lowfor net_p=3Dffffffc02c4796f0=C2=A0</div><div> [0m</div><div> [0;33;41mBL=
OG ERROR blog_request :blog_key corruption when deleting flowfor net_p=3Dff=
ffffc02c4796f0=C2=A0</div><div> [0m</div><div> [0;33;41mBLOG ERROR blog_req=
uest :blog_key corruption when deleting flowfor net_p=3Dffffffc02c4796f0=C2=
=A0</div><div> [0m</div><div> [0;33;41mBLOG ERROR blog_request :blog_key co=
rruption when deleting flowfor net_p=3Dffffffc02c4796f0=C2=A0</div><div> [0=
m</div><div> [0;33;41mBLOG ERROR blog_request :blog_key corruption when del=
eting flowfor net_p=3Dffffffc02c4796f0=C2=A0</div><div> [0m</div><div> [0;3=
3;41mBLOG ERROR blog_request :blog_key corruption when deleting flowfor net=
_p=3Dffffffc02c4796f0=C2=A0</div><div> [0m</div><div> [0;33;41mBLOG ERROR b=
log_request :blog_key corruption when deleting flowfor net_p=3Dffffffc02c47=
96f0=C2=A0</div><div> [0m</div><div> [0;33;41mBLOG ERROR blog_request :blog=
_key corruption when deleting flowfor net_p=3Dffffffc02c4796f0=C2=A0</div><=
div> [0m</div><div> [0;33;41mBLOG ERROR blog_request :blog_key corruption w=
hen deleting flowfor net_p=3Dffffffc02c4796f0=C2=A0</div><div> [0m</div><di=
v> [0;33;41mBLOG ERROR blog_request :blog_key corruption when deleting flow=
for net_p=3Dffffffc02c4796f0=C2=A0</div><div> [0m</div><div> [0;33;41mBLOG =
ERROR blog_request :blog_key corruption when deleting flowfor net_p=3Dfffff=
fc02c4796f0=C2=A0</div><div> [0m</div></div><div><br></div><div>-----------=
--------------------------------------------</div><div>I don&#39;t know how=
 to code and how to solve this</div></div></div><div>But I do know how to b=
uild a embedded firmware from source code (openwrt, asuswrt ...), and confi=
gure vpn on it.=C2=A0</div><div>If there is any way to solve this, I would =
very like to do some testing=C2=A0</div><div><br></div></div></div></div>

--000000000000c1b459057d6cf238--

--===============4504862425266455082==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============4504862425266455082==--
