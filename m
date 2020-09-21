Return-Path: <SRS0=UBEJ=C6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FB53C43466
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 21 Sep 2020 09:57:48 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5EAA21BE5
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 21 Sep 2020 09:57:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=toke.dk header.i=@toke.dk header.b="xTR5dQ28"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B5EAA21BE5
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=toke.dk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8efc67e7;
	Mon, 21 Sep 2020 09:26:46 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [2a0c:4d80:42:2001::664])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8ae2a1f6
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 21 Sep 2020 09:26:44 +0000 (UTC)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
 t=1600682233; bh=AbsyTn5+Wb3qVqVBDpmtzfwmGKtaFk4V0jaUkwS76vo=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=xTR5dQ28zCKDOLGgkMvomiVmjSmmY0yTBOIeDYvaIQg0kmQMKPZ+Ph0V4Dga5tRQn
 +vqnMPJMfJVPJscJWINOjXksN/Lbwr8v5YSqEIye/YfQcC8eASwpV2rq5KfqrB9OVZ
 ysW/1651yyRxNKySXHnZJ6TZRlkQyEnfw+woTQU3te7BH2RAoUhpaZkLWW71cOogQ3
 p/lCo/ShblHHV9geIfIoNujhfS8S/OTJBVbVg7UBTtM6kvSmYvhWSdTc4BaaZ+8Y6m
 odhN3fPy1gZe1Yf9vJYxqQowgOckxJvbTZwuti9cGTBtKjAH0O46LMyv77eQcLBNwP
 CROZJoaKyYcCg==
To: Derrick Lyndon Pallas <derrick@pallas.us>, WireGuard mailing list
 <wireguard@lists.zx2c4.com>
Subject: Re: Interest in adding multicast support to Wireguard?
In-Reply-To: <9b4ba85a-633a-04ed-ca15-eb29d476cd57@pallas.us>
References: <9b4ba85a-633a-04ed-ca15-eb29d476cd57@pallas.us>
Date: Mon, 21 Sep 2020 11:57:12 +0200
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <878sd3qwp3.fsf@toke.dk>
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

Derrick Lyndon Pallas <derrick@pallas.us> writes:

> I know this has come up a few times before, but if there was resolution, 
> I couldn't find it.
>
> I am trying to set up a hub-and-spoke network with many clients 
> connected to a single concentrator. One application I need to support 
> relies on mDNS.

While I generally support adding multicast support to Wireguard, for
mDNS you may be able to solve your problem by using a 'hybrid proxy'
which makes it possible to do mDNS discovery over unicast DNS. See
https://tools.ietf.org/html/draft-ietf-dnssd-hybrid-10 for the standard,
and https://github.com/sbyx/ohybridproxy for an implementation. I'm
running the latter on my network, and while it does require a bit of
configuration, it works reasonably well for device discovery across
routed network segments... So depending on your setup it could likely be
made to work across wg links as well :)

-Toke
