Return-Path: <SRS0=o99y=2A=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E80EEC43603
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Dec 2019 17:37:38 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 847182073D
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Dec 2019 17:37:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="DWeomxx+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 847182073D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c71b9b07;
	Tue, 10 Dec 2019 17:36:21 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0ac89e66
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Dec 2019 17:36:19 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cc75f013
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Dec 2019 17:36:19 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 71b9dbb7
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Dec 2019 16:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=lSRuzGyQOZ26LNPNvIUyJG66jxo=; b=DWeomx
 x+KAirLVgLP9ZRfTs6BuR6zQjzXggQtiEhUYffaAhE3FUV9yWAATqiUZ2RN6/lvI
 lMY3w9FTS0APzgbFAi9HyihNXDpxM1qvMvfQLb6qUvdXlZcopi2mtZ1eIvbBqinu
 KwpP7YJhKGdT60ZRdNrxdSdZ7BFpBq4kT970WRZnt1Ixzxbtl3XVfJux/V9JQzSN
 Js0raiWdKqXHsgsAcZxJtQUtPgnerOWcc5Pn+ncHXBgy1p2UXgXSYNrC5unYo1aD
 U5j0XHbNEMCqlNK0a0Rybnms28a5RXk+9PnASa8EEUamqZ64/tab6SEbpoUP4YBG
 4S624cwK18Doznfw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6d69a477
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Dec 2019 16:40:45 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id d17so16292843otc.0
 for <wireguard@lists.zx2c4.com>; Tue, 10 Dec 2019 09:36:18 -0800 (PST)
X-Gm-Message-State: APjAAAVDxP3xN1/+PVWufgigKHkM191hyTTfnohLoEQmyYbRx/u5UDT/
 NDnzBekv7MJCr5lvvb390cQgpFD2vVOc9mKI83o=
X-Google-Smtp-Source: APXvYqyChei1g5RLAmzNIo0DjzVzptf/8godWamtVzmVyjwZXQ4bWgL2n9+SAv9fxAOgkxScEbCwBZKSkMOXpsGmRbQ=
X-Received: by 2002:a05:6830:1b6a:: with SMTP id
 d10mr27271199ote.52.1575999377685; 
 Tue, 10 Dec 2019 09:36:17 -0800 (PST)
MIME-Version: 1.0
References: <20191210154850.577745-1-Jason@zx2c4.com>
 <FX30kbIJvHNSsmPxMSA_XdlAOLSee8p5eHMDcDAkDH8KKhihrybE2EtZJIjtU9ojh-JJT9g4Cj5xlT85E5uETb9JsBJmficyjfDvblrRaJg=@protonmail.ch>
 <CAHmME9pdqq23OXNPHLT-YyXCKTVTKJNyfz9D+Q0jADAN=BDhnA@mail.gmail.com>
 <20191210221215.56c2f30d@natsu>
In-Reply-To: <20191210221215.56c2f30d@natsu>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 10 Dec 2019 18:36:06 +0100
X-Gmail-Original-Message-ID: <CAHmME9oYJFfQByaaVefEfbbXT=DABV+=DShuupJjBrk5i87GQA@mail.gmail.com>
Message-ID: <CAHmME9oYJFfQByaaVefEfbbXT=DABV+=DShuupJjBrk5i87GQA@mail.gmail.com>
Subject: Re: [PATCH] wg-quick: linux: add support for nft and prefer it
To: Roman Mamedov <rm@romanrm.net>, Daniel Kahn Gillmor <dkg@fifthhorseman.net>
Cc: "jwollrath@web.de" <jwollrath@web.de>,
 "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
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

Hi Roman,

On Tue, Dec 10, 2019 at 6:12 PM Roman Mamedov <rm@romanrm.net> wrote:
>
> On Tue, 10 Dec 2019 17:54:49 +0100
> "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:
>
> > iptables rules and nftables rules can co-exist just fine, without any
> > translation needed. Indeed if your iptables is symlinked to
> > iptables-nft, then you'll insert nftables rules when you try to insert
> > iptables rules, but it really doesn't matter much either way (AFAIK).
> > I figured I'd prefer nftables over iptables if available because I
> > presume, without any metrics, that nftables is probably faster and
> > slicker or something.
>
> nftables is slower than iptables across pretty much every metric[1][2]. It
> only wins where a pathological case is used for the iptables counterpart (e.g.
> tons of single IPs as individual rules and without ipset). It is a disaster
> that it is purported to be the iptables replacement, just for the syntax and
> non-essential whistles such as updating rules in place or something. And
> personally I don't prefer the new syntax either. It's the systemd and
> pulseaudio story all over again, where something more convoluted, less reliable
> and of lower quality is passed for a replacement of stuff that actually worked,
> but was deemed "unsexy" and arbitrarly declared as deprecated.
>
> [1] http://www.diva-portal.org/smash/get/diva2:1212650/FULLTEXT01.pdf
> [2] https://developers.redhat.com/blog/2017/04/11/benchmarking-nftables/

That bachelors thesis says in the abstract, "Latency was measured
through the round-trip time of ICMP packets while throughput was
measured by generating UDP traffic using iPerf3. The results showed
that, when using linear look-ups, nftables performs worse than
iptables when using small frame sizes and when using large rulesets.
If the frame size was fairly large and rule-set fairly small, nftables
was often performed slightly better both in terms of latency and in
terms of throughput. When using indexed data structures, performance
of both firewalls was very similar regardless of frame size or
rule-set size. Minor, but statistically significant, differences were
found both in favour of and against nftables, depending on the exact
parameters used." So maybe it doesn't actually matter?

On the other hand, if what you say is actually true in our case, and
nftables is utter crap, then perhaps we should scrap this nft(8) patch
all together and just keep pure iptables(8). DKG - you seemed to want
nft(8) support, though. How would you feel about that sort of
conclusion?

Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
