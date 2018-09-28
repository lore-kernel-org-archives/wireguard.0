Return-Path: <SRS0=QupR=MK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4B76C43382
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 28 Sep 2018 04:44:05 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EFA82170E
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 28 Sep 2018 04:44:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="es2E3han"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EFA82170E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e7c7bd48;
	Fri, 28 Sep 2018 04:41:07 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dbea880e
 for <wireguard@lists.zx2c4.com>;
 Fri, 28 Sep 2018 04:41:04 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d12291b7
 for <wireguard@lists.zx2c4.com>;
 Fri, 28 Sep 2018 04:41:04 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 564f313e
 for <wireguard@lists.zx2c4.com>;
 Fri, 28 Sep 2018 04:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=6KuddjFAtBh2+sGx2AZ6waTVuWw=; b=es2E3h
 anM8woQ2U9o46a7jbo87RSO3mJfTqzmqgv97Vxv292d2WP9JyPdicEsTDPROXEPZ
 kEHgECAzSqC/HsiT6SoWnYMT8XFmu2aW7I9+DpDWSG5f7FRJ7JbiOThJgUYbYybI
 /siFH5yO10li0tgWIw7V/IoNMdG/PWi2vlxLbpt6GI9LFjPHLOy2iM4jFHj9Qk1s
 5+WlIWThNZNz6+Zct3Ws67anlsD7bwjZT+jw3Swq2GbL4k70iu3JAh2UTCqHyR2I
 2m4/SwROprTbVDK1y2AwLwvEhJcfBgQC/KFXDf//3RB0Ys40P/qxA9shJro/lA35
 mjf0lhuY+yqioncw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9845da71
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 28 Sep 2018 04:25:14 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id o13-v6so4818704otl.4
 for <wireguard@lists.zx2c4.com>; Thu, 27 Sep 2018 21:43:59 -0700 (PDT)
X-Gm-Message-State: ABuFfojF4dEb/GU5DYGvIpMUqg4jTKszqM+XaL6YpR27LNx+RAiPtvOr
 u7racjw1NRTH93W4X7nYFH5IKTFoqJl7XPUJQgA=
X-Google-Smtp-Source: ACcGV62PaiJzyYNhX5ApvU4UQL3sJ5oDg9SsOQsTgsIu39Q3xoxfgMbGFI79yAWxmBDkq0VDW1W9vloWAaF+nA4m4uA=
X-Received: by 2002:a9d:61d0:: with SMTP id
 h16-v6mr2808074otk.225.1538109839012; 
 Thu, 27 Sep 2018 21:43:59 -0700 (PDT)
MIME-Version: 1.0
References: <D6gJBvvJiEjhD6sGH1nVqTjK0phGs51GwYC8Fv6emeVhbYQzru65w-G3uCH7osm1EK1I2t_rsYDfaKJ4EO_8Tm9c6_T8ujEp0bWdVk8Jv2I=@protonmail.com>
 <CAHmME9p1VH0Hmqqi0ZAFMsy4Jj2BWY6x0Ng3csN1fwgOqhKrrw@mail.gmail.com>
 <EHYEPfkFpkfKvezFkP0dpmtlpyl6SuHLqMvOWl8PMZhUJZxGjQTmfbL8YqhxxC4NsvFm7p4N6OFTmfURdPerP5quN0wgmhTSDSBgac-GvS0=@protonmail.com>
 <qKu5swioFkO6-GRUyzeclQ3H7fOed-Uf0Xd4QZRw0pwywVTaZZop9zTIGQ8EBAGGXhSJeTgu3_XSLYgFNaokCvVDSNdkvMr6Y6QiDHme-io=@protonmail.com>
In-Reply-To: <qKu5swioFkO6-GRUyzeclQ3H7fOed-Uf0Xd4QZRw0pwywVTaZZop9zTIGQ8EBAGGXhSJeTgu3_XSLYgFNaokCvVDSNdkvMr6Y6QiDHme-io=@protonmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 28 Sep 2018 06:43:47 +0200
X-Gmail-Original-Message-ID: <CAHmME9pMGSL+w21n6FFTY+SHse=vVhYroBxaOE+q4VNCsJ7rRw@mail.gmail.com>
Message-ID: <CAHmME9pMGSL+w21n6FFTY+SHse=vVhYroBxaOE+q4VNCsJ7rRw@mail.gmail.com>
Subject: Re: Connection issues with Google Fi
To: Lane Russell <lanerussell@protonmail.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hi Lane,

Ahh this is T-Mobile XLAT/CLAT happening. I'll put a fix for this into
the next android client release. Thanks for mentioning it.

Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
