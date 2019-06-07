Return-Path: <SRS0=ogfi=UG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1DE6C28CC3
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  7 Jun 2019 08:05:36 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25084208C0
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  7 Jun 2019 08:05:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25084208C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=matrix-dream.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 65d5fed8;
	Fri, 7 Jun 2019 08:05:34 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c499112c
 for <wireguard@lists.zx2c4.com>; Fri, 7 Jun 2019 08:05:32 +0000 (UTC)
Received: from mail1.matrix-dream.net (mail1.matrix-dream.net
 [IPv6:2a0a:51c0::71])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fc32ff64
 for <wireguard@lists.zx2c4.com>; Fri, 7 Jun 2019 08:05:32 +0000 (UTC)
Received: from ivan by mail1.matrix-dream.net with local (Exim 4.91)
 (envelope-from <labawi-wg@matrix-dream.net>)
 id 1hZ9s3-000764-P4; Fri, 07 Jun 2019 08:05:07 +0000
Date: Fri, 7 Jun 2019 08:05:07 +0000
From: Ivan =?iso-8859-1?Q?Lab=E1th?= <labawi-wg@matrix-dream.net>
To: Toke =?iso-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@toke.dk>
Subject: Re: Overlapping AllowedIPs Configuration
Message-ID: <20190607080507.GA26861@matrix-dream.net>
References: <20190506210827.2h4nzjxjpmwg7kpa@yavin>
 <536efee3-3d15-682f-4979-7fa2bb3457c3@zil.li>
 <87lfyfdnyu.fsf@toke.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87lfyfdnyu.fsf@toke.dk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: henningreich@gmail.com, wireguard@lists.zx2c4.com
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On Thu, Jun 06, 2019 at 12:09:45PM +0200, Toke H=F8iland-J=F8rgensen wrote:
> Paul Zillmann <paul@zil.li> writes:
..
> > The problem is that the allowed-ips configuration has multiple purposes=
: =

> > routing table and firewall/packet filter. This introduces these =

> > problems. It would be helpfull to get a compile flag or something else =

> > to make this behavior optional.
> =

> That is probably not going to happen; the crypto-routing is quite
> integral to Wireguard, and is an important security feature.
> =


Disabling source filtering entirely is a bad idea, but permitting
non-routed (duplicate) inputs would be a useful feature for key-rotation,
failover and building resilient and/or exotic routing networks
without adding yet another layer of tunneling headers.

For example by separating parameters as:
AllowedIPs: A, B, C
RouteIPs: A, C
or set both:
IPs: A, C

As per the original question, I do find it strange, that a transient
modification of a peer can remove routes from another peer. Also
discarding routes in general, even more so when done silently.

Regards,
Ivan
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
