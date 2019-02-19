Return-Path: <SRS0=+C0p=Q2=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B39A6C43381
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 19 Feb 2019 14:26:36 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF55421773
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 19 Feb 2019 14:26:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF55421773
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lonnie.abelbeck.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a0350ee3;
	Tue, 19 Feb 2019 14:18:01 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 022200e6
 for <wireguard@lists.zx2c4.com>;
 Tue, 19 Feb 2019 14:17:58 +0000 (UTC)
Received: from ibughas.pair.com (ibughas.pair.com [209.68.5.177])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6f2fb52d
 for <wireguard@lists.zx2c4.com>;
 Tue, 19 Feb 2019 14:17:58 +0000 (UTC)
Received: from ibughas.pair.com (localhost [127.0.0.1])
 by ibughas.pair.com (Postfix) with ESMTP id 764431E3062;
 Tue, 19 Feb 2019 09:26:31 -0500 (EST)
Received: from [10.4.1.148] (wsip-70-184-211-81.om.om.cox.net [70.184.211.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by ibughas.pair.com (Postfix) with ESMTPSA id 0C8C61E304E;
 Tue, 19 Feb 2019 09:26:30 -0500 (EST)
Mime-Version: 1.0 (Mac OS X Mail 12.2 \(3445.102.3\))
Subject: Re: DNS name resolution should not be done during configuration
 parsing.
From: Lonnie Abelbeck <lists@lonnie.abelbeck.com>
In-Reply-To: <dda16c02-171c-6b44-8258-fda8d65d0543@urlichs.de>
Date: Tue, 19 Feb 2019 08:26:29 -0600
Message-Id: <9ECFB5A1-9B31-4697-817A-887BF82D0E2A@lonnie.abelbeck.com>
References: <8_iPFshR7GasRS24vRTFKp3pG-UGxQLluTaoZZeAO-UlYBTQ2nCHNlMniuKWz9tWpWPbbXS8Br3SxRpCjcruohwFw8PD83jko2lrf3E7hq4=@wieliczko.ninja>
 <CAJJxGdG2G+busk12y==dZOL2__+C1T6nQy+tGRJM=M65-SuZ5Q@mail.gmail.com>
 <CAH8yC8=2pjH3VbxaeJ-sTSnV64-KxKK3AHA7K_EEANX5_g02Mw@mail.gmail.com>
 <8f46738a-35bd-8d48-ab0a-aa0c9ed40e8d@trustiosity.com>
 <dda16c02-171c-6b44-8258-fda8d65d0543@urlichs.de>
To: Matthias Urlichs <matthias@urlichs.de>
X-Mailer: Apple Mail (2.3445.102.3)
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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



> On Feb 19, 2019, at 1:22 AM, Matthias Urlichs <matthias@urlichs.de> wrote:
> 
> We don't even need call-outs. We already have a netlink interface which
> a userspace client can use to monitor WG. Teach that client to
> re-resolve the name and to update the peer.
> -- 
> -- Matthias Urlichs

Agreed.  For example Jason's "reresolve-dns.sh" script. [1]

The missing piece is to keep "wg setconf" (et al.) from failing given a DNS failure on any peer.

Per this trivial patch.
https://raw.githubusercontent.com/astlinux-project/astlinux/master/package/wireguard/wireguard-0001-ignore-endpoint-dns-failure.patch

Peers without DNS endpoints (or successful DNS) would be allowed to start promptly as expected, and any failed DNS endpoints would be filled in later via a userspace WG monitor (ex. reresolve-dns.sh).

Lonnie

[1] https://git.zx2c4.com/WireGuard/tree/contrib/examples/reresolve-dns

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
