Return-Path: <SRS0=7A+2=6T=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45B7AC3A5A9
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  5 May 2020 00:05:30 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91B37206CC
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  5 May 2020 00:05:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="ev+2TPQH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91B37206CC
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6b0316f8;
	Mon, 4 May 2020 23:53:00 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3fa4f04a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 4 May 2020 23:52:57 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 732601dd;
 Mon, 4 May 2020 23:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=subject:to
 :references:cc:from:message-id:date:mime-version:in-reply-to
 :content-type:content-transfer-encoding; s=mail; bh=8MVGLU5Isdkq
 z5X7vj30ybnUKaM=; b=ev+2TPQHiaEtdyVSorwi+vslf6MwcZC6jX6iw0l3F0kU
 6PfYwlT2NntrLCU7BA9EMQtL96oIUhl93TkkUHtDMXYdpsFutRtGjm1Kem70tqTQ
 D5cbTxCo6aA1/reOKKkyxHCJRmzRcV1565ZES0w5gQhPLQaZG7QOIMk4b1RotgcQ
 NZz2tr21p+AkpUGOFNpRjEz7wp+S65FpsEWonbImoJPI0qoulnt4M9D2GHWY+tJs
 sl7tejqdrTGYfxeGJcSZEMOGgIAXdYx1zkBuJ05/mQugEnSOL1slcyZCLDCndJVT
 jsjky/YjPKp98t7oO67pzS8XmFS+LGYXXzk1i33ODA==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7e2af03d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Mon, 4 May 2020 23:52:57 +0000 (UTC)
Subject: Re: soft lockup - may be related to wireguard (backported)
To: Wang Jian <larkwang@gmail.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <CAF75rJBKTbaK6CEQcmto=YcgA5NGrG85jSvSrYZpQV-L1xFMww@mail.gmail.com>
Cc: sultan@kerneltoast.com
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Message-ID: <def8bc96-a1ae-ff12-cf5e-30edebe350a8@zx2c4.com>
Date: Mon, 4 May 2020 18:05:24 -0600
MIME-Version: 1.0
In-Reply-To: <CAF75rJBKTbaK6CEQcmto=YcgA5NGrG85jSvSrYZpQV-L1xFMww@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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

Sultan had a nice stroke of insight. Let's see if this fixes the issue:
https://git.zx2c4.com/wireguard-linux/commit/?h=stable&id=e21300c15cd8365017be856f944efa4db7b1cb95
