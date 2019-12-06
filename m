Return-Path: <SRS0=ImwE=Z4=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,FREEMAIL_REPLYTO_END_DIGIT,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCEAEC43603
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Dec 2019 16:12:36 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00BEF206DF
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Dec 2019 16:12:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=protonmail.ch header.i=@protonmail.ch header.b="Eb6ccGyJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00BEF206DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=protonmail.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 061f1ae8;
	Fri, 6 Dec 2019 16:12:34 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9210d450
 for <wireguard@lists.zx2c4.com>; Fri, 6 Dec 2019 16:12:31 +0000 (UTC)
Received: from mail-40141.protonmail.ch (mail-40141.protonmail.ch
 [185.70.40.141])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f5a72768
 for <wireguard@lists.zx2c4.com>; Fri, 6 Dec 2019 16:12:31 +0000 (UTC)
Date: Fri, 06 Dec 2019 16:12:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.ch;
 s=default; t=1575648743;
 bh=g5UiypWV5mAGg2XwKAL67Ts1OBvoox+5YihSUn5Cb6I=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=Eb6ccGyJ1Sbo5vJXzwDMERc9NwrJscwidH+M8Lc2nLNuXuXf5DRX9EUpDybJ62dvX
 c0JWcyLRjdtSapquOqG8v+n0IDA0rjV1036Eh60o9Psa26+YPQ1YrQTalju4dVrgF4
 n/Jk0EO865cAK67AG10P5CrDwDYXTMwFfY7wvM30=
To: Vasili Pupkin <diggest@gmail.com>
From: Jordan Glover <Golden_Miller83@protonmail.ch>
Subject: Re: Regarding "Inferring and hijacking VPN-tunneled TCP connections"
Message-ID: <sZXjoRuWmvBHjZtlb28qeohg4R8BAHjCk5b-I2TWb5-ew1OZJBGYefxuSzTjFP7e5lESacVJMtp4fKIl7wyXJCI1iIznqnStW6OxG-P9YeQ=@protonmail.ch>
In-Reply-To: <1bcf459c-4c08-33b2-19da-31cb62fd56a1@gmail.com>
References: <20191205191318.GA44156@zx2c4.com>
 <db72ae85-4e68-1745-e11b-0fb81016358e@gmail.com>
 <CAHmME9osDRPQvfYMexRcAhHdAb-x2PjD8Wnf+nrcHyX42ivmqA@mail.gmail.com>
 <51usC7EJy_alaYnTOuLCvYhTzzcKrvAfq01j0Vfu5QVd6OGARQLdDDqQymloKWhWqkp81E09bpwjSRw5mnJDwg5fv8FuAVS-W0CYLuJlpRI=@protonmail.ch>
 <CAHmME9qUWRO76NJrnO5iNoWuauvMT3kf+qM1bY49bVkcBFXY9g@mail.gmail.com>
 <1bcf459c-4c08-33b2-19da-31cb62fd56a1@gmail.com>
Feedback-ID: QEdvdaLhFJaqnofhWA-dldGwsuoeDdDw7vz0UPs8r8sanA3bIt8zJdf4aDqYKSy4gJuZ0WvFYJtvq21y6ge_uQ==:Ext:ProtonMail
MIME-Version: 1.0
Cc: "William J. Tolley" <william@breakpointingbad.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
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

On Friday, December 6, 2019 4:03 PM, Vasili Pupkin <diggest@gmail.com> wrote:

> On 06.12.2019 18:08, Jason A. Donenfeld wrote:
>
> > On Fri, Dec 6, 2019 at 4:06 PM Jordan Glover
> > Golden_Miller83@protonmail.ch wrote:
> >
> > > On Thursday, December 5, 2019 8:24 PM, Jason A. Donenfeld Jason@zx2c4.com wrote:
> > >
> > > > If we can make nft coexistance work reliably, perhaps we can run the
> > > > nft rule on systems where the nft binary simply exists.
> > >
> > > Will this work correctly on systems where nft binary exist but only
> > > iptables rules are used?
> > > That's what I meant by, "if we can make nft coexistance work reliably."
>
> Take a look at the table on the bottom of this page
> https://wiki.nftables.org/wiki-nftables/index.php/Troubleshooting#Question_4._How_do_nftables_and_iptables_interact_when_used_on_the_same_system.3F
>
> On my system their rules coexist fine. Both nftables and iptables are
> just high level interfaces to kernel netfilter hooks after all, if
> either of them drop the packet then the packet is dropped. It is also
> possible to write the same filter using iptables, not as easy and not as
> beautiful as nft though. Finally wireguard can do this directly
> interacting with netfilter as the last resort.

But nft rule won't be visible from iptables tools like iptables-save,
right? This may be confusing for people who still use iptables for
setting up firewall on their systems.

Jordan
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
