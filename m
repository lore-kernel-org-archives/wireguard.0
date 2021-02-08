Return-Path: <SRS0=YvsD=HK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3FC9C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  8 Feb 2021 11:36:44 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B72F64E30
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  8 Feb 2021 11:36:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B72F64E30
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=essd.nl
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e2ac5a0f;
	Mon, 8 Feb 2021 11:36:40 +0000 (UTC)
Received: from pmg01-out1.zxcs.nl (pmg01-out1.zxcs.nl [2a06:2ec0:1::ffeb])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id af513cdd
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 8 Feb 2021 11:36:38 +0000 (UTC)
Received: from pmg01.zxcs.nl (localhost.localdomain [127.0.0.1])
 by pmg01.zxcs.nl (ZXCS) with ESMTP id 095201045A2;
 Mon,  8 Feb 2021 12:36:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=essd.nl;
 s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JsH0A/T7EtKVT52Bb55A4wiKTYUBBhis1NNgFZDH+ks=; b=cidAWnSMChBXeAN6KRVCUWULGS
 Ebj3lrFVeHsEnQR8nWmTIKcIiAgKAck2UKVWJUGHnMZh4w/XxQGRIRZreffXiCtGxxjFDzSam1EJW
 bSiMLhZi7cweLVCTlfzqJ2hLqm9a+o0/t3mpi9QUm4Ngo7wk9BNKOlVfv57IKT9FKXCteu3TkgLch
 GnoH3xoz8x4QqVdwu2E7vF7XhXasRwO+8LWhLeLYPBZz3bS7OLbAvWJVaeJNCxCu5cJtcGgRkPXWO
 opy+Yat2UOcJlB3jC+GcfXPZ6Ln835lqyvpJ5KPnEiPvzOdfgHJBYD+Exz4TOu8MyTf9/svkKGqPi
 oY8dVrgQ==;
Subject: Re: "BUG: scheduling while atomic" on 5.4 kernels with PREEMPT_RT
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <90c10d21558d31825a56aac48692b080@essd.nl>
 <CAHmME9qmYATYk2oV0T3OmnE4J1uTy49p09gyuRHdrGNZHKsejg@mail.gmail.com>
 <9c5569cf88048c3ceb343340e68d7564@essd.nl>
 <CAHmME9pjcBFBQM67iTOjG+HLH8OnMUhxNOX2rne2umiNW9bHew@mail.gmail.com>
From: Erik Schuitema <erik@essd.nl>
Message-ID: <0d84e883-2aa5-df3c-95bd-24304223d07f@essd.nl>
Date: Mon, 8 Feb 2021 12:36:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAHmME9pjcBFBQM67iTOjG+HLH8OnMUhxNOX2rne2umiNW9bHew@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: nl
X-AuthUser: erik@essd.nl
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

Hi Jason,

(Sorry for the delay in my reply..)

On 19/12/2020 19:16, Jason A. Donenfeld wrote:
 > So far as I can tell, upstream is fine with this. I'd encourage you to
 > move to the newer LTS, 5.10. The compat stuff has always been pretty
 > meh. It was an important step in getting WireGuard bootstrapped, of
 > course, but just look at this horror:
 >
 > https://git.zx2c4.com/wireguard-linux-compat/tree/src/compat/compat.h

I don't have doubts about the upstream code, I was merely wondering 
whether the performance hit from disabling SIMD is still present in 
newer kernels (it wasn't immediately obvious to me while browsing the 
5.10 source).

 > I'll keep it working as people need, but folks should really really
 > move to the new LTS, now that it's out.

These efforts are highly appreciated! It's not trivial for me to switch 
to a new kernel (needs extensive product testing), so I'm happy with the 
5.4 patch. But I'll be sure to skip right to 5.10 when moving to a new 
kernel.

Best regards,
Erik


