Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA849CA6003
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Oct 2026 11:15:46 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 3ef4b212;
	Mon, 5 Oct 2026 07:00:18 +0000 (UTC)
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id e24a2e96
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 25 Jul 2026 21:39:21 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-47640541585so911493f8f.1
 for <wireguard@lists.zx2c4.com>; Sat, 25 Jul 2026 14:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785015561; x=1785620361; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=0LHdCMVshoJPDdj4jRprhs0nqzL/c/TvlElJONknoCA=;
 b=rhRpBSH9+uuw+fFVMRqb7leC0lNoWYNIgsSrx3rE8pO0w/Sr4B1AGxaF+rAi0zwJqd
 B+JTJUHnH/gTaOpeUqVptSr72Pvxc38NZ0kXBJiM8//F3Z8keMbPHEKhnfVvGexeGdqI
 y0TcdzBN6S87BuSiA6gbr1L3C7LpZFTtfp1HWsZ5P0Iv4pX4Lxgx8R5Otm0PAmfiB3Fg
 itrcrGFDsyjP7tC/JcwRu+dZf46ZKo3kIxN45h6RuS1FysuhLt4++Ol8hQemq287Y3TS
 ROGiMyGqBIc5uxkJgh07zCDUNF6BvyxHzElexzeLZicYbbbbsXz0Oc421yFVZZaiebLt
 /nyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785015561; x=1785620361;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=0LHdCMVshoJPDdj4jRprhs0nqzL/c/TvlElJONknoCA=;
 b=dTLeGzmzzolnjiOf9DdgzT4z1327aripeI6633qKvLhq6LJiDe2IYop3TLhE+ban0L
 jPibDJMrC4Ml6TFaNI6i0HXiscyNLhee/pIeGWZLjjmWXoDGMYQnnjCtJ363dGYEcfJS
 9xRgg4ICD4ojL5h+ocgWTh3CO7jQdPOAwNvB1PeqI3RjO5K3h+7HOb/MkOzwCS+TVNoy
 irJPrAofyj36AFm1XuWVpetAfOGPv7cCQtDmwFGv57ZdylmtukyA9E6PuyuWL8cn7aOg
 RK72/x4FkhY+wbq0wgzug/E+kKmTH8UWZaHZ9ocen2YncL+2DihrrVbpXtQtLoqip+wv
 KccQ==
X-Gm-Message-State: AOJu0YzdF9ofnRe5Ao1K4EOE2J7/8QfFClW435PWxR04GP77y70iGBDf
 XFTzHXGxNb6llxNdiqz9h3WyZ8COeBFaNh4YwrU0wBRRepSK1WZLAAfZJ0z+LbCx
X-Gm-Gg: AR+sD12GbRBiYKSJjr+M9mtloO/AtmNcoz+cbaGs65u2JuCmZsv89Vx+GqEwHMU1b+E
 VUpJtqe1tKxhuSPAPjdJhk4F5MeV3T0k2CU6ArRrvwLspbGypovv4Odd6lR9sdFG5VLECVcvb8e
 CaM0Yzr19Q57ZET2K6HTmPelNWRSItFx36e+7W/QVuHkaXtMksIA31EOGBeexSaZub22Wl+GYR+
 4q5RO7V+oJvgfjdSL4jAWcvWsEhRc2/Ffdlw4pjUmuhbUHfc7rZTj1Z8y0mQ4bbgFvJJS+XMF88
 9D9N832AJELUqqV7yuOMg880ABWmXQYd9FDEAeqkzkeyelxBB2wlwSr/KpebakbCGxvxGbmcz9M
 o9ev6Pv9I4tLya2/tFdOZJ/TH3hWgoU2mv7jnhwmRQmvRJOVyU4jzra9ZIcFiIEvm/tNN+Kbwqb
 K48tXkxcr+9hC7fUCfE6eg3dgNEkA9wwzjpKFI7FA=
X-Received: by 2002:a5d:5f45:0:b0:47f:9260:4bc9 with SMTP id
 ffacd0b85a97d-47f9feb51fcmr4485279f8f.29.1785015561003; 
 Sat, 25 Jul 2026 14:39:21 -0700 (PDT)
Received: from localhost.localdomain ([79.118.195.86])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f85b9a5c4sm34770208f8f.8.2026.07.25.14.39.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 25 Jul 2026 14:39:20 -0700 (PDT)
From: Razvan Cremenescu <razvan.cremenescu@gmail.com>
To: "Jason A . Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com, Razvan Cremenescu <razvan.cremenescu@gmail.com>
Subject: [PATCH wireguard-apple 1/2] macOS: activate the app before showing a
 modal alert without a window
Date: Sun, 26 Jul 2026 00:39:17 +0300
Message-ID: <20260725213918.45422-1-razvan.cremenescu@gmail.com>
X-Mailer: git-send-email 2.50.1
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

