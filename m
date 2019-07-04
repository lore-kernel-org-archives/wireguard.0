Return-Path: <SRS0=di/l=VB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 918F1C0651F
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  4 Jul 2019 16:12:04 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27EB32083B
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  4 Jul 2019 16:12:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kent-dobias.com header.i=@kent-dobias.com header.b="mFbLLk7n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27EB32083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kent-dobias.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 12455d48;
	Thu, 4 Jul 2019 16:11:36 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 725119af
 for <wireguard@lists.zx2c4.com>; Thu, 4 Jul 2019 16:11:34 +0000 (UTC)
Received: from mail.kent-dobias.com (mail.kent-dobias.com [5.2.75.74])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3f4c6439
 for <wireguard@lists.zx2c4.com>; Thu, 4 Jul 2019 16:11:34 +0000 (UTC)
Received: from [192.168.1.2] (unknown [10.9.0.3])
 by mail.kent-dobias.com (Postfix) with ESMTPSA id C062A9D44;
 Thu,  4 Jul 2019 12:11:32 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=kent-dobias.com;
 s=dkim; t=1562256693;
 bh=O4yfMVlz2mR4bqi1w3OId/X8c4OiYG5noRQxGudERTs=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To;
 b=mFbLLk7nY+6+WN1HqX95KThBesb+JB8SDrnmdLHs6ZitTmPT8fea9L0JQ7AQ/QHkS
 EJxfd57wMcBAWY5xt9T+BJRsKnGUluY6gBWbaevNuInBtwaOCAmwi/V0s4yHdmj17E
 KPBA8azuuc6RpFSP1zWCtL6pwxNSEOWLT7x8C/Zg=
Subject: Re: [ANNOUNCE] WireGuard Snapshot `0.0.20190702` Available
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <59eba07cc65097ac@frisell.zx2c4.com>
 <a54fa617-96a4-8b3b-2c34-3046c61c82a9@kent-dobias.com>
 <8d85242a-3162-7ddb-c1b5-14fb7884cf5f@kent-dobias.com>
 <CAHmME9rkfa6-BDK_QM537+vD0rdw3djF9qc0toeSZY0wjMmb4A@mail.gmail.com>
From: Jaron Kent-Dobias <jaron-wg@kent-dobias.com>
Openpgp: preference=signencrypt
Message-ID: <c1c677f2-4588-49c9-1837-80b0e9df5f9b@kent-dobias.com>
Date: Thu, 4 Jul 2019 12:11:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CAHmME9rkfa6-BDK_QM537+vD0rdw3djF9qc0toeSZY0wjMmb4A@mail.gmail.com>
Content-Language: en-US
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On 7/4/19 5:45 AM, Jason A. Donenfeld wrote:
> Try running `rm net/wireguard/.check` and trying again.
> 
> https://git.zx2c4.com/WireGuard/commit/?id=c31f8664cff475b8f4160506e582fc423c71f381
> 
> Something something cthulhu something.

It worked! Interesting use of an inline Euclid's algorithm.

Jaron
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
