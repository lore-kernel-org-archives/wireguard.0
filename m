Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AC62CA5FFD
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Oct 2026 11:35:54 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 948cac6f;
	Mon, 5 Oct 2026 07:00:39 +0000 (UTC)
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 571fa602
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 31 Aug 2026 07:15:54 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-482e2fdf5abso1370560f8f.2
 for <wireguard@lists.zx2c4.com>; Mon, 31 Aug 2026 00:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788160554; x=1788765354; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=0LHdCMVshoJPDdj4jRprhs0nqzL/c/TvlElJONknoCA=;
 b=nz5cYMNX+QNJfhOtn/UrzgfiuvMcgkgOuGZ4nQW1R/69WGMXwGzvIQWulW2YzOLTin
 LXbbqVvB0aZY85M+4dWINRpo6MV1ZWJtmGDmZBJVVbbVtT2XVRnOtVFeJHp/+b9ETtsG
 21NhJWo8c0ICJMYX/3cMIcILYMOKAPZJlkqJxCT4qKu4TJPdv9pQb7Bg6QV2eehEdhB+
 o8N8cyScBWbKofVjcZGvha0zQnarni9MPFE92riGl2VcpNE2FHDow3RkqQcr80bKHZ5L
 84ytK8+sOV3OyPlk08VQb6PQx9l7WslvSqCt42RJvBKJt7KINEMRZROk4imz9jGPE46u
 HftQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788160554; x=1788765354;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=0LHdCMVshoJPDdj4jRprhs0nqzL/c/TvlElJONknoCA=;
 b=C9WlM9AIXfiK1poJgTtEPvAJ2IKNZLs+rklANJGNn/jg8SRvjHoydwP+FQ+J6kVvPm
 X8TdyRdRNmZ7tyLIoLCs6e9oFJgiufYIhZo2eGVuKK10FC3JFcdSabzIbWPdvR30JTxX
 Kv0YHkwnq7uIUHA/YhLjQ0W4N+G2ZDdj4RMg3TgRaD+Qm5LvXiwL+N+ec1H+dBf/FEhA
 E1ha3lk42zGBBCJxLAzOhJZqmBgasz0pIQI24S1u/D0ZCLyCv24B6WzQByk8sybzs4Hj
 cxBPXmcFIRi60Gh2oJx+gVq97eH6CJIVgKCWisTrx6kLonNAmc2SshkCSWEgYgwZiBrm
 aahQ==
X-Gm-Message-State: AFuF++lf2i4Wavvbqhcc2u6aK6y2b9I70wIU+yVKWnD9wtoodrb04L2e
 6SCv6K0c0we8DjDwgreyepwOr7MIkU3VZBUhenlj3efac4Ae9HxWKbFj
X-Gm-Gg: AYBFou2QFHuRRKctRPv/zqrLMg3yRBplIcpgqOdZDCOPv97FkBvpHKhIQF9LXvKWYEJ
 ilXGrCYcm6CJqrhmT+nyHRCBTnvunEiA98G85opCp9uuSLaAkxq5F2CGYJEJ2GgNEJXFZmGeS1Z
 LVZQSe0ENedKIphzk0UdGs4n1smGL28H8vplMIFUuG6zztfapM0LZnnr3ahwcd7NG4Aeu2mEMgF
 ZBHYFGDP5nTMK2Dx/79CgVQbPVjvXPtcCOQs5EwbV7+OzlBOiAY31h5p3DRcq6CJnqpIVCQSSeP
 T9ihhOlggrlnd1afsY1MzfLv+avcLtBfhtWopm85kNhr8bU81wSyM3gw9f0Y1HJhCX5OWQHRZ+5
 MXiXByJclaCP12dp2YkBpsK36Gut3aMxqDGpzJooyFNDRDusqGjitm/Qo0ubigChunLfhkkNJEY
 tmhx3q2rpFAgm/AYQqUfHiXsW954GnzmE5TnMOBCe+C/jHIOSHfNdW3op7bVSgkrUnyhE7Ox0Qe
 TWwFw6pl80fwKM550H9lqBm
X-Received: by 2002:a05:6000:4693:b0:482:f5f6:d253 with SMTP id
 ffacd0b85a97d-482f79b0528mr29396309f8f.12.1788160553599; 
 Mon, 31 Aug 2026 00:15:53 -0700 (PDT)
Received: from localhost.localdomain ([79.118.195.86])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482fbab3f3asm21026885f8f.3.2026.08.31.00.15.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 31 Aug 2026 00:15:52 -0700 (PDT)
From: Razvan Cremenescu <razvan.cremenescu@gmail.com>
To: "Jason A . Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com, Razvan Cremenescu <razvan.cremenescu@gmail.com>
Subject: [RESEND PATCH wireguard-apple 08/10] macOS: activate the app before
 showing a modal alert without a window
Date: Mon, 31 Aug 2026 10:15:35 +0300
Message-ID: <20260831071537.12966-9-razvan.cremenescu@gmail.com>
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

WireGuard runs as a menu bar accessory app. When an error alert has no
source window to attach to as a sheet - e.g. an activation failure
while the Manage Tunnels window is closed - it falls back to
NSAlert.runModal(). Shown while the app is inactive, the modal window
comes up behind everything with no way to reach it, and the modal loop
freezes the whole app until it is dismissed. Activate the app first so
the alert is actually visible.

Signed-off-by: Razvan Cremenescu <razvan.cremenescu@gmail.com>
---
 Sources/WireGuardApp/UI/macOS/ErrorPresenter.swift | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Sources/WireGuardApp/UI/macOS/ErrorPresenter.swift b/Sources/WireGuardApp/UI/macOS/ErrorPresenter.swift
index dbab027..b3884ff 100644
--- a/Sources/WireGuardApp/UI/macOS/ErrorPresenter.swift
+++ b/Sources/WireGuardApp/UI/macOS/ErrorPresenter.swift
@@ -16,6 +16,11 @@ class ErrorPresenter: ErrorPresenterProtocol {
                 onDismissal?()
             }
         } else {
+            // WireGuard runs as a menu bar (accessory) app, which is usually
+            // not the active app. A modal alert shown while inactive comes up
+            // behind other windows with no way to reach it, freezing the app
+            // until it is dismissed. Activate first so the alert is visible.
+            NSApp.activate(ignoringOtherApps: true)
             alert.runModal()
             onDismissal?()
         }
-- 
2.50.1 (Apple Git-155)

