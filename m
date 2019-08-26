Return-Path: <SRS0=Q0ZK=WW=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DEC1C3A59E
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 26 Aug 2019 09:37:24 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D992D206BA
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 26 Aug 2019 09:37:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D992D206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=spam-fetish.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3459e20d;
	Mon, 26 Aug 2019 09:37:11 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4c7f1fc7
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Aug 2019 09:37:09 +0000 (UTC)
Received: from mailout-02.maxonline.de (mailout-02.maxonline.de [81.24.66.23])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id db43e14c
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Aug 2019 09:37:09 +0000 (UTC)
Received: from web03-01.max-it.de (web03-01.max-it.de [81.24.64.215])
 by mailout-02.maxonline.de (Postfix) with ESMTPS id B60934D3;
 Mon, 26 Aug 2019 11:37:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by web03-01.max-it.de (Postfix) with ESMTP id B240828B8B9;
 Mon, 26 Aug 2019 11:37:06 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at web03-01.max-it.de
Received: from web03-01.max-it.de ([127.0.0.1])
 by localhost (web03-01.max-it.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 3ry2gWCtiya0; Mon, 26 Aug 2019 11:36:34 +0200 (CEST)
Received: from [81.24.66.132] (unknown [81.24.66.132])
 (Authenticated sender: m.muenz@spam-fetish.org)
 by web03-01.max-it.de (Postfix) with ESMTPA id 5A06D28B847;
 Mon, 26 Aug 2019 11:36:34 +0200 (CEST)
Subject: Re: [ANNOUNCE] OPNsense 19.7 supports WireGuard
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <b660d135-4450-66d3-0254-a893f46ba9f7@spam-fetish.org>
 <CAHmME9qPAOLxz3CyHxq9tubzgzvksGS5iz55yL=eB2wFa23fXg@mail.gmail.com>
From: "Muenz, Michael" <m.muenz@spam-fetish.org>
Message-ID: <2c6c29af-a852-96da-351f-7dc34b4dab58@spam-fetish.org>
Date: Mon, 26 Aug 2019 11:37:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAHmME9qPAOLxz3CyHxq9tubzgzvksGS5iz55yL=eB2wFa23fXg@mail.gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Am 25.08.2019 um 17:45 schrieb Jason A. Donenfeld:
> Congratulations on the release. That's great news.
>
> Would you like me to add some blurb to https://www.wireguard.com/install/ on it?
>
Hi,

If you like you can add some lines like "Install via 
"System->Firmware->Plugins->WireGuard" and follow the documenatation 
here https://docs.opnsense.org/manual/how-tos/wireguard-s2s.html

Best,

Michael


_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
