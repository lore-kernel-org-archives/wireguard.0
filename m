Return-Path: <SRS0=0+k7=45=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8E36C2BB1D
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Mar 2020 06:40:49 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DDEB20735
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Mar 2020 06:40:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b2fGaqFg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DDEB20735
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1a049c22;
	Thu, 12 Mar 2020 06:34:49 +0000 (UTC)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [2607:f8b0:4864:20::636])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b297a9d9
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Mar 2020 06:34:46 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id j20so2256243pll.6
 for <wireguard@lists.zx2c4.com>; Wed, 11 Mar 2020 23:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GwQmYhHGe0w5qReQYCywoaqePj2xr8Y0atjksYgtFrM=;
 b=b2fGaqFgF+uIScvQygUwMJlCH/HQ7X747JJakujYxwQsJT2KMwXf1PGakRUztrV3vN
 rmkRI636nRACN+6h3NZMK8Un1uEcpYCnt4sm48lbwLRXA1IE5+eZw1vnM+p0t6LDV8KQ
 akgwliuqG9G5rpJ8P+ptFCPSKcLk66ceSQ+E/IYYv70AWBfrm+FaE6PBzDULdidLzi/A
 01P+D3B058gOJgbVy1y0zhUHYNcHiYICtKTEju6b8QKSeIHW3yrUduYCMbGytlW4M4OO
 7Jivv2DujqoZXUtJMKQefV16SfwbzTYPe0ykx5yRFTqsYE8zSvKTebr/pM9goUMh949x
 UKMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GwQmYhHGe0w5qReQYCywoaqePj2xr8Y0atjksYgtFrM=;
 b=C+p7mxcnIdvhcSq5eXUskacx2Y9/PBH+arb397G89b+7PTRAXm67UKDhLU6Npik2Fv
 nUwzWCzIZtBiBdkr1Gqfjpd9zje43DrK2NMXD9HDQLV1bWyqF2yreORh2d60kJt4Kz5Q
 D4+UutxZbQ1awDXy9f22QRgX4/PMCn4u9PNAq1RKxuw1cmm8e7qEdDMd2Zo6Vgd/h8zZ
 jjzVj/m9zLETF310IUjU8Xqp78SIn4Gz17GgegHjYPEM+JXXBSW6g1Mzw8AYNggAGW0c
 1gvF/C+aaL2LlkETgIaSoml82fSl8tsAcPSShXCs5G2iJ+q+iii70g0Pw96nXyPcq7VH
 cxAQ==
X-Gm-Message-State: ANhLgQ1ymCuiq6vnyouLs0xpzenR6arpE+yQ4licnmkYHa1YtFNHFK8p
 dTN9krMWH2fYJujiAoEH15Nd0tAs
X-Google-Smtp-Source: ADFU+vsxEBiwPG3N3SO4CS+6xwLJGsw9MVvtrk9v3O0sOv8gMZ6SeIJV/xg86rQxUn5WxW5UWlkbqQ==
X-Received: by 2002:a17:90b:3745:: with SMTP id
 ne5mr2553077pjb.156.1583995217030; 
 Wed, 11 Mar 2020 23:40:17 -0700 (PDT)
Received: from home-imac.catsrv1.hicat.ne.jp (ca163152.hicat.ne.jp.
 [202.95.163.152])
 by smtp.gmail.com with ESMTPSA id z17sm5145070pff.12.2020.03.11.23.40.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 11 Mar 2020 23:40:16 -0700 (PDT)
From: Eiji Tanioka <tanioka404@gmail.com>
To: wireguard@lists.zx2c4.com
Cc: Eiji Tanioka <tanioka404@gmail.com>
Subject: [PATCH] strings: update Japanese translation
Date: Thu, 12 Mar 2020 15:36:23 +0900
Message-Id: <20200312063622.82015-1-tanioka404@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Signed-off-by: Eiji Tanioka <tanioka404@gmail.com>
---
 ui/src/main/res/values-ja/strings.xml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/ui/src/main/res/values-ja/strings.xml b/ui/src/main/res/values-ja/strings.xml
index 4da0854..58944bd 100644
--- a/ui/src/main/res/values-ja/strings.xml
+++ b/ui/src/main/res/values-ja/strings.xml
@@ -97,7 +97,15 @@
     <string name="module_installer_title">カーネルモジュールをダウンロードしてインストールする</string>
     <string name="module_installer_working">ダウンロードしてインストールしています…</string>
     <string name="module_installer_error">失敗しました. 再度実行してみてください</string>
+    <string name="module_disabler_disabled_title">カーネルモジュールバックエンドの有効化</string>
+    <string name="module_disabler_disabled_summary">カーネルモジュールは実験的ですがパフォーマンスが向上する可能性があります。</string>
+    <string name="module_disabler_enabled_title">カーネルモジュールバックエンドの無効化</string>
+    <string name="module_disabler_enabled_summary">ユーザースペースバックエンドは低速ですが安定しています。</string>
+    <string name="module_disabler_working">アプリケーションは5秒以内に再起動します</string>
     <string name="mtu">MTU</string>
+    <string name="multiple_tunnels_title">複数トンネルの同時有効化</string>
+    <string name="multiple_tunnels_summary_on">同時に複数のトンネルを有効化できます</string>
+    <string name="multiple_tunnels_summary_off">トンネルを有効化すると他のトンネルは無効になります</string>
     <string name="name">名前</string>
     <string name="no_config_error">未設定のままトンネルを起動しようとしています</string>
     <string name="no_configs_error">設定が見つかりません</string>
@@ -117,6 +125,8 @@
     <string name="public_key">公開鍵</string>
     <string name="public_key_description">公開鍵</string>
     <string name="qr_code_hint">Tip: `qrencode -t ansiutf8 &lt; tunnel.conf` で生成できます</string>
+    <string name="restore_on_boot_summary_on">起動時に前回有効化されていたトンネルを有効にする</string>
+    <string name="restore_on_boot_summary_off">起動時にトンネルを有効化しない</string>
     <string name="restore_on_boot_title">起動時に復元</string>
     <string name="save">保存</string>
     <string name="select_all">すべて選択</string>
-- 
2.25.1

