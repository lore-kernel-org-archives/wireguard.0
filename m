Return-Path: <SRS0=sGqt=WP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D325C3A5A0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 19 Aug 2019 17:39:30 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A9D320578
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 19 Aug 2019 17:39:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ULjk8sdL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A9D320578
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 59ece286;
	Mon, 19 Aug 2019 17:39:00 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cbe6cb38
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Aug 2019 07:26:46 +0000 (UTC)
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cc707ff0
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Aug 2019 07:26:46 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id s14so632881qkm.4
 for <wireguard@lists.zx2c4.com>; Mon, 19 Aug 2019 00:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=RkWwTwTzyouRcFKCyTjSTzjlU7znOmOPblDON/uDXl0=;
 b=ULjk8sdLRs/TKhZmj+wgYN2lUEAO38hsdb01jctzy7AaEozCXZ7mhdB73euHQqtMNo
 kZ1wp6OMkt4OxouUfnC4Q/9VwybYeBoulIf1q5QR7EtcnaJdh3QZjyaz683wWCj55QYj
 4tTym/8d2B58vyJALtJCk12+RBi9ZWJKGutECvpy6AUWZr2k672FkI4pgDEB3ivBNCaR
 eJtajGL2ar8ZIKYBqOP4ginCTcKffvqsHXOJW535sArzv7GCk82oeCe09bjUxMBE2oW7
 8+aDs6z7T+l+y5c2GAjSxeuCg459cmyNiLZmzDwEopiPwY5+2VeD5bpH2gxl+lgvdo8Q
 sUkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=RkWwTwTzyouRcFKCyTjSTzjlU7znOmOPblDON/uDXl0=;
 b=ob7r/wJlcP018g8O5ApJQlWUk+PT0Q8UWU7aNL2/vEusnXg0mspPlopESE1nkqX97C
 x49LottzMmJgiW6HiYo1oKMDQbsSA9ls5+CYEAC093dBTETZE2RSTeamFRcvNVv9Ssjk
 H6cGRpYH9g1UkHARt9arGSQdiyXie8hC8MfoXWDbxMG6O/anK+rJNuJrS8SfgG3QCynQ
 xwEb+UHlodqYpZncoAOwRSddETFXmRNxi3oj9GuWSygVKb2HX/OajBounhvOS3KbVoa7
 PCYrX7Z2TvGvl/jpxeIH/JqCN+zHqqOWEtiC5wr7efJphLHFUGmOIfMO0K3iGSQX/3S8
 KR8g==
X-Gm-Message-State: APjAAAWVH3CcaFRLkwuli5bd4O6dL1kkit6JTdeCmMIVtZAN+ZzoO54+
 qQ/t7A78isS3JDRtOpNGtASrWDIsL0egUOLC9ydLQJicvYxAkA==
X-Google-Smtp-Source: APXvYqw0Z59XKNMsMbNZ9trVUrzeB8TZWP2bw6JNEGZlERmjemJZVvhEFZURdKMSqFt8+xGek+C0GNIbaMilsUNDgnU=
X-Received: by 2002:a37:6555:: with SMTP id z82mr18844437qkb.319.1566199605390; 
 Mon, 19 Aug 2019 00:26:45 -0700 (PDT)
MIME-Version: 1.0
From: Lev Stipakov <lstipakov@gmail.com>
Date: Mon, 19 Aug 2019 10:26:34 +0300
Message-ID: <CAGyAFMWzGbheVD6iOm=UZxbkmHOWCPHq7QzCi3_BpGbZT4f2kA@mail.gmail.com>
Subject: Volatile in Wintun
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Mon, 19 Aug 2019 19:38:59 +0200
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
Content-Type: multipart/mixed; boundary="===============3574063018208563222=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============3574063018208563222==
Content-Type: multipart/alternative; boundary="0000000000002070b005907343e7"

--0000000000002070b005907343e7
Content-Type: text/plain; charset="UTF-8"

Hi,

I am working on Wintun support for OpenVPN..

I am a bit unsure about the purpose of volatile in Wintun.

According to https://en.cppreference.com/w/cpp/atomic/memory_order,
volatile ensures that accesses are not reordered within the thread of
execution, but order is not guaranteed to be observed by another thread.

On the other hand, Visual Studio generates memory barriers while accessing
volatile objects and targeting non-ARM architectures
https://docs.microsoft.com/en-us/cpp/cpp/volatile-cpp?view=vs-2019#microsoft-specific.
However, it also says that "for architectures other than ARM we strongly
recommend that you specify /volatile:iso, and use explicit synchronization
primitives and compiler intrinsics when you are dealing with memory that is
shared across threads."

A few question I would like to ask:

- Is guarantee that accesses are not reordered within the thread of
execution is enough?

- Do we rely on Microsoft-specific behavior of volatile for non-ARM
architecture?

- Could reordering performed in ARM be a problem? If yes, shouldn't we
(wintun and client app) use memory fences to synchronize accesses between
threads? In openvpn3 we use C++11 so we were thinking about
std::atomic_long with acquire/release semantics.

-- 
-Lev

--0000000000002070b005907343e7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div><div>I am working on Wintun support=
 for OpenVPN..</div><div><br></div><div>I am a bit unsure about the purpose=
 of volatile in Wintun.</div><div><br></div><div>According to=C2=A0<a href=
=3D"https://en.cppreference.com/w/cpp/atomic/memory_order" target=3D"_blank=
">https://en.cppreference.com/w/cpp/atomic/memory_order</a>, volatile ensur=
es that accesses are not reordered within the thread of execution, but orde=
r is not guaranteed to be observed by another thread.</div><div><br></div><=
div>On the other hand, Visual Studio generates memory barriers while access=
ing volatile objects and targeting non-ARM architectures=C2=A0<a href=3D"ht=
tps://docs.microsoft.com/en-us/cpp/cpp/volatile-cpp?view=3Dvs-2019#microsof=
t-specific" target=3D"_blank">https://docs.microsoft.com/en-us/cpp/cpp/vola=
tile-cpp?view=3Dvs-2019#microsoft-specific</a>. However, it also says that =
&quot;for architectures other than ARM we strongly recommend that you speci=
fy /volatile:iso, and use explicit synchronization primitives and compiler =
intrinsics when you are dealing with memory that is shared across threads.&=
quot;</div><div><br></div><div>A few question I would like to ask:</div><di=
v><br></div><div>- Is guarantee that accesses are not reordered within the =
thread of execution is enough?</div><div><br></div><div>- Do we rely on Mic=
rosoft-specific behavior of volatile for non-ARM architecture?</div><div><b=
r></div><div>- Could reordering performed in ARM be a problem? If yes, shou=
ldn&#39;t we (wintun and client app) use memory fences to synchronize acces=
ses between threads? In openvpn3 we use C++11 so we were thinking about std=
::atomic_long with acquire/release semantics.</div></div><div><div><br></di=
v>-- <br><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail=
_signature">-Lev</div></div></div>

--0000000000002070b005907343e7--

--===============3574063018208563222==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============3574063018208563222==--
