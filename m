Return-Path: <SRS0=5LHB=JY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEDBCC433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 27 Apr 2021 19:52:52 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF91E613B1
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 27 Apr 2021 19:52:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF91E613B1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=matrix-dream.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9550cf9a;
	Tue, 27 Apr 2021 19:52:49 +0000 (UTC)
Received: from mail1.matrix-dream.net (<unknown> [2a0a:51c0::71])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f43c1469
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Apr 2021 19:52:47 +0000 (UTC)
Received: from ivan by mail1.matrix-dream.net with local (Exim 4.93.0.4)
 (envelope-from <labawi-wg@matrix-dream.net>)
 id 1lbThc-0005Yy-4m; Tue, 27 Apr 2021 19:49:00 +0000
Date: Tue, 27 Apr 2021 19:49:00 +0000
From: Ivan =?iso-8859-1?Q?Lab=E1th?= <labawi-wg@matrix-dream.net>
To: lejeczek <peljasz@yahoo.co.uk>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: wgX iface as slave to a bridge - Linux
Message-ID: <YIhqrEPpmsAfVQuM@matrix-dream.net>
References: <0c8b4be5-ee9d-4f19-7179-ad08a28d0574.ref@yahoo.co.uk>
 <0c8b4be5-ee9d-4f19-7179-ad08a28d0574@yahoo.co.uk>
 <CA+cYV6uTvNYv3wkZ9vS8wBP5BHEmg8rZHg7WBvyRkHdd+fjpVg@mail.gmail.com>
 <4eeeaa84-65a9-d53e-972b-c2212babc944@yahoo.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4eeeaa84-65a9-d53e-972b-c2212babc944@yahoo.co.uk>
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

Normally, you would use routing (L3) instead of bridging (L2).
Conceptually, the connectivity should work about the same,
as long as you configure your routes and enable forwarding.
Routes need to be configured on the host, not container-only,
but if assign a subnet to a bridge, devices can use addresses
from it without intervention on the host.

If you want roaming addresses, you could do live route
updates on your wireguard links and host routing table
for a native L3 solution. For a pre-existing automated
solution, you can use a some kind of routing service,
usually with multiple additional layers of encapsulation,
as others have mentioned.

Regards,
ivan


On Sun, Apr 25, 2021 at 02:13:24PM +0100, lejeczek wrote:
> On 25/04/2021 13:21, Chriztoffer Hansen wrote:
> > What is your use case behind the question?
> >
> Containers. Simple (but also can be complex too as scales 
> easily) case where containers would be glued together and be 
> able to communicate across nodes/hosts via wireguard 
> tunnel/link.
> I'm looking at it from a 'regular' admin standpoint.
> Then it'd be just one wiregurard host-to-host link which all 
> container could utilize, as oppose to separate wireguard 
> for/in each container.
> 
> many thanks, L.
