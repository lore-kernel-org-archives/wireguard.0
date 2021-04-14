Return-Path: <SRS0=Tjnm=JL=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 290F0C433ED
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 14 Apr 2021 22:14:11 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBCB36115C
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 14 Apr 2021 22:14:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CBCB36115C
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=toke.dk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fac96b0f;
	Wed, 14 Apr 2021 22:14:08 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [45.145.95.4])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3d90d1c8
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Apr 2021 22:14:06 +0000 (UTC)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
 t=1618438445; bh=tb3v4245/QV/dlS7RQREGzq7b//r5so9hhmmJm64Mig=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=gxMQTJp5KXCvSt8CSKpaVSMy5PCd6oQ4uyN9Nbn/15hNI+siabFSCMF0B1WNqgZfj
 LnNB5un+WgH0m+ELXnZqwlSLZFJ9EbVngernhpvRi8TmrNE6AzehpxIXsMc1drwa8R
 mgNxO02raqYsYllRMFR5I9AccPJMK3EIsqmnDHDwnW5X+Z16qZwRodvOAFPC5GAfJY
 Rhx7P9lLyNeY82iIXhlSJjlycbTTbzCbL3F+2u/m9/s5HQdz+MuHl0n+Ykfz5IwQBa
 F1IQMjFhLT3qMY1PuLUnvfmPT96y2J6tFPmrVEHSlv6gHcp8l44kMmYRmRdVHUfvRo
 8/vB0bmKd+qSQ==
To: Stefan Haller <stefan.haller@stha.de>, WireGuard mailing list
 <wireguard@lists.zx2c4.com>
Subject: Re: FreeBSD if_wg POINTTOPOINT and MULTICAST behaviour
In-Reply-To: <87371254-15f1-494b-8740-38071d7f7d68@stha.de>
References: <9afe6dc9-5c53-4c25-b09f-5b4cf6ff8046@stha.de>
 <CAHmME9rAzGauYJuq4Qpn561f1YrYTaSN1mj2HB2Kdhgd2QJs9A@mail.gmail.com>
 <87371254-15f1-494b-8740-38071d7f7d68@stha.de>
Date: Thu, 15 Apr 2021 00:14:04 +0200
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <874kg8ldjn.fsf@toke.dk>
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

Stefan Haller <stefan.haller@stha.de> writes:

> Hi Jason,
>
> Thanks for your clarification. I understand that setting this flag would
> be a false promise to userspace, because generally Wireguard is
> point-to-multipoint and doesn't copy messages to multiple peers (which
> is not exactly necessary in my case, where only a single peer is
> configured on both sides).
>
> I just wanted to ensure that the introduced change was intentional
> before looking into other directions, hence my question.
>
> On Wed, Apr 14, 2021 at 02:24:20PM -0600, Jason A. Donenfeld wrote:
>> Does bird completely ignore interfaces without it? Is there no setting
>> to change that?
>
> At least a brief look at the code suggests this: [1]
>
> The Babel protocol seems to rely on well-known *link-local* IPv6
> multicast addresses. I did not find anything related to unicast "hello"
> messages in the RFC or in the implementations. (OSPF is similar, but
> as far as I remember unicast hellos are explicitly allowed.)
>
> One odd thing I noticed: On Linux (5.11.13-arch1-1, so quite recent),
> the interface does not list the MULTICAST flag and the interface is
> still used by bird:
>
> # ip l show dev wg1
> 4: wg1: <POINTOPOINT,NOARP,UP,LOWER_UP> mtu 1400 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000
>
> I will have a closer look why it doesn't work on FreeBSD but the same thing
> works on Linux. I am probably missing something important.

That's because the babel protocol code is checking for Bird's internal
MULTICAST flag, which is set like:

  else if (fl & IFF_POINTOPOINT)    /* PtP */
    f.flags |= IF_MULTICAST;
  else if (fl & IFF_BROADCAST)      /* Broadcast */
    f.flags |= IF_MULTIACCESS | IF_BROADCAST | IF_MULTICAST;

so it needs either the OS-level POINTOPOINT or the BROADCAST flag set.
Wireguard interfaces on Linux has POINTOPOINT which is enough for Bird.

And yeah, for now Babel only speaks multicast; the spec does allow for
unicast communication, but the code in Bird doesn't implement that yet
(I'm the author of the Babel implementation in Bird). Even for unicast,
Babel still needs multicast for discovery, but in the case of Wireguard
that could be replaced by reading the peers directly from the Wireguard
kernel module. Add in updating of Wireguard AllowedIPs, and presto,
there's you completely dynamic mesh requiring only a single wg interface
on each peer :)

Quite happy to review Bird patches if someone wants to hack on this,
BTW, but otherwise it's on my "eventually" list :P

-Toke
