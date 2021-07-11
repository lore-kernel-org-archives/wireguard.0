Return-Path: <SRS0=Z/Ly=MD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06AD5C07E9E
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 11 Jul 2021 23:46:14 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C9E460FE6
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 11 Jul 2021 23:46:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C9E460FE6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0f825e77;
	Sun, 11 Jul 2021 23:42:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:e::133])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id bcce520b
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 11 Jul 2021 23:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=TGRhbMUsl1yRfRw9a46SZWtCcXw/VTCt/x/NlatoqFI=; b=rCutemvyW97aDoDJnIHx9zNGr5
 P4KjtYJoRO4HGCeQEwObV7IsSabg03DpqPRvbTp48NFcCFjFITzbbUfDCJP3wXrY89rDg+y6t34TT
 yehA9kBkncbOaCUjNOjck8pbW7r2xxqmoZtyQwoNJ0TeHyroaOr1zjbaApIQBgIXd1oPWsjO9fb4g
 Q3ap7qAeqvGugj3Bd44VW2iHg/E+C3627osokc78k+RsnYklgI5n1PxyiR2QXcRgwTjFputCO8c2t
 ZFCC2ux0W6lzRw5Va7FiIKLvXg2ZXj51QvVT2O6HYLyWkBZRHYRzXbYSK0/WO/8fSV5Dq8cTl9jTd
 J7u4mZRA==;
Received: from [2601:1c0:6280:3f0::aefb] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m2hzM-005U4u-8Y; Sun, 11 Jul 2021 22:31:52 +0000
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
Subject: [PATCH 2/6 v2] hw_random: rename 'mod_init' & 'mod_exit' functions to
 be module-specific
Date: Sun, 11 Jul 2021 15:31:44 -0700
Message-Id: <20210711223148.5250-3-rdunlap@infradead.org>
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
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andres Salomon <dilinger@queued.net>
Cc: linux-geode@lists.infradead.org
Cc: Matt Mackall <mpm@selenic.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: linux-crypto@vger.kernel.org
Cc: Jason A. Donenfeld <Jason@zx2c4.com>
---
v2: no change

 drivers/char/hw_random/amd-rng.c   |    8 ++++----
 drivers/char/hw_random/geode-rng.c |    8 ++++----
 drivers/char/hw_random/intel-rng.c |    8 ++++----
 drivers/char/hw_random/via-rng.c   |    8 ++++----
 4 files changed, 16 insertions(+), 16 deletions(-)

--- linux-next-20210708.orig/drivers/char/hw_random/amd-rng.c
+++ linux-next-20210708/drivers/char/hw_random/amd-rng.c
@@ -124,7 +124,7 @@ static struct hwrng amd_rng = {
 	.read		= amd_rng_read,
 };
 
-static int __init mod_init(void)
+static int __init amd_rng_mod_init(void)
 {
 	int err;
 	struct pci_dev *pdev = NULL;
@@ -188,7 +188,7 @@ out:
 	return err;
 }
 
-static void __exit mod_exit(void)
+static void __exit amd_rng_mod_exit(void)
 {
 	struct amd768_priv *priv;
 
@@ -203,8 +203,8 @@ static void __exit mod_exit(void)
 	kfree(priv);
 }
 
-module_init(mod_init);
-module_exit(mod_exit);
+module_init(amd_rng_mod_init);
+module_exit(amd_rng_mod_exit);
 
 MODULE_AUTHOR("The Linux Kernel team");
 MODULE_DESCRIPTION("H/W RNG driver for AMD chipsets");
--- linux-next-20210708.orig/drivers/char/hw_random/geode-rng.c
+++ linux-next-20210708/drivers/char/hw_random/geode-rng.c
@@ -83,7 +83,7 @@ static struct hwrng geode_rng = {
 };
 
 
-static int __init mod_init(void)
+static int __init geode_rng_init(void)
 {
 	int err = -ENODEV;
 	struct pci_dev *pdev = NULL;
@@ -124,7 +124,7 @@ err_unmap:
 	goto out;
 }
 
-static void __exit mod_exit(void)
+static void __exit geode_rng_exit(void)
 {
 	void __iomem *mem = (void __iomem *)geode_rng.priv;
 
@@ -132,8 +132,8 @@ static void __exit mod_exit(void)
 	iounmap(mem);
 }
 
-module_init(mod_init);
-module_exit(mod_exit);
+module_init(geode_rng_init);
+module_exit(geode_rng_exit);
 
 MODULE_DESCRIPTION("H/W RNG driver for AMD Geode LX CPUs");
 MODULE_LICENSE("GPL");
--- linux-next-20210708.orig/drivers/char/hw_random/intel-rng.c
+++ linux-next-20210708/drivers/char/hw_random/intel-rng.c
@@ -325,7 +325,7 @@ PFX "RNG, try using the 'no_fwh_detect'
 }
 
 
-static int __init mod_init(void)
+static int __init intel_rng_mod_init(void)
 {
 	int err = -ENODEV;
 	int i;
@@ -403,7 +403,7 @@ out:
 
 }
 
-static void __exit mod_exit(void)
+static void __exit intel_rng_mod_exit(void)
 {
 	void __iomem *mem = (void __iomem *)intel_rng.priv;
 
@@ -411,8 +411,8 @@ static void __exit mod_exit(void)
 	iounmap(mem);
 }
 
-module_init(mod_init);
-module_exit(mod_exit);
+module_init(intel_rng_mod_init);
+module_exit(intel_rng_mod_exit);
 
 MODULE_DESCRIPTION("H/W RNG driver for Intel chipsets");
 MODULE_LICENSE("GPL");
--- linux-next-20210708.orig/drivers/char/hw_random/via-rng.c
+++ linux-next-20210708/drivers/char/hw_random/via-rng.c
@@ -192,7 +192,7 @@ static struct hwrng via_rng = {
 };
 
 
-static int __init mod_init(void)
+static int __init via_rng_mod_init(void)
 {
 	int err;
 
@@ -209,13 +209,13 @@ static int __init mod_init(void)
 out:
 	return err;
 }
-module_init(mod_init);
+module_init(via_rng_mod_init);
 
-static void __exit mod_exit(void)
+static void __exit via_rng_mod_exit(void)
 {
 	hwrng_unregister(&via_rng);
 }
-module_exit(mod_exit);
+module_exit(via_rng_mod_exit);
 
 static struct x86_cpu_id __maybe_unused via_rng_cpu_id[] = {
 	X86_MATCH_FEATURE(X86_FEATURE_XSTORE, NULL),
