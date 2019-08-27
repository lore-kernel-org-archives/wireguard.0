Return-Path: <SRS0=ZPcD=WX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83B1FC3A5A3
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 27 Aug 2019 05:14:10 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 253E0217F5
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 27 Aug 2019 05:14:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 253E0217F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=spam-fetish.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 21d9acb8;
	Tue, 27 Aug 2019 05:13:57 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c8dc80e4
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Aug 2019 05:13:55 +0000 (UTC)
Received: from mailout-02.maxonline.de (mailout-02.maxonline.de [81.24.66.23])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2f3e75fa
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Aug 2019 05:13:55 +0000 (UTC)
Received: from web03-01.max-it.de (web03-01.max-it.de [81.24.64.215])
 by mailout-02.maxonline.de (Postfix) with ESMTPS id CBCE44D4;
 Tue, 27 Aug 2019 07:13:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by web03-01.max-it.de (Postfix) with ESMTP id C8B3C28B84A;
 Tue, 27 Aug 2019 07:13:52 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at web03-01.max-it.de
Received: from web03-01.max-it.de ([127.0.0.1])
 by localhost (web03-01.max-it.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id m48S048PAr4H; Tue, 27 Aug 2019 07:13:52 +0200 (CEST)
Received: from [81.24.66.132] (unknown [81.24.66.132])
 (Authenticated sender: m.muenz@spam-fetish.org)
 by web03-01.max-it.de (Postfix) with ESMTPA id 9A12828B82E;
 Tue, 27 Aug 2019 07:13:52 +0200 (CEST)
Subject: Re: [ANNOUNCE] OPNsense 19.7 supports WireGuard
To: Vincent <mercier@intnet.mu>
References: <DDEE689A-E2B5-414A-8233-F08B06278F0B@intnet.mu>
From: "Muenz, Michael" <m.muenz@spam-fetish.org>
Message-ID: <8f65fe2a-d5ab-931c-75fa-850433a53bf1@spam-fetish.org>
Date: Tue, 27 Aug 2019 07:15:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <DDEE689A-E2B5-414A-8233-F08B06278F0B@intnet.mu>
Cc: wireguard@lists.zx2c4.com
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

Am 27.08.2019 um 06:28 schrieb Vincent:
> Is there any particular tweeks required to install the announed wireguard in opnsense?
> non listed under plugin and neither pkg install in opnsense 19.7.2
>
>
>
Ah, you are running 32bit version? WireGuard depends on Go which has 
some nasty compilation errors on FreeBSD/32bit, so it's only supported 
for 64bit installations.


Best,

Michael

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
