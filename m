Return-Path: <SRS0=q7qE=4U=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32B1BC3F2D1
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  3 Mar 2020 23:18:19 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6ED820870
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  3 Mar 2020 23:18:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6ED820870
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=matrix-dream.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b75666a4;
	Tue, 3 Mar 2020 23:08:58 +0000 (UTC)
Received: from mail1.matrix-dream.net (mail1.matrix-dream.net [2a0a:51c0::71])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c1055a28
 for <wireguard@lists.zx2c4.com>; Mon, 2 Mar 2020 18:48:34 +0000 (UTC)
Received: from ivan by mail1.matrix-dream.net with local (Exim 4.92.2)
 (envelope-from <labawi-wg@matrix-dream.net>)
 id 1j8qAs-0000CA-UU; Mon, 02 Mar 2020 18:52:18 +0000
Date: Mon, 2 Mar 2020 18:52:18 +0000
From: Ivan =?iso-8859-1?Q?Lab=E1th?= <labawi-wg@matrix-dream.net>
To: tubi webmail <tubi.webmail@gmail.com>
Subject: Re: Translation of sender IP address
Message-ID: <20200302185218.GA609@matrix-dream.net>
References: <CABFD=YMqMZPx1LG9e3C03u0eAnUfx2d2KvvQAcsJXaBSd0UqkA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABFD=YMqMZPx1LG9e3C03u0eAnUfx2d2KvvQAcsJXaBSd0UqkA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Wed, 04 Mar 2020 00:08:57 +0100
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On Wed, Feb 26, 2020 at 05:05:26PM +0100, tubi webmail wrote:
> So NO rules regarding masquerading seems to be in use.

I would suggest you check your iptables nat table
# iptables --list -vn -t nat
alternatively check the output of
# iptables-save

Also, these days you might be using nftables:

# nft list ruleset   # probably, I don't use nftables

Regards,
Ivan
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
