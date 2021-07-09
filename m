Return-Path: <SRS0=3wNI=MB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC349C07E99
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  9 Jul 2021 02:53:00 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A32B61417
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  9 Jul 2021 02:52:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A32B61417
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ea11d8ba;
	Fri, 9 Jul 2021 02:48:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:e::133])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a26c4ca0
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 9 Jul 2021 02:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=q5PBy6APiXWPEupiMc3NRNYtzT/lblW7v71tiwv6vD4=; b=a/xws38deUOeggL/Jkk2RG3+/g
 pbJBq3tgbEiBzTrJRwB7MG09RkMZ5vTIXko+KXmrvX674zUJGw3yuH+YiHYUASZV+cqdacFTr53iD
 mVrQ+/u9zWGvZyO+yaDsziYvExuD9KOKY4amjXtsb3N4pHQ5R0OC55UWoZ4IkQF5K4icAZ4MFjSz4
 LzOK5l1BDX3Z4AAydCNNM6arBp6ZC2/L+9s+8ZVQOZJJJCZHaXOllWzEGjx81IltrUWJ/PNkeBbBh
 lMXwS5eNaW70KOC6n8U7xf/qYaU45bRUHLrMh6lO4psjQQYVdPSLlD8cxqcBQEKz2rXfOr8QjdbiA
 KNVhR8yA==;
Received: from [2601:1c0:6280:3f0::aefb] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1g5N-000Wlc-IQ; Fri, 09 Jul 2021 02:17:49 +0000
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
Subject: [PATCH 0/6] treewide: rename 'mod_init' & 'mod_exit' functions to be
 module-specific
Date: Thu,  8 Jul 2021 19:17:41 -0700
Message-Id: <20210709021747.32737-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
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

There are multiple (16) modules which use a module_init() function
with the name 'mod_init' and a module_exit() function with the name
'mod_exit'. This can lead to confusion or ambiguity when reading
crashes/oops/bugs etc. and when reading an initcall_debug log.

Example 1: (System.map file)

ffffffff83446d10 t mod_init
ffffffff83446d18 t mod_init
ffffffff83446d20 t mod_init
...
ffffffff83454665 t mod_init
ffffffff834548a4 t mod_init
ffffffff83454a53 t mod_init
...
ffffffff8345bd42 t mod_init
...
ffffffff8345c916 t mod_init
ffffffff8345c92a t mod_init
ffffffff8345c93e t mod_init
ffffffff8345c952 t mod_init
ffffffff8345c966 t mod_init
...
ffffffff834672c9 t mod_init

Example 2: (boot log when using 'initcall_debug')

[    0.252157] initcall mod_init+0x0/0x8 returned 0 after 0 usecs
[    0.252180] initcall mod_init+0x0/0x8 returned 0 after 0 usecs
[    0.252202] initcall mod_init+0x0/0x8 returned 0 after 0 usecs
...
[    0.892907] initcall mod_init+0x0/0x23f returned -19 after 104 usecs
[    0.913788] initcall mod_init+0x0/0x1af returned -19 after 9 usecs
[    0.934353] initcall mod_init+0x0/0x49 returned -19 after 0 usecs
...
[    1.454870] initcall mod_init+0x0/0x66 returned 0 after 72 usecs
...
[    1.455527] initcall mod_init+0x0/0x14 returned 0 after 0 usecs
[    1.455531] initcall mod_init+0x0/0x14 returned 0 after 0 usecs
[    1.455536] initcall mod_init+0x0/0x14 returned 0 after 0 usecs
[    1.455541] initcall mod_init+0x0/0x14 returned 0 after 0 usecs
[    1.455545] initcall mod_init+0x0/0x52 returned 0 after 0 usecs
...
[    1.588162] initcall mod_init+0x0/0xef returned 0 after 45 usecs


Cc: Jason A. Donenfeld <Jason@zx2c4.com>
Cc: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andres Salomon <dilinger@queued.net>
Cc: linux-geode@lists.infradead.org
Cc: Matt Mackall <mpm@selenic.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org
Cc: Christian Gromm <christian.gromm@microchip.com>
Cc: Krzysztof Halasa <khc@pm.waw.pl>
Cc: netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Martin Schiller <ms@dev.tdt.de>
Cc: linux-x25@vger.kernel.org
Cc: wireguard@lists.zx2c4.com

[PATCH 1/6] arm: crypto: rename 'mod_init' & 'mod_exit' functions to be module-specific
[PATCH 2/6] hw_random: rename 'mod_init' & 'mod_exit' functions to be module-specific
[PATCH 3/6] lib: crypto: rename 'mod_init' & 'mod_exit' functions to be module-specific
[PATCH 4/6] MOST: cdev: rename 'mod_init' & 'mod_exit' functions to be module-specific
[PATCH 5/6] net: hdlc: rename 'mod_init' & 'mod_exit' functions to be module-specific
[PATCH 6/6] net: wireguard: rename 'mod_init' & 'mod_exit' functions to be module-specific

 arch/arm/crypto/curve25519-glue.c  |    8 ++++----
 drivers/char/hw_random/amd-rng.c   |    8 ++++----
 drivers/char/hw_random/geode-rng.c |    8 ++++----
 drivers/char/hw_random/intel-rng.c |    8 ++++----
 drivers/char/hw_random/via-rng.c   |    8 ++++----
 drivers/most/most_cdev.c           |    8 ++++----
 drivers/net/wan/hdlc_cisco.c       |    8 ++++----
 drivers/net/wan/hdlc_fr.c          |    8 ++++----
 drivers/net/wan/hdlc_ppp.c         |    8 ++++----
 drivers/net/wan/hdlc_raw.c         |    8 ++++----
 drivers/net/wan/hdlc_raw_eth.c     |    8 ++++----
 drivers/net/wan/hdlc_x25.c         |    8 ++++----
 drivers/net/wireguard/main.c       |    8 ++++----
 lib/crypto/blake2s.c               |    8 ++++----
 lib/crypto/chacha20poly1305.c      |    8 ++++----
 lib/crypto/curve25519.c            |    8 ++++----
 16 files changed, 64 insertions(+), 64 deletions(-)
