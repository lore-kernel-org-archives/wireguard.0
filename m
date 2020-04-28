Return-Path: <SRS0=IpBN=6S=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6954C47247
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 May 2020 11:03:39 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97D9E20658
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 May 2020 11:03:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97D9E20658
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jzdm.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9d48d331;
	Mon, 4 May 2020 10:51:15 +0000 (UTC)
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 919bdbd0
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Apr 2020 14:02:14 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 49BNt72lzMzQlJv
 for <wireguard@lists.zx2c4.com>; Tue, 28 Apr 2020 16:13:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
 by spamfilter02.heinlein-hosting.de (spamfilter02.heinlein-hosting.de
 [80.241.56.116]) (amavisd-new, port 10030)
 with ESMTP id JZhvQ_Qrz9dy for <wireguard@lists.zx2c4.com>;
 Tue, 28 Apr 2020 16:13:47 +0200 (CEST)
To: wireguard@lists.zx2c4.com
From: "Johannes Z. D. Mieth" <wgmailinglist.all@jzdm.de>
Subject: EdgeRouter binaries
Message-ID: <d70eb47c-717a-4d11-28ab-e133e38444e7@jzdm.de>
Date: Tue, 28 Apr 2020 16:13:45 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-Rspamd-Queue-Id: 27D961776
X-Rspamd-Score: -5.50 / 15.00 / 15.00
X-Mailman-Approved-At: Mon, 04 May 2020 12:51:12 +0200
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

Dear all,

unfortunately the GitHub repository [1] for WireGuard EdgeRouter
binaries seems to be discontinued [2].
Does anybody have a recommendation for another repository to get
WireGuard binaries from?
What I need are binaries for the EdgeRouter X with firmware ≥
v2.0.8-hotfix, kernel 4.14.54.

Kind regards,
    Johannes

[1] https://github.com/Lochnair/vyatta-wireguard
[2]
https://github.com/Lochnair/vyatta-wireguard/issues/140#issuecomment-587031573
