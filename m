Return-Path: <SRS0=3VOv=OQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50D00C07E85
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  7 Dec 2018 04:22:10 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C490D2082D
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  7 Dec 2018 04:22:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="kE+3n0/r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C490D2082D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c4e70fe1;
	Fri, 7 Dec 2018 04:13:53 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7b37ab3e
 for <wireguard@lists.zx2c4.com>; Fri, 7 Dec 2018 04:13:51 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c6007a68
 for <wireguard@lists.zx2c4.com>; Fri, 7 Dec 2018 04:13:51 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d6a27b30
 for <wireguard@lists.zx2c4.com>; Fri, 7 Dec 2018 04:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=m2NlEGcvH7VGA310kQ7vxS11FBg=; b=kE+3n0
 /rnA0QzGe7hk4pIh63XMW3CUJ/3WHy4sloVgDLyBXaNiGG7FC4DidnLqYjwrmXhN
 uXZmM2mhGrMx9EYgpnGW9yt2Z5LX2cWM6CDUdW4D/76VH9YrYdQjIAOonYfzOqnf
 A5UHMvonTO9GfwCMTVUyWyvejZYypVcIhutwu4jHOsal5SFgh633ToYgsDDnIwiD
 z998a3nDC0SfgoxGrUCgPQrH21+269XhD0ovjXdFY7kSvarZTK2WC3zFbBfUKFbl
 Q5xI6Z6+dz0iD770GAXcXLBp4ZyGC1FNgKW1awtsNuO4IL8ZzhvK6G+ziQpg/4xA
 anqpzWzLwTraDrLw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e064e53b
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 7 Dec 2018 04:13:51 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id v6so2418399oif.2
 for <wireguard@lists.zx2c4.com>; Thu, 06 Dec 2018 20:22:06 -0800 (PST)
X-Gm-Message-State: AA+aEWYpren25CXtp9oWryaUnh7GhB5uv6tCf0MC9zJTtvTGNrntNvPw
 /w/m23nrSX0W/IhqlXQNgSR0JdkqCK/kjkukZbU=
X-Google-Smtp-Source: AFSGD/U4r+vHcyYLawNfegkYf4FSZBzNmnklKt+drxfuYLo+ScCypwuJzbGDqX5oiGCXiLmHdITbOaQM/aA1EcNjFN8=
X-Received: by 2002:aca:f288:: with SMTP id q130mr378777oih.228.1544156525587; 
 Thu, 06 Dec 2018 20:22:05 -0800 (PST)
MIME-Version: 1.0
References: <CAO_nJAYGman8=av2iLjnxaEMVLaH=H+392iZ6YrcxLNxTK+hkg@mail.gmail.com>
In-Reply-To: <CAO_nJAYGman8=av2iLjnxaEMVLaH=H+392iZ6YrcxLNxTK+hkg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 7 Dec 2018 05:21:54 +0100
X-Gmail-Original-Message-ID: <CAHmME9qXh9nmcscVwpiPD7+_yYMGdb-DE7W8Z1DGRHzxA--o5Q@mail.gmail.com>
Message-ID: <CAHmME9qXh9nmcscVwpiPD7+_yYMGdb-DE7W8Z1DGRHzxA--o5Q@mail.gmail.com>
Subject: Re: [BUG] iOS client (0.0.20181104) sometimes kills WiFi
 connections/switches to LTE
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Should be fixed for the next version.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
