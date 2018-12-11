Return-Path: <SRS0=sRyP=OU=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69B6FC5CFFE
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 11 Dec 2018 15:29:45 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBA4020849
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 11 Dec 2018 15:29:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="DdtMYbkm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBA4020849
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 52f3af68;
	Tue, 11 Dec 2018 15:20:54 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b34cebd6
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Dec 2018 15:20:53 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6856c009
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Dec 2018 15:20:53 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2d7aa451;
 Tue, 11 Dec 2018 15:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=subject:to
 :references:cc:from:message-id:date:mime-version:in-reply-to
 :content-type:content-transfer-encoding; s=mail; bh=3TFpE1U3mK6N
 TXzRZYsqMHavh68=; b=DdtMYbkmqzysHselF1ZPDQyqtrF1xUydMn/31+bXAb65
 JtsWBfBDeOVuNXLS1EdvhvVlKW6hcmWFvmf4vvsxNy1GsMZdtv9/21o1yI52PlG8
 SWHI7PWeTFIChexaAsE90muGtQyBRRabMvpvwuSOLLTruPC2II1EO/JYfjH/flUC
 SiZhyvo24DcPVyC4q8RN1BtxEGTgqIdVLCXyh+KjnmgGVxBS9DzRdRpjA4/gFfwV
 ebUoR9/Oj/J10K/OhclstzJ8hg+wx4TVU+s+hfM0XvuO7a+/58b6xUu4PYNq41hy
 DbSb+tsf9r1DemadF13z/2fQaa8Dl8arfy/33TcqUg==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a59a71ca
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO); 
 Tue, 11 Dec 2018 15:20:52 +0000 (UTC)
Subject: Re: OpenBSD kernel implementation
To: Matt <ncon@mail.noconroy.net>
References: <20181211132437.cooi2kwvx2j3llem@vertex.local>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Message-ID: <d9c01aa2-9dab-44b0-d743-a93ff7936e38@zx2c4.com>
Date: Tue, 11 Dec 2018 16:29:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <20181211132437.cooi2kwvx2j3llem@vertex.local>
Content-Language: en-US
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

Hi Matt,

Exciting to see you working on this. However, I'm afraid the
implementation you describe sounds deeply flawed and kind of misses
the point of WireGuard.

On Tue, Dec 11, 2018 at 2:24 PM Matt wrote:
 > Currently, I want to take all the code that doesn't need to be in the
 > kernel and move it to userspace, which is essentially the handshake
 > code, timeout timers and state machine functions. What is left is
 > essentially the transport function (IPSEC transform equivalent),
 > peforming simple crypto on incoming/outgoing packets. This design is
 > somewhat similar to how IPSEC is currently implemented in OpenBSD. I
 > believe this is a reasonable approach, but welcome comments on things I
 > may not have considered.

Do not do this. This is entirely unacceptable and wholly contrary to
the design approach of WireGuard. The transport layer and handshake
layer exist on the same state machine, and I designed the handshake
specifically to be extremely simple and implementable in kernel space.
I'm happy to help you clean up your current approach -- which seems
nicer and closer to the goal -- but your proposed separated approach
is really deeply flawed, and overly complex. Do not make this mistake.

Rather, let's clean up your current WIP together. If you're on IRC,
I'm happy to discuss with you there (I'm zx2c4 on Freenode) and we can
get this into shape.

Regards,
Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
