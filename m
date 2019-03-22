Return-Path: <SRS0=+rGD=RZ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A523C43381
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 22 Mar 2019 19:48:55 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 657F221841
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 22 Mar 2019 19:48:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="OncmcNOd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 657F221841
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e12f179c;
	Fri, 22 Mar 2019 19:48:01 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 72f9bf96
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Mar 2019 19:48:00 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 01672002
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Mar 2019 19:48:00 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8540ce6f
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Mar 2019 19:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=Xex3SQaaahrOERcHIrQVJ2SXzrU=; b=OncmcN
 OdDGNN4OceySYWurFi9J4yOGv8m2UUFooxVZsGGjqSRMkK8gSQ0RaJ4VgnJrwSLD
 wUBFPprb75Bh+Osn72PELL6XWswhF9xox6EiwvBSL3fHZu7YeOJMS7S/hzhyHrhI
 SIkcgxV0lxxg2fpeJV24M1teYrhA1f7FZ8yYNKkZ1CPjEuqNX/SzEIGPd0nrLUoJ
 kNbEniChCK/sxs0ixscdcd0JDbC3CXHnJe9il9cIW+TdPhDJ2HVoFQbSI0WobaGm
 +xgZIeFi95SMndzH2TvB8+2vH95zXnu3N18Dapz2z5HIQojX+nckEuDb9K9Qc1cS
 aB8l0Gx18+2Gf9hw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 07de1371
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Mar 2019 19:26:48 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id t206so2635682oib.3
 for <wireguard@lists.zx2c4.com>; Fri, 22 Mar 2019 12:48:35 -0700 (PDT)
X-Gm-Message-State: APjAAAUDqfwjjnZWe6Vb4z4N+REpsP0lv+TYZOA+Myrb+x792MCJNdIZ
 4wtKYM0gOGBvJGZF2E0C8f0f+NKJ4HyXDjcsvhQ=
X-Google-Smtp-Source: APXvYqyplFNHipdYX9IxFB7pddeDGSuSjJn+5UkL30muO2P6XM4r1VfB2VcBZVMTyel8jTB1DAI+xknq5mcL3pqF8GM=
X-Received: by 2002:aca:61c4:: with SMTP id v187mr2866381oib.122.1553284115087; 
 Fri, 22 Mar 2019 12:48:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAO_nJAYPMoBNaKqNW10TRQSKA2EV_-9XqOhJmPmNVm4OuedOAw@mail.gmail.com>
In-Reply-To: <CAO_nJAYPMoBNaKqNW10TRQSKA2EV_-9XqOhJmPmNVm4OuedOAw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 22 Mar 2019 13:48:23 -0600
X-Gmail-Original-Message-ID: <CAHmME9r9k6iHgGRnKh8=aa-D-uHApLGc_LdqSnZu38V_NqO2HA@mail.gmail.com>
Message-ID: <CAHmME9r9k6iHgGRnKh8=aa-D-uHApLGc_LdqSnZu38V_NqO2HA@mail.gmail.com>
Subject: Re: TestFlight is no longer accepting testers ... new link needed?
To: member graysky <graysky@archlinux.us>
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
Content-Type: multipart/mixed; boundary="===============5504990721515357839=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============5504990721515357839==
Content-Type: multipart/alternative; boundary="000000000000ea49da0584b423b7"

--000000000000ea49da0584b423b7
Content-Type: text/plain; charset="UTF-8"

Apple took it down because the required device capability key conflicted
with an iPad in their test flight program, at exactly the same time the
main version was approved for the store. Interestingly the required device
capability key contained an erroneous entry "armv7", which we don't
actually require. So that's trivial to remediate, and the fix is already in
the repo. But it is interesting this was explicitly flagged for the first
time as part of their test program: does that mean they're working on a new
iPad chip that is armv8-only? It wouldn't surprise me.

On Fri, Mar 22, 2019, 13:25 John <graysky@archlinux.us> wrote:

> Is TestFlight for the iOS app no longer active?  Looking to get the
> latest build of the iOS client in hopes it is more robust for me (I
> see 0.0.20190319-5 a few days ago).
>

--000000000000ea49da0584b423b7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div data-smartmail=3D"gmail_signature">Apple took it dow=
n because the required device capability key conflicted with an iPad in the=
ir test flight program, at exactly the same time the main version was appro=
ved for the store. Interestingly the required device capability key contain=
ed an erroneous entry &quot;armv7&quot;, which we don&#39;t actually requir=
e. So that&#39;s trivial to remediate, and the fix is already in the repo. =
But it is interesting this was explicitly flagged for the first time as par=
t of their test program: does that mean they&#39;re working on a new iPad c=
hip that is armv8-only? It wouldn&#39;t surprise me.</div></div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 22, 2=
019, 13:25 John &lt;<a href=3D"mailto:graysky@archlinux.us" target=3D"_blan=
k" rel=3D"noreferrer">graysky@archlinux.us</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">Is TestFlight for the iOS app no longer active?=C2=
=A0 Looking to get the<br>
latest build of the iOS client in hopes it is more robust for me (I<br>
see 0.0.20190319-5 a few days ago).<br>
</blockquote></div>

--000000000000ea49da0584b423b7--

--===============5504990721515357839==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============5504990721515357839==--
