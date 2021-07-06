Return-Path: <SRS0=V78u=MZ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DEC1C4338F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  2 Aug 2021 13:18:54 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B40DF60F6D
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  2 Aug 2021 13:18:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B40DF60F6D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=grsecurity.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 064b3287;
	Mon, 2 Aug 2021 13:14:14 +0000 (UTC)
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id bc934070
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 6 Jul 2021 13:32:23 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id r26so20810245lfp.2
 for <wireguard@lists.zx2c4.com>; Tue, 06 Jul 2021 06:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grsecurity.net; s=grsec;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PQbF0TiI97mlnZs/zsIDmUYMbdE7ExonUUdbiSwMsuA=;
 b=Xq62wtHjypAfkkWAAEWxcwVPT6R+LOpr56/uSUq6lyXfdJrfb+NXRPWDUf8tNrZS+i
 K8OQkyaQbAt5LZxQjvZSggchDIA94vrEsHTCDj22GoQZuirLuPe0xnC6DxpOQyEp5dJ1
 ta4lU1NE8DwVWkBd+vC2AyOYuoTuFITeoSsQdMC4SFSFhTgQErtpQKx945zCEvUe9rp4
 8KkUC4F0Rd9v+huLUyROe2M0sGro2GYr8d8W4MfFaAuNyr64jW808DlC/R3pL0y83t1R
 i3o1cIhPsJWYMvPNkcy8d0MVD95vQQxq0NbvgGOjH4yOG/nC6iD/ZNBeenltRz6Cu+zf
 akAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PQbF0TiI97mlnZs/zsIDmUYMbdE7ExonUUdbiSwMsuA=;
 b=E9pCSn4R8LyULj01xZA0ptEy1UQcWAq8TTxVHveKU8bBfr7GEAz0fHXE4p5aXF6gz5
 2OTsvffLE39DssulZkfmwYeU6r8sMOO+Ae2FAo3iu6ab6JtyHpYpoKF3/8IWpdXCo45n
 M/HkaGv75cgxGVgiI3kM2wyKg79w0PzsnlGX6+BjIO5129TCRKnJY2y31UgvnD3V5fz0
 8xVn4GM74EsiSMmN+PEFCQEmlDKRL6TD1sarqayc4I8/r8mtTcvVoN9vAH8pLtbkhpp7
 jIjy8wHQRGxzLHy2vaXVyTStbcbTqbUqf1UA/pPKo9BgvLRssLz5H3oPzQ4DjbpPFa0a
 WldQ==
X-Gm-Message-State: AOAM5307o40F4CO9xDIdTN9Tfn4mQiOkZGKxbtuhLW44mcwch1Z41mAO
 2WjHEwuQQwYqfVt1AwmnFhiujeWw16wjrPSSiaM=
X-Google-Smtp-Source: ABdhPJxO0aSEPJlKHl36SczN3NJE1Xuk8MNomPEA4ByDlEU/o0VUcqqZwIvzElEd3CCKPM/2WfSFOA==
X-Received: by 2002:adf:e689:: with SMTP id r9mr3416141wrm.416.1625578040245; 
 Tue, 06 Jul 2021 06:27:20 -0700 (PDT)
Received: from bell.fritz.box
 (p200300f6af0ea300f5eebaf01242eb9f.dip0.t-ipconnect.de.
 [2003:f6:af0e:a300:f5ee:baf0:1242:eb9f])
 by smtp.gmail.com with ESMTPSA id c7sm16927769wrs.23.2021.07.06.06.27.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 06:27:19 -0700 (PDT)
From: Mathias Krause <minipli@grsecurity.net>
To: "Jason A . Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com,
	Mathias Krause <minipli@grsecurity.net>
Subject: [PATCH 2/2] curve25519-x86_64: solve register constraints with
 reserved registers
Date: Tue,  6 Jul 2021 15:27:14 +0200
Message-Id: <20210706132714.8220-3-minipli@grsecurity.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210706132714.8220-1-minipli@grsecurity.net>
References: <20210706132714.8220-1-minipli@grsecurity.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 02 Aug 2021 13:14:07 +0000
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

The register constraints for the inline assembly in fsqr() and fsqr2()
are pretty tight on what the compiler may assign to the remaining three
register variables. The clobber list only allows the following to be
used: RDI, RSI, RBP and R12. With RAP reserving R12 and a kernel having
CONFIG_FRAME_POINTER=y, claiming RBP, there are only two registers left
so the compiler rightfully complains about impossible constraints.

Provide alternatives that'll allow a memory reference for 'out' to solve
the allocation constraint dilemma for this configuration.

Signed-off-by: Mathias Krause <minipli@grsecurity.net>

---

Yes, the '+' constraint prefix doesn't need to be repeated for the
alternatives. In fact, it's invalid syntax to do so (see [1]). Also
"+rm" won't do the trick either, as in this case gcc still insists to
have a free register -- even if it would choose a memory operand in the
end.

[1] https://gcc.gnu.org/onlinedocs/gcc/Multi-Alternative.html#Multi-Alternative
---
 src/crypto/zinc/curve25519/curve25519-x86_64.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/src/crypto/zinc/curve25519/curve25519-x86_64.c b/src/crypto/zinc/curve25519/curve25519-x86_64.c
index 79716c425b0c..67f55affcf88 100644
--- a/src/crypto/zinc/curve25519/curve25519-x86_64.c
+++ b/src/crypto/zinc/curve25519/curve25519-x86_64.c
@@ -581,7 +581,7 @@ static inline void fsqr(u64 *out, const u64 *f, u64 *tmp)
 		"  cmovc %%rdx, %%rax;"
 		"  add %%rax, %%r8;"
 		"  movq %%r8, 0(%0);"
-	: "+&r" (tmp), "+&r" (f), "+&r" (out)
+	: "+&r,&r" (tmp), "+&r,&r" (f), "+&r,m" (out)
 	:
 	: "%rax", "%rcx", "%rdx", "%r8", "%r9", "%r10", "%r11", "%rbx", "%r13", "%r14", "%r15", "memory", "cc"
 	);
@@ -743,7 +743,7 @@ static inline void fsqr2(u64 *out, const u64 *f, u64 *tmp)
 		"  cmovc %%rdx, %%rax;"
 		"  add %%rax, %%r8;"
 		"  movq %%r8, 32(%0);"
-	: "+&r" (tmp), "+&r" (f), "+&r" (out)
+	: "+&r,&r" (tmp), "+&r,&r" (f), "+&r,m" (out)
 	:
 	: "%rax", "%rcx", "%rdx", "%r8", "%r9", "%r10", "%r11", "%rbx", "%r13", "%r14", "%r15", "memory", "cc"
 	);
-- 
2.20.1

