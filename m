Return-Path: <SRS0=NC//=J5=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 004C4C433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  2 May 2021 12:06:38 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5817610A6
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  2 May 2021 12:06:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5817610A6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ungleich.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2a8f2d10;
	Sun, 2 May 2021 12:06:36 +0000 (UTC)
Received: from smtp.ungleich.ch (smtp.ungleich.ch
 [2a0a:e5c0:0:2:400:b3ff:fe39:7956])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d88ac3b5
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 2 May 2021 12:06:34 +0000 (UTC)
Received: from nb3.localdomain (localhost [IPv6:::1])
 by smtp.ungleich.ch (Postfix) with ESMTP id 516CD1FE3B;
 Sun,  2 May 2021 14:06:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ungleich.ch; s=mail;
 t=1619957194; bh=t3S8coofytgKbt3U+nbhoBQSvojzy8Au/k0bYTWKNRQ=;
 h=References:From:To:Cc:Subject:In-reply-to:Date:From;
 b=U2tc1oQ1fTzIBtth0zsTU+zW5sKqaGHZY1aSV4m20flVljC4FHrI7yV6tsIcMXALc
 riiDPjQRDdlU3wJjn/w5nsaM6Wnvwu80l8V6QEZfPPHvTLAe1y2wYKw3YCKisEQer0
 Rtx8IaCq+oDCacq3ADmUih8brlR8Ru74RQWP5OZkoV+jMN6oRwTWc12Vd4YSZM4LaQ
 sNztyqJiH4WIyegXO1OPLwZw1gYA1fhx+L9bxKOsPMNqNIVXkRSi/gPLv6F3J1Fy4D
 4CZeMZNw+Ma6BloJoLkYwhq8c79FlbDaEocbxOFy75vAiCgV9HiApdSND/mTQWUbt7
 XaBjKNx/j+Zyg==
Received: by nb3.localdomain (Postfix, from userid 1000)
 id D68E914C0423; Sun,  2 May 2021 14:06:53 +0200 (CEST)
References: <87wnshs8jf.fsf@ungleich.ch> <20210502164344.039fe960@natsu>
User-agent: mu4e 1.4.15; emacs 27.2
From: Nico Schottelius <nico.schottelius@ungleich.ch>
To: Roman Mamedov <rm@romanrm.net>
Cc: Nico Schottelius <nico.schottelius@ungleich.ch>, wireguard@lists.zx2c4.com
Subject: Re: Multiple Keys per Peer
In-reply-to: <20210502164344.039fe960@natsu>
Date: Sun, 02 May 2021 14:06:53 +0200
Message-ID: <87pmy9s5k2.fsf@ungleich.ch>
MIME-Version: 1.0
Content-Type: text/plain
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


Roman Mamedov <rm@romanrm.net> writes:

> On Sun, 02 May 2021 13:02:28 +0200
> Nico Schottelius <nico.schottelius@ungleich.ch> wrote:
>
>> when running a lot of VPN connections using wireguard, there are some
>> questions we see quite often from users, two of which I'd like to
>> discuss here:
>>
>> Multiple keys per Peer
>> ----------------------
>>
>> Users often ask for sharing their connection with multiple
>> devices. The obvious solution is for users to setup their own VPN
>> endpoint with the first key and then reshare themselves. However, this
>> is not feasible in many end user situations.
>
> The prime and the most straightforward solution is to give each user multiple
> keys, and let them connect from each endpoint as an independent Peer.
>
> The rest of what you propose appears to be a set of bizarre hacks because
> you don't want to do the above, because "(reasons)". Maybe start with
> detailing those reasons first, or reconsidering if they are *really* that
> important and unsurmountable :)

Practically speaking our VPN are currently rather
"dumb" and only know about /48's (usually one VPN server is responsible
for a /40). And in practice, we are not so much interested in knowing
how people split their tunnels, so we considers this more of a
dynamic routing than a static configuration.

However, I see your point that we could update our systems for
pre-processing the routing logic and letting users split on a static
basis and with that keeping the wireguard protocol more simple.

I'd say fair enough and thanks for the pointer!

Best regards,

Nico

--
Sustainable and modern Infrastructures by ungleich.ch
