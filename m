Return-Path: <SRS0=vkhh=UM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D042C31E45
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 13 Jun 2019 23:15:46 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8B8120B7C
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 13 Jun 2019 23:15:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8B8120B7C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lonnie.abelbeck.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f639b478;
	Thu, 13 Jun 2019 23:15:44 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 17761397
 for <wireguard@lists.zx2c4.com>;
 Thu, 13 Jun 2019 23:15:42 +0000 (UTC)
Received: from ibughas.pair.com (ibughas.pair.com [209.68.5.177])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f1c2dec2
 for <wireguard@lists.zx2c4.com>;
 Thu, 13 Jun 2019 23:15:42 +0000 (UTC)
Received: from ibughas.pair.com (localhost [127.0.0.1])
 by ibughas.pair.com (Postfix) with ESMTP id B516B1E3011;
 Thu, 13 Jun 2019 19:15:41 -0400 (EDT)
Received: from macpro.priv.abelbeck.com (wsip-70-184-211-81.om.om.cox.net
 [70.184.211.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ibughas.pair.com (Postfix) with ESMTPSA id 611691E303F;
 Thu, 13 Jun 2019 19:15:41 -0400 (EDT)
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: RFC: wg syncpeers wg0 wireguard.conf
From: Lonnie Abelbeck <lists@lonnie.abelbeck.com>
In-Reply-To: <CAHmME9r3QVVWRu=36Yx6wmfuHm5CCA3Dg+JdZknpnNAmnj=ATQ@mail.gmail.com>
Date: Thu, 13 Jun 2019 18:15:40 -0500
Message-Id: <2046FD14-A817-4790-A87A-5176B60D858C@lonnie.abelbeck.com>
References: <6BFBD58C-ACC2-45FD-9986-63CEA1143BA6@lonnie.abelbeck.com>
 <CAHmME9r3QVVWRu=36Yx6wmfuHm5CCA3Dg+JdZknpnNAmnj=ATQ@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
X-Mailer: Apple Mail (2.3445.104.11)
Cc: Luis Ressel <aranea@aixah.de>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
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


> On Jun 11, 2019, at 12:28 PM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> 
> I gave it a stab in this branch:
> https://git.zx2c4.com/WireGuard/commit/?h=jd/syncconf Try it out and
> let me know if it does what you had in mind?

More testing, "syncconf" is working great.

A real world example, connecting over WG to a remote instance, using a web interface for remote WG management:

1) "Restart WireGuard VPN" takes 35 seconds (using "setconf"), 17 seconds for the WG peer to reestablish and the rest of the time is most likely the TCP backoff timers for the HTTPS web interface session, totaling 35 seconds.

2) "Reload WireGuard VPN" takes << 1 second (using "syncconf"), no noticeable impact at all, even when editing the AllowedIPs of the peer tunnel used for access.


Our project will be using Jason's elegant "syncconf" (above URL) as a patch, up until an official solution is committed.

Lonnie

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
