Return-Path: <SRS0=OFCv=PC=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2813C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 Oct 2021 02:45:50 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F32B61130
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 Oct 2021 02:45:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5F32B61130
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=moenia.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 32830939;
	Thu, 14 Oct 2021 02:45:47 +0000 (UTC)
Received: from smtp.is-kassel.org (eremit.is-kassel.org [37.120.174.132])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e04ccda3
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Oct 2021 02:45:43 +0000 (UTC)
Received: from dynamic-077-001-193-244.77.1.pool.telefonica.de by
 smtp.is-kassel.org (SendMail 8.13.4/1.6.0) 
 with ESMTP  TLSv1/SSLv3 id 19E2r7tY031110 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Oct 2021 04:53:08 +0200
X-Authenticated: authenticated by smtp.is-kassel.org:
 jb@dynamic-077-001-193-244.77.1.pool.telefonica.de;
 Thu, 14 Oct 2021 04:53:08 +0200
To: wireguard@lists.zx2c4.com
From: uxDWzco-wg@moenia.de
Subject: linux: bridging/bonding not possible
Message-ID: <78fa512a-82c6-0b0c-d759-162d31a134b4@moenia.de>
Date: Thu, 14 Oct 2021 04:45:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: de
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

hi.

as I understand, linux needs the ability to change hardware-addresses on
netdevs to put them into a bridge or bond, but wireguard-netdevs on
linux don't support hw-addresses at all (at least in kernel 5.10).

is it possible (or even planned) to add hw-addresses to the
wireguard-netdevs or does this interfere with the concept of wireguard?

regards

j.
