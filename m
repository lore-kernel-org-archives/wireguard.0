Return-Path: chetgurevitch@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c35fe903
 for <wireguard@lists.zx2c4.com>;
 Fri, 29 Sep 2017 03:55:13 +0000 (UTC)
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
 [209.85.192.195])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c8e2edc3
 for <wireguard@lists.zx2c4.com>;
 Fri, 29 Sep 2017 03:55:13 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id f84so252318pfj.3
 for <wireguard@lists.zx2c4.com>; Thu, 28 Sep 2017 21:23:34 -0700 (PDT)
Return-Path: <chetgurevitch@gmail.com>
Received: from localhost.localdomain ([38.95.108.168])
 by smtp.gmail.com with ESMTPSA id m24sm5396958pfj.28.2017.09.28.21.23.32
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 28 Sep 2017 21:23:33 -0700 (PDT)
From: Chet Gurevitch <chetgurevitch@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH] Makefile: add uapi level to dkms-install target
Date: Thu, 28 Sep 2017 21:23:31 -0700
Message-Id: <20170929042331.18247-1-chetgurevitch@protonmail.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

---
 src/Makefile | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/src/Makefile b/src/Makefile
index 960bbb4..f437de3 100644
--- a/src/Makefile
+++ b/src/Makefile
@@ -44,11 +44,13 @@ install:
 	$(MAKE) -C tools install
 
 DKMS_TOP_LEVEL := Makefile Kbuild Kconfig $(filter-out wireguard.mod.c, $(wildcard *.c)) $(filter-out version.h, $(wildcard *.h)) version.h dkms.conf
+DKMS_UAPI_LEVEL := $(wildcard uapi/*.c) $(wildcard uapi/*.h)
 DKMS_SELFTEST_LEVEL := $(wildcard selftest/*.c) $(wildcard selftest/*.h)
 DKMS_CRYPTO_LEVEL := $(wildcard crypto/*.c) $(wildcard crypto/*.h) $(wildcard crypto/*.S)
 DKMS_COMPAT_LEVEL := $(shell find compat/ -name '*.c' -o -name '*.h' -o -name '*.include')
-dkms-install: $(DKMS_TOP_LEVEL) $(DKMS_SELFTEST_LEVEL) $(DKMS_CRYPTO_LEVEL) $(DKMS_COMPAT_LEVEL)
+dkms-install: $(DKMS_TOP_LEVEL) $(DKMS_UAPI_LEVEL) $(DKMS_SELFTEST_LEVEL) $(DKMS_CRYPTO_LEVEL) $(DKMS_COMPAT_LEVEL)
 	@install -v -m0644 -D -t$(DESTDIR)$(DKMSDIR) $(DKMS_TOP_LEVEL)
+	@install -v -m0644 -D -t$(DESTDIR)$(DKMSDIR)/uapi $(DKMS_UAPI_LEVEL)
 	@install -v -m0644 -D -t$(DESTDIR)$(DKMSDIR)/selftest $(DKMS_SELFTEST_LEVEL)
 	@install -v -m0644 -D -t$(DESTDIR)$(DKMSDIR)/crypto $(DKMS_CRYPTO_LEVEL)
 	@for file in $(DKMS_COMPAT_LEVEL); do install -v -m0644 -D $$file $(DESTDIR)$(DKMSDIR)/$$file; done
-- 
2.14.2
