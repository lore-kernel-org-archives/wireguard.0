Return-Path: <SRS0=S5mX=JM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB21CC433ED
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 15 Apr 2021 12:22:44 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5971561042
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 15 Apr 2021 12:22:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5971561042
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=toke.dk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 13994de1;
	Thu, 15 Apr 2021 12:22:41 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [45.145.95.4])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6c696249
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 15 Apr 2021 12:22:40 +0000 (UTC)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
 t=1618489359; bh=6p0K4uYWMfxiL1WMZXctvisg86X00zpRJQT9NxU3b8g=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Vkd4sMpFuTCw34Oj5zJRlJ6WETN0u8DDwUFlhsVKMjgN93wfpBe2jxjM8uThK3KYT
 +UCFPsnr7Bggqu+k+YnGg0FAMlP7ymPG51TCbMlKvFbsWN26fSB7Jsgv/Zna3UyyaQ
 RQ/vUZtWnSdPIF0ZqELEoBNT9JXzyJmsxy3baWEHq3pR7oo8t3lT/DAK3hQ3W+Tlyn
 gn1JUJCTOP7Vc1McYEnGeVU2axtQF6br2PpHoaDaHrQx9sRJOC3M0U6fd3z6/X0m0O
 CcgYx+j0UW0semyGkx6dfN/oCZYCKYfxJPX2mGoUgf/exjfgl0kv+/f4KJlbd9ZDx5
 mf5qHSE80V8KA==
To: Stefan Haller <stefan.haller@stha.de>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: FreeBSD if_wg POINTTOPOINT and MULTICAST behaviour
In-Reply-To: <7be52421-db0d-4971-99b0-ce76307d1a33@stha.de>
References: <9afe6dc9-5c53-4c25-b09f-5b4cf6ff8046@stha.de>
 <CAHmME9rAzGauYJuq4Qpn561f1YrYTaSN1mj2HB2Kdhgd2QJs9A@mail.gmail.com>
 <87371254-15f1-494b-8740-38071d7f7d68@stha.de> <874kg8ldjn.fsf@toke.dk>
 <7be52421-db0d-4971-99b0-ce76307d1a33@stha.de>
Date: Thu, 15 Apr 2021 14:22:38 +0200
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <87czuvka9d.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Stefan Haller <stefan.haller@stha.de> writes:

> Hi Toke,
>
> On Thu, Apr 15, 2021 at 12:14:04AM +0200, Toke H=C3=B8iland-J=C3=B8rgense=
n wrote:
>> That's because the babel protocol code is checking for Bird's internal
>> MULTICAST flag, which is set like:
>>=20
>>   else if (fl & IFF_POINTOPOINT)    /* PtP */
>>     f.flags |=3D IF_MULTICAST;
>>   else if (fl & IFF_BROADCAST)      /* Broadcast */
>>     f.flags |=3D IF_MULTIACCESS | IF_BROADCAST | IF_MULTICAST;
>>=20
>> so it needs either the OS-level POINTOPOINT or the BROADCAST flag set.
>> Wireguard interfaces on Linux has POINTOPOINT which is enough for Bird.
>
> That explains a lot. I expected something like this, but did not have
> time yet to look more closely.
>
>> And yeah, for now Babel only speaks multicast; the spec does allow for
>> unicast communication, but the code in Bird doesn't implement that yet
>> (I'm the author of the Babel implementation in Bird). Even for unicast,
>> Babel still needs multicast for discovery, but in the case of Wireguard
>> that could be replaced by reading the peers directly from the Wireguard
>> kernel module. Add in updating of Wireguard AllowedIPs, and presto,
>> there's you completely dynamic mesh requiring only a single wg interface
>> on each peer :)
>
> Overall, this sounds like a great idea. Having to create so many
> wireguard p2p tunnels to form a mesh is quite cumbersome. Using
> Wireguards AllowedIPs as an alternative to the kernel routing table
> sounds useful. The peer discovery could also be useful outside of the
> babel protocol implementation (even though it will always be quite
> non-standard). One could probably assume that the first configured
> v6/128 and v4/32 IPs belong to the directly connected peer.
>
>> Quite happy to review Bird patches if someone wants to hack on this,
>> BTW, but otherwise it's on my "eventually" list :P
>
> While I am interested and it sounds like a great opportunity to learn
> cool new things I don't know a lot about yet, I have to see if I am
> actually up to the task. :)
>
> Anyway, I think there is an agreement that it is better to add specific
> support for Wireguard interfaces in bird instead of changing the
> interface flags.

Yeah; in the meantime, you can just patch Bird; just get rid of this
check in proto/babel/babel.c (there are two of them):

    if (!(iface->flags & IF_MULTICAST))
      continue;

should have no ill effects. Actually I think we could just get rid of
that check entirely, it's not strictly needed for anything other than
maybe filtering a very wide glob of interfaces. I'll send a patch...

-Toke
