Return-Path: <SRS0=Z/Ly=MD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FFEEC07E96
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 11 Jul 2021 23:36:37 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7388A60FF2
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 11 Jul 2021 23:36:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7388A60FF2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f25e5cfe;
	Sun, 11 Jul 2021 23:36:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:e::133])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2b8eaf21
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 11 Jul 2021 23:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=QagmsqvITB+o/LjZmHl9L5jAr/pQWs85BlMi3cpN/GM=; b=kveM54MS1wi04GLj96Vw5I6VrK
 lBq4VAWSUq1V2REETfPCN7Jn7iv4/Eimz13RJl/a7uJQCpx/Ax/XvWUTin9KVvN9pJ9LBj2Gtw9+S
 loWm2h9vswnmpB6d/3JRypzyiL4jKb6wIMLdxj9M6pMT5NLDjHVsztUMzDdi7YaM7NXstjHd0vNSs
 d1gmfK4m2qi7OqSZ80+CU91FQx4AJBL77Bzhq5ISxTUG4IKsyfxjdlcwVkueC6+bjJ4hA048WiMLB
 HrG/NnMWUk7WmtI/qaJ2Ni7EV7AFJB13zu57d+8ER28xukgCAHP49whc4hNFcCq1+s5xG/wLO1F+o
 MJJKTlbA==;
Received: from [2601:1c0:6280:3f0::aefb] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m2hzN-005U4u-Ry; Sun, 11 Jul 2021 22:31:53 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
 "Jason A . Donenfeld" <Jason@zx2c4.com>,
 Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andres Salomon <dilinger@queued.net>, linux-geode@lists.infradead.org,
 Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 linux-crypto@vger.kernel.org,
 Christian Gromm <christian.gromm@microchip.com>,
 Krzysztof Halasa <khc@pm.waw.pl>, netdev@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Martin Schiller <ms@dev.tdt.de>, linux-x25@vger.kernel.org,
 wireguard@lists.zx2c4.com
Subject: [PATCH 4/6 v2] MOST: cdev: rename 'mod_init' & 'mod_exit' functions
 to be module-specific
Date: Sun, 11 Jul 2021 15:31:46 -0700
Message-Id: <20210711223148.5250-5-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210711223148.5250-1-rdunlap@infradead.org>
References: <20210711223148.5250-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Rename module_init & module_exit functions that are named
"mod_init" and "mod_exit" so that they are unique in both the
System.map file and in initcall_debug output instead of showing
up as almost anonymous "mod_init".

This is helpful for debugging and in determining how long certain
module_init calls take to execute.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Christian Gromm <christian.gromm@microchip.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
v2: no change

 drivers/most/most_cdev.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

--- linux-next-20210708.orig/drivers/most/most_cdev.c
+++ linux-next-20210708/drivers/most/most_cdev.c
@@ -486,7 +486,7 @@ static struct cdev_component comp = {
 	},
 };
 
-static int __init mod_init(void)
+static int __init most_cdev_init(void)
 {
 	int err;
 
@@ -518,7 +518,7 @@ dest_ida:
 	return err;
 }
 
-static void __exit mod_exit(void)
+static void __exit most_cdev_exit(void)
 {
 	struct comp_channel *c, *tmp;
 
@@ -534,8 +534,8 @@ static void __exit mod_exit(void)
 	class_destroy(comp.class);
 }
 
-module_init(mod_init);
-module_exit(mod_exit);
+module_init(most_cdev_init);
+module_exit(most_cdev_exit);
 MODULE_AUTHOR("Christian Gromm <christian.gromm@microchip.com>");
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("character device component for mostcore");
