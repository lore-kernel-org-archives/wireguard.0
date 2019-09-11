Return-Path: <SRS0=/FJx=XG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E893C49ED6
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 11 Sep 2019 16:50:23 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAFC920838
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 11 Sep 2019 16:50:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="w+nK2HqZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EAFC920838
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a7b4f57e;
	Wed, 11 Sep 2019 16:50:09 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7057f79a
 for <wireguard@lists.zx2c4.com>;
 Wed, 11 Sep 2019 16:50:08 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a38e48c9
 for <wireguard@lists.zx2c4.com>;
 Wed, 11 Sep 2019 16:50:08 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 12981f84
 for <wireguard@lists.zx2c4.com>;
 Wed, 11 Sep 2019 16:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=tDPCzy4089eAT9gMFrlYq+7iBT4=; b=w+nK2H
 qZSPSBrd2UzPbn81/MJCDImlE87+M+s/+8Do1WRA1VAT3/d5+T3eTrKHMAXUatga
 9PI5FL9ptH423eUiH0pToXptXt6GKdDb+brtsy+2k6SD2PH8Tw+R1z8jPrRDS66l
 NUGzwVDhu8KFVkS6KGGzp69lNRUuUvjiT29KT8BueXuNZ8GYXro27BgPtxmgP74t
 k+sxkuUVx8bOmT4zk8tinw2hOUHDf8RVWulVYZt0I2Q/crLtUc4mr9hR7kBNJGYl
 g4jtgeD7NDKmWYeI1fHelhZW1gIxJk2P74LIMZf/bwla051uoOlzrsWig67/Ucdg
 hzSf7zX12cTA334A==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a441cc9f
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 11 Sep 2019 16:06:09 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id n7so23214508otk.6
 for <wireguard@lists.zx2c4.com>; Wed, 11 Sep 2019 09:50:07 -0700 (PDT)
X-Gm-Message-State: APjAAAXedwGrIKU/zSK2difx56TwJkpls6N8S4ZnaiD7++pE2nKCmkU4
 AuXZ2J6sSlj3QquzvXh5gAgUOMDPojcRGhmoXuw=
X-Google-Smtp-Source: APXvYqw2d8XQeLpPcXCGPNDemAvf8Aw7VjkNiM2dACiwCr0yWCTeCg2Eg9U0UaftD6DI7lVXxBld4JKozMyZxhepboM=
X-Received: by 2002:a9d:7d91:: with SMTP id j17mr5759096otn.120.1568220607343; 
 Wed, 11 Sep 2019 09:50:07 -0700 (PDT)
MIME-Version: 1.0
References: <3256534.Vi1k177MCT@themisto> <2063759.iXnbFVBoeU@themisto>
In-Reply-To: <2063759.iXnbFVBoeU@themisto>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 11 Sep 2019 12:49:56 -0400
X-Gmail-Original-Message-ID: <CAHmME9pe28R6U04uidrmjvLUXW7eetMz3XHzx+Ty+0YJ7FgSSw@mail.gmail.com>
Message-ID: <CAHmME9pe28R6U04uidrmjvLUXW7eetMz3XHzx+Ty+0YJ7FgSSw@mail.gmail.com>
Subject: Re: RHEL8 compatibility
To: =?UTF-8?Q?Robert=2DAndr=C3=A9_Mauchin?= <zebob.m@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Does something like this work?

diff --git a/src/compat/compat.h b/src/compat/compat.h
index 54907e9a..888974a3 100644
--- a/src/compat/compat.h
+++ b/src/compat/compat.h
@@ -90,7 +90,7 @@
     (LINUX_VERSION_CODE < KERNEL_VERSION(3, 18, 27) &&
LINUX_VERSION_CODE >= KERNEL_VERSION(3, 17, 0)) || \
     (LINUX_VERSION_CODE < KERNEL_VERSION(3, 16, 8) &&
LINUX_VERSION_CODE >= KERNEL_VERSION(3, 15, 0)) || \
     (LINUX_VERSION_CODE < KERNEL_VERSION(3, 14, 40) &&
LINUX_VERSION_CODE >= KERNEL_VERSION(3, 13, 0)) || \
-    (LINUX_VERSION_CODE < KERNEL_VERSION(3, 12, 54))) && !defined(ISUBUNTU1404)
+    (LINUX_VERSION_CODE < KERNEL_VERSION(3, 12, 54))) &&
!defined(ISUBUNTU1404) && !defined(ISRHEL7)
 #include <linux/if.h>
 #include <net/ip_tunnels.h>
 #define IP6_ECN_set_ce(a, b) IP6_ECN_set_ce(b)
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
