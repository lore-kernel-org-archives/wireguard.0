Return-Path: <SRS0=uCSF=Z7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F58BC43603
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Dec 2019 10:12:55 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78459206D5
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Dec 2019 10:12:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="m3axVgkl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78459206D5
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 22e95043;
	Mon, 9 Dec 2019 10:12:37 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3a2a0ddb
 for <wireguard@lists.zx2c4.com>; Mon, 9 Dec 2019 10:12:36 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eacbac0a
 for <wireguard@lists.zx2c4.com>; Mon, 9 Dec 2019 10:12:36 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2249e66f
 for <wireguard@lists.zx2c4.com>; Mon, 9 Dec 2019 09:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :from:date:message-id:subject:to:content-type; s=mail; bh=cDKkrR
 WCSLARm1211dP31vopctk=; b=m3axVgklkw3dTCNbEfxRQp2AHbVOabZFf32zkG
 rbhshjbC508UWDqB/LpbL6YXfpyLBvjSRBXsvwDdL2Kpony090Nw418T5eo3ch0A
 yz2umTxFryA6V54aycsQi9ooWHwONOb9UA6iaM87FJuwCZAPJ/2Q7Bf1kD58imeG
 jI7o74oilEKT6hnnMElsSlJKfYVqv6pEJIDS7/7SVQ/MKg4Ulxda/SExsixZ4M16
 4OtJgFHWUWpeSW4tZTENCvq1T3XbMeHO1h/AHMLqlxSk925PX4zVgXpm9ikhKgqm
 M3jIfmNH5QNTaVHI6SlrH5xYak4gtePUS0kxAXZdD5dcBKsQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d6e0db33
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 9 Dec 2019 09:17:12 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id x195so5830499oix.4
 for <wireguard@lists.zx2c4.com>; Mon, 09 Dec 2019 02:12:35 -0800 (PST)
X-Gm-Message-State: APjAAAWHV9gYMtTtXDbAZTZ4EGxmJaqKuwLptLgWwqejdTZNIarDp8xu
 lhbx1y9qO4qVcfwLHZljffXTy0yDuTDMi9MRfak=
X-Google-Smtp-Source: APXvYqxR1MnSVHQ8ZxeyuzxPB9P8RRE5JZO0pHQq6kzoTaF/f9192rd3NbkszC6RzeY4M4ASegxIdz/gAkQo5eCheaQ=
X-Received: by 2002:aca:2109:: with SMTP id 9mr7886891oiz.119.1575886355290;
 Mon, 09 Dec 2019 02:12:35 -0800 (PST)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 9 Dec 2019 11:12:23 +0100
X-Gmail-Original-Message-ID: <CAHmME9oRJqvMWF9rnSZejWe9J6ONUMbk108VkH1Qfy513Vp=dg@mail.gmail.com>
Message-ID: <CAHmME9oRJqvMWF9rnSZejWe9J6ONUMbk108VkH1Qfy513Vp=dg@mail.gmail.com>
Subject: [ANNOUNCE] WireGuard merged to net-next, on its way to Linux 5.6
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Hey everyone,

I'm happy to announce that WireGuard has been merged into Dave
Miller's net-next tree. That means when Linus Torvalds opens up his
tree for Linux 5.6, Dave will send a pull request to Linus, and
WireGuard will wind up in Linux 5.6.

This is big news and very exciting.

Thanks to all the developers, contributors, users, advisers, and
mailing list interlocutors who have helped to make this happen.

In the coming hours and days I'll be sending followups on next steps.

Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
