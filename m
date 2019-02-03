Return-Path: <SRS0=rgFP=QK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 315EEC169C4
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  3 Feb 2019 23:57:53 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53AA12084A
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  3 Feb 2019 23:57:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="mok+4UsV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53AA12084A
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 411e2f65;
	Sun, 3 Feb 2019 23:51:18 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a95c87b3
 for <wireguard@lists.zx2c4.com>; Sun, 3 Feb 2019 23:51:17 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2c76114b
 for <wireguard@lists.zx2c4.com>; Sun, 3 Feb 2019 23:51:16 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1ee0fb84
 for <wireguard@lists.zx2c4.com>; Sun, 3 Feb 2019 23:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=is4xVbGmpDFCE/i+vZNfGKjneQw=; b=mok+4U
 sV17zB9lpjFC6J9q+o01EbY5pEcuc9a10HJtGFGfNtBo0haxdDCLrfiWIajmD+WR
 aPGkCeCSIBqzPSxYUacP9Cuhjj0IMGNYzAN54MobNKVw8QOKb+ZEzdIAz0VpLs05
 hDxE3fsPb1Ilw2ULG5iR8SHUT+JWu0XdelAAx/opQthkrXNyDllAn4jvUJ25psWh
 +XpkizDVYvnS6uswJccoQirvHecIJpyDPtbUBYC9laL8YkRKJ4zbm+kBwuPxUWbH
 A/ID3AjaWyX4o1y40g0eO59EbLl2m4xRWpo1SPuj+6T4s0g+T1ylxxDSlRYf/oaT
 KyPoRxAr+jkK50OQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 16b7faec
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 3 Feb 2019 23:42:01 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id j21so10145574oii.8
 for <wireguard@lists.zx2c4.com>; Sun, 03 Feb 2019 15:57:48 -0800 (PST)
X-Gm-Message-State: AJcUukd9I9Oi+qIQCxdC5Sb+c+3BZOAsMnwic6Pm/x69MVI+wWCkyc95
 t8RC4CjO/E3oo5nI8Fs7EQhZvDcJCMCnfBTSCEA=
X-Google-Smtp-Source: AHgI3IaAjtXQ2lc7kH/xDZpwyQXoa80/ijKEzdn5EpCHKuTn1PFxqcgPRjDWyBflzL4VHqrbf6QrTom5K0VNBH3kInU=
X-Received: by 2002:aca:14f:: with SMTP id 76mr25787992oib.74.1549238267751;
 Sun, 03 Feb 2019 15:57:47 -0800 (PST)
MIME-Version: 1.0
References: <20190203213156.7553-1-maarten@de-vri.es>
In-Reply-To: <20190203213156.7553-1-maarten@de-vri.es>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 4 Feb 2019 00:57:36 +0100
X-Gmail-Original-Message-ID: <CAHmME9o3=5VUp3qXVKtoaAi+dE+5eNA6M9LVJbbs6LUZpDFbVw@mail.gmail.com>
Message-ID: <CAHmME9o3=5VUp3qXVKtoaAi+dE+5eNA6M9LVJbbs6LUZpDFbVw@mail.gmail.com>
Subject: Re: [PATCH] Allow changing `creator_net` after interface creation.
To: Maarten de Vries <maarten@de-vri.es>
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

Hey Maarten,

Thanks for the patch. It turns out that in the git repo, the
jo/transit-namespace branch from Julian (CC'd) already has something
that seems very familiar with this. Pending upstreaming, we're holding
off on adding new features, but following that, we'll start to
evaluate options like this very seriously.

Do you see a difference between what your patchset does and what Julian's does?

Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
