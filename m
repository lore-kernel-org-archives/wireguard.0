Return-Path: <SRS0=2DBL=OO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5337EC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Sep 2021 08:48:11 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E80C61211
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Sep 2021 08:48:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6E80C61211
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=distanz.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 26fb21e3;
	Fri, 24 Sep 2021 08:45:27 +0000 (UTC)
Received: from sym2.noone.org (sym2.noone.org [178.63.92.236])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id fd54d964
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Sep 2021 08:45:25 +0000 (UTC)
Received: by sym2.noone.org (Postfix, from userid 1002)
 id 4HG5Fx15Vfzvjfm; Fri, 24 Sep 2021 10:45:25 +0200 (CEST)
Date: Fri, 24 Sep 2021 10:45:24 +0200
From: Tobias Klauser <tklauser@distanz.ch>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [PATCH wireguard-go] tun: avoid leaking sock fd in CreateTUN
 error cases
Message-ID: <20210924084524.iwgnjuxhfxidwhnc@distanz.ch>
References: <20210923100513.1452-1-tklauser@distanz.ch>
 <CAHmME9rzGKO51oh5UBvPV+qn7J8yAXbQHsWXh-k+r1BkCHfVTw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHmME9rzGKO51oh5UBvPV+qn7J8yAXbQHsWXh-k+r1BkCHfVTw@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
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

On 2021-09-23 at 17:54:20 +0200, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> Applied, thanks! I'm curious: is this a bug you ran into somewhere?

I've not seen this causing problems with wireguard-go specifically, but
have seen issues with leaked fds elsewhere. So by now I'm attentive of
the pattern and send fixes where I notice it :)
