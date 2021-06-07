Return-Path: <SRS0=3dEh=LB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8CBCC47082
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  7 Jun 2021 12:00:16 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE78B611AD
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  7 Jun 2021 12:00:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE78B611AD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=employees.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b6dba530;
	Mon, 7 Jun 2021 11:58:33 +0000 (UTC)
Received: from clarinet.employees.org (clarinet.employees.org [198.137.202.74])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c89cd5ea
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 7 Jun 2021 11:58:31 +0000 (UTC)
Received: by clarinet.employees.org (Postfix, from userid 1736)
 id EB4614E11CA8; Mon,  7 Jun 2021 11:58:29 +0000 (UTC)
Date: Mon, 7 Jun 2021 12:58:29 +0100
From: Derek Fawcus <dfawcus+lists-wireguard@employees.org>
To: Peter Linder <peter@fiberdirekt.se>
Cc: wireguard@lists.zx2c4.com
Subject: Re: potentially disallowing IP fragmentation on wg packets, and
 handling routing loops better
Message-ID: <YL4J5cFpPx1UTJbr@clarinet.employees.org>
References: <CAHmME9rNnBiNvBstb7MPwK-7AmAN0sOfnhdR=eeLrowWcKxaaQ@mail.gmail.com>
 <e86a2a76-1ff2-2272-f67b-555f36d8b444@fiberdirekt.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e86a2a76-1ff2-2272-f67b-555f36d8b444@fiberdirekt.se>
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

On Sun, Jun 06, 2021 at 01:14:16PM +0200, Peter Linder wrote:
> This would break things for me. We're doing a lot of L2 over L3 site to 
> site stuff and we are using wireguard as the outer layer. Inner layer is 
> vxlan or l2tpv3.
>
> In particular, people connect lots of stuff with no regard for MTU. For 
> some things it's also very hard to change so we just assume people 
> don't. Since the L3 network typically has the same MTU as the inner L2 
> network, we need fragmentation. There is no practical way to be able to 
> tell hosts on the L2 network about the limited mtu, for all we know they 
> don't even run IP....

I've not looked in to vxlan much, but for L2TP you always have recourse
to RFC 4623, where the MRU & MRRU can be exchanged.

DF
