Return-Path: <SRS0=gQ6O=UF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 366DCC04AB5
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Jun 2019 09:35:41 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 265C520684
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Jun 2019 09:35:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=airmail.cc header.i=@airmail.cc header.b="EWF5GWvd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 265C520684
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=airmail.cc
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cc58f594;
	Thu, 6 Jun 2019 09:35:39 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ed4881cd
 for <wireguard@lists.zx2c4.com>; Sun, 2 Jun 2019 06:32:54 +0000 (UTC)
Received: from cock.li (mx1.cock.li [185.10.68.5])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6303e4f8
 for <wireguard@lists.zx2c4.com>; Sun, 2 Jun 2019 06:32:54 +0000 (UTC)
Message-ID: <49c02779bfc7c9109e6083d24b88244bb3411ef1.camel@airmail.cc>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=airmail.cc; s=mail;
 t=1559457173; bh=/MBb7LyPuJnWCK1QUHJYrOMQoDaOZekhPFvWG5mZqCk=;
 h=Subject:From:To:Date:In-Reply-To:References:From;
 b=EWF5GWvdRk5oM42m75DMkvHTjYZ4Gjdj92/tyi/uo2Hklv6r/diSapC8Kn16zgKKg
 TA0RhlH8glvQ2UtO76iJWPWpoUijEY8Dh3CbJJxWyJCFkRt8xJ+RxMLzljwaPKQIdP
 y/oAQ9xGbLkj3A0faFuGT2HM/XwCn6ABGTyKICjzAGcXLDm3IYzkmwNd7nnhaPrFHH
 spZxq+86xoM0AG1HDSv8YENQEG/UfASoDqG8lgHKX/u3S2LEUQBYs8DVMu6lhgmfDV
 R5U+OsPPXfYWeGokFGCYWIhgQT7M9yznNU9tIoV1ju/ybU3HMmXabbNIFz5WrNjPtT
 g1/e+FFt5UOAw==
Subject: Re: wg-quick up automation fails
From: XRP <xrp@airmail.cc>
To: Silvan Nagl <mail@53c70r.de>, WireGuard mailing list
 <wireguard@lists.zx2c4.com>
Date: Sun, 02 Jun 2019 08:32:52 +0200
In-Reply-To: <b46b6815-347b-1410-51df-db52c7386313@53c70r.de>
References: <b46b6815-347b-1410-51df-db52c7386313@53c70r.de>
User-Agent: Evolution 3.32.2 
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 06 Jun 2019 11:35:38 +0200
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

On Sun, 2019-06-02 at 01:49 +0200, Silvan Nagl wrote:
> G'day,
> 
> i recently upgrade WireGuard to the latest shipped Debian version
> (0.0.20190406-1) and noticed my wg-quick created interface did not
> come
> up as usual anymore. (Also tried the git master branch) I tried to
> single command trough wg-quick's automation to reproduce the error;
> 
> automatic:
> 
> [#] ip link add Y type wireguard
> [#] wg setconf Y /dev/fd/63
> [#] ip address add X.X.X.X/32 dev Y
> [#] ip address add fc00::XXXX/128 dev Y
> [#] ip link set mtu XXXX up dev Y
> [#] resolvconf -a tun.Y -m 0 -x
> [#] wg set Y fwmark 51820
> [#] ip -6 route add ::/0 dev Y table 51820
> RTNETLINK answers: No such device
> [#] resolvconf -d tun.Y
> [#] ip link delete dev Y
> 
> manual:
> 
> > ip link add Y type wireguard
> > wg setconf Y <(wg-quick strip /etc/wireguard/Y.conf)
> > ip address add X.X.X.X/32 dev Y
> > ip address add fc00::XXXX/128 dev Y
> > ip link set mtu 1268 up dev Y
> > resolvconf -a tun.X -m 0 -x
> > wg set Y fwmark 51820
> > ip -6 route add ::/0 dev Y table 51820
> 
> < RTNETLINK answers: No such device
> 
> (MTU may be to low here so i set it higher again)
> 
> > ip link set mtu 1420 up dev Y
> > ip -6 route add ::/0 dev Y table 51820 (works now)
> 
> breaks up @ this point because of error handling...
> 
> Additionally it could be possible the MTU isn't set correctly.

I had a similar problem where I got a "RTNETLINK answers: No such
device" error. After that I tried to use the wg-quick version in the
master branch and that fixed my problem. I hope that helps.

(MTU for IPv6 must be 1280 bytes at least.)

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
