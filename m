Return-Path: <SRS0=Zpbp=DI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0D1CC4727F
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  1 Oct 2020 11:14:38 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C661921707
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  1 Oct 2020 11:14:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C661921707
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=secmail.pro
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 26050e25;
	Thu, 1 Oct 2020 10:40:44 +0000 (UTC)
Received: from secmail.pro (secmail.pro [46.226.111.104])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 504ab994
 for <wireguard@lists.zx2c4.com>;
 Sat, 26 Sep 2020 22:53:07 +0000 (UTC)
Received: by secmail.pro (Postfix, from userid 33)
 id 7155B406E2; Sun, 27 Sep 2020 01:24:22 +0200 (CEST)
Received: from secmailw453j7piv.onion (localhost [IPv6:::1])
 by secmail.pro (Postfix) with ESMTP id 858B657A96D
 for <wireguard@lists.zx2c4.com>; Sat, 26 Sep 2020 16:24:18 -0700 (PDT)
Received: from 127.0.0.1 (SquirrelMail authenticated user properly@secmail.pro)
 by giyzk7o6dcunb2ry.onion with HTTP; Sat, 26 Sep 2020 16:24:18 -0700
Message-ID: <a74e6ed79eda71933bedeb38268f41e4.squirrel@giyzk7o6dcunb2ry.onion>
Date: Sat, 26 Sep 2020 16:24:18 -0700
Subject: Security: Support 3rd party firewall software
From: properly@secmail.pro
To: wireguard@lists.zx2c4.com
User-Agent: SquirrelMail/1.4.22
MIME-Version: 1.0
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: 8bit
X-Priority: 3 (Normal)
Importance: Normal
X-Mailman-Approved-At: Thu, 01 Oct 2020 12:40:42 +0200
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

On Windows, wireguard is not obeying Comodo Firewall because wireguard
wintun network adapter is not including comodo's driver.

Note that this problem doesn't occur on OpenVPN's network adapter (V9)
because it loads comodo driver.


1. Disable Windows Firewall on Win10
2. Install Comodo Firewall(CF)
3. Configure CF
4. Acknoledge that the CF is filtering packet as expected

5. Install Wireguard
6. Connect to WG
7. All packets runs through WG, and comodo can't filter them


This is severe security risk.
Using Windows firewall is not an answer here.
There are many people who bought third party software solution.

