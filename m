Return-Path: <SRS0=S5mX=JM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBFA6C433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 15 Apr 2021 11:37:31 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FF006137D
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 15 Apr 2021 11:37:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8FF006137D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=stha.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b9dd062d;
	Thu, 15 Apr 2021 11:37:28 +0000 (UTC)
Received: from deponia.stha.de (deponia.stha.de [2001:8d8:1801:133::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 35cd5b45
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 15 Apr 2021 11:37:26 +0000 (UTC)
Received: from mail.stha.de (mail.stha.de [IPv6:2a03:4000:24:7d0:100::15])
 by deponia.stha.de (Postfix) with ESMTPS id 9B96611000F;
 Thu, 15 Apr 2021 11:37:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: stefan)
 by mail.stha.de (Postfix) with ESMTPSA id 40DA71851F3;
 Thu, 15 Apr 2021 11:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=stha.de; s=20200509;
 t=1618486615; bh=cYACa7TnWcmRNk2+MnztWRTe4kDWHWADdB+/pSR4q1Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YoE2hsMIFVtz+TY436DF3pBbbHuIWCpSZbGRWWhkARxUbk+izsrl4ioi4r9hF+tRI
 0oXlfNQ6z3/XUi6ARf/ZGA0XVwaMyfgrBBJJNtzFm2sqxMjFkLkPfc+S0z44hDJdPk
 bJEuXGkoyAiBk5OU09VR7dmWX1Z/nq+X8m/xUb4R0DmFniyCet/fbxLDkAcrLfapx1
 DS9SO4L/QcmykIUDePwmJy05iMLTAU6d8uLTwPpNE1s7memJo2uAbwZfhOhrMamv0l
 PTobCAUYkYTcTmpW6mJFZ71fXrxpChNcnDdPwLAxrusZ8TOaYSYaxFeO6m8lwdRo/B
 rE4hy+WR8qHsA==
Date: Thu, 15 Apr 2021 13:36:53 +0200
From: Stefan Haller <stefan.haller@stha.de>
To: Toke =?iso-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@toke.dk>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: FreeBSD if_wg POINTTOPOINT and MULTICAST behaviour
Message-ID: <7be52421-db0d-4971-99b0-ce76307d1a33@stha.de>
References: <9afe6dc9-5c53-4c25-b09f-5b4cf6ff8046@stha.de>
 <CAHmME9rAzGauYJuq4Qpn561f1YrYTaSN1mj2HB2Kdhgd2QJs9A@mail.gmail.com>
 <87371254-15f1-494b-8740-38071d7f7d68@stha.de>
 <874kg8ldjn.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <874kg8ldjn.fsf@toke.dk>
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

Hi Toke,

On Thu, Apr 15, 2021 at 12:14:04AM +0200, Toke Høiland-Jørgensen wrote:
> That's because the babel protocol code is checking for Bird's internal
> MULTICAST flag, which is set like:
> 
>   else if (fl & IFF_POINTOPOINT)    /* PtP */
>     f.flags |= IF_MULTICAST;
>   else if (fl & IFF_BROADCAST)      /* Broadcast */
>     f.flags |= IF_MULTIACCESS | IF_BROADCAST | IF_MULTICAST;
> 
> so it needs either the OS-level POINTOPOINT or the BROADCAST flag set.
> Wireguard interfaces on Linux has POINTOPOINT which is enough for Bird.

That explains a lot. I expected something like this, but did not have
time yet to look more closely.

> And yeah, for now Babel only speaks multicast; the spec does allow for
> unicast communication, but the code in Bird doesn't implement that yet
> (I'm the author of the Babel implementation in Bird). Even for unicast,
> Babel still needs multicast for discovery, but in the case of Wireguard
> that could be replaced by reading the peers directly from the Wireguard
> kernel module. Add in updating of Wireguard AllowedIPs, and presto,
> there's you completely dynamic mesh requiring only a single wg interface
> on each peer :)

Overall, this sounds like a great idea. Having to create so many
wireguard p2p tunnels to form a mesh is quite cumbersome. Using
Wireguards AllowedIPs as an alternative to the kernel routing table
sounds useful. The peer discovery could also be useful outside of the
babel protocol implementation (even though it will always be quite
non-standard). One could probably assume that the first configured
v6/128 and v4/32 IPs belong to the directly connected peer.

> Quite happy to review Bird patches if someone wants to hack on this,
> BTW, but otherwise it's on my "eventually" list :P

While I am interested and it sounds like a great opportunity to learn
cool new things I don't know a lot about yet, I have to see if I am
actually up to the task. :)

Anyway, I think there is an agreement that it is better to add specific
support for Wireguard interfaces in bird instead of changing the
interface flags.


Kind regards,
Stefan
