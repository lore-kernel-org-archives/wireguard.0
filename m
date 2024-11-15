Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4118ED49224
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Nov 2024 13:47:39 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 790ee9ae;
	Mon, 18 Nov 2024 12:38:36 +0000 (UTC)
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [2607:f8b0:4864:20::530])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e2930c03
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 15 Nov 2024 11:07:41 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-7ee020ec76dso1220028a12.3
 for <wireguard@lists.zx2c4.com>; Fri, 15 Nov 2024 03:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731668860; x=1732273660; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+s7uyzZf8In4uLin49oKAReXMClKRobUSg+yMBzWuAs=;
 b=AYbZuGQa/OFD/voVOJuv+mFbTcc26OC3RV7qi5/LLmG+jbM24v6MfMuCn4egoUBVnQ
 IakKn7aKB7ubTxN/zh18K9DXRc3oIMHKo+qTCPhUMROGfj80WNWWPzDioUSXdAALABao
 7saPI3UJVp28cD2tOD8IGNbejae7ICDHhX0s9J0Fly+HY1bwN5NqtAjBwsSiTFcAzY+5
 6bMbXXMWflld5Mc+shS+jhkf2dinHt3msd6kHlSoeyTMs8sr781sbcYFlVshHsztHPuB
 /XYQgFbfa8Sfs/mSxfb/CIUB1rls6+vL0jk4InaakWX7zQiGS0MAMRwXluRdbvtEUKIA
 FUWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731668860; x=1732273660;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+s7uyzZf8In4uLin49oKAReXMClKRobUSg+yMBzWuAs=;
 b=PN6bDe70LY5JxkgvdvQcp0PTHkpTMT+ne05v0UV6a9khzw8Fq9A7WkbLwGOo7uUiAk
 y2TPrdGUP0k1Wj3jjuLVJN96nVEFWnNFUv4hTBB1l5mADarxxyahgpANUGf5Xhm79JiZ
 sjUvVLya78ogCszlQ7yVd6ohSP2OUbma6tP0xfImaGhBcf7CMq4/nV8BKG9l5Roz7Hg6
 LqU1JggDY/yBRcnMkE27RROiQirc+PU6zGSwwSf4rzvJcHTm9VSEZG7w1JvxmfnubINZ
 zLUbU/EhmyWkg7TMtbJMWdNegdg3UNn/um/ZK1xifi1u0blMNODm9JivOYivKvb2M0T+
 QRKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXovyxTr/HMMihbn2aNXEdLRN12eFPLLxhqpvjidRa1sLf7BtX8KCHS6wBqAB7pCtAN8dZYpSTC0So=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YxQ3yaR3ALRZcTh+0E+kvNGdqRb2KtSj8REZbmpxMHWwoPCIfti
 fpD7dfKftwizyHfvWNATLQpR+JlaUCn2Y3/uQ0s3+etyZ2xYq4Gc
X-Google-Smtp-Source: AGHT+IE0jUvjlIv9ahz4VOxkviACSEPPm9XERK0CMbvsThmxdZ/es+hFfDJJtHURfB0yuoqlI2BAuQ==
X-Received: by 2002:a05:6a20:7f9a:b0:1d9:8275:cd70 with SMTP id
 adf61e73a8af0-1dc90bee4e9mr3125851637.40.1731668859858; 
 Fri, 15 Nov 2024 03:07:39 -0800 (PST)
Received: from HOME-PC ([223.185.134.27]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72477120bbdsm1100341b3a.78.2024.11.15.03.07.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2024 03:07:39 -0800 (PST)
From: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
To: Jason@zx2c4.com,
	wireguard@lists.zx2c4.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dheeraj.linuxdev@gmail.com
Subject: [PATCH net-next] wireguard: allowedips: Fix useless call issue
Date: Fri, 15 Nov 2024 16:37:21 +0530
Message-Id: <20241115110721.22932-1-dheeraj.linuxdev@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 18 Nov 2024 12:38:13 +0000
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

This commit fixes a useless call issue detected
by Coverity (CID 1508092). The call to
horrible_allowedips_lookup_v4 is unnecessary as
its return value is never checked.

Signed-off-by: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
---
 drivers/net/wireguard/selftest/allowedips.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireguard/selftest/allowedips.c b/drivers/net/wireguard/selftest/allowedips.c
index 3d1f64ff2e12..25de7058701a 100644
--- a/drivers/net/wireguard/selftest/allowedips.c
+++ b/drivers/net/wireguard/selftest/allowedips.c
@@ -383,7 +383,6 @@ static __init bool randomized_test(void)
 		for (i = 0; i < NUM_QUERIES; ++i) {
 			get_random_bytes(ip, 4);
 			if (lookup(t.root4, 32, ip) != horrible_allowedips_lookup_v4(&h, (struct in_addr *)ip)) {
-				horrible_allowedips_lookup_v4(&h, (struct in_addr *)ip);
 				pr_err("allowedips random v4 self-test: FAIL\n");
 				goto free;
 			}
-- 
2.34.1

