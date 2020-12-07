Return-Path: <SRS0=iyUg=FL=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 810ABC4361B
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  7 Dec 2020 23:52:12 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 811D323A21
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  7 Dec 2020 23:52:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 811D323A21
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yoshimi.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bd430d8c;
	Mon, 7 Dec 2020 23:44:27 +0000 (UTC)
Received: from mail-gateway-shared13.cyon.net (mail-gateway-shared13.cyon.net
 [194.126.200.66])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 02b6719b
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 7 Dec 2020 14:34:00 +0000 (UTC)
Received: from s026.cyon.net ([149.126.4.35])
 by mail-gateway-shared13.cyon.net with esmtpsa
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim)
 (envelope-from <lists@yoshimi.ch>) id 1kmHhI-0007Vu-BM
 for wireguard@lists.zx2c4.com; Mon, 07 Dec 2020 15:41:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=yoshimi.ch; 
 s=default;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version
 :Date:Message-ID:From:Subject:References:To:Sender:Reply-To:Cc:Content-ID:
 Content-Description; bh=meMSfgf5W9rtun/V3bXBLL8c2XXehGJ5twscu4TkfG8=; b=loj6b
 VYMVYjzUvAlGOZpL1lJKLIH0Js7KydlHd+tONnkllDbLH9dpAq7L7Y1W0RXbczwjS7H2xpeR1Anng
 KpJZgMyj+jxSyvvlCWq7BVSAiU0rgDxluyxMoTcr4vJDHlaa7qSP5WJpPnm7Lz2kRf2YzNsK6JWEe
 CmrRfWsHjjhd2gVFkP3nMBjfFSLjSz0hHx8W6jwbdYMCQ1LGLwNIvWbkNyrPCNJ0KqNp0EzwmOVe6
 q4KTCE/CZuWVa3MxjLvaDJXgJvqXJy4FpmO4F5dsHWMhCNsI8gkfQPl/uWdCzANDL9yI5Hp8VjPhK
 pnSfU526sQHwdyZ+GnzYA1MJGGMdw==;
Received: from [10.20.10.230] (port=53354 helo=mail.cyon.ch)
 by s026.cyon.net with esmtpa (Exim 4.93)
 (envelope-from <lists@yoshimi.ch>) id 1kmHhH-001yH0-6r
 for wireguard@lists.zx2c4.com; Mon, 07 Dec 2020 15:41:03 +0100
To: wireguard@lists.zx2c4.com
References: <d1e3a201-8fcd-3448-f958-5fd4518f0101@molgaard.org>
Subject: Re: MacOS DNS Search Domain
From: Yoshimi Takano <lists@yoshimi.ch>
Message-ID: <e32baf86-4ef1-eed9-4daa-575e3786f6f2@yoshimi.ch>
Date: Mon, 7 Dec 2020 15:41:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d1e3a201-8fcd-3448-f958-5fd4518f0101@molgaard.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - s026.cyon.net
X-AntiAbuse: Original Domain - lists.zx2c4.com
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - yoshimi.ch
X-Get-Message-Sender-Via: s026.cyon.net: authenticated_id: lists@yoshimi.ch
X-Authenticated-Sender: s026.cyon.net: lists@yoshimi.ch
X-OutGoing-Spam-Status: No, score=-1.1
X-Mailman-Approved-At: Tue, 08 Dec 2020 00:44:26 +0100
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

Hello

I just wanted to mention that I ran in to the same issue.

The MacOS client rejects DNS settings containing non-IP hostnames such as

DNS = 1.2.3.4, example.search.domain.com

with the error "Interface’s DNS servers must be a list of 
comma-separated IP addresses".

According to the wg-quick man page, non-IP hostnames (to be interpreted 
as search domains) are allowed for the DNS setting.

The Windows client accepts these fine.

Best regards
   Yoshimi
