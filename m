Return-Path: <SRS0=z0pY=WI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8D3AC433FF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 12 Aug 2019 19:01:38 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B66E20679
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 12 Aug 2019 19:01:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=czerwinskis.de header.i=@czerwinskis.de header.b="lAI5+B+b";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=czerwinskis.de header.i=@czerwinskis.de header.b="lAI5+B+b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B66E20679
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=czerwinskis.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b47b2081;
	Mon, 12 Aug 2019 19:01:36 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 642f2e6d
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Aug 2019 19:01:34 +0000 (UTC)
Received: from magratgarlick.emantor.de (magratgarlick.emantor.de
 [IPv6:2a01:4f8:c17:c88::2])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 70292251
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Aug 2019 19:01:34 +0000 (UTC)
Received: by magratgarlick.emantor.de (Postfix, from userid 114)
 id D62DCD1992; Mon, 12 Aug 2019 21:01:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=czerwinskis.de;
 s=mail; t=1565636492;
 bh=eiNS0MFRSexnVfpxZxHk6Kuz2OjL0YTcEk6nINRKPsE=;
 h=References:From:To:Subject:In-reply-to:Date:From;
 b=lAI5+B+bYUsxsCt4OSR54CIY9HK+8AHr/+pRov/mPtp7rxcU20x8e4777CdhKJ1e1
 zt3h9Mg2zWj940ton/lYuLcjwfnD3VXXCl7OWh9+U7aPclGBuXHbAbAygEjCWWkLKr
 XTBaIegK+H9kTU7rFkc4SowMIbT1rLUf8Vla5ieU=
Received: from localhost (p200300D21F09A602EABBB32684480F6D.dip0.t-ipconnect.de
 [IPv6:2003:d2:1f09:a602:eabb:b326:8448:f6d])
 by magratgarlick.emantor.de (Postfix) with ESMTPSA id 3B171D1990
 for <wireguard@lists.zx2c4.com>; Mon, 12 Aug 2019 21:01:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=czerwinskis.de;
 s=mail; t=1565636492;
 bh=eiNS0MFRSexnVfpxZxHk6Kuz2OjL0YTcEk6nINRKPsE=;
 h=References:From:To:Subject:In-reply-to:Date:From;
 b=lAI5+B+bYUsxsCt4OSR54CIY9HK+8AHr/+pRov/mPtp7rxcU20x8e4777CdhKJ1e1
 zt3h9Mg2zWj940ton/lYuLcjwfnD3VXXCl7OWh9+U7aPclGBuXHbAbAygEjCWWkLKr
 XTBaIegK+H9kTU7rFkc4SowMIbT1rLUf8Vla5ieU=
References: <37fac6bc-b751-02b3-06f5-61b4823b2a17@powerneth.ro>
User-agent: mu4e 1.3.4; emacs 26.2
From: Rouven Czerwinski <rouven@czerwinskis.de>
To: wireguard@lists.zx2c4.com
Subject: Re: IS-IS routing protocol
In-reply-to: <37fac6bc-b751-02b3-06f5-61b4823b2a17@powerneth.ro>
Date: Mon, 12 Aug 2019 21:01:31 +0200
Message-ID: <87mugep5ro.fsf@czerwinskis.de>
MIME-Version: 1.0
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

Hi,

Lucian Cristian <luci@powerneth.ro> writes:

> Has anyone managed to configure IS-IS routing with wireguard interfaces ?
>
> I've added multicast address to AllowedIPs (AllowedIPs=224.0.0.0/24) but
> when I activate ip router isis on the wireguard interface, tcpdump only
> shows: unknown ip 8
>
> expecting to see something like L1 Lan IIH, hlen: 27, v: 1, pdu-v: 1,
> sys-id-len: 6 (0), max-area: 3 (0)
>
> or
>
> L2 Lan IIH, hlen: 27, v: 1, pdu-v: 1, sys-id-len: 6 (0), max-area: 3 (0)

IS-IS uses layer 2 while wireguard only provides layer 3 connectivity.
IS-IS will not work over wireguard.

Regards,
Emantor
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
