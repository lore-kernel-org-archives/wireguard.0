Return-Path: <SRS0=Tjnm=JL=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 459B4C433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 14 Apr 2021 21:51:25 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F69A60FF0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 14 Apr 2021 21:51:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F69A60FF0
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=stha.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 22c3342b;
	Wed, 14 Apr 2021 21:51:22 +0000 (UTC)
Received: from deponia.stha.de (deponia.stha.de [2001:8d8:1801:133::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f242c114
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Apr 2021 21:51:20 +0000 (UTC)
Received: from mail.stha.de (mail.stha.de [IPv6:2a03:4000:24:7d0:100::15])
 by deponia.stha.de (Postfix) with ESMTPS id 346E110FD07
 for <wireguard@lists.zx2c4.com>; Wed, 14 Apr 2021 21:51:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: stefan)
 by mail.stha.de (Postfix) with ESMTPSA id E36F1184B91
 for <wireguard@lists.zx2c4.com>; Wed, 14 Apr 2021 21:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=stha.de; s=20200509;
 t=1618437049; bh=EhySSzkzFES501HWM4oH70JebTareYd2Q579BKQEHmo=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=mro6pCT5mJr/LB00lsJt5yTfZzCkA83RVpHwDOav83D6zoDW2hvl/mmw9wY+2rq0R
 74QtF6ZD4T/GuYWYeswhEnzZEEGSC/FscnkZZyH+AVRrKRtRU9HhHDEYBxhBQ50t7T
 rl9hPPwcEnskmne5y2a50A6FusmnM7K+pqr+w7Qu0Zm0HDU3joHmz24/ute1y+9HXC
 w05+8bfT5QHUlwtIXadNfDhsERc/QhjsV2tJAjaPwib0cd0o7CZRw/Fx2bZ7U2ouZS
 vXkf16uRakvRIaQ51MEa/N5VdcvG/4nvN6k5yuEyxzZy5L+2no2NrF4zSgQTJM/alR
 V/3B5ffVG6o2g==
Date: Wed, 14 Apr 2021 23:50:45 +0200
From: Stefan Haller <stefan.haller@stha.de>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: FreeBSD if_wg POINTTOPOINT and MULTICAST behaviour
Message-ID: <87371254-15f1-494b-8740-38071d7f7d68@stha.de>
References: <9afe6dc9-5c53-4c25-b09f-5b4cf6ff8046@stha.de>
 <CAHmME9rAzGauYJuq4Qpn561f1YrYTaSN1mj2HB2Kdhgd2QJs9A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHmME9rAzGauYJuq4Qpn561f1YrYTaSN1mj2HB2Kdhgd2QJs9A@mail.gmail.com>
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

Hi Jason,

Thanks for your clarification. I understand that setting this flag would
be a false promise to userspace, because generally Wireguard is
point-to-multipoint and doesn't copy messages to multiple peers (which
is not exactly necessary in my case, where only a single peer is
configured on both sides).

I just wanted to ensure that the introduced change was intentional
before looking into other directions, hence my question.

On Wed, Apr 14, 2021 at 02:24:20PM -0600, Jason A. Donenfeld wrote:
> Does bird completely ignore interfaces without it? Is there no setting
> to change that?

At least a brief look at the code suggests this: [1]

The Babel protocol seems to rely on well-known *link-local* IPv6
multicast addresses. I did not find anything related to unicast "hello"
messages in the RFC or in the implementations. (OSPF is similar, but
as far as I remember unicast hellos are explicitly allowed.)

One odd thing I noticed: On Linux (5.11.13-arch1-1, so quite recent),
the interface does not list the MULTICAST flag and the interface is
still used by bird:

# ip l show dev wg1
4: wg1: <POINTOPOINT,NOARP,UP,LOWER_UP> mtu 1400 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000

I will have a closer look why it doesn't work on FreeBSD but the same thing
works on Linux. I am probably missing something important.


Kind regards,
Stefan


[1]: https://gitlab.nic.cz/labs/bird/-/blob/9c41e1ca3e93d4498eaa085139caf1545e08c1d8/proto/babel/babel.c#L1662
