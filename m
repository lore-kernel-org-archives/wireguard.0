Return-Path: <SRS0=o99y=2A=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E39DEC43603
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Dec 2019 17:39:23 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B5982073D
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Dec 2019 17:39:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="VlH+wVqE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B5982073D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ae5e0ae5;
	Tue, 10 Dec 2019 17:38:56 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d800aba6
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Dec 2019 17:38:54 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2aa35782
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Dec 2019 17:38:54 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 018aad1b
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Dec 2019 16:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=BYrXJCVw1P3hiYu8dq7GdUbqITQ=; b=VlH+wV
 qErziCOi8PxEFEeakjG+kjkeZUVDJALvfSEpjK7fngfjGqbAeI5+ukBRYixgXB41
 Kih1TKB3XFgEUPCywhCdu8Su2cD4KTc1aeSAYBCysXzs4JCxlw91Qf5A9CYmsiEh
 xdQGRXly4CXRurolSG+jrMTLdcXwK20E8c+wwIadU31KMxH2DjyhpIqKpt3J/dYT
 Xh22ac9RXH/2Vo2W3StTX4BiR0LNept+jDv7xqh34eKpbh5ApxBcnwXEYioR+VgA
 I8AFsxoNZgWLjYUp4mIMMfsXXniJ5wSvFPA3gXUfg5kJF6N6Nn/KB0d63XJOdH+a
 ikdVeV6t1+37ZB/A==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a408e59b
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Dec 2019 16:43:19 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id i1so10557632oie.8
 for <wireguard@lists.zx2c4.com>; Tue, 10 Dec 2019 09:38:52 -0800 (PST)
X-Gm-Message-State: APjAAAWIFOGvPQTODK2XlW/yd6n0u3EsObJV38FwjRv2u/F8SIxiVepV
 DX/bWiwlDNFxCQL6T9CaR4G8DEQL3L+6+Al68qk=
X-Google-Smtp-Source: APXvYqzf1G7F+7TDUIkKa1gQQOluG+CdOlLYY9BJ+jRpkxkEQ9+FVIM2MiwHOiHsya+m1XuHaMX6+Rm8SrC+RphzkTI=
X-Received: by 2002:a05:6808:4cc:: with SMTP id
 a12mr5097028oie.115.1575999532165; 
 Tue, 10 Dec 2019 09:38:52 -0800 (PST)
MIME-Version: 1.0
References: <20191210154850.577745-1-Jason@zx2c4.com>
 <c51624f6-b243-07dc-9edc-0cc7bf9a75ab@gmail.com>
In-Reply-To: <c51624f6-b243-07dc-9edc-0cc7bf9a75ab@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 10 Dec 2019 18:38:41 +0100
X-Gmail-Original-Message-ID: <CAHmME9pBZoHh+D5+EL6yDXJWqrDOm91bXocH3=8ztCsX489-qw@mail.gmail.com>
Message-ID: <CAHmME9pBZoHh+D5+EL6yDXJWqrDOm91bXocH3=8ztCsX489-qw@mail.gmail.com>
Subject: Re: [PATCH] wg-quick: linux: add support for nft and prefer it
To: Vasili Pupkin <diggest@gmail.com>
Cc: jwollrath@web.de, WireGuard mailing list <wireguard@lists.zx2c4.com>
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

On Tue, Dec 10, 2019 at 6:30 PM Vasili Pupkin <diggest@gmail.com> wrote:
>
> On 10.12.2019 18:48, Jason A. Donenfeld wrote:
>
> > restore '%s-I PREROUTING ! -i %s -d %s -m addrtype ! --src-type LOCAL -j DROP
> > nftcmd '%sadd rule %s %s preraw iifname != %s %s daddr %s fib saddr type != local drop
>
>
> I am trying to understand the rulesets. When you check the type of the
> source address of the incoming packet its type just can't be local to
> our machine, it is the address of the sender. The source address of the
> packet can only be local if the packet was sent from the same machine.
> Isn't this part of the rule redundant?

Those lines are supposed to do the same thing, by the way. If I
screwed up and they differ subtly, please let me know.

The ! --src-type LOCAL thing makes it so that you can still ping
yourself locally. "Allow loopback." This also has the side effect of
letting in dangerous packets that are masquerading as 127/8, but only
if you've explicitly opted in to net.ipv4.conf.lo.route_localnet=1 and
maybe one other safety nob, which nobody in their right mind does for
obvious reasons.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
