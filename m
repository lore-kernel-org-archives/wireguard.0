Return-Path: <SRS0=BFU5=5G=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7CC1C4332B
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 21 Mar 2020 13:42:02 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00B8320780
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 21 Mar 2020 13:42:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bRk6o8zx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00B8320780
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5b522c78;
	Sat, 21 Mar 2020 13:35:16 +0000 (UTC)
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [2607:f8b0:4864:20::643])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 1a8b9f0d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 21 Mar 2020 13:35:13 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id t16so3715727plr.8
 for <wireguard@lists.zx2c4.com>; Sat, 21 Mar 2020 06:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GKcH8B5DhJEXWzen/O7TtomSxvhw0YcKfVoMNFJ2C0k=;
 b=bRk6o8zxnSw2QJu88ABRXcTtDzxb8sxQd5ct6HyQTAc0EE1TBGml7L1bNw5KpmJ05n
 ttr45PzcNcv3R+uVu24YFyRNhy+AW2Rgt5bGFm7wF20uMCqLLDSbl9pkGvcq77h3i4un
 +aw7KjGexKeqyuaVe0FR7RBB7mtoRfZ+fkCG9GDIXCm+oqlKANB7pBhQ93V1ALiBiF+3
 ZR7Hym3cEZ1GWwxc+InrzVrA+LF3GbwPQRaeY5yETD9RH5fYl9HoCj1ifsWCy+CReMg8
 RMHZGKZe57mxxHdWExe70ccmHpBt1LLmRka4lpNYNYJvakaW4ZJiwqqdpz/qO4yj8FDc
 TGjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GKcH8B5DhJEXWzen/O7TtomSxvhw0YcKfVoMNFJ2C0k=;
 b=kL5kmcFExu0swKJGa1awGDg03igr11y5Zibdjnid2Q2CSg7h/8pzWCYH7qMT3jmvS6
 KcCcGfp1YzgKii25OFu0QN8ISsNiJMHVMrvI5lDxcJnuU3rN3Juy3WdZNS5+arlu1igV
 9nEFQkViLhrS/qOMW/HkWXDuvcdcGIlnj6mK5WLe3MWDgjZBiZ4MaQWaX4QHZ8Db0yHx
 QBpJMJbpCciLiheJkRlO7NgJN7XU5wytcKwtflo53Po2IelkkO0LidtpzgjKlGkY1BZP
 9c/XZqxqvCRw6+mrPB2k/52nR/L8mNyIC8TIBviC2E/1OmMag7e9Kdb8z15A+miSt69e
 mmhQ==
X-Gm-Message-State: ANhLgQ3vPaPFa5uYb31T+b/AzlBUzaN/izA0Oh3Xh7Zzk6Ml2wAd7ppg
 lHFGX183F+r8k8++yp/WzrPBAeJM
X-Google-Smtp-Source: ADFU+vuyK/mp4OJw305W3whk4dKVe5W6tdbGd2Wm+oGRVRPF8i5/AXGaKzjJIfGmPxP1r6swm+ZZ5w==
X-Received: by 2002:a17:902:8a89:: with SMTP id
 p9mr13294773plo.286.1584798116499; 
 Sat, 21 Mar 2020 06:41:56 -0700 (PDT)
Received: from My-MacBookAir.catsrv1.hicat.ne.jp (ca163152.hicat.ne.jp.
 [202.95.163.152])
 by smtp.gmail.com with ESMTPSA id v123sm8238682pfb.85.2020.03.21.06.41.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 21 Mar 2020 06:41:56 -0700 (PDT)
From: Eiji Tanioka <tanioka404@gmail.com>
To: wireguard@lists.zx2c4.com
Cc: Eiji Tanioka <tanioka404@gmail.com>
Subject: [PATCH wireguard-android] strings: Update Japanese translation.
Date: Sat, 21 Mar 2020 22:30:47 +0900
Message-Id: <20200321133045.26722-1-tanioka404@gmail.com>
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

Update correspond to commit 029a4a8.

Signed-off-by: Eiji Tanioka <tanioka404@gmail.com>
---
 ui/src/main/res/values-ja/strings.xml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/ui/src/main/res/values-ja/strings.xml b/ui/src/main/res/values-ja/strings.xml
index f743a9a..a7627cb 100644
--- a/ui/src/main/res/values-ja/strings.xml
+++ b/ui/src/main/res/values-ja/strings.xml
@@ -49,6 +49,8 @@
     <string name="create_activity_title">WireGuard トンネルの作成</string>
     <string name="create_bin_dir_error">ローカルバイナリディレクトリを作成できません</string>
     <string name="create_empty">空の状態から作成</string>
+    <string name="create_from_file">ファイル、アーカイブからインポート</string>
+    <string name="create_from_qr_code">QRコードをスキャン</string>
     <string name="create_output_dir_error">出力ディレクトリを作成できません</string>
     <string name="create_downloads_file_error">ダウンロードディレクトリにファイルを作成できません</string>
     <string name="create_temp_dir_error">ローカルに一時ディレクトリを作成できません</string>
-- 
2.25.1

