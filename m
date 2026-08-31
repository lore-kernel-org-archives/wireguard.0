Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0178ACA5FCE
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Oct 2026 11:15:56 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id b7f08762;
	Mon, 5 Oct 2026 07:00:33 +0000 (UTC)
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id d56ec264
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 31 Aug 2026 07:15:44 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-47f633e6058so2422151f8f.0
 for <wireguard@lists.zx2c4.com>; Mon, 31 Aug 2026 00:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788160544; x=1788765344; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=yDZ9eZGpPJXvTlMRLDkc0vxgdxBgtk9UQ5ejfM/SXak=;
 b=fy31PI3MaitggQMEsk4ySv9SWYdwhWnmROcUISlyJqXefab6kwtitaRG7sKNoI8+YC
 KXU7FRELMThCehW8KMSVMNRS8k+FQUpE/+TQUDKJMKR+mgjC2jyctXr3AYJgDQSLAszP
 2ZpD0gdQqqKK7aR7kn9UtmWiEQNpQyHIn7OIRwN4pLAxmVRoL1kp/RvBcjFV8e2O6JwU
 JnMJo9369w/H9ZbQG++hbLRTtsRKvt10T+x9oVZRlnUg147EOFWpupJnq75muPaeoKsh
 eYDMfCasIHmMuYk9GvwOa65YR73P05Uz98RyK3tb1mrhj9Ej8NeKg1uDwnYK/lcFzre8
 uWUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788160544; x=1788765344;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=yDZ9eZGpPJXvTlMRLDkc0vxgdxBgtk9UQ5ejfM/SXak=;
 b=jPfM4fSYqLrLBskUWkFYpruTT1YUVkLLSgryBnP0TaxCHdm/71Gf4Ulk3osvIxMLNp
 R9vK0quOSV5qKl4w09+F0XkI5Wr//1DgEcwf2QtzFmTtYWwSxXH31B25DBZLZQJEUT4h
 TnaV0SGz+ri1vKPriLJl3MBGFpqPpkxNw98dE9C6S9c2AgJBQ+Z/FaQpgUu8ShPD+o8s
 fgcfvSJdqQDR3V/7NXNznQvoKK22WCyMno3GWEeZkSRIzcpbzkr++ZBbAZ8F12jt0B1U
 3CdnUQ2f8QE2BCiLVh2DzVB+4y0CP/p35WmVSCdrzHNaa0xu/VIs0NWBm2DVRHNC33X5
 Fotw==
X-Gm-Message-State: AFuF++kQ13JNQeLGCOjNKoA5wGCEBf0NpV/cieBnfPsucsDifstEEZ+Z
 dX1aclqVCQnUYnbiJVkpzCkqtKomYISwb0+d0yeY8rd+99AOPsgk58dF
X-Gm-Gg: AYBFou1Es251rhGpQFRFz1wV0yxAyFhLZBCiFAG9fsUNq9FGxIHkgeDAA02jheL38Qg
 ODvc8Fo1WqqCVWCTygtNknl2rShc/FLu44pmwVTYgeCxfqAZxG3eTux7xrgHE5seu06XNcEiFSv
 NKd8YqQqJtsSAnDn4OPESzAhTsMxYPve81pwp5XGmX7hzJ4z1OpJFuw98kMWwknlxbu4csmjIKs
 Bk8w46rTxNFbBpx8fVqsG3VZuc4wbYJOfTNimvGskXk5Ig4rJ43YHaOGB8beGg6qig4H5aWert8
 LCyZ2bmQtbp+Ap/+yUicQHu7lFClokzfR0ZYMNTrunBmTJBVLc+xN0L0B5Q+dcnuwXEXb/8jxSY
 udR9maJZA6oSfUksgg9l0TscbnaTsOzCuUW94B0up1a4pXQvizE5L6ytwDRy4Ldjmg+88wHMBHf
 1zcADkkDAIhfocJlOplYo1oHcVNX9plxuKe7iUrBNLIWoY58viB0DR3Q7r3SkQnPFpNoxjmdwEp
 bmjAgNyaYTe7KmkQI4T2cIt
X-Received: by 2002:a05:6000:40dd:b0:482:e4bc:51b3 with SMTP id
 ffacd0b85a97d-482f799da20mr34856400f8f.1.1788160543921; 
 Mon, 31 Aug 2026 00:15:43 -0700 (PDT)
Received: from localhost.localdomain ([79.118.195.86])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482fbab3f3asm21026885f8f.3.2026.08.31.00.15.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 31 Aug 2026 00:15:43 -0700 (PDT)
From: Razvan Cremenescu <razvan.cremenescu@gmail.com>
To: "Jason A . Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com, Razvan Cremenescu <razvan.cremenescu@gmail.com>
Subject: [RESEND PATCH wireguard-apple 02/10] TunnelsManager: drop the restart
 intent when deactivation is requested
Date: Mon, 31 Aug 2026 10:15:29 +0300
Message-ID: <20260831071537.12966-3-razvan.cremenescu@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260831071537.12966-1-razvan.cremenescu@gmail.com>
References: <20260831071537.12966-1-razvan.cremenescu@gmail.com>
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

