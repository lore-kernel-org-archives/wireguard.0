Return-Path: <SRS0=QHSY=WV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE3C1C3A5A4
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:51:09 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61DB72080C
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:51:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ungleich.ch header.i=@ungleich.ch header.b="Cu3GgXaI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61DB72080C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ungleich.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 125eadb5;
	Sun, 25 Aug 2019 15:41:27 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id de8886c0
 for <wireguard@lists.zx2c4.com>;
 Fri, 26 Jul 2019 16:57:43 +0000 (UTC)
Received: from smtp.ungleich.ch (mx.ungleich.ch [185.203.112.16])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0f716a43
 for <wireguard@lists.zx2c4.com>;
 Fri, 26 Jul 2019 16:57:43 +0000 (UTC)
Received: from nico.schottelius.org (localhost [IPv6:::1])
 by smtp.ungleich.ch (Postfix) with ESMTP id 94802200F8;
 Fri, 26 Jul 2019 18:57:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ungleich.ch; s=mail;
 t=1564160261; bh=EyqJalKMGGId55Wd3MrsVh0nXfknQoMAieR9tym43NY=;
 h=From:To:Subject:Date:From;
 b=Cu3GgXaIBJZA9MnG/We7XMGVWJ3zkZqUOwcjMc9LF7XsxkO0YoYe1u3eyep67oJh/
 z9rcNMug6WAiwtWxTq7DlsrwbzJunb14MVAN/UE+7wWvcp76lF55RVjVw6+PnWjzQG
 DBvGgu8zTEsTMBVC67SCrcXxvovV9BcAEXX/PPgM=
Received: by nico.schottelius.org (Postfix, from userid 1000)
 id 63C4E1A01027; Fri, 26 Jul 2019 18:57:41 +0200 (CEST)
User-agent: mu4e 1.0; emacs 26.1
From: Nico Schottelius <nico.schottelius@ungleich.ch>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Wireguard compatible with Omega2 / Omega2+
Date: Fri, 26 Jul 2019 18:57:41 +0200
Message-ID: <87ef2c4ttm.fsf@line.ungleich.ch>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 25 Aug 2019 17:41:26 +0200
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


Good evening,

I was wondering if an MT7688 SoC that features a 580 MHz MIPS CPU
is feasible for running wireguard? With either 64 or 128 MB RAM.

To be specific, we are considering to get a a batch of Omega2/Omega2
[0][1] and deploy IPv6 nodes on it that get their IPs via wireguard.

If anyone has experience with such lowe power device, any input would be
appreciated.

Best,

Nico

[0] https://onion.io/store/omega2p/
[1] https://onion.io/store/omega2/

--
Your Swiss, Open Source and IPv6 Virtual Machine. Now on www.datacenterlight.ch.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
