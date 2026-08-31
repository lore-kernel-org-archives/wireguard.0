Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DDBCCA5FFF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Oct 2026 11:35:55 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 0592a05f;
	Mon, 5 Oct 2026 07:00:41 +0000 (UTC)
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 126c7f1d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 31 Aug 2026 07:15:55 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-48436668d20so603824f8f.3
 for <wireguard@lists.zx2c4.com>; Mon, 31 Aug 2026 00:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788160555; x=1788765355; darn=lists.zx2c4.com;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=jjC2Wh500hgHI9OXH1J0PhZjji+iG2Ay5fHL06LUnVo=;
 b=FpX+OsMLsz0eb6F4NVmcKu09LNLLfwbv/JSwojZQtY6XrwK6E1aRWHZRHtH7zt//n/
 IaR2R/4hCW+MIvPTqqL37S7wRJxbdwB2b2KStrkkm/7jpXoVvSwZCm15j+KYNLFSNyZX
 RF998k+xGs/oXS4wxONuc/L0rnw/rtzR1Jde3+dTgihsFu3T5FpMR9iqK6vGKQttU+7j
 enBujXrTHxEXDvhrp6QxiXwOFprZcHyvXwSUaD6GiyMdmoef+gajbf0/FOUpFJoccAzl
 oZTyzzjVc17f3ES4XKWnK3FHJAkwS6uDY2zWCLyemlB6SLnjwyTms4ib6xo479jlGxQE
 TdPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788160555; x=1788765355;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=jjC2Wh500hgHI9OXH1J0PhZjji+iG2Ay5fHL06LUnVo=;
 b=W+KKfi1AuiG5wZyafGNWUzuIpU7Xen30qsPvUvKN2dsNE8xMeX4Q1bwrcxWo95hBbj
 2N340ZcHcIoE4/6XtZRI9TfUB01aAJPOkLqvPJEh5CbdLx0gUF6ZeEwBFKXb10mKqGBW
 1OHrdAf7sVytw4e+3MGkJMMBkv7fASkrGe8CWjs0HGLYq1SE2+EIb+0g9QWfXB8efGp6
 Q5Fwqxovs1SxUrYudVTiFYVMdP8VcMQhKOGo6o9ajFo6YxO2BhAuyJtlJUjVD4XBAQ/s
 8VFE2PivrExS/0b2KZFo/x2JTCRG51Lv3K4QPDPsrOJhroTBugiSFcqq9OEFW4mnrttY
 9TWA==
X-Gm-Message-State: AFuF++lqdFY6axFwkSzoFqRj74alKGE7LkJYp9FnmP6l+Kvln6NlwkqT
 x07rp77zqkbGEi/6jQXnIT1Rh4eWxyftDljLdJxeZsiZtj8bVJxYMOpG
X-Gm-Gg: AYBFou0HZoGOBUnmDbtWcaBhRsfRa2YT3WjC2mJ3JT4ojEEYS60p2iIED3njJuRSTJD
 KlQjmHf16Pq0UIfRAUyK6LV4v8TYkbZV4cphmwJ3eSgZFZ2ZZsGH84JngQzLN+ioWRwKhVlr0b/
 6uYmL87WJ4IDPYc/jA1rTtIjcsUBiLEQ2fSo8vvFWUD7Vd6ickqN5x/f3k41GGrsScsab9Xo3xx
 MM4XiqZvj+yK4CtjWy13EaJDjcounqnQm4Sj8vAk68kl2MTA6jR0vc7JYDv++fWe4H1fNLftjm9
 zIMNL3hlFGRgf4JWC7JmKDIqRtWUx3YBLfMovdOqs/D3Ui4GW5DMW8yHYXEVRA/+sWeqZKuJSFq
 cjZfKBn46E+OUiYJMQTv2e74JhZKffxBsuluV2zrTox4nC80ccoSNvRhmry7oDfwDfTCYEysZe1
 ycNOo9dTSJzluZvos9yrzCnOcvv5xKieuFVdNFvkQAVNWP0+UyrWWmLT5Y/7qTRywfHXoWjVAos
 ZcpqwWm+3e7uEHXcaXXUxexsA==
X-Received: by 2002:a05:6000:41e9:b0:484:3621:6340 with SMTP id
 ffacd0b85a97d-48436216a9bmr16137411f8f.16.1788160554806; 
 Mon, 31 Aug 2026 00:15:54 -0700 (PDT)
Received: from localhost.localdomain ([79.118.195.86])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482fbab3f3asm21026885f8f.3.2026.08.31.00.15.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 31 Aug 2026 00:15:54 -0700 (PDT)
From: Razvan Cremenescu <razvan.cremenescu@gmail.com>
To: "Jason A . Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com, Razvan Cremenescu <razvan.cremenescu@gmail.com>
Subject: [RESEND PATCH wireguard-apple 09/10] macOS: don't crash opening the
 editor for an unreadable tunnel
Date: Mon, 31 Aug 2026 10:15:36 +0300
Message-ID: <20260831071537.12966-10-razvan.cremenescu@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260831071537.12966-1-razvan.cremenescu@gmail.com>
References: <20260831071537.12966-1-razvan.cremenescu@gmail.com>
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

