Return-Path: <SRS0=KrVi=4C=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 171FAC2BA83
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 14 Feb 2020 11:03:44 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9EF72168B
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 14 Feb 2020 11:03:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bossanova.com header.i=@bossanova.com header.b="oSY5pWTV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9EF72168B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bossanova.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fb112b09;
	Fri, 14 Feb 2020 10:55:09 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2b0b85bb
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Feb 2020 14:05:47 +0000 (UTC)
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4d665470
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Feb 2020 14:05:47 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id z3so7908929wru.3
 for <wireguard@lists.zx2c4.com>; Mon, 10 Feb 2020 06:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bossanova.com; s=bossanova;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NGygjBwpxPYO8XFoSQzN4ptPoP1Nf5aTr6s95G6ZFe0=;
 b=oSY5pWTVXinpnDzu9lGHK4L2T9U8dR91hxku8vlddws5WZlaGvwTkA1WUdEJJ4ORTX
 839U56nst7s7AF8qlipK3yVQJvkFEQacz+2fp5zQ8cS2RMu/hVr5j4BsxauE5hPIkBwJ
 z2FhXvnrXBgZu7f72TlOjct6ZOQhPci2Rwf6Uw3fhGy1LNBfSBUS4/gTITQE531I2O2R
 k/BlYqLKbqNIVyaDYu/qHgin3BIB9PmkQFeFbeiqHJN1hoBdttECkopKmPZTif+a/uWf
 Pfiec0WaAkf3y5ati78r/fT554BPgc9OnZ1ceMUtvJg+EeviXfxyreT0MrJTDPpkr/DB
 RZEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NGygjBwpxPYO8XFoSQzN4ptPoP1Nf5aTr6s95G6ZFe0=;
 b=arIAOJkErFrljz+miwI/h6x5YrwUC8ORvf1vDhopXtCeq5Vhb0AGg2MFyOShDu8+Qd
 dRxKDR3Q2PEH3nqxQdkJ8OoogsCjsYJV2sQ5YOpyUVzT8tUnSBJ0cbJDwjsdLxk01KGv
 SmSZ6uLzJFpsoqAqlmT+8CS/V0I6PvR6v9fbX7TFB5XEk39jWu0t2j2Dv4jFsNSIbzJ2
 Xj2Ea41mKUGfk/rtq1fn3iRmlxtHSPwatJhCsIDNKrU3q4hP0zlPsBcum1jzOby899ub
 Vf4ixsYYmaQ1BOQWpUe6pVRHBO9zQRx7yrXpSUgJ37jG95FDAFVMId16/L7LBwk+3TVn
 xP4Q==
X-Gm-Message-State: APjAAAUyDXiTEGiEvpz9xdcWueucHAoTODT6fxXTeboByAnFjJiAf90U
 7Jiutk1Wig/xNY8Qal8K7ztt7D3UuhiMLpBcELVc3w==
X-Google-Smtp-Source: APXvYqxWSms/XbjntfIBQ9cyQ2tFJiUdQKRzndh6XAG31rLLfN3wmcpGBxHGcSmxMJ7YfeNNVkhiOKxHCkicGcBoFng=
X-Received: by 2002:adf:f401:: with SMTP id g1mr2144437wro.129.1581343641208; 
 Mon, 10 Feb 2020 06:07:21 -0800 (PST)
MIME-Version: 1.0
References: <CA+w0pKbV0bUrYfvnZ82Nam2oCODGG5_hv4d+AzqYXvuto3Y_vg@mail.gmail.com>
 <CAHmME9pFY10ujuOWUD45YkEu8zgFgyQP+zxbSbYE+oh=2fhmnQ@mail.gmail.com>
In-Reply-To: <CAHmME9pFY10ujuOWUD45YkEu8zgFgyQP+zxbSbYE+oh=2fhmnQ@mail.gmail.com>
From: Barrett Strausser <barrett@bossanova.com>
Date: Mon, 10 Feb 2020 09:07:10 -0500
Message-ID: <CA+w0pKY0KGCBAPYqoTReXdDmB22ctWkczEoK-FFxoR3B8b0wzw@mail.gmail.com>
Subject: Re: CryptoKey Routing Management for Peers
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
X-Mailman-Approved-At: Fri, 14 Feb 2020 11:55:07 +0100
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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
Content-Type: multipart/mixed; boundary="===============3139832166679819441=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============3139832166679819441==
Content-Type: multipart/alternative; boundary="00000000000000a681059e39423e"

--00000000000000a681059e39423e
Content-Type: text/plain; charset="UTF-8"

I don't doubt that it can handle 1M peers.

My question was more concerned with can an *Organization *perform the
configuration management to handle 1M peers if all configuration is through
a static IP.

If I have 1M peers and .9999 have no change per day, that still leaves 100
changes or ~4 per hour. I'd argue it is a good practice to have to restart
services to pick up those changes.

I'll have a look at those links. Thank you very much

-b



On Sat, Feb 8, 2020 at 4:29 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> WireGuard has an API, via Netlink. This might help you:
>
> https://git.zx2c4.com/wireguard-tools/tree/contrib/embeddable-wg-library
> https://git.zx2c4.com/wireguard-tools/tree/src/uapi/linux/wireguard.h
>
> It can handle 1M peers, yes.
>

--00000000000000a681059e39423e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I don&#39;t doubt that it can handle 1M peers.=C2=A0<div><=
br></div><div>My question was more concerned with can an <i>Organization </=
i>perform the configuration management to handle 1M peers if all configurat=
ion is through a static IP.</div><div><br></div><div>If I have 1M peers and=
 .9999 have no change per day, that still leaves 100 changes or ~4 per hour=
. I&#39;d argue it is a good practice to have to restart services to pick u=
p those changes.</div><div><br></div><div>I&#39;ll have a look at those lin=
ks. Thank you very much</div><div><br></div><div>-b</div><div><br></div><di=
v><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">On Sat, Feb 8, 2020 at 4:29 PM Jason A. Donenfeld &lt;<a href=
=3D"mailto:Jason@zx2c4.com">Jason@zx2c4.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">WireGuard has an API, via Netlin=
k. This might help you:<br>
<br>
<a href=3D"https://git.zx2c4.com/wireguard-tools/tree/contrib/embeddable-wg=
-library" rel=3D"noreferrer" target=3D"_blank">https://git.zx2c4.com/wiregu=
ard-tools/tree/contrib/embeddable-wg-library</a><br>
<a href=3D"https://git.zx2c4.com/wireguard-tools/tree/src/uapi/linux/wiregu=
ard.h" rel=3D"noreferrer" target=3D"_blank">https://git.zx2c4.com/wireguard=
-tools/tree/src/uapi/linux/wireguard.h</a><br>
<br>
It can handle 1M peers, yes.<br>
</blockquote></div>

--00000000000000a681059e39423e--

--===============3139832166679819441==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============3139832166679819441==--
