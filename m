Return-Path: <SRS0=kIRS=NV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26904C432BE
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Aug 2021 17:59:35 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C42060698
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Aug 2021 17:59:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5C42060698
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=romanrm.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 98041c28;
	Mon, 30 Aug 2021 17:59:32 +0000 (UTC)
Received: from rin.romanrm.net (rin.romanrm.net [2001:bc8:2dd2:1000::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 825597f3
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Aug 2021 17:59:29 +0000 (UTC)
Received: from natsu (natsu2.home.romanrm.net [IPv6:fd39::e99e:8f1b:cfc9:ccb8])
 by rin.romanrm.net (Postfix) with SMTP id 6B75B28F;
 Mon, 30 Aug 2021 17:59:28 +0000 (UTC)
Date: Mon, 30 Aug 2021 22:59:27 +0500
From: Roman Mamedov <rm@romanrm.net>
To: Daniel <tech@tootai.net>
Cc: wireguard@lists.zx2c4.com
Subject: Re: [Warning: DMARC Fail Email] Re: ipv6 connexion fail - ipv4 OK
Message-ID: <20210830225927.6df90edb@natsu>
In-Reply-To: <e949b3e2-eab7-fc4c-2b15-8820a2c17374@tootai.net>
References: <ec8fe61d-06a9-9544-ab2c-3dfc26905d74@tootai.net>
 <e4b50341-6f90-92fe-7728-a518768a1b51@tootai.net>
 <20210827211412.3ed5f170@natsu>
 <3ec547c6-c846-e5be-e276-ace7862f5cb7@tootai.net>
 <34d4341c-98be-b754-af8e-c7097bc21aac@pineview.net>
 <20210828024454.1766744f@natsu>
 <7437f3e0-26ba-5e33-a175-0cf233635b3f@tootai.net>
 <20210830214312.6a332333@natsu>
 <e620ed11-2664-fa06-1497-a0f18facac7e@tootai.net>
 <20210830223836.5384badd@natsu>
 <e949b3e2-eab7-fc4c-2b15-8820a2c17374@tootai.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon, 30 Aug 2021 19:44:21 +0200
Daniel <tech@tootai.net> wrote:

> > Do you get WG working at all, between some other two hosts (not involving this
> > particular server for now)?
> Yes. Clients are shown on both sides as connected, trafic seems to go 
> out on each side but other one as received near to nothing.

I mean not just "shown as connected", but have you got actual traffic working
between any two hosts. Even just forgetting this server for a while. So that
you can rule out some general issue and concentrate on just the particular
machine setup.

-- 
With respect,
Roman
