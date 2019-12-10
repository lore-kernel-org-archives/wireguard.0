Return-Path: <SRS0=o99y=2A=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15F89C43603
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Dec 2019 17:12:09 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD9402073B
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Dec 2019 17:12:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="rKR4k02y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD9402073B
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 74d05c77;
	Tue, 10 Dec 2019 17:12:07 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6bb009fd
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Dec 2019 17:12:05 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2330bf42
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Dec 2019 17:12:05 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3c5bf83d
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Dec 2019 16:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=doCyNDhsQTzJUPTs2z1jzSt8g64=; b=rKR4k0
 2yw/XYxTFUBOJDJydud0uSRkiVsdvI5xywjdV1z1WVzpyl2dTNTGpfwvSKBP1msM
 0Y/5DJdIe6yMbRJljvQWNGFDytixVyUaTgu1N3h6jRkFlKSKnQzytAbzqgLfofpi
 q0LnHe3ZLHZ+g573fD+6TPSZ9lpitkgbjudNCNSJomd/SM0a/hPFkEEDB4n7GpKm
 9ne+xwwHELtqiTik7+/I700OYpwiIgK+WHRPL1A34J9sC3Yq0cBB78wlF2XyrmUa
 QR9TtfafEBdK9yGfUkDXCPNf/k/PZU02JNoVEMg6OlkI4CRvqf268LaVoCMAh65q
 th2N6nWee/QsI3mQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d0c4786f
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Dec 2019 16:16:32 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id r27so16140733otc.8
 for <wireguard@lists.zx2c4.com>; Tue, 10 Dec 2019 09:12:05 -0800 (PST)
X-Gm-Message-State: APjAAAWd4I8vqosEQvXDoatFvcTwokSclizH2oZlvxd3JeKwRvXo4uLk
 ei3px3c2TyJmtWRDMkBU/fQvMGjbQRek9jLtAcc=
X-Google-Smtp-Source: APXvYqxRyx7ImwovjYSfB0hixJRr2fP4GkeBy3oRbDzSWllKXi0FhiqWRUJEVJLTqCGOK+d82rRu62WMXOd9avrx22U=
X-Received: by 2002:a9d:4f0f:: with SMTP id d15mr13588716otl.179.1575997924408; 
 Tue, 10 Dec 2019 09:12:04 -0800 (PST)
MIME-Version: 1.0
References: <20191210154850.577745-1-Jason@zx2c4.com>
 <FX30kbIJvHNSsmPxMSA_XdlAOLSee8p5eHMDcDAkDH8KKhihrybE2EtZJIjtU9ojh-JJT9g4Cj5xlT85E5uETb9JsBJmficyjfDvblrRaJg=@protonmail.ch>
 <CAHmME9pdqq23OXNPHLT-YyXCKTVTKJNyfz9D+Q0jADAN=BDhnA@mail.gmail.com>
 <G4y-P2Nndjy1FeZWH6oDZqfhtvl23C4Ezs4x1oZIpieVeppTVu15YYim4wvpIo7LQJrVgmTV8IjnGCKScyTAGUjheEol0zr0n-pot3AJKik=@protonmail.ch>
In-Reply-To: <G4y-P2Nndjy1FeZWH6oDZqfhtvl23C4Ezs4x1oZIpieVeppTVu15YYim4wvpIo7LQJrVgmTV8IjnGCKScyTAGUjheEol0zr0n-pot3AJKik=@protonmail.ch>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 10 Dec 2019 18:11:52 +0100
X-Gmail-Original-Message-ID: <CAHmME9rkzP_2-0OsUhFxiAHzYTmkXbPdMghRmDgHtjT_4zEa9g@mail.gmail.com>
Message-ID: <CAHmME9rkzP_2-0OsUhFxiAHzYTmkXbPdMghRmDgHtjT_4zEa9g@mail.gmail.com>
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

On Tue, Dec 10, 2019 at 6:05 PM Jordan Glover
<Golden_Miller83@protonmail.ch> wrote:
>
> On Tuesday, December 10, 2019 4:54 PM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> > On Tue, Dec 10, 2019 at 5:52 PM Jordan Glover
> > Golden_Miller83@protonmail.ch wrote:
> >
> > > On Tuesday, December 10, 2019 3:48 PM, Jason A. Donenfeld Jason@zx2c4.com wrote:
> > >
> > > > If nft(8) is installed, use it. These rules should be identical to the
> > > > iptables-restore(8) ones, with the advantage that cleanup is easy
> > > > because we use custom table names.
> > >
> > > I wonder if nft should be used only if iptables isn't installed instead.
> > > Nowadays iptables has nft backend which I believe is default and will
> > > translate iptables rules to nft automatically. On my system iptables rules
> > > from wg-quck are already shown in "nft list ruleset".
> > > I'm not sure if this work in reverse - are nft rules automatically translated
> > > to iptables and shown in iptables-save? If not then using iptables of available
> > > seems more versatile for the job.
> >
> > iptables rules and nftables rules can co-exist just fine, without any
> > translation needed. Indeed if your iptables is symlinked to
> > iptables-nft, then you'll insert nftables rules when you try to insert
> > iptables rules, but it really doesn't matter much either way (AFAIK).
> > I figured I'd prefer nftables over iptables if available because I
> > presume, without any metrics, that nftables is probably faster and
> > slicker or something.
>
> As I said before, my concern is more about people being fully aware of state
> of their firewall rather than if it technically works.

Ahh, I see what you're wondering. Well, `wg-quick` shows `[#] nft -f
-` in it's output, so an administrator should be aware that running
`nft list ruleset` or similar is how to gain some visibility, I
suppose.

Perhaps when we eventually can drop RHEL7 support, we'll even drop
iptables support all together.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
