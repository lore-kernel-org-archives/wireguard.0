Return-Path: <SRS0=Yiz6=SI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3028FC10F06
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  6 Apr 2019 11:53:15 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 089752173C
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  6 Apr 2019 11:53:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wpkg.org header.i=@wpkg.org header.b="J8paZsy7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 089752173C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wpkg.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8857eee3;
	Sat, 6 Apr 2019 11:50:44 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e707f24f
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Mar 2019 14:21:31 +0000 (UTC)
Received: from mail.virtall.com (mail.virtall.com [46.4.129.203])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 13f4cf18
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Mar 2019 14:21:31 +0000 (UTC)
Received: from mail.virtall.com (localhost [127.0.0.1])
 by mail.virtall.com (Postfix) with ESMTP id 53AD8F807E8
 for <wireguard@lists.zx2c4.com>; Thu, 28 Mar 2019 14:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wpkg.org; s=default;
 t=1553782970; bh=78QKFQxh6qdLsTGc/ClZWkz/rMkM87iKwXWivslDXH8=;
 h=Date:From:To:Subject;
 b=J8paZsy7Jc5qLoPcWtEsv4zCEdxuZQssnTssGbYGVt2gCFDqo6VzQLNjuAnvWJXN7
 Xjo/vafc55tePJYiK0lLovGuuz/XpfRTfV02Ud9yiXKAYHh57TfK/da+iPY9C1/PE0
 X2mk3O7EbFhnTblFV9FwqBgHAbp60ZxtASt9yIol27q2QYCBCvMXGCc+riL4sfmQs2
 E/Ne+Td5XvhrlvXzd70ZkxC3+5O0CUyJChtFJQgpsE0V43e2L6rMQqCcQ7gneTIQtx
 r5TXftLoJSQtnxT8G/WTdFdE2buc6NkpYK+vOyOZvHmYVCUjuTst+1e0VpdyZHuCkH
 j8T9Ul/NHWB1g==
X-Fuglu-Suspect: 0a5e357063234184823c174d117a6ac1
X-Fuglu-Spamstatus: NO
Received: from localhost (localhost [127.0.0.1]) (Authenticated sender:
 tch@virtall.com) by mail.virtall.com (Postfix) with ESMTPSA
 for <wireguard@lists.zx2c4.com>; Thu, 28 Mar 2019 14:22:46 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 28 Mar 2019 23:22:45 +0900
From: Tomasz Chmielewski <mangoo@wpkg.org>
To: wireguard@lists.zx2c4.com
Subject: mesh VPN with wireguard?
Message-ID: <bf1d3b6ac8dc6a31c82042b363db3bf3@wpkg.org>
X-Sender: mangoo@wpkg.org
X-Mailman-Approved-At: Sat, 06 Apr 2019 13:50:44 +0200
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

Does Wireguard allow to set up mesh VPN with "relative ease"?

Say, we have 10 servers with public IPs, we want them all to create a 
VPN network with private subnet 10.11.12.0/24, and have all 10 servers 
communicate directly with each other.
Then a year later, expand it to 100 servers.

Something in the line of: https://www.tinc-vpn.org/


Tomasz Chmielewski
https://lxadm.com
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
