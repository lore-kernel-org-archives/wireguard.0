Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27D91C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 22 Apr 2022 00:21:21 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id c0839158;
	Thu, 21 Apr 2022 23:48:55 +0000 (UTC)
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [2607:f8b0:4864:20::1030])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 487a6c09
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 6 Apr 2022 08:03:17 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id kw18so1810745pjb.5
 for <wireguard@lists.zx2c4.com>; Wed, 06 Apr 2022 01:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fXfVUspRbB2681eUfJmgQcYa7ZPKWzfzUEb/Zjv4BJI=;
 b=peG2iv63yVe9vC8cy/Yrc4zcQSgJ2CW8Csn4xpPtT1qqUJL1Aku/cI/dotpakklugN
 8lEomxuwtInBuwXTS5+vc+d/m+28IK8rWi9vc2aumWYWVApVoeyF7X9N0t+XkrNXl/O3
 JiEzvNPQ0GJmzsYxj8fJTxNWElwG0v7yEPrGS4VLjE7DNMMKGSFmDhVgk5awKKryM/wr
 Hb6wiUBsmAMB0YmxK6MlhKIcLJVd1qgZUvg0jTuHIW92FJ3LbSzfmwJtfsbBXzzfdSSC
 FiqoPRmc7KpJp9SKiHNsxruOFb+hJWdru1dYb50azuXDvm7YvEG/uhPzh1cCIqsTzkHi
 589w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fXfVUspRbB2681eUfJmgQcYa7ZPKWzfzUEb/Zjv4BJI=;
 b=5dydlwbX6EApygNFaZxEx3SOIq3cldBUIsz5K9ibbNHRUtlHW1CWqUfyCUteB9voqS
 lmAkq0O8tQAmE5M9jVleXIQkD++/zcWOvEUb5STQVfdECGEcGctXXGiOTzAjemP7a2uX
 lu4yTvpP5voBVBDOPhm3Il2X70ET1Ke1uFY/BLxU7ebN4/bY34HcV4f7/Ua8QzcJ5/KZ
 OugjRL5saH8bUiXjxSK6qilscBD/ZsWiXyGQG4R/we/4wOJEmkay7UEb/DptKtPcWY4i
 W32llcxeVeftok3SCNGp3TmADgzjcnMuE8p7wFCUU0wB72yztFYInb0EWpPYt8F4pv70
 rV6g==
X-Gm-Message-State: AOAM530582TTnCR1f3DP+nQYUw3pk6nPCXyXSaD/XlgdcLU3d7iVLvaf
 XkAYR8drtwTmt3e8Pyy3beApkvibMMA=
X-Google-Smtp-Source: ABdhPJy5kkOIfR/YKyBmjC17a0/qbMM53UGrCkDHqB+10wDF/ljijZ6lI5e+VSwZMGm6A3A7NK0hFA==
X-Received: by 2002:a17:90a:4e08:b0:1ca:7108:439e with SMTP id
 n8-20020a17090a4e0800b001ca7108439emr8635116pjh.27.1649232195875; 
 Wed, 06 Apr 2022 01:03:15 -0700 (PDT)
Received: from localhost.localdomain ([123.129.124.220])
 by smtp.gmail.com with ESMTPSA id
 u126-20020a637984000000b0038147b4f53esm15400075pgc.93.2022.04.06.01.03.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 01:03:15 -0700 (PDT)
From: Brook Q <brook.qin@gmail.com>
To: wireguard@lists.zx2c4.com
Cc: Brook Q <brook.qin@gmail.com>
Subject: [PATCH 1/1] UI: macOS: move tunnel peers ip to submenus
Date: Wed,  6 Apr 2022 16:01:10 +0800
Message-Id: <20220406080110.8705-2-brook.qin@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220406080110.8705-1-brook.qin@gmail.com>
References: <20220406080110.8705-1-brook.qin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 21 Apr 2022 23:48:42 +0000
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

Sometimes allowdIPs as a string is too long as menu title, maybe convert to submenu list is better.
---
 Sources/WireGuardApp/Base.lproj/Localizable.strings |  1 +
 Sources/WireGuardApp/UI/macOS/StatusMenu.swift      | 13 ++++++++++---
 Sources/WireGuardApp/de.lproj/Localizable.strings   |  1 +
 Sources/WireGuardApp/fa.lproj/Localizable.strings   |  1 +
 Sources/WireGuardApp/fi.lproj/Localizable.strings   |  1 +
 Sources/WireGuardApp/fr.lproj/Localizable.strings   |  1 +
 Sources/WireGuardApp/it.lproj/Localizable.strings   |  1 +
 Sources/WireGuardApp/ja.lproj/Localizable.strings   |  1 +
 Sources/WireGuardApp/pa.lproj/Localizable.strings   |  1 +
 Sources/WireGuardApp/pl.lproj/Localizable.strings   |  1 +
 Sources/WireGuardApp/ro.lproj/Localizable.strings   |  1 +
 Sources/WireGuardApp/ru.lproj/Localizable.strings   |  1 +
 Sources/WireGuardApp/sl.lproj/Localizable.strings   |  1 +
 Sources/WireGuardApp/tr.lproj/Localizable.strings   |  1 +
 .../WireGuardApp/zh-Hans.lproj/Localizable.strings  |  1 +
 .../WireGuardApp/zh-Hant.lproj/Localizable.strings  |  1 +
 16 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/Sources/WireGuardApp/Base.lproj/Localizable.strings b/Sources/WireGuardApp/Base.lproj/Localizable.strings
index 40023ec..3db7659 100644
--- a/Sources/WireGuardApp/Base.lproj/Localizable.strings
+++ b/Sources/WireGuardApp/Base.lproj/Localizable.strings
@@ -301,6 +301,7 @@
 
 // Mac status bar menu / pulldown menu / main menu
 
+"macMenuNetworks" = "Networks";
 "macMenuNetworks (%@)" = "Networks: %@";
 "macMenuNetworksNone" = "Networks: None";
 
diff --git a/Sources/WireGuardApp/UI/macOS/StatusMenu.swift b/Sources/WireGuardApp/UI/macOS/StatusMenu.swift
index 6cd00a4..b74877d 100644
--- a/Sources/WireGuardApp/UI/macOS/StatusMenu.swift
+++ b/Sources/WireGuardApp/UI/macOS/StatusMenu.swift
@@ -107,12 +107,19 @@ class StatusMenu: NSMenu {
             networksMenuItem.title = ""
             networksMenuItem.isHidden = true
         } else {
-            let allowedIPs = tunnel.tunnelConfiguration?.peers.flatMap { $0.allowedIPs }.map { $0.stringRepresentation }.joined(separator: ", ") ?? ""
-            if !allowedIPs.isEmpty {
-                networksMenuItem.title = tr(format: "macMenuNetworks (%@)", allowedIPs)
+			networksMenuItem.submenu?.items.removeAll()
+            let allowedIPs = tunnel.tunnelConfiguration?.peers.flatMap { $0.allowedIPs }.map { $0.stringRepresentation } ?? []
+			if allowedIPs.count > 0 {
+                networksMenuItem.title = tr("macMenuNetworks")
+				allowedIPs.forEach { ip in
+					let networkSubItem = NSMenuItem(title: ip, action: nil, keyEquivalent: "")
+					networkSubItem.isEnabled = false
+					networksMenuItem.submenu?.addItem(networkSubItem)
+				}
             } else {
                 networksMenuItem.title = tr("macMenuNetworksNone")
             }
+			networksMenuItem.isEnabled = (networksMenuItem.submenu?.items.count ?? 0) > 0
             networksMenuItem.isHidden = false
         }
         deactivateMenuItem.isHidden = tunnel.status != .active
diff --git a/Sources/WireGuardApp/de.lproj/Localizable.strings b/Sources/WireGuardApp/de.lproj/Localizable.strings
index ffcb429..2f0ee1d 100644
--- a/Sources/WireGuardApp/de.lproj/Localizable.strings
+++ b/Sources/WireGuardApp/de.lproj/Localizable.strings
@@ -291,6 +291,7 @@
 
 // Mac status bar menu / pulldown menu / main menu
 
+"macMenuNetworks" = "Netzwerke";
 "macMenuNetworks (%@)" = "Netzwerke:%@";
 "macMenuNetworksNone" = "Keine Netzwerke.";
 
diff --git a/Sources/WireGuardApp/fa.lproj/Localizable.strings b/Sources/WireGuardApp/fa.lproj/Localizable.strings
index 43bd393..6cfda75 100644
--- a/Sources/WireGuardApp/fa.lproj/Localizable.strings
+++ b/Sources/WireGuardApp/fa.lproj/Localizable.strings
@@ -235,6 +235,7 @@
 
 // Mac status bar menu / pulldown menu / main menu
 
+"macMenuNetworks" = "شبکه‌ها";
 "macMenuNetworks (%@)" = "شبکه‌ها: %@";
 "macMenuNetworksNone" = "شبکه‌ها: هیچی";
 
diff --git a/Sources/WireGuardApp/fi.lproj/Localizable.strings b/Sources/WireGuardApp/fi.lproj/Localizable.strings
index b359675..6600f3c 100644
--- a/Sources/WireGuardApp/fi.lproj/Localizable.strings
+++ b/Sources/WireGuardApp/fi.lproj/Localizable.strings
@@ -244,6 +244,7 @@
 
 // Mac status bar menu / pulldown menu / main menu
 
+"macMenuNetworks" = "Verkot";
 "macMenuNetworks (%@)" = "Verkot: %@";
 "macMenuNetworksNone" = "Verkot: Ei mitään";
 
diff --git a/Sources/WireGuardApp/fr.lproj/Localizable.strings b/Sources/WireGuardApp/fr.lproj/Localizable.strings
index aeeed29..335d061 100644
--- a/Sources/WireGuardApp/fr.lproj/Localizable.strings
+++ b/Sources/WireGuardApp/fr.lproj/Localizable.strings
@@ -291,6 +291,7 @@
 
 // Mac status bar menu / pulldown menu / main menu
 
+"macMenuNetworks" = "Réseaux";
 "macMenuNetworks (%@)" = "Réseaux: %@";
 "macMenuNetworksNone" = "Réseaux: Aucun";
 
diff --git a/Sources/WireGuardApp/it.lproj/Localizable.strings b/Sources/WireGuardApp/it.lproj/Localizable.strings
index 68acfc2..14a74c6 100644
--- a/Sources/WireGuardApp/it.lproj/Localizable.strings
+++ b/Sources/WireGuardApp/it.lproj/Localizable.strings
@@ -291,6 +291,7 @@
 
 // Mac status bar menu / pulldown menu / main menu
 
+"macMenuNetworks" = "Reti";
 "macMenuNetworks (%@)" = "Reti: %@";
 "macMenuNetworksNone" = "Reti: nessuna";
 
diff --git a/Sources/WireGuardApp/ja.lproj/Localizable.strings b/Sources/WireGuardApp/ja.lproj/Localizable.strings
index be5d30b..c729a88 100644
--- a/Sources/WireGuardApp/ja.lproj/Localizable.strings
+++ b/Sources/WireGuardApp/ja.lproj/Localizable.strings
@@ -291,6 +291,7 @@
 
 // Mac status bar menu / pulldown menu / main menu
 
+"macMenuNetworks" = "ネットワーク";
 "macMenuNetworks (%@)" = "ネットワーク: %@";
 "macMenuNetworksNone" = "ネットワーク: なし";
 
diff --git a/Sources/WireGuardApp/pa.lproj/Localizable.strings b/Sources/WireGuardApp/pa.lproj/Localizable.strings
index 54cef5f..76dbc64 100644
--- a/Sources/WireGuardApp/pa.lproj/Localizable.strings
+++ b/Sources/WireGuardApp/pa.lproj/Localizable.strings
@@ -291,6 +291,7 @@
 
 // Mac status bar menu / pulldown menu / main menu
 
+"macMenuNetworks" = "ਨੈੱਟਵਰਕ";
 "macMenuNetworks (%@)" = "ਨੈੱਟਵਰਕ: %@";
 "macMenuNetworksNone" = "ਨੈੱਟਵਰਕ: ਕੋਈ ਨਹੀਂ";
 
diff --git a/Sources/WireGuardApp/pl.lproj/Localizable.strings b/Sources/WireGuardApp/pl.lproj/Localizable.strings
index 550344a..dddca13 100644
--- a/Sources/WireGuardApp/pl.lproj/Localizable.strings
+++ b/Sources/WireGuardApp/pl.lproj/Localizable.strings
@@ -291,6 +291,7 @@
 
 // Mac status bar menu / pulldown menu / main menu
 
+"macMenuNetworks" = "Sieci";
 "macMenuNetworks (%@)" = "Sieci: %@";
 "macMenuNetworksNone" = "Sieci: brak";
 
diff --git a/Sources/WireGuardApp/ro.lproj/Localizable.strings b/Sources/WireGuardApp/ro.lproj/Localizable.strings
index 0b0843f..53ec584 100644
--- a/Sources/WireGuardApp/ro.lproj/Localizable.strings
+++ b/Sources/WireGuardApp/ro.lproj/Localizable.strings
@@ -291,6 +291,7 @@
 
 // Mac status bar menu / pulldown menu / main menu
 
+"macMenuNetworks" = "Rețele";
 "macMenuNetworks (%@)" = "Rețele: %@";
 "macMenuNetworksNone" = "Rețele: niciuna";
 
diff --git a/Sources/WireGuardApp/ru.lproj/Localizable.strings b/Sources/WireGuardApp/ru.lproj/Localizable.strings
index aa18919..906a938 100644
--- a/Sources/WireGuardApp/ru.lproj/Localizable.strings
+++ b/Sources/WireGuardApp/ru.lproj/Localizable.strings
@@ -291,6 +291,7 @@
 
 // Mac status bar menu / pulldown menu / main menu
 
+"macMenuNetworks" = "Сети";
 "macMenuNetworks (%@)" = "Сети: %@";
 "macMenuNetworksNone" = "Сети отсутствуют";
 
diff --git a/Sources/WireGuardApp/sl.lproj/Localizable.strings b/Sources/WireGuardApp/sl.lproj/Localizable.strings
index b57da97..36ff8e7 100644
--- a/Sources/WireGuardApp/sl.lproj/Localizable.strings
+++ b/Sources/WireGuardApp/sl.lproj/Localizable.strings
@@ -291,6 +291,7 @@
 
 // Mac status bar menu / pulldown menu / main menu
 
+"macMenuNetworks" = "Omrežja";
 "macMenuNetworks (%@)" = "Omrežja: %@";
 "macMenuNetworksNone" = "Ni omrežij";
 
diff --git a/Sources/WireGuardApp/tr.lproj/Localizable.strings b/Sources/WireGuardApp/tr.lproj/Localizable.strings
index 537d28c..be52bb5 100644
--- a/Sources/WireGuardApp/tr.lproj/Localizable.strings
+++ b/Sources/WireGuardApp/tr.lproj/Localizable.strings
@@ -291,6 +291,7 @@
 
 // Mac status bar menu / pulldown menu / main menu
 
+"macMenuNetworks" = "Ağlar";
 "macMenuNetworks (%@)" = "Ağlar: %@";
 "macMenuNetworksNone" = "Ağlar: Yok";
 
diff --git a/Sources/WireGuardApp/zh-Hans.lproj/Localizable.strings b/Sources/WireGuardApp/zh-Hans.lproj/Localizable.strings
index 1f97382..557b492 100644
--- a/Sources/WireGuardApp/zh-Hans.lproj/Localizable.strings
+++ b/Sources/WireGuardApp/zh-Hans.lproj/Localizable.strings
@@ -291,6 +291,7 @@
 
 // Mac status bar menu / pulldown menu / main menu
 
+"macMenuNetworks" = "网络";
 "macMenuNetworks (%@)" = "网络：%@";
 "macMenuNetworksNone" = "网络：无";
 
diff --git a/Sources/WireGuardApp/zh-Hant.lproj/Localizable.strings b/Sources/WireGuardApp/zh-Hant.lproj/Localizable.strings
index 5aef8b4..a526d5a 100644
--- a/Sources/WireGuardApp/zh-Hant.lproj/Localizable.strings
+++ b/Sources/WireGuardApp/zh-Hant.lproj/Localizable.strings
@@ -176,6 +176,7 @@
 "alertUnableToWriteLogTitle" = "Log export failed";
 "alertInvalidPeerMessagePublicKeyRequired" = "Peer’s public key is required";
 "macMenuNetworksNone" = "Networks: None";
+"macMenuNetworks" = "Networks";
 "tunnelOnDemandSSIDsKey" = "SSIDs";
 "alertCantOpenOutputZipFileForWritingMessage" = "Could not open zip file for writing.";
 "logViewTitle" = "Log";
-- 
2.32.0 (Apple Git-132)

