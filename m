Return-Path: <SRS0=23NU=3L=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3AB4C33CB6
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Jan 2020 19:48:27 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4815024655
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Jan 2020 19:48:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4815024655
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=j-o-a.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9040b101;
	Wed, 22 Jan 2020 19:48:10 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e6d058e2
 for <wireguard@lists.zx2c4.com>; Thu, 9 Jan 2020 09:07:46 +0000 (UTC)
Received: from smtprelay03.ispgateway.de (smtprelay03.ispgateway.de
 [80.67.31.41])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 49587df6
 for <wireguard@lists.zx2c4.com>; Thu, 9 Jan 2020 09:07:45 +0000 (UTC)
Received: from [89.186.220.72] (helo=mail.home.j-o-a.de)
 by smtprelay03.ispgateway.de with esmtpa (Exim 4.92.3)
 (envelope-from <oliver@j-o-a.de>) id 1ipTn6-00052A-Qo
 for wireguard@lists.zx2c4.com; Thu, 09 Jan 2020 10:07:44 +0100
Received: from [10.20.34.177] (router.home.j-o-a.de [192.168.10.14])
 by mail.home.j-o-a.de (Postfix) with ESMTPA id 857A721F5EC
 for <wireguard@lists.zx2c4.com>; Thu,  9 Jan 2020 10:07:44 +0100 (CET)
To: wireguard@lists.zx2c4.com
From: Oliver Joa <oliver@j-o-a.de>
Subject: Split routing in android app not working
Message-ID: <d37c5923-d552-83ed-579f-1c90fba1d5da@j-o-a.de>
Date: Thu, 9 Jan 2020 10:07:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
Content-Language: en-US
X-Df-Sender: OTI2Nzky
X-Mailman-Approved-At: Wed, 22 Jan 2020 20:48:09 +0100
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

Hi,

I don't get split routing working in the android app.

This is my configuration:

[Interface]
PrivateKey = <key>
Address = 10.88.88.2/24

[Peer]
Endpoint = 192.168.10.29:51820
PublicKey = <key>
AllowedIPs = 10.88.88.0/24
PersistentKeepalive = 25

Everything is routet through wireguard, but shouldn't it be only 
10.88.88.0/24?

Thanks and regards

Olli
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
