Return-Path: <SRS0=3tYq=PM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A3B0C43387
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  4 Jan 2019 03:17:27 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F12A20665
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  4 Jan 2019 03:17:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=eero.com header.i=@eero.com header.b="gixotiaT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F12A20665
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=eero.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 50e0bb70;
	Fri, 4 Jan 2019 03:14:49 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id de370f98
 for <WireGuard@lists.zx2c4.com>; Fri, 4 Jan 2019 03:14:48 +0000 (UTC)
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com
 [IPv6:2607:f8b0:4864:20::936])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6a321a40
 for <WireGuard@lists.zx2c4.com>; Fri, 4 Jan 2019 03:14:48 +0000 (UTC)
Received: by mail-ua1-x936.google.com with SMTP id p9so11606284uaa.5
 for <WireGuard@lists.zx2c4.com>; Thu, 03 Jan 2019 19:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eero.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7hj731JRO47O4SXhcXSYZBRXMaiI3rCxJuG/15cDp4E=;
 b=gixotiaTs56OzRRR19i8yN/cCNysaT34EiGTCs1xd4xy1lmCvEd1qhDl0a3yVucynw
 3lJSbE/oa6GYsNJNsiJjD4antjAvGUNbjgLEgBhUy9IdfEyovWNvsI/gl73mnnK5q07m
 95o1w7C7FRJxlpITEtMkCO9KIYMU2Oho/2Do4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7hj731JRO47O4SXhcXSYZBRXMaiI3rCxJuG/15cDp4E=;
 b=ahTV/cE8XAHUyNdlGq/Kr9FxbtkWGtxv8H6P6kE0M+8X9WK3E31XGrZUZq/odgxQor
 kFzGO5Pbb3TvA2OOBEhkH5L4ya6XMtkwvOF9JAWs2fYSUYS3sj47cmXcE2uml88zWVog
 ca634Zhjbs2zghyZm9MNDW7V7409Dh078vKlSlaw/3O+kB6VkB5D3JZvbeTIrGbbb7A2
 DPOQbB4lnguy2nsXWZnuesJkvuoAIg6Ucu2RqR2h9KtuWMk98VlAQyXT5V1lqEh9YXT1
 3OY4nrM2r706PYeT0rbuVz5RqTv0lt650ZZReXkfjUWxM2iaZpljuxJBjeNgDKeC+c9z
 +r6A==
X-Gm-Message-State: AJcUukcw4bHtNrfpwlAYctrPel7MUGXhm8M5IRAP1TETTU5+f5YXthtB
 0ycp3cOoBgV2+X+wnpl71iGwP0bZ4PJ46EuWrLnInQ==
X-Google-Smtp-Source: ALg8bN5eVzbhNY7tq8k7N73uiK0i04vfCTgBOx3sp76+ilk292qIdA7d3+a0HLFrMRgXPHwaCULMi5mWKkDhyf63Hng=
X-Received: by 2002:ab0:4e23:: with SMTP id g35mr19035017uah.8.1546571842247; 
 Thu, 03 Jan 2019 19:17:22 -0800 (PST)
MIME-Version: 1.0
References: <CAPRZce1x-TLHiZ=nU9s0_aYcWZdf_hTbcXYg+ZkAjD1F_=X9ng@mail.gmail.com>
In-Reply-To: <CAPRZce1x-TLHiZ=nU9s0_aYcWZdf_hTbcXYg+ZkAjD1F_=X9ng@mail.gmail.com>
From: David Cowden <dcow@eero.com>
Date: Thu, 3 Jan 2019 19:17:10 -0800
Message-ID: <CACN7iODSSjKJEWPdTKOK3diUFGyj-tRbvKWqNzsG62aKUN28OQ@mail.gmail.com>
Subject: Re: Wireguard + anycast
To: Edward Vielmetti <edward.vielmetti@gmail.com>
Cc: WireGuard@lists.zx2c4.com
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
Content-Type: multipart/mixed; boundary="===============7840044067951201933=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============7840044067951201933==
Content-Type: multipart/alternative; boundary="000000000000471257057e995100"

--000000000000471257057e995100
Content-Type: text/plain; charset="UTF-8"

If Wireguard let you configure a list of allowed keys for a peer (instead
of a single key) that would be a logical solution without much extra
complexity at all I imagine.

On Thu, Jan 3, 2019 at 2:39 PM Edward Vielmetti <edward.vielmetti@gmail.com>
wrote:

> A little thought experiment which I haven't tried yet.
>
> Using anycast, a single IP address can be routed to multiple machines in a
> data center or around the world.
>
> Is it at all possible that anycast and Wireguard would play together
> nicely? In particular, is it plausible that you could give a client an
> anycast address of a server to use as its endpoint, and that when it picked
> the correct / closest one that it would do the right thing?
>
> The naive approach would be to have all of the anycast devices share the
> same private/public key pair, but that has a bad smell. And I don't know
> what would happen if your routing changed in mid-connection.
>
> (anycast is the technology used to give name servers a single global
> address, like Google's 8.8.8.8 DNS)
>
> --
> Edward Vielmetti +1 734 330 2465
> edward.vielmetti@gmail.com
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--000000000000471257057e995100
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">If Wireguard let you configure a list of allowed keys for =
a peer (instead of a single key) that would be a logical solution without m=
uch extra complexity at all I imagine.<br></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr">On Thu, Jan 3, 2019 at 2:39 PM Edward Vielmetti &lt;<a=
 href=3D"mailto:edward.vielmetti@gmail.com">edward.vielmetti@gmail.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div =
dir=3D"ltr">A little thought experiment which I haven&#39;t tried yet.<div>=
<br></div><div>Using anycast, a single IP address can be routed to multiple=
 machines in a data center or around the world.</div><div><br></div><div>Is=
 it at all possible that anycast and Wireguard would play together nicely? =
In particular, is it plausible that you could give a client an anycast addr=
ess of a server to use as its endpoint, and that when it picked the correct=
 / closest one that it would do the right thing?</div><div><br></div><div>T=
he naive approach would be to have all of the anycast devices share the sam=
e private/public key pair, but that has a bad smell. And I don&#39;t know w=
hat would happen if your routing changed in mid-connection.</div><div><br><=
/div><div>(anycast is the technology used to give name servers a single glo=
bal address, like Google&#39;s 8.8.8.8 DNS)<br clear=3D"all"><div><br></div=
>-- <br><div dir=3D"ltr" class=3D"gmail-m_6052099409359437970gmail_signatur=
e"><span>Edward Vielmetti=C2=A0<span id=3D"gmail-m_6052099409359437970gc-nu=
mber-93" class=3D"gmail-m_6052099409359437970gc-cs-link" title=3D"Call with=
 Google Voice">+1 734 330 2465</span></span><div><a href=3D"mailto:edward.v=
ielmetti@gmail.com" target=3D"_blank">edward.vielmetti@gmail.com</a></div><=
div><br></div></div></div></div>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@li=
sts.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinfo/wireguard=
</a><br>
</blockquote></div>

--000000000000471257057e995100--

--===============7840044067951201933==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============7840044067951201933==--
