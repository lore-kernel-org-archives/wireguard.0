Return-Path: <SRS0=x2E1=EQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SHORT_SHORTNER,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13B03C388F7
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Nov 2020 13:03:14 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAC322064B
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Nov 2020 13:03:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CAC322064B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=al2klimov.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ddf513ed;
	Tue, 10 Nov 2020 12:58:58 +0000 (UTC)
Received: from smtp.al2klimov.de (smtp.al2klimov.de [2a01:4f8:c0c:1465::1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 9226091a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 31 Oct 2020 11:29:29 +0000 (UTC)
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
 by smtp.al2klimov.de (Postfix) with ESMTPA id F015D5DFD7
 for <wireguard@lists.zx2c4.com>; Sat, 31 Oct 2020 11:31:50 +0000 (UTC)
To: wireguard@lists.zx2c4.com
From: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Subject: MacOS: Can't have multiple on-demand tunnels
Message-ID: <ca2d6ca6-1bca-c177-1ace-60480edee2db@al2klimov.de>
Date: Sat, 31 Oct 2020 12:31:49 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp.al2klimov.de;
 auth=pass smtp.auth=aklimov@al2klimov.de
 smtp.mailfrom=grandmaster@al2klimov.de
X-Spamd-Bar: /
X-Mailman-Approved-At: Tue, 10 Nov 2020 13:58:56 +0100
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

Hello there!

Has anyone seen this problem, too?

https://youtu.be/qkRmzvnhfzQ

Does anyone even know how to workaround it?

Best,
AK
