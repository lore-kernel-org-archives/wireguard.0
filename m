Return-Path: <SRS0=S6z6=OR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4E4FC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 27 Sep 2021 16:22:37 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C2C760F39
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 27 Sep 2021 16:22:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7C2C760F39
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0a22555b;
	Mon, 27 Sep 2021 16:21:23 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2e943d8e
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Sep 2021 16:21:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E0B9661041
 for <wireguard@lists.zx2c4.com>; Mon, 27 Sep 2021 16:21:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="UM3eV71y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1632759675;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OhNJM2hhzI/62nOILT9qpFQqJeUvqICfBJj0TwODcL4=;
 b=UM3eV71yAkTn6r0GyMEMLPtuBTD7Ulk+KCJoXuA9NeWCpkggerwEo2bdDr7r8sD2/noGX9
 x4QO9TywvX5Npwa1T6BTiL4bZv9CpTh6yD/AaiUJjLtp6aFBJ2KW9ftxz0mzI3xkZVKLBj
 ClE9U/TtgQ5TaPmOaGW19v+Iteh9HaU=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 96a4373d
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Sep 2021 16:21:15 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id r1so25166503ybo.10
 for <wireguard@lists.zx2c4.com>; Mon, 27 Sep 2021 09:21:15 -0700 (PDT)
X-Gm-Message-State: AOAM5331r7NXeRKB4czwUjYO1nBa1EUFMNRi6X+WWE06EDfnuhq5otoG
 +qvj1PCXJoV4rcVaJG6C/lbxwRXtlckTrs6YX4Y=
X-Google-Smtp-Source: ABdhPJy6derQUtEiobL5Bp7UDvevgAiWcDUkfw17JYn3VqtUWb0JDNjbsy0/dcPG0sflvWX4PqYn8QXDCMhD5afQDDY=
X-Received: by 2002:a25:854c:: with SMTP id f12mr759398ybn.95.1632759674602;
 Mon, 27 Sep 2021 09:21:14 -0700 (PDT)
MIME-Version: 1.0
References: <XhEJRjPvvlk57PFUWApI0RPX2-dCuDbQ9RYxw9Y5GxzMs8YEpwVc4U-fR3avC-NT1X2UlBNQerMkOxgqrue_EEOtyZR18V329KuKev_i3aE=@protonmail.com>
In-Reply-To: <XhEJRjPvvlk57PFUWApI0RPX2-dCuDbQ9RYxw9Y5GxzMs8YEpwVc4U-fR3avC-NT1X2UlBNQerMkOxgqrue_EEOtyZR18V329KuKev_i3aE=@protonmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 27 Sep 2021 10:21:03 -0600
X-Gmail-Original-Message-ID: <CAHmME9rDj9dDGSY0E6ZtE88vObS5Hjd=ocpt3hz1gfVAkaxPgg@mail.gmail.com>
Message-ID: <CAHmME9rDj9dDGSY0E6ZtE88vObS5Hjd=ocpt3hz1gfVAkaxPgg@mail.gmail.com>
Subject: Re: WireGuard with obfuscation support
To: el3xyz <el3xyz@protonmail.com>
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hey Evgeny,

There are some neat aspects of the approach here. Encrypting using the
pubkey has the nice effect of making packets look like noise while
also being sufficiently peer-linked that it might not be super
feasible to detect (though still possible I suppose).

I don't think we'd merge something like this into wireguard-itself,
unfortunately. Obfuscation is a bit of a cat and mouse game, and were
we to bake a handful of methods into wireguard, much focus would be
spent on detecting those, and then the whole thing would be moot.

From my own obfuscation projects, I've found the most effective
techniques involve mimicry of other explicitly-allowed protocols,
rather than just turning packets into noise, and mimicking the related
packet timing and length relations of those protocols too. It's
possible to do this in part using Markov chains, but also for your
likely use case, you may be able to just code logic for fake tcp +
http -looking sessions, or perhaps quic in the future.

But your likely use case is also not likely to be the same as others'
use cases for obfuscation. For example, while much obfuscation focuses
on censorship resistance, there's another corner that focuses on IDS
evasion, like hiding inside of Kerberos or RDP or even resembling
SIGTRAN packets. And even in the censorship resistance space, there
are often important tradeoffs to be made between performance and
detection: do you want your connection to be as speedy as possible, or
do you want to ensure that you won't be detected? What are the
repercussions of failure for each case? And moreover, what about when
targeted traffic shaping is used in connection with DPI or related
heuristics? In that case, a popular technique appears to be adding FEC
to packets. And so on and so forth.

This all is to say that the obfuscation game is a big rabbit hole of
sorts, and there's unlikely to be one solution for the many
applications of it.

For that reason, as I've written on this list before, I think
obfuscation ought to be in a layer above wireguard, not within it. You
can do this by setting the endpoint to be a localhost udp port, or
better, by writing a netfilter module or using something like NFQUEUE
to do it in userspace. While there's a lot of enthusiasm for
"pluggable transports" and such, I actually don't think it's a bad
idea to violate the layering distinction and borrow things like peer
public keys when that makes for a potentially slicker system.

For example, I could imagine a netfilter plugin that specifically
attaches to a wireguard interface, and uses config information from it
to do per-peer obfuscation, so that additional identities don't need
to be configured. An admin would run `iptables -t mangle -A OUTPUT -m
evgeny_wg_thing --out-iface wg0 -j EVGENYS_COOL_OBFS_THING_OUT &&
iptables -t mangle -A INPUT -m evgeny_wg_thing --in-iface wg0 -j
EVGENYS_COOL_OBFS_THING_IN` and then presto, everything would work
with no additional configuration.

Splitting out your ideas into something that runs adjacent to
wireguard but works intimately with it might require a little bit more
work in the short term, but I think long term that will lead to a more
sound design, and it could grow and morph all sorts of interesting
different modes.

Jason
