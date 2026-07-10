Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A47F0CA6001
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Oct 2026 11:15:35 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 7e6bbe53;
	Mon, 5 Oct 2026 06:59:55 +0000 (UTC)
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 6faad9fc
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Jul 2026 13:22:49 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-47ddf7b09aaso621583f8f.3
 for <wireguard@lists.zx2c4.com>; Fri, 10 Jul 2026 06:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783689769; x=1784294569; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=yDZ9eZGpPJXvTlMRLDkc0vxgdxBgtk9UQ5ejfM/SXak=;
 b=kLIA/4OMRYHbeWBSteo5zb5zWVxnQKofZ6WVod0nMEyQuKNUeNhcFbEwYSV3SG6rzy
 CGyJq4lgcCjry68yh9zylz8coYDrhIawS4Qdx+/RV51ON7Z9j59CUcDEvz8Bp3Tl2PPH
 BBA+Fat75u5nvdRVbfnCPh465V+tFow6FmgpIVROFsEXIdChvOx9rOOlVls6RIZJJk5R
 gwNoElDE1rkjSbaQn1ejMngAwNm68cPIPgouCJk+PxLgS73Tx8SNI+sCqmUSDwyP3ToA
 goJ6a4biXtp2aL7rQUASYTlx0cbYKCOoag11fG643zwCnva+coPAUm0oWQs9hdv5YeW8
 BdYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783689769; x=1784294569;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=yDZ9eZGpPJXvTlMRLDkc0vxgdxBgtk9UQ5ejfM/SXak=;
 b=cn+pfVq1ExkBO6u5Zhsn6c+sygaRMLogUn1SvbWo8jPXQxQgQUvQ3r9gWcSIJC7SWr
 QWmTYrDOAGwBnHzWSSMP20x2MJyRgt36NMAyV/2riJSiN73QBgBgEf6qdy0MggQiSJ95
 i4fxO7epByQu+d2Gynqr26I5SK6CSQ8Dr0yLafLRaoS+kl75drDz6Baw5NbaWPZ66EGk
 fYsj75AdJUSEuIV0ixCL10J9Jci0JTpePepeioEjrTLMzooQU+Ys6lQbR/W3ZH4BXEFo
 bPUHl3YO0WBIzH7nJcad7AsO89m58yhVS7qdDrAxgt2PDi1p6B7Nmpv29P7jzeX0zS/2
 iTww==
X-Gm-Message-State: AOJu0YzMxj5F1h4Jb/ozICDREuf2kkKcP3acPhd4gH1JMFclaDeGkheP
 ot2Z9CbPdkOaxXo2yOqPFN8z5RnjrPMPZMGi3XrtDKW3lY6zk3DPl3PL
X-Gm-Gg: AfdE7cmpi3fhK6U+BuMjDZmdIS84TpCQHuaHRMr/FHOTyxAymWUR1PRcg5W9JaRLFdl
 Rp1Ookg6z/il0coM+anvy1hwYGd41RtpTo68sfWGcVWWaSFxB6cHn9t8zZimNV3SNZpfPgnyN8o
 yMWmBr4MKO9FCm0GuQ4n9MlIpdjUCR+l8g/FuqhcZycmCelJF2E6bNPwytirAlbN2he1WWfn00X
 5KoFUUTpOKKeRi8I41VBuOP86uo8frroQ5J8vNaqNYWG4uTuIbugxuy8QBpPZmfR7P5yEo8gsvc
 M61P6vpW3IJcujRjkRdvbDloTOt2UzaIV1iluK+TMjyd7U8/GB5y4In42CwneHOAv/EqpgPE8Xs
 UbWX9f/xQdcLBVvoodwKX8zhXcI6PTIKLKV6e3gIpARJ56qYSUpjuBOCsi49SghiGbl0U/ZcSOk
 dSq5970d7gLR9/iYg/7WrSkLV47Uu87dTcVx4y4UP3wUAXpARUWw==
X-Received: by 2002:a05:6000:26c2:b0:47d:f01d:104b with SMTP id
 ffacd0b85a97d-47df077657cmr12435930f8f.46.1783689769224; 
 Fri, 10 Jul 2026 06:22:49 -0700 (PDT)
Received: from localhost.localdomain ([79.118.195.86])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47aa039bcdasm62653868f8f.21.2026.07.10.06.22.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 10 Jul 2026 06:22:48 -0700 (PDT)
From: Razvan Cremenescu <razvan.cremenescu@gmail.com>
To: "Jason A . Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com, Razvan Cremenescu <razvan.cremenescu@gmail.com>
Subject: [PATCH wireguard-apple 2/7] TunnelsManager: drop the restart intent
 when deactivation is requested
Date: Fri, 10 Jul 2026 16:22:34 +0300
Message-ID: <20260710132242.39814-3-razvan.cremenescu@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260710132242.39814-1-razvan.cremenescu@gmail.com>
References: <20260710132242.39814-1-razvan.cremenescu@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 05 Oct 2026 06:59:44 +0000
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

A tunnel in the .restarting state is automatically reactivated by the
status observer when its connection reaches .disconnected. If the user
asks for deactivation while the restart is still pending, the tunnel
would go down and immediately come back up. Reset the status from the
actual connection status before stopping, so an explicit deactivation
request always wins over a pending restart.

Signed-off-by: Razvan Cremenescu <razvan.cremenescu@gmail.com>
---
 Sources/WireGuardApp/Tunnel/TunnelsManager.swift | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Sources/WireGuardApp/Tunnel/TunnelsManager.swift b/Sources/WireGuardApp/Tunnel/TunnelsManager.swift
index c277f6d..365094e 100644
--- a/Sources/WireGuardApp/Tunnel/TunnelsManager.swift
+++ b/Sources/WireGuardApp/Tunnel/TunnelsManager.swift
@@ -473,6 +473,11 @@ class TunnelsManager {
     func startDeactivation(of tunnel: TunnelContainer) {
         tunnel.isAttemptingActivation = false
         guard tunnel.status != .inactive && tunnel.status != .deactivating else { return }
+        if tunnel.status == .restarting {
+            // The tunnel was going to be restarted on disconnection, but the
+            // user asked for deactivation, so drop the restart intent.
+            tunnel.status = TunnelStatus(from: tunnel.tunnelProvider.connection.status)
+        }
         #if targetEnvironment(simulator)
         tunnel.status = .inactive
         #else
-- 
2.50.1 (Apple Git-155)

