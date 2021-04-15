Return-Path: <SRS0=S5mX=JM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B86BC433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 15 Apr 2021 09:42:36 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F5E2611AB
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 15 Apr 2021 09:42:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F5E2611AB
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=toke.dk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7df4275a;
	Thu, 15 Apr 2021 09:42:33 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [45.145.95.4])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ea58f3e3
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 15 Apr 2021 09:42:32 +0000 (UTC)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
 t=1618479750; bh=DtDDzswxHlTHJbmO2XOfLMY3wnKHrbTvlzDsvN/omx0=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=onDvOJzhIZkXcB55YAZMNdq8ai9ypW6FzkLTHdLytJIDOlzNq4WsZJI/tToWNEAx5
 FuFs/3L7mQfozBg/jC4V2ZuVsj55kAwaayGLGUK5OVgJvOF5evStHSMxBHPFJVqAgr
 1nCuiE7qivBbi27TceYBFW+wmydi3jBdcI0OEnJ7fcVPNquRHEyOXUdqrJgCvpAgDe
 68vYabkj7eLqF6NXXq00RnxsktvWsDAs6CcFqRWWsMBq7YqRxelsqy7d7xCNQDy5I0
 7ZBoTu7LMtdHKC2IIC9/TXeNF2aiCAPOguYbPhg3VblJmG3NVExDYleck39AifE/s5
 StUwO9TbZzpzw==
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Stefan Haller <stefan.haller@stha.de>, WireGuard mailing list
 <wireguard@lists.zx2c4.com>
Subject: Re: FreeBSD if_wg POINTTOPOINT and MULTICAST behaviour
In-Reply-To: <CAHmME9p29dAjepPMJbESJm8ZCxS55rz6xCB1fG+YtmfULtm3cA@mail.gmail.com>
References: <9afe6dc9-5c53-4c25-b09f-5b4cf6ff8046@stha.de>
 <CAHmME9rAzGauYJuq4Qpn561f1YrYTaSN1mj2HB2Kdhgd2QJs9A@mail.gmail.com>
 <87371254-15f1-494b-8740-38071d7f7d68@stha.de> <874kg8ldjn.fsf@toke.dk>
 <CAHmME9p29dAjepPMJbESJm8ZCxS55rz6xCB1fG+YtmfULtm3cA@mail.gmail.com>
Date: Thu, 15 Apr 2021 11:42:27 +0200
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <87im4nkhoc.fsf@toke.dk>
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

"Jason A. Donenfeld" <Jason@zx2c4.com> writes:

> Hey Toke,
>
> Regarding POINTTOPOINT flag in Linux vs FreeBSD -- apparently FreeBSD
> routes everything differently simply by virtue of the interface having
> that flag, whereas on Linux, PTP routing mode is only switched on if
> you actually add an address with a dest peer. So for FreeBSD, the
> different routing seemed somewhat disruptive, so I stopped setting
> that flag in a recent snapshot release.

Ah, of course that would be different...

> Hey Stefan,
>
> Looking at bird's source code (iface.c), it looks like bird will only
> look at IFF flags if you fail to specify the interface type in the
> config file. Can you try *not changing to link1/ptp mode* and then
> setting the type flag in your bird config? Specifically:
>
>                 interface <interface pattern> [instance <num>] {
>                         ...
>                         type [broadcast|bcast|pointopoint|ptp|
>                                 nonbroadcast|nbma|pointomultipoint|ptmp];

This is from the OSPF protocol code, though, so it won't work for
Babel.

-Toke
