Return-Path: <SRS0=o99y=2A=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48431C2D0BF
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Dec 2019 20:34:47 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C366120652
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Dec 2019 20:34:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="QWbY/4x/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C366120652
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eff3b237;
	Tue, 10 Dec 2019 20:34:34 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b432bec2
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Dec 2019 20:34:33 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c68efcbe
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Dec 2019 20:34:33 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4fcead5b
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Dec 2019 19:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=+Z5deuV3sPCPUTQQDyEDa3XWW7A=; b=QWbY/4
 x/t9FqaXfDAGnFLypUvgwY2MpeYmjjh18qg3UWCEVeOnSOVW4heMUqyBdmuGyR1Z
 pkpq2kMgyLJdxPlkfpmolSpVNVwyHZ+EK08DcBgc9KQvSwbRRSfNNgQGIuz+YnlB
 ObP7Mkq32k7Zem31BJUltKC4gPDbufQk47CChl9/T7AMSqvTr9juBJyH7l6ndTAr
 PYK8PsvIQeQftynjIOVY7QECnps036NShE26dRhaUb4Z5Ffj3YwcFhJY50Wpl2xa
 0jFkQ4Y7j5/9AfQEJUvvNd9Mx+ncAoFWh/xKRCyeU0is2VpiLQn1pI4CL4I6m7oy
 /GuHmu76ODiX6kDg==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 44178668
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Dec 2019 19:38:58 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id i15so16755792oto.7
 for <wireguard@lists.zx2c4.com>; Tue, 10 Dec 2019 12:34:32 -0800 (PST)
X-Gm-Message-State: APjAAAX1cjhyWsARpj5yNPh5b0HmlAasc2dAjDh/1mmzWY3C8ZO7e5kd
 H/w+vQ5hTUqZ4ISgZTvf7btguGS68lSZOQxsx4I=
X-Google-Smtp-Source: APXvYqyIQVt2legLNryTAgvhOOG6j/RoeYYB8+6wscgFcEs77CJ4vbawmhYQKUiYD6ykyi68oaKb/4+SENeUOe/YBgk=
X-Received: by 2002:a9d:1e88:: with SMTP id n8mr28484509otn.369.1576010071839; 
 Tue, 10 Dec 2019 12:34:31 -0800 (PST)
MIME-Version: 1.0
References: <20191210154850.577745-1-Jason@zx2c4.com>
 <FX30kbIJvHNSsmPxMSA_XdlAOLSee8p5eHMDcDAkDH8KKhihrybE2EtZJIjtU9ojh-JJT9g4Cj5xlT85E5uETb9JsBJmficyjfDvblrRaJg=@protonmail.ch>
 <CAHmME9pdqq23OXNPHLT-YyXCKTVTKJNyfz9D+Q0jADAN=BDhnA@mail.gmail.com>
 <20191210221215.56c2f30d@natsu>
 <CAHmME9oYJFfQByaaVefEfbbXT=DABV+=DShuupJjBrk5i87GQA@mail.gmail.com>
 <OP549CYtruXJJQ-jftan-7-ySlaBW7egOMSgpfkcSjBM3DMK6rnDyiN-V8VUEdIq-MxP5iNwV57VMvcPp9MwTjdUIndoZ3JtQXlW900KhW8=@protonmail.ch>
 <CAHmME9qbpPQ2-M66bjjV32t2rvbsd=-EgEJau5SfxHoe6UEixg@mail.gmail.com>
 <5hY57KNFlbEgS6fAPnw9YbBwTENsSKiWsoofsA7UBa0C1cnN1eg_yB2egr01M3gGsAmOlJ9AS9CBg5vuZOi8Zw7p0luFqaAkQoNKzTNoV5Q=@protonmail.ch>
In-Reply-To: <5hY57KNFlbEgS6fAPnw9YbBwTENsSKiWsoofsA7UBa0C1cnN1eg_yB2egr01M3gGsAmOlJ9AS9CBg5vuZOi8Zw7p0luFqaAkQoNKzTNoV5Q=@protonmail.ch>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 10 Dec 2019 21:34:20 +0100
X-Gmail-Original-Message-ID: <CAHmME9rGbFe-eXrjXXDRhysqGez2tRuqNUOaV5ZDUFuEBt=yeg@mail.gmail.com>
Message-ID: <CAHmME9rGbFe-eXrjXXDRhysqGez2tRuqNUOaV5ZDUFuEBt=yeg@mail.gmail.com>
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

On Tue, Dec 10, 2019 at 9:30 PM Jordan Glover
<Golden_Miller83@protonmail.ch> wrote:
>
> On Tuesday, December 10, 2019 7:15 PM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> > On Tue, Dec 10, 2019 at 7:58 PM Jordan Glover
> > Golden_Miller83@protonmail.ch wrote:
> >
> > > On Tuesday, December 10, 2019 5:36 PM, Jason A. Donenfeld Jason@zx2c4.com wrote:
> > >
> > > > On the other hand, if what you say is actually true in our case, and
> > > > nftables is utter crap, then perhaps we should scrap this nft(8) patch
> > > > all together and just keep pure iptables(8). DKG - you seemed to want
> > > > nft(8) support, though. How would you feel about that sort of
> > > > conclusion?
> > > > Jason
> > >
> > > The only scenario where you really want to use nft is where iptables command
> > > doesn't exist. I don't know how realistic scenario it is but I assume it can
> > > happen in the wild. Otherwise calling iptables will take care of both iptables
> > > and nftables automatically if those are supported on system. That's why I
> > > proposed to invert current patch logic.
> >
> > I reason about things a bit differently. For me, the decision is
> > between these two categories:
> >
> > A) iptables-nft points to iptables and is available for people who
> > want a nft-only system. So, code against the iptables API, and mandate
> > that users either have iptables or iptables-nft installed, which isn't
> > unreasonable, considering the easy availability of each.
> >
> > B) nft is the future and should be used whenever available. Support
> > iptables as a fallback though for old systems, and remove it as soon
> > as we can.
> >
> > Attitudes that fall somewhere between (A) and (B) are much less
> > interesting to me.
>
> Isn't future goal to drop those firewall hacks altogether? The future of
> nft may be irrelevant then and effort should go for iptables which works
> on more systems

Yes, but that means likely kernel patches, which means a very very
long deployment timeline.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
