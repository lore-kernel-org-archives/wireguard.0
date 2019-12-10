Return-Path: <SRS0=o99y=2A=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,FREEMAIL_REPLYTO_END_DIGIT,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4F99C43603
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Dec 2019 18:58:24 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F261205ED
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Dec 2019 18:58:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=protonmail.ch header.i=@protonmail.ch header.b="kSUKhapQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F261205ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=protonmail.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 808038ea;
	Tue, 10 Dec 2019 18:58:22 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e4ebed13
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Dec 2019 18:58:20 +0000 (UTC)
Received: from mail-40140.protonmail.ch (mail-40140.protonmail.ch
 [185.70.40.140])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9009e9ff
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Dec 2019 18:58:20 +0000 (UTC)
Date: Tue, 10 Dec 2019 18:58:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.ch;
 s=default; t=1576004299;
 bh=1zt5rBdqgwQYAZUUILVECzNrpvU9y0dO+28mV6e/rUg=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=kSUKhapQ6wGep2GTkh35wtcmkMM1OlYP2OlDgvtR0yOvr0gejXi9aVfx46GGUOEEm
 3MF4mbCp19Kk0Y/LVs362rCcQ1ifZH00l4ObZEAJ5rUjg19b7qlh4xhSDaf81zC9Ia
 gbq9a1gbFqnOIpfZaPLIuHmxymDSHzgQKEVVlb1Y=
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
From: Jordan Glover <Golden_Miller83@protonmail.ch>
Subject: Re: [PATCH] wg-quick: linux: add support for nft and prefer it
Message-ID: <OP549CYtruXJJQ-jftan-7-ySlaBW7egOMSgpfkcSjBM3DMK6rnDyiN-V8VUEdIq-MxP5iNwV57VMvcPp9MwTjdUIndoZ3JtQXlW900KhW8=@protonmail.ch>
In-Reply-To: <CAHmME9oYJFfQByaaVefEfbbXT=DABV+=DShuupJjBrk5i87GQA@mail.gmail.com>
References: <20191210154850.577745-1-Jason@zx2c4.com>
 <FX30kbIJvHNSsmPxMSA_XdlAOLSee8p5eHMDcDAkDH8KKhihrybE2EtZJIjtU9ojh-JJT9g4Cj5xlT85E5uETb9JsBJmficyjfDvblrRaJg=@protonmail.ch>
 <CAHmME9pdqq23OXNPHLT-YyXCKTVTKJNyfz9D+Q0jADAN=BDhnA@mail.gmail.com>
 <20191210221215.56c2f30d@natsu>
 <CAHmME9oYJFfQByaaVefEfbbXT=DABV+=DShuupJjBrk5i87GQA@mail.gmail.com>
Feedback-ID: QEdvdaLhFJaqnofhWA-dldGwsuoeDdDw7vz0UPs8r8sanA3bIt8zJdf4aDqYKSy4gJuZ0WvFYJtvq21y6ge_uQ==:Ext:ProtonMail
MIME-Version: 1.0
Cc: "jwollrath@web.de" <jwollrath@web.de>,
 "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
Reply-To: Jordan Glover <Golden_Miller83@protonmail.ch>
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

On Tuesday, December 10, 2019 5:36 PM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:

>
> On the other hand, if what you say is actually true in our case, and
> nftables is utter crap, then perhaps we should scrap this nft(8) patch
> all together and just keep pure iptables(8). DKG - you seemed to want
> nft(8) support, though. How would you feel about that sort of
> conclusion?
>
> Jason

The only scenario where you really want to use nft is where iptables command
doesn't exist. I don't know how realistic scenario it is but I assume it can
happen in the wild. Otherwise calling iptables will take care of both iptables
and nftables automatically if those are supported on system. That's why I
proposed to invert current patch logic.

Jordan
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
