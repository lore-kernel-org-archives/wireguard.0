Return-Path: <SRS0=7eHk=2Q=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF5F7C2D0DA
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 26 Dec 2019 17:45:21 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59FBF206CB
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 26 Dec 2019 17:45:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="ULRnFkPz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59FBF206CB
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 040be216;
	Thu, 26 Dec 2019 17:45:20 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ec9fbb7c
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Dec 2019 17:45:17 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b335484c
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Dec 2019 17:45:17 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4eec0cd8
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Dec 2019 16:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to
 :content-type; s=mail; bh=fopYylMzhmJTsn6ihU2uI65gTDc=; b=ULRnFk
 PzXeVoYOTKL253K+JHU8BNVM5Br01shzUJTRpIOkAy1ArpnqzdcrwNZA8Ao0zEY4
 8TLXl+rT8xaeo2x28P86OnFAIedxMBwRaGvDSfG0Wud5pn31dyfPl8Tyky1J7JWx
 37jRpRUpxkP4JkxmeK6v0gynkqKccGStiMGW0ikzWW422ipinD+C5x0onidDb0us
 zrnMcOlUlxVr43lq5ps+xGwhC2wWramqI6QelXnKdIJPY5myyYfGMgy5fDSfZbFg
 fZIpsTr5RAAeUCWUJ8QruiiTpPTOPzZdrdjWbGnlJ8G1uZx2obO5MpbH9pK+pXNw
 sS5kYm/Yu0LSdIHQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 983e457d
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Dec 2019 16:47:40 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id p125so6631395oif.10
 for <wireguard@lists.zx2c4.com>; Thu, 26 Dec 2019 09:45:17 -0800 (PST)
X-Gm-Message-State: APjAAAXvlzeh9uEzL5FU5neLs6OTC68eSrkmja07v7foyeOrS8FMyK1E
 Vlk92c9KKwpI8pZoGRbC7156o2RBfrkZEvTIlSk=
X-Google-Smtp-Source: APXvYqyYX5++06zK1pj3w/Qz/ydqMMZKpHipwKzy00ldDibAi3pL21o4MICBQjttiFc+StQeJU4n34M2Q0I7/H4BkwA=
X-Received: by 2002:a05:6808:a8a:: with SMTP id
 q10mr2463084oij.66.1577382316807; 
 Thu, 26 Dec 2019 09:45:16 -0800 (PST)
MIME-Version: 1.0
References: <CAHmME9p1-5hQXv5QNqqHT+OBjn-vf16uAU2HtYcmwKMtLhnsTA@mail.gmail.com>
In-Reply-To: <CAHmME9p1-5hQXv5QNqqHT+OBjn-vf16uAU2HtYcmwKMtLhnsTA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 26 Dec 2019 18:45:05 +0100
X-Gmail-Original-Message-ID: <CAHmME9rArDcBAhdj2roaoVeC+S_v=+KdEvrvY3gPMnApnLdmJA@mail.gmail.com>
Message-ID: <CAHmME9rArDcBAhdj2roaoVeC+S_v=+KdEvrvY3gPMnApnLdmJA@mail.gmail.com>
Subject: Re: organization of wireguard linux kernel repos moving forward
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

On Mon, Dec 9, 2019 at 12:56 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> With WireGuard in net-next, it's time to break up the monolithic repo
> we've been using for development into something a bit more manageable
> and in line with ordinary kernel development.
>
> Right now the "WireGuard.git" repo has been structured as an out of
> tree module, alongside a subdirectory for tools, one for scripts, one
> for tests, and another for a super gnarly compat layer that makes the
> thing work on all kernels going back to 3.10. We're going to break
> this up into three repositories:
>
> 1) wireguard-linux.git will be a full Linux tree, with wireguard
> changes, and regularly merge in net/net-next, and have things from
> there posted on netdev like usual for review. This repo won't be an
> out of tree module any more, obviously.
> https://git.zx2c4.com/wireguard-linux/
>
> 2) wireguard-tools.git will have the userspace utilities and scripts,
> such as wg(8) and wg-quick(8), and be easily packageable by distros.
> https://git.zx2c4.com/wireguard-tools/
>
> 3) wireguard-linux-compat.git will be an out-of-tree module containing
> the aforementioned horrific compat.h layer. New development will go
> into upstream wireguard-linux.git, but we'll do our best to keep
> things mostly working for as long as it makes sense and is feasible.
> https://git.zx2c4.com/wireguard-linux-compat/
>
> The CI that runs on build.wireguard.com will also see some updates to
> reflect these adjustments, and also more closely align with the
> net-next tree. Additionally, I'm interested to see if I can make our
> CI useful for a variety of things in net/ and drivers/net/ instead of
> just for wireguard.

The above changes are now complete.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
