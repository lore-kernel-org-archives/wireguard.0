Return-Path: <SRS0=o99y=2A=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4823EC43603
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Dec 2019 16:55:21 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA8872073D
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Dec 2019 16:55:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="Z89NFxA7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA8872073D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b3059669;
	Tue, 10 Dec 2019 16:55:03 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d3d920a4
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Dec 2019 16:55:02 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c5faa4e9
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Dec 2019 16:55:02 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ad434f71
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Dec 2019 15:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=OQGTJ5f9dW5YJfpRKxqEc6kR2GQ=; b=Z89NFx
 A7W448K+MDMPXs6yjdBEMEVKGs+iekq+633MDu/Rep+ZlYd0Jwc07o47vVnXNUdE
 curIBfZjB8dgVj4eak7GgodMR70+Y+ATtOrE28LGhrDB3YitSRblZUc0XleyJVS0
 pUktRU2MLvnHpbuQbxpnPgawiIOyK5c5KktuBpxutvFQvVrlAumPS6PBNpruwgjE
 C0Fl4i7I2LY8zFHUU0DJ8PitUPIm6LUUxWsZn8xQogSlcNrHPSolVlk9mrF/fl6m
 RW4Bjb80tt7EV8XBON42fBu4pm7ar3yVrdHXRNsOCitYcpdSLLta4fvvcE1P/B1R
 z/RXyAan0XKVKipw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 579a2e42
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Dec 2019 15:59:28 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id j22so10410590oij.9
 for <wireguard@lists.zx2c4.com>; Tue, 10 Dec 2019 08:55:01 -0800 (PST)
X-Gm-Message-State: APjAAAV98acajPdG0MujLl+dm4smkFxu0djsgDQz46yu13p6WBaIHj/N
 RqNzT+LgJe/l1dB9aCezZFrUqXCNu9eLaWDUp0E=
X-Google-Smtp-Source: APXvYqwxf+WJ5VtASm5UyfLaq6T8w3HRUWwE8JSJTdf6MF3A1PDvG3HqFKVx+xL+ckmux8Qsj2+I80W8TYfaftOhViY=
X-Received: by 2002:aca:815:: with SMTP id 21mr4991444oii.52.1575996901123;
 Tue, 10 Dec 2019 08:55:01 -0800 (PST)
MIME-Version: 1.0
References: <20191210154850.577745-1-Jason@zx2c4.com>
 <FX30kbIJvHNSsmPxMSA_XdlAOLSee8p5eHMDcDAkDH8KKhihrybE2EtZJIjtU9ojh-JJT9g4Cj5xlT85E5uETb9JsBJmficyjfDvblrRaJg=@protonmail.ch>
In-Reply-To: <FX30kbIJvHNSsmPxMSA_XdlAOLSee8p5eHMDcDAkDH8KKhihrybE2EtZJIjtU9ojh-JJT9g4Cj5xlT85E5uETb9JsBJmficyjfDvblrRaJg=@protonmail.ch>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 10 Dec 2019 17:54:49 +0100
X-Gmail-Original-Message-ID: <CAHmME9pdqq23OXNPHLT-YyXCKTVTKJNyfz9D+Q0jADAN=BDhnA@mail.gmail.com>
Message-ID: <CAHmME9pdqq23OXNPHLT-YyXCKTVTKJNyfz9D+Q0jADAN=BDhnA@mail.gmail.com>
Subject: Re: [PATCH] wg-quick: linux: add support for nft and prefer it
To: Jordan Glover <Golden_Miller83@protonmail.ch>
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

On Tue, Dec 10, 2019 at 5:52 PM Jordan Glover
<Golden_Miller83@protonmail.ch> wrote:
>
> On Tuesday, December 10, 2019 3:48 PM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> > If nft(8) is installed, use it. These rules should be identical to the
> > iptables-restore(8) ones, with the advantage that cleanup is easy
> > because we use custom table names.
> >
>
> I wonder if nft should be used only if iptables isn't installed instead.
> Nowadays iptables has nft backend which I believe is default and will
> translate iptables rules to nft automatically. On my system iptables rules
> from wg-quck are already shown in "nft list ruleset".
>
> I'm not sure if this work in reverse - are nft rules automatically translated
> to iptables and shown in iptables-save? If not then using iptables of available
> seems more versatile for the job.

iptables rules and nftables rules can co-exist just fine, without any
translation needed. Indeed if your iptables is symlinked to
iptables-nft, then you'll insert nftables rules when you try to insert
iptables rules, but it really doesn't matter much either way (AFAIK).
I figured I'd prefer nftables over iptables if available because I
presume, without any metrics, that nftables is probably faster and
slicker or something.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
