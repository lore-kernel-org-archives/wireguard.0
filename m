Return-Path: <SRS0=opgr=TK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,FREEMAIL_REPLYTO_END_DIGIT,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AEB8C04A6B
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 10 May 2019 14:06:31 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 433D521479
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 10 May 2019 14:06:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=protonmail.ch header.i=@protonmail.ch header.b="W7nlOcoG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 433D521479
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=protonmail.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c4bcb04c;
	Fri, 10 May 2019 14:06:12 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1b653dac
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 May 2019 14:06:11 +0000 (UTC)
Received: from mail-40135.protonmail.ch (mail-40135.protonmail.ch
 [185.70.40.135])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9aa76baa
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 May 2019 14:06:11 +0000 (UTC)
Date: Fri, 10 May 2019 14:06:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.ch;
 s=default; t=1557497170;
 bh=WrJ+f/YzafWwSE3lNSn5l9pdYvJDqBDsNK0mJlsdDnM=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=W7nlOcoGOxxDNca2iXicv0cmBK/J0SSG96SJw2//6P9wjrDkEqea4euV4Y+m13c15
 6wS8mzt9RYrYs5rgoMJybvlA527ECQlmeLE067JHZYKMPzlQ2VG9vMZX1I30KYDbqD
 LxI8UOTUc/NKC40hqDRrqv/GjFzJam+43alKGhhk=
To: Sitaram Chamarty <sitaramc@gmail.com>
From: Jordan Glover <Golden_Miller83@protonmail.ch>
Subject: Re: bypassing wireguard using firejail
Message-ID: <e8xbxVAEDF-AAUjQOklv4K5j-1bQo1VS-JS07WCoG_RyC4crpfDxeEOfg_VH6EQQvKAd0W-1ACbi6XXFR80vA6Lkw1Zin-lTQSVDCnIp4OA=@protonmail.ch>
In-Reply-To: <20190510115445.GA29887@sita-dell>
References: <20190510115445.GA29887@sita-dell>
Feedback-ID: QEdvdaLhFJaqnofhWA-dldGwsuoeDdDw7vz0UPs8r8sanA3bIt8zJdf4aDqYKSy4gJuZ0WvFYJtvq21y6ge_uQ==:Ext:ProtonMail
MIME-Version: 1.0
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
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

On Friday, May 10, 2019 11:54 AM, Sitaram Chamarty <sitaramc@gmail.com> wrote:

> I am able to bypass the VPN by using firejail (which is a
> sandbox program to run untrusted applications).
>
> Below, the IP addresses and domain names are fake but that
> should not matter:
>
> # wg
> interface: wg0
> public key: ....
> private key: (hidden)
> listening port: 59457
> fwmark: 0xca6c
>
> peer: ....
> endpoint: 11.22.33.44:51820
> allowed ips: 0.0.0.0/0
> latest handshake: 41 seconds ago
> transfer: 35.42 MiB received, 2.74 MiB sent
>
> $ curl zx2c4.com/ip
> 11.22.33.44 <--- my wg VPN end point IP
> static.44.33.22.11.elided.tld
> curl/7.64.0
>
> $ firejail --net=wlp2s0 --dns=8.8.8.8 curl zx2c4.com/ip
> 55.66.77.88 <--- my actual external IP
> elided.hostname.myisp.in
> curl/7.64.0
>
> My questions:
>
> 1.  I know firejail is suid root, but still... is there any way
>     to prevent this from happening, or at least make it less
>     trivial?
>
>     I'm OK with a "this is the way it is, if your untrusted app
>     is running as root you're already toast" response; just want
>     to make sure I'm not missing a bet here.
>
> 2.  I guess I don't know as much about Linux networking as I
>     thought I knew, especially about policy routing, so I am
>     feeling a bit lost here.
>
>     I would prefer not to have to learn lots of things about
>     policy routing and so on, so I wonder if there is a simple,
>     (wireguard-specific, if possible) explanation of how linux
>     policy routing and iptables work behind the scenes to direct
>     packets when wireguard is in play?
>
>     regards
>     sitaram
>
>

This is known firejail feature[1]. If you want to prevent yourself
from this footgun you may add "restricted-network yes" in
/etc/firejail/firejail.config

I don't see anything from wireguard to do here. If system admin want
to bypass the routes, they will.

[1] https://github.com/netblue30/firejail/issues/2665

Jordan

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
