Return-Path: <SRS0=MYpk=IB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 416CCC433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  3 Mar 2021 08:15:55 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C8A664EAE
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  3 Mar 2021 08:15:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C8A664EAE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chocolatine.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e22a9d63;
	Wed, 3 Mar 2021 08:15:51 +0000 (UTC)
Received: from mx.chocolatine.org (mx.chocolatine.org [137.220.37.30])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3f69716f
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 2 Mar 2021 17:10:23 +0000 (UTC)
Received: (qmail 86453 invoked by uid 1001); 2 Mar 2021 17:10:21 -0000
Date: Tue, 2 Mar 2021 17:10:21 +0000
From: Nicolai <nicolai-wireguard@chocolatine.org>
To: wireguard@lists.zx2c4.com
Subject: Re: best way for redundancy?
Message-ID: <20210302171021.GA65777@chocolatine.org>
References: <03ff01d70bbb$953d4750$bfb7d5f0$@lindenberg.one>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <03ff01d70bbb$953d4750$bfb7d5f0$@lindenberg.one>
X-Mailman-Approved-At: Wed, 03 Mar 2021 08:15:49 +0000
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

On Thu, Feb 25, 2021 at 10:17:06PM +0100, Joachim Lindenberg wrote:

> I do have a wireguard VPN that connects multiple sites. Unfortunately
> some routers are not available all the time, causing network disruption.
> I'd like to improve connectivity via redundancy, i.e. add multiple
> routers that connect the networks.

> What are the options to do that using wireguard? Can I have multiple
> peers with different keys and endpoint but same Allowed IPs? Will
> wireguard select the one available?

In the future I want a similar setup: multiple routers for each network
each seamlessly handling WireGuard when necessary.  I haven't put any
effort into this yet, but my general plan is to use CARP on OpenBSD,
with WireGuard sharing keys.  (I know you want distinct keys, so I
waited to respond until others had a chance.)  Anyway the routers in
City1 would share City1Keys, routers in City2 would share City2Keys,
etc.  When City1Router1 is unavailable, City1Router2 would grab the IP
address and be able to immediately speak WireGuard to the other
locations without anyone noticing.

https://www.openbsd.org/faq/pf/carp.html

Nicolai
