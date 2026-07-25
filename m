Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B863ECA6006
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Oct 2026 11:15:49 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 62aabc6f;
	Mon, 5 Oct 2026 07:00:22 +0000 (UTC)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 8ca2f61c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 25 Jul 2026 21:39:23 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-47f97d310caso1035068f8f.2
 for <wireguard@lists.zx2c4.com>; Sat, 25 Jul 2026 14:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785015563; x=1785620363; darn=lists.zx2c4.com;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=jjC2Wh500hgHI9OXH1J0PhZjji+iG2Ay5fHL06LUnVo=;
 b=GzCnLPq2VgdZsN3YYlUYfhKFb3J9BviGHVtyH8eGbEpaQ8U0qysln4b2eiOViE6yHu
 7zkBmBaydoXHDaCzYTtKeQrds4rncFFzecLAIVvz8iSBS+Vdk+oA3t15DJnXN7G7Sa26
 liydc4LBfXVCn2rLzU8UFQs4fpiAfgkTUHoZGYuaIQ7LKjZY7k5tkWFkjVjbtstGALD0
 y4E/X7vmgwPq9Ejm/Y1Ezsw8iYpxbzAwzQ/uCmR6ftDtFBU689RsaYdyuY7zNb90RAz+
 E5ICU9qPImNad7BSHDu/wZK8DauSzt7yiGXmBoQ0nXh16xTp4hI4cXF8wQtcrDy2Z05/
 eDOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785015563; x=1785620363;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=jjC2Wh500hgHI9OXH1J0PhZjji+iG2Ay5fHL06LUnVo=;
 b=VDoE4VL/Ho5O0TrKpiWr+C1nok0OEk9syCRPQEZBw4Jqh4edxqksUmJmxM/iO6yZHQ
 2tS6e0pn2CfGYFEXmToC7eEJGKNkuCR87VcsuPph4nZG8OqHua/6UzQRCCvFz0r52rIm
 c6kFX+wVyzSGA32FoHsSmdqS+0q6u2lHGLn9Qld9olBKUtYhPusDQIS48hq8lsUdxbI3
 6dE+4Kyt3XJnokdICA0T1Xqk1IISYxuh3BkwRLvU120h2AOLJUT0wC+hk6NADnOxEWug
 1Cd6qvlJJ1uVxvEZ7xgCmE0t33N8JIf25aalYolzUgoUayfjhEnyPOdANGXu5QbrPsL1
 epxw==
X-Gm-Message-State: AOJu0YxNGE6Uv+8ErZL/kzjmJhy3O/WP7lB4i/a8ZerYPySmb9RFEW+P
 7f8igPOV+aqnKWLXs/SOSnqXTwFmXewqF1V735HQDkxMvb90RqnOfOLc0bc+bh6P
X-Gm-Gg: AR+sD10ukHU9EiGh6hwkzs4yIJF7UqEMrL9WPOUjxB4FyWtc+TYzmqGLXoFWutxMIOv
 dIkfaNv0n+jhniyaDUsv7kx8fs80L7JYsvQy6mMvmcto8+kp3MKaHwe49CiLROVLpD9E/qcAbnd
 +UJvVifVAkXyqO6MaPlee/JSd2Gesgo1YgHyFXN4oBucl44W0zutUO6rJaUkbzoQjgcrSi1iW8t
 8voMsm9DIr3K0yF3RuFqlPeb/MlJUGepO4RXxaY/m6fr50a5nsyxN1tDd2NpKgXmJ9g1a1J3K0W
 cphVKQbiNbCxTR0zGnK7HHCiPLAPVpZtOD6Uuc6qcWBTJtvm5+CXEmoe52CyTsZPstZoN4cXqZM
 VJGHfnqhMZPqiTpXP6qqL7c8W6NPnAyDtfL9BXVs2Anwa5ZFFMiWGvKC/7eSVgsME97VV4efuJ6
 Mi6oz0jvuwXNA1pGfrIUWgVyO9KAHLvmy0WkT7r38/0atDLq8CbQ==
X-Received: by 2002:a05:6000:613:b0:47f:8b9e:f44e with SMTP id
 ffacd0b85a97d-47f9fc89aa1mr3846737f8f.12.1785015563261; 
 Sat, 25 Jul 2026 14:39:23 -0700 (PDT)
Received: from localhost.localdomain ([79.118.195.86])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f85b9a5c4sm34770208f8f.8.2026.07.25.14.39.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 25 Jul 2026 14:39:21 -0700 (PDT)
From: Razvan Cremenescu <razvan.cremenescu@gmail.com>
To: "Jason A . Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com, Razvan Cremenescu <razvan.cremenescu@gmail.com>
Subject: [PATCH wireguard-apple 2/2] macOS: don't crash opening the editor for
 an unreadable tunnel
Date: Sun, 26 Jul 2026 00:39:18 +0300
Message-ID: <20260725213918.45422-2-razvan.cremenescu@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260725213918.45422-1-razvan.cremenescu@gmail.com>
References: <20260725213918.45422-1-razvan.cremenescu@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

TunnelEditViewController.populateFields() force-unwraps the tunnel's
configuration. When the saved configuration cannot be read - for
instance when its keychain entry is inaccessible - that configuration
is nil and opening the editor traps. Check that the configuration is
readable before presenting the editor and report the failure instead.

Signed-off-by: Razvan Cremenescu <razvan.cremenescu@gmail.com>
---
 Sources/WireGuardApp/Base.lproj/Localizable.strings        | 1 +
 .../ViewController/TunnelDetailTableViewController.swift   | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/Sources/WireGuardApp/Base.lproj/Localizable.strings b/Sources/WireGuardApp/Base.lproj/Localizable.strings
index cacb316..23037ce 100644
--- a/Sources/WireGuardApp/Base.lproj/Localizable.strings
+++ b/Sources/WireGuardApp/Base.lproj/Localizable.strings
@@ -385,6 +385,7 @@
 
 "macAlertNameIsEmpty" = "Name is required";
 "macAlertDuplicateName (%@)" = "Another tunnel already exists with the name ‘%@’.";
+"macAlertCannotReadConfigTitle" = "Unable to read configuration";
 
 "macAlertInvalidLine (%@)" = "Invalid line: ‘%@’.";
 
diff --git a/Sources/WireGuardApp/UI/macOS/ViewController/TunnelDetailTableViewController.swift b/Sources/WireGuardApp/UI/macOS/ViewController/TunnelDetailTableViewController.swift
index 41d2b15..f1526d7 100644
--- a/Sources/WireGuardApp/UI/macOS/ViewController/TunnelDetailTableViewController.swift
+++ b/Sources/WireGuardApp/UI/macOS/ViewController/TunnelDetailTableViewController.swift
@@ -208,6 +208,13 @@ class TunnelDetailTableViewController: NSViewController {
     @objc func handleEditTunnelAction() {
         PrivateDataConfirmation.confirmAccess(to: tr("macViewPrivateData")) { [weak self] in
             guard let self = self else { return }
+            guard self.tunnel.tunnelConfiguration != nil else {
+                // The configuration could not be read (e.g. the keychain entry
+                // is inaccessible). Opening the editor would crash, so report
+                // the failure instead.
+                ErrorPresenter.showErrorAlert(title: tr("macAlertCannotReadConfigTitle"), message: tr("alertTunnelActivationSavedConfigFailureMessage"), from: self)
+                return
+            }
             let tunnelEditVC = TunnelEditViewController(tunnelsManager: self.tunnelsManager, tunnel: self.tunnel)
             tunnelEditVC.delegate = self
             self.presentAsSheet(tunnelEditVC)
-- 
2.50.1 (Apple Git-155)

