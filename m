Return-Path: <SRS0=di/l=VB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=3.0 tests=DKIM_ADSP_ALL,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A5A5C0651F
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  4 Jul 2019 16:17:11 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 830D22189E
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  4 Jul 2019 16:17:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=toke.dk header.i=@toke.dk header.b="OvYWgrS/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 830D22189E
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=toke.dk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7d2f56c3;
	Thu, 4 Jul 2019 16:17:09 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d9a0f0b8
 for <wireguard@lists.zx2c4.com>; Thu, 4 Jul 2019 16:17:08 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [IPv6:2a00:7660:6da:2001::664])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 98e1f454
 for <wireguard@lists.zx2c4.com>; Thu, 4 Jul 2019 16:17:07 +0000 (UTC)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
 t=1562257025; bh=kzNeyK2tA2BOig2xExsUCCjZPtMn3kQReNj2nikOioM=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=OvYWgrS/AyxRufdAnA0WPEXc0BMoxF+0MlkjxKuxZLvUvBxxBqBNjEcThS5H36ZQQ
 xGNBjY7uwsIg2oa5iuaLQp/DdAbC+rB4Xir4JXV8d1Ro5WqaInjU1BKQAoV3FMcQnQ
 XySZ5UmjxsJI6lBQbt32gwZbkHDahvMLGjjoD48IkrJwEWTwZEcRj98HtN6DKXnZVA
 SUy+l2gIy+LZdWMEzQYasoK260YF8D9t23wU7YZWR+zT5du78FoJiQ4xVOsvGthU66
 AWDvyXV904mOlExRFcbJz5lo4auyvUr6KERyOO2kRv6PHTdVPY8mdIppVrVfpKRBn9
 PeZexnRb9fRcA==
To: Jaron Kent-Dobias <jaron-wg@kent-dobias.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [ANNOUNCE] WireGuard Snapshot `0.0.20190702` Available
In-Reply-To: <c1c677f2-4588-49c9-1837-80b0e9df5f9b@kent-dobias.com>
References: <59eba07cc65097ac@frisell.zx2c4.com>
 <a54fa617-96a4-8b3b-2c34-3046c61c82a9@kent-dobias.com>
 <8d85242a-3162-7ddb-c1b5-14fb7884cf5f@kent-dobias.com>
 <CAHmME9rkfa6-BDK_QM537+vD0rdw3djF9qc0toeSZY0wjMmb4A@mail.gmail.com>
 <c1c677f2-4588-49c9-1837-80b0e9df5f9b@kent-dobias.com>
Date: Thu, 04 Jul 2019 18:17:04 +0200
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <87tvc122rj.fsf@toke.dk>
MIME-Version: 1.0
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

Jaron Kent-Dobias <jaron-wg@kent-dobias.com> writes:

> On 7/4/19 5:45 AM, Jason A. Donenfeld wrote:
>> Try running `rm net/wireguard/.check` and trying again.
>> 
>> https://git.zx2c4.com/WireGuard/commit/?id=c31f8664cff475b8f4160506e582fc423c71f381
>> 
>> Something something cthulhu something.
>
> It worked! Interesting use of an inline Euclid's algorithm.

Wow, yeah. I'm impressed and horrified; cthulhu fhtagn indeed!

-Toke
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
