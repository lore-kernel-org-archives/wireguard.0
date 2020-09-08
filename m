Return-Path: <SRS0=5dvq=C3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 225C7C43465
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 18 Sep 2020 15:58:04 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE4DB23787
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 18 Sep 2020 15:58:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE4DB23787
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chocolatine.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 543e20a6;
	Fri, 18 Sep 2020 15:27:35 +0000 (UTC)
Received: from tao.chocolatine.org (mx.chocolatine.org [45.32.229.228])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 9cdabe3a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 8 Sep 2020 02:54:20 +0000 (UTC)
Received: from localhost (tao.chocolatine.org [local])
 by tao.chocolatine.org (OpenSMTPD) with ESMTPA id 48d2f6a2
 for <wireguard@lists.zx2c4.com>; Tue, 8 Sep 2020 03:23:07 +0000 (UTC)
Date: Tue, 8 Sep 2020 03:23:07 +0000
From: Nicolai <nicolai+wireguard@chocolatine.org>
To: wireguard@lists.zx2c4.com
Subject: OpenBSD interop testing
Message-ID: <20200908032307.GA93967@chocolatine.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailman-Approved-At: Fri, 18 Sep 2020 17:27:32 +0200
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

Hello all,

Now that OpenBSD has tagged 6.8-beta it's a good time to report interop
testing of WireGuard.  I've been using the kernel implementation since
support was merged in June.  Every peer combination I've tried works
properly, it's a joy to use, and I'm excited for 6.7 users to upgrade
and start using the kernel implementation.

All OpenBSD-current machines are using the kernel implementation.  Here
are the interop tests, all on IPv4:

0. peer-A, peer-B
1. OpenBSD 6.7 amd64 wireguard-go, OpenBSD 6.7-current amd64
2. OpenBSD 6.7-current amd64, OpenBSD 6.7-current amd64
3. OpenBSD 6.8-beta amd64, OpenBSD 6.8-beta amd64
4. Debian 10 x86-64 backported kernel, OpenBSD 6.7-current amd64
5. Debian 10 x86-64 backported kernel, OpenBSD 6.8-beta amd64
6. iOS 13.5.1, OpenBSD 6.7-current amd64
7. iOS 13.6, OpenBSD 6.7-current amd64
8. iOS 13.7, OpenBSD 6.7-current amd64
9. iOS 13.7, OpenBSD 6.8-beta amd64
10. macOS 10.15.4 (Catalina), OpenBSD 6.7-current amd64
11. macOS 10.15.6 (Catalina), OpenBSD 6.8-beta amd64
12. Android 5.1, OpenBSD 6.7-current amd64
13. Android 5.1, OpenBSD 6.8-beta amd64
14. OpenBSD 6.7-current i386, OpenBSD 6.7 amd64 wireguard-go
15. OpenBSD 6.7-current i386 PSK, OpenBSD 6.7 amd64 wireguard-go PSK
16. OpenBSD 6.7-current amd64 PSK, OpenBSD 6.7-current amd64 PSK
17. OpenBSD 6.8-beta amd64, OpenBSD 6.7 amd64 wireguard-go

Thank you to all developers, users, and contributors, in particular Matt
and Jason for bringing WireGuard to OpenBSD, and to everyone who has
given code feedback on tech@.

Nicolai
