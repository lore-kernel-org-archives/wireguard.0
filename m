Return-Path: <SRS0=zOjE=TG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFFF2C04AAD
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 May 2019 20:28:39 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C19120830
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 May 2019 20:28:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vY3giSY3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C19120830
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e8574f68;
	Mon, 6 May 2019 20:28:38 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2c246f16
 for <wireguard@lists.zx2c4.com>;
 Thu, 11 Apr 2019 06:21:11 +0000 (UTC)
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 36ee4e8e
 for <wireguard@lists.zx2c4.com>;
 Thu, 11 Apr 2019 06:21:11 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id 8so2941664pfr.4
 for <wireguard@lists.zx2c4.com>; Wed, 10 Apr 2019 23:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mPPaKkXO3irOhTaxIzXirGFeX73o8kJUEu02ybMN/v4=;
 b=vY3giSY3uCr0Pt0hUO33ObMwfyTRMOQo1i3x+EuZQle1Or4ByPdkSAABg166z1ZLG9
 WmM2I+23o8Haviym7k55xTarLzHd9HvxLSVrjTIne3KYMXI1jEdhJxoS9hnQdbD3Sq7Q
 JTcl+ygRf82b6/T5KD31w2+v9i32d7GY8ivbzUYsgcomtx+eA0ziPuDKhhHIcSFlRXvs
 YEBdOU0mD5W+kyyBsaf+ubS1CIpJOPBaBnd37PmK5tFnzt+lHw6DnTJEkUDZBw/4P+k/
 Wu75Zr9ye5srVxVu5cqlX/buyobHLBB8xcwA514NwTQl2qPTdew3+9v2h2nJm/LEmsEV
 Zl7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=mPPaKkXO3irOhTaxIzXirGFeX73o8kJUEu02ybMN/v4=;
 b=dKobTK3pa/+EybZTFp1ShBzhTlU04ucmnl5/UGeb/XsVhL+RNN69borUtJvxx8YIQQ
 qskCkd6Ss5V1UmEaOqdKxikf81Gpl05o/uGRyjyvnQuGGTI5kODP2BZWalEC30c6jWyg
 QxZnJaHX5GluRLjx9FH2WRDeG/1JXaeixYa7P82X8aPZcx0iHtKVny+ZkcNIL4aGWctJ
 4GhTEv4TxvKOCT5q6Mzo2q3WwKjRtVRbbPnImi0LXdpNTQmESasXudlsyv456adUlqbY
 K86NLfTj/PrXzhnQxbg3rx5MPybe64Kw7K2fE8StHC6GBst8W7cc+3MibnErWEEOcTm+
 GudA==
X-Gm-Message-State: APjAAAW+UkGy/b+oCVA3Ozs/vWdpXs8XhY3CgkL5U7chBxbcxlRfeOQV
 CuCrUN/sRwzvtk92gpk8omAsTTwM
X-Google-Smtp-Source: APXvYqxFmoS1T6yf6RFvDpk7FNLDZDivto96ighbvblDSVkbJGuBm6u2qOOiq0RCQTtXY41ZDdL58w==
X-Received: by 2002:a63:d256:: with SMTP id t22mr42984367pgi.80.1554963670181; 
 Wed, 10 Apr 2019 23:21:10 -0700 (PDT)
Received: from vaiopro11.localdomain (i58-93-147-32.s41.a013.ap.plala.or.jp.
 [58.93.147.32])
 by smtp.gmail.com with ESMTPSA id e126sm90736327pfh.35.2019.04.10.23.21.08
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 10 Apr 2019 23:21:09 -0700 (PDT)
From: Yu Watanabe <watanabe.yu+github@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH] uapi: Fix typo in comments
Date: Thu, 11 Apr 2019 15:20:31 +0900
Message-Id: <20190411062031.28438-1-watanabe.yu+github@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 06 May 2019 22:28:35 +0200
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

Signed-off-by: Yu Watanabe <watanabe.yu+github@gmail.com>
---
 src/uapi/wireguard.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/src/uapi/wireguard.h b/src/uapi/wireguard.h
index 071ce41..d7960f9 100644
--- a/src/uapi/wireguard.h
+++ b/src/uapi/wireguard.h
@@ -18,13 +18,13 @@
  * one but not both of:
  *
  *    WGDEVICE_A_IFINDEX: NLA_U32
- *    WGDEVICE_A_IFNAME: NLA_NUL_STRING, maxlen IFNAMESIZ - 1
+ *    WGDEVICE_A_IFNAME: NLA_NUL_STRING, maxlen IFNAMSIZ - 1
  *
  * The kernel will then return several messages (NLM_F_MULTI) containing the
  * following tree of nested items:
  *
  *    WGDEVICE_A_IFINDEX: NLA_U32
- *    WGDEVICE_A_IFNAME: NLA_NUL_STRING, maxlen IFNAMESIZ - 1
+ *    WGDEVICE_A_IFNAME: NLA_NUL_STRING, maxlen IFNAMSIZ - 1
  *    WGDEVICE_A_PRIVATE_KEY: len WG_KEY_LEN
  *    WGDEVICE_A_PUBLIC_KEY: len WG_KEY_LEN
  *    WGDEVICE_A_LISTEN_PORT: NLA_U16
@@ -77,7 +77,7 @@
  * WGDEVICE_A_IFINDEX and WGDEVICE_A_IFNAME:
  *
  *    WGDEVICE_A_IFINDEX: NLA_U32
- *    WGDEVICE_A_IFNAME: NLA_NUL_STRING, maxlen IFNAMESIZ - 1
+ *    WGDEVICE_A_IFNAME: NLA_NUL_STRING, maxlen IFNAMSIZ - 1
  *    WGDEVICE_A_FLAGS: NLA_U32, 0 or WGDEVICE_F_REPLACE_PEERS if all current
  *                      peers should be removed prior to adding the list below.
  *    WGDEVICE_A_PRIVATE_KEY: len WG_KEY_LEN, all zeros to remove
@@ -119,7 +119,7 @@
  * filling in information not contained in the prior. Note that if
  * WGDEVICE_F_REPLACE_PEERS is specified in the first message, it probably
  * should not be specified in fragments that come after, so that the list
- * of peers is only cleared the first time but appened after. Likewise for
+ * of peers is only cleared the first time but appended after. Likewise for
  * peers, if WGPEER_F_REPLACE_ALLOWEDIPS is specified in the first message
  * of a peer, it likely should not be specified in subsequent fragments.
  *
-- 
2.20.1

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
