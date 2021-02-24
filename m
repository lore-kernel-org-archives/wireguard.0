Return-Path: <SRS0=93XJ=IF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D47AAC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Mar 2021 17:20:32 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DEC81650E0
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Mar 2021 17:20:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DEC81650E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=tutanota.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9539e31d;
	Sun, 7 Mar 2021 17:20:29 +0000 (UTC)
Received: from w1.tutanota.de (w1.tutanota.de [81.3.6.162])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d6668044
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 24 Feb 2021 00:11:02 +0000 (UTC)
Received: from w3.tutanota.de (unknown [192.168.1.164])
 by w1.tutanota.de (Postfix) with ESMTP id 2A0AAFBF456
 for <wireguard@lists.zx2c4.com>; Wed, 24 Feb 2021 00:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1614125462; 
 s=s1; d=tutanota.com;
 h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Date:Date:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:Sender;
 bh=S3BbLSDjtasRfwUIvuIGFb6CGTtEwsA68vmG1K1EPss=;
 b=3qsvzDlMPwgnjCay6qmC6uvUCZCGY8EHSPb8uxUBK1vDK5XLhp2lJeeE9XNi4TlN
 gR48VLcwnHjVpFfMl3gS/1xq4nHDaPgCeyZpdfFsV84CQQK4zz7Wg7jVoQjd5EWbN/t
 SjAOvYadTerGDhi+OY78QECgOJPrircvBfGhT6/fbzS17jNVH3DWX4gT8KZ76nou/9Y
 fbf4xYg282+HrrsCl8eqlbbZcSu7z9m63CrDbbR+jP7sHPhcKTURF9zFKV69yXz3Q/B
 kLi+Kizh38fXi7lrhIVeFI2pmWjgontqwhYgHeYWfF6jQ0aPIX19pfmiuCNBGlQPjkA
 TdYDpKNpRA==
Date: Wed, 24 Feb 2021 01:11:02 +0100 (CET)
From: frank.mosch@tutanota.com
To: Wireguard <wireguard@lists.zx2c4.com>
Message-ID: <MUGMypO--3-2@tutanota.com>
Subject: event for peer connection
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sun, 07 Mar 2021 17:20:28 +0000
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

Hello,

first thank you all for your great work on Wireguard! 

We would like to switch to wireguard at work but for our setup we need some automatic configuration based on the clients and their IP numbers. Is there a way to get notified when peers connect or send handshake packets? We'd like to avoid polling as the configuration needs to be done rather quickly on a connect for a pleasant user experience.
A file in /sys or /proc that can be waited on would be best but listening for netlink events would be useful, too. 

Servus, Frank
