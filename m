Return-Path: <SRS0=Q0ZK=WW=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01A5AC3A59F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 26 Aug 2019 14:24:02 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C0A2217F5
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 26 Aug 2019 14:24:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C0A2217F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=spam-fetish.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1b34dc97;
	Mon, 26 Aug 2019 14:23:59 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 466f558c
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Aug 2019 14:23:55 +0000 (UTC)
Received: from mailout-02.maxonline.de (mailout-02.maxonline.de [81.24.66.23])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ed8e169a
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Aug 2019 14:23:54 +0000 (UTC)
Received: from web03-01.max-it.de (web03-01.max-it.de [81.24.64.215])
 by mailout-02.maxonline.de (Postfix) with ESMTPS id 505474D3
 for <wireguard@lists.zx2c4.com>; Mon, 26 Aug 2019 16:23:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by web03-01.max-it.de (Postfix) with ESMTP id 48AB128B8B9
 for <wireguard@lists.zx2c4.com>; Mon, 26 Aug 2019 16:23:52 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at web03-01.max-it.de
Received: from web03-01.max-it.de ([127.0.0.1])
 by localhost (web03-01.max-it.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 2pxJR4AAAaxI for <wireguard@lists.zx2c4.com>;
 Mon, 26 Aug 2019 16:23:51 +0200 (CEST)
Received: from [81.24.66.132] (unknown [81.24.66.132])
 (Authenticated sender: m.muenz@spam-fetish.org)
 by web03-01.max-it.de (Postfix) with ESMTPA id D837828B847
 for <wireguard@lists.zx2c4.com>; Mon, 26 Aug 2019 16:23:51 +0200 (CEST)
Subject: Re: [ANNOUNCE] OPNsense 19.7 supports WireGuard
To: wireguard@lists.zx2c4.com
References: <mailman.1.1566813601.6235.wireguard@lists.zx2c4.com>
 <C86A2825-D825-4E9E-A7D4-9F518A61CEA3@intnet.mu>
From: "Muenz, Michael" <m.muenz@spam-fetish.org>
Message-ID: <fca2eded-b498-98b0-d5b8-a6dd43970ad6@spam-fetish.org>
Date: Mon, 26 Aug 2019 16:25:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <C86A2825-D825-4E9E-A7D4-9F518A61CEA3@intnet.mu>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Am 26.08.2019 um 13:44 schrieb Vincent:
> Wireguard not listed in OPNsense 19.7 plugins
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>
I have one user report where it wasn't listed in the plugins menu.

Seems user switched multiple times from production to development mode.


You can as always install via CLI:

# pkg install os-wireguard


Best,

Michael


_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
