Return-Path: <SRS0=x3Nk=MT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5DC8C65C30
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Oct 2018 09:15:16 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 087FB2087D
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Oct 2018 09:15:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=eworm.de header.i=@eworm.de header.b="VX+5D4C1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 087FB2087D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eworm.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a605c58f;
	Sun, 7 Oct 2018 09:14:35 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 28bc145c
 for <wireguard@lists.zx2c4.com>; Sun, 7 Oct 2018 09:14:33 +0000 (UTC)
Received: from mx.mylinuxtime.de (mx.mylinuxtime.de
 [IPv6:2a01:4f8:13a:16c2::25])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e772936d
 for <wireguard@lists.zx2c4.com>; Sun, 7 Oct 2018 09:14:33 +0000 (UTC)
Received: from leda.eworm.de (tmo-109-100.customers.d1-online.com
 [80.187.109.100])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mx.mylinuxtime.de (Postfix) with ESMTPSA id 8540BA77EA;
 Sun,  7 Oct 2018 11:15:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mx.mylinuxtime.de 8540BA77EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=eworm.de; s=mail;
 t=1538903709; bh=m8ACtoRJKcN9vuVnEkZk2lIZBFp7taM3FIyl0sH4jro=;
 h=From:To:Cc:Subject:Date;
 b=VX+5D4C1m/gnjQbbH9qapq73zBl9Jw1fXK5H8ZsGjTSR34fPhsEvalExyCK550DNU
 /uMQwMwg1FFzgZ6Jrc1mjDp++dg4tE7H2QpsI6vd3QU7pNo/VzshpJKtYxk9ZZzfic
 hK4pT0G6NbiMdx4kEiJAbHYJOg6cEFYqjSgYGqdI=
Received: by leda.eworm.de (Postfix, from userid 1000)
 id 8900D1026C7; Sun,  7 Oct 2018 11:14:38 +0200 (CEST)
From: Christian Hesse <list@eworm.de>
To: wireguard@lists.zx2c4.com
Subject: [PATCH 1/1] fix install target for dkms sources
Date: Sun,  7 Oct 2018 11:14:30 +0200
Message-Id: <20181007091430.22212-1-list@eworm.de>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-Spamd-Bar: +
Authentication-Results: mx.mylinuxtime.de;
 auth=pass smtp.auth=smtp-only@eworm.de smtp.mailfrom=eworm@leda.eworm.de
X-Rspamd-Server: mx
X-Stat-Signature: 317534cokjfaye63w6dbojxcdzgcjp7d
X-Rspamd-Queue-Id: 8540BA77EA
X-Spamd-Result: default: False [1.78 / 15.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 R_MISSING_CHARSET(2.50)[]; MIME_GOOD(-0.10)[text/plain];
 BROKEN_CONTENT_TYPE(1.50)[]; RCPT_COUNT_TWO(0.00)[2];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM(-2.79)[-0.930,0];
 FORGED_SENDER(0.30)[list@eworm.de,eworm@leda.eworm.de];
 RCVD_TLS_LAST(0.00)[];
 ASN(0.00)[asn:3320, ipnet:80.187.0.0/16, country:DE];
 FROM_NEQ_ENVFROM(0.00)[list@eworm.de,eworm@leda.eworm.de];
 BAYES_HAM(-0.63)[82.30%]; RCVD_COUNT_TWO(0.00)[2]
Cc: Christian Hesse <mail@eworm.de>
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

From: Christian Hesse <mail@eworm.de>

Commit ad5e4210 (global: rename include'd C files to be .c) breaks
install target for dkms sources. Fix installing selftest/*.c.

Signed-off-by: Christian Hesse <mail@eworm.de>
---
 src/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/Makefile b/src/Makefile
index 8543b99..b65ca0a 100644
--- a/src/Makefile
+++ b/src/Makefile
@@ -52,7 +52,7 @@ install:
 	@$(MAKE) -C tools install
 
 rwildcard=$(foreach d,$(wildcard $1*),$(call rwildcard,$d/,$2) $(filter $(subst *,%,$2),$d))
-DKMS_SOURCES := version.h Makefile Kbuild Kconfig dkms.conf $(filter-out version.h wireguard.mod.c,$(wildcard *.c *.h selftest/*.h uapi/*.h)) $(call rwildcard,crypto/,*.c *.h *.S *.include) $(call rwildcard,compat/,*.c *.h *.include)
+DKMS_SOURCES := version.h Makefile Kbuild Kconfig dkms.conf $(filter-out version.h wireguard.mod.c,$(wildcard *.c *.h selftest/*.c uapi/*.h)) $(call rwildcard,crypto/,*.c *.h *.S *.include) $(call rwildcard,compat/,*.c *.h *.include)
 dkms-install: $(DKMS_SOURCES)
 	@$(foreach f,$(DKMS_SOURCES),install -v -m0644 -D $(f) $(DESTDIR)$(DKMSDIR)/$(f);)
 
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
