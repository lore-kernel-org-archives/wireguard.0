Return-Path: <SRS0=kUA2=O2=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 795BCC43387
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 17 Dec 2018 07:52:53 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12B262084D
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 17 Dec 2018 07:52:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=diyism.com header.i=@diyism.com header.b="XAJF38GN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12B262084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=diyism.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4bdb0273;
	Mon, 17 Dec 2018 07:52:33 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 07f63ded
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Dec 2018 07:52:31 +0000 (UTC)
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com
 [IPv6:2607:f8b0:4864:20::e30])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 83353a4f
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Dec 2018 07:52:31 +0000 (UTC)
Received: by mail-vs1-xe30.google.com with SMTP id x64so7137245vsa.5
 for <wireguard@lists.zx2c4.com>; Sun, 16 Dec 2018 23:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=diyism.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fokZoy4gMdC/3cz/cMD+qXSklrX4h1vibEms38CcT7w=;
 b=XAJF38GNpQdPw2b1nBYzhu+Om8xsAPyGKRCr9GTGGYmtsiW8t49bkFrJDL86wvP7wM
 w/V2dULD3FDO1aDrr9DQ4r19vDL5nOqHQ81ZDvIfIcm+W0vkiuk8CCJ9xAORPlv4K2Ah
 0NQoaLpwddLSyjbhGM1ObTIJexF9ln1WpX8ok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fokZoy4gMdC/3cz/cMD+qXSklrX4h1vibEms38CcT7w=;
 b=BpBur8vIK+fcL5MTSX+2lhnLxUMMs87Nfi+0Z5LDubqPmnHYwUDMpw2Z+3cgG+mYJ9
 +9MOi8Q1fJG3Rx0v/z8Dcdtz8o4zsmF6qwBcD/EqMvb7wHbDuuQ12c8AwxJbTCqTphAH
 ZMuYPn+EcebFCJXxc15pVDhtC+zQLSCi6/nzJRYyiVB6YLncxY409nRcnljjBspEE5Be
 S4DjSwtIUa7HCSIppS+r2ssS57MeyQJQITs9kNlZZi5Ourt/d4Qc4GA7imWY/0s6VjFD
 9YnwFpXRVBkqGcs5djgHGw3rJcEAG19GqB74XL0uwaLWlkRMi2TZotPM5vqQKQdRQLHX
 0rRQ==
X-Gm-Message-State: AA+aEWYbhw9Tt9mkfMiV3BzR5actghlvFnZMgGjkZjbt7nMSjiIy/vDf
 cgTaF+bIa0PPi/SkBOAybBgSuh4OCYIuqdz7BS2/6gBXaLkzBIAt
X-Google-Smtp-Source: AFSGD/XMHmGuQSIEBFfJ90ip6gd3u5wRZCAo8Bt4bVy8h+BnjY7/bL1AbJjrlhdZ6uDWWWzs7Pg9SHKkYaxSjQpmr7M=
X-Received: by 2002:a67:4a48:: with SMTP id x69mr5599532vsa.93.1545033167819; 
 Sun, 16 Dec 2018 23:52:47 -0800 (PST)
MIME-Version: 1.0
References: <CAKVinOVZ1nVJh8LvqGme5C27+R=AFBOxPKS22ckO7TEHsbc4-A@mail.gmail.com>
 <CAHmME9pzif4L4okrDMZdsLb73oXegaMvGHXKkY3twbw_wkYnug@mail.gmail.com>
In-Reply-To: <CAHmME9pzif4L4okrDMZdsLb73oXegaMvGHXKkY3twbw_wkYnug@mail.gmail.com>
From: "KeXianbin(http://diyism.com)" <kexianbin@diyism.com>
Date: Mon, 17 Dec 2018 15:53:09 +0800
Message-ID: <CAKVinOXBxdFrTAiMaDmdE63iYO-rjBSAmBj5mb3QZ52zkmzoRQ@mail.gmail.com>
Subject: Re: [Question or Feature Request] Any wg1.conf option to limit peer
 IP as 1-to-1?
To: Jason@zx2c4.com
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

On my machine(10.1.0.1), does the option "AllowedIPs = 10.1.0.3/32" in
wg1.conf take effects in both input and ouput directions?
It seems that "AllowedIPs = 10.1.0.3/32" only added ip route rule
"10.1.0.3 dev wg1  scope link" on my side,
can it prevent the peer to send packets to my 10.1.0.1:80 from 10.1.0.4?
On Mon, Dec 17, 2018 at 3:40 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> On Mon, Dec 17, 2018 at 2:42 AM KeXianbin(http://diyism.com)
> <kexianbin@diyism.com> wrote:
> > AllowedIPs = 10.1.0.3/32
> > [...]
> > If I want to limit the peer to a fixed IP 10.1.0.3, any wg1.conf
> > OPTION to config it?
> >
> > Currently,  the peer can set any IP, for example 10.1.0.4, and can
> > send packets to my http://10.1.0.1:80 from 10.1.0.4.
>
> Setting that peer's allowedips to 10.1.0.3/32 should accomplish
> exactly what you want; that peer is _only_ allowed to send packets as
> that IP. If the peer attempts to send packets as 10.1.0.4, WireGuard
> should reject those packets. If it doesn't, that sounds like a major
> bug.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
