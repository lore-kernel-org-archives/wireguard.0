Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C5DCCCA473
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Jun 2022 19:12:51 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id c74efa13;
	Thu, 30 Jun 2022 19:12:49 +0000 (UTC)
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com
 [2607:f8b0:4864:20::114a])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id a2843d8a
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Jun 2022 19:12:47 +0000 (UTC)
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-3177608c4a5so1952197b3.14
 for <wireguard@lists.zx2c4.com>; Thu, 30 Jun 2022 12:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=ThcqTcL2EK/v16TPbcx9ACYtX+c6g+PxYAfz/JDcQGs=;
 b=UENhzz+jbEW4l84h8cZMmbOEXYbTwlSXV9VQ8f7rFL0Ztfrqrt5eiMNs9BlnxqiFU1
 kccRNaD4buDLdaXHk8Zo69mr23KsOw5ADWsI0Lf3MnR7O7pR8Jl0ZPC0/DpJc5mfr/63
 cmsnoRfEOdO9sBVUnpj4a4H8QONTMtoBbLQNfpdJ3NZlTQLV8dzxRGxWWewQdQBi4f5R
 plkwj4+Qc4EQgC+HMXYGghTW27hTCxF1JdKHS1ab8tKMcshcTnDg5FwHIB4xOHFI6lIT
 8NkGaAdeVB6UYyjsAafc0Hel3SfbBDnGNdDVbAE/eE4OGZQMdFii3kMiE22vMS7RgV+r
 Gf5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=ThcqTcL2EK/v16TPbcx9ACYtX+c6g+PxYAfz/JDcQGs=;
 b=eeoVlrcA7T9egyzGX1LaeSVQ0cllCO2d56NJSxnzxygPLz3CMwkvZYWAgXkWeKtio0
 Xrfj4A37I29LxiXgvd3atbKLvoTR1T/VrJZXd3mQMbSjHJgWypYzufyXEMF1WzHTcxCg
 W/1i0uPc56824zjrW+49n8qAL/N0ROmLUrQQRlPc2PSo0W6jAMMLwQ0KcFpM7NSHvc+N
 p1eOQfUwgNef9tplErtsZWTyWXi1f0lESEXQEVwUGdQxWNinGPZdsWXPB3bJzfP7hHRW
 QY9FcKbbx9X0OrlbH1PoIoIP2iuG0m95dIKkhgVeq24acv9HZB5lKPeXUW6br0hb9Dza
 UMOQ==
X-Gm-Message-State: AJIora8vVNRoZz341z+bO0NNJ1+0GIkmCtD/U+WgGRHwNvS/kOgjmIQD
 dxQAhET391srz4mzPlVZTs8d0AdkR2VsjHOneA==
X-Google-Smtp-Source: AGRyM1t3Ww7PWb3WFVXoxeowZvFh7zUW/ka0FXdujSxX4keyA44O4mR1BtFfGbDknmo/m4f02C8i2nkEO9Lj5x07PQ==
X-Received: from kaleshsingh.mtv.corp.google.com
 ([2620:15c:211:200:5fd:1939:78ea:dfb2])
 (user=kaleshsingh job=sendgmr) by 2002:a25:9388:0:b0:66d:1fd9:6f73 with SMTP
 id a8-20020a259388000000b0066d1fd96f73mr10731114ybm.147.1656616366313; Thu,
 30 Jun 2022 12:12:46 -0700 (PDT)
Date: Thu, 30 Jun 2022 19:12:29 +0000
Message-Id: <20220630191230.235306-1-kaleshsingh@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
Subject: [PATCH] pm/sleep: Add PM_USERSPACE_AUTOSLEEP Kconfig
From: Kalesh Singh <kaleshsingh@google.com>
To: Jason@zx2c4.com, jstultz@google.com, paulmck@kernel.org, 
 rostedt@goodmis.org, rafael@kernel.org, hch@infradead.org
Cc: saravanak@google.com, tjmercier@google.com, surenb@google.com, 
 kernel-team@android.com, Kalesh Singh <kaleshsingh@google.com>, 
 "Theodore Ts'o" <tytso@mit.edu>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Len Brown <len.brown@intel.com>, 
 Pavel Machek <pavel@ucw.cz>, linux-kernel@vger.kernel.org,
 wireguard@lists.zx2c4.com, 
 netdev@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

Systems that initiate frequent suspend/resume from userspace
can make the kernel aware by enabling PM_USERSPACE_AUTOSLEEP
config.

This allows for certain sleep-sensitive code (wireguard/rng) to
decide on what preparatory work should be performed (or not) in
their pm_notification callbacks.

This patch was prompted by the discussion at [1] which attempts
to remove CONFIG_ANDROID that currently guards these code paths.

[1] https://lore.kernel.org/r/20220629150102.1582425-1-hch@lst.de/

Suggested-by: Jason A. Donenfeld <Jason@zx2c4.com>
Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---
 drivers/char/random.c          |  4 ++--
 drivers/net/wireguard/device.c |  3 ++-
 kernel/power/Kconfig           | 20 ++++++++++++++++++++
 3 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/char/random.c b/drivers/char/random.c
index e3dd1dd3dd22..8c90f535d149 100644
--- a/drivers/char/random.c
+++ b/drivers/char/random.c
@@ -755,8 +755,8 @@ static int random_pm_notification(struct notifier_block *nb, unsigned long actio
 	spin_unlock_irqrestore(&input_pool.lock, flags);
 
 	if (crng_ready() && (action == PM_RESTORE_PREPARE ||
-	    (action == PM_POST_SUSPEND &&
-	     !IS_ENABLED(CONFIG_PM_AUTOSLEEP) && !IS_ENABLED(CONFIG_ANDROID)))) {
+	    (action == PM_POST_SUSPEND && !IS_ENABLED(CONFIG_PM_AUTOSLEEP) &&
+	     !IS_ENABLED(CONFIG_PM_USERSPACE_AUTOSLEEP)))) {
 		crng_reseed();
 		pr_notice("crng reseeded on system resumption\n");
 	}
diff --git a/drivers/net/wireguard/device.c b/drivers/net/wireguard/device.c
index aa9a7a5970fd..d58e9f818d3b 100644
--- a/drivers/net/wireguard/device.c
+++ b/drivers/net/wireguard/device.c
@@ -69,7 +69,8 @@ static int wg_pm_notification(struct notifier_block *nb, unsigned long action, v
 	 * its normal operation rather than as a somewhat rare event, then we
 	 * don't actually want to clear keys.
 	 */
-	if (IS_ENABLED(CONFIG_PM_AUTOSLEEP) || IS_ENABLED(CONFIG_ANDROID))
+	if (IS_ENABLED(CONFIG_PM_AUTOSLEEP) ||
+	    IS_ENABLED(CONFIG_PM_USERSPACE_AUTOSLEEP))
 		return 0;
 
 	if (action != PM_HIBERNATION_PREPARE && action != PM_SUSPEND_PREPARE)
diff --git a/kernel/power/Kconfig b/kernel/power/Kconfig
index a12779650f15..60a1d3051cc7 100644
--- a/kernel/power/Kconfig
+++ b/kernel/power/Kconfig
@@ -143,6 +143,26 @@ config PM_AUTOSLEEP
 	Allow the kernel to trigger a system transition into a global sleep
 	state automatically whenever there are no active wakeup sources.
 
+config PM_USERSPACE_AUTOSLEEP
+	bool "Userspace opportunistic sleep"
+	depends on PM_SLEEP
+	help
+	Notify kernel of aggressive userspace autosleep power management policy.
+
+	This option changes the behavior of various sleep-sensitive code to deal
+	with frequent userspace-initiated transitions into a global sleep state.
+
+	Saying Y here, disables code paths that most users really should keep
+	enabled. In particular, only enable this if it is very common to be
+	asleep/awake for very short periods of time (<= 2 seconds).
+
+	Only platforms, such as Android, that implement opportunistic sleep from
+	a userspace power manager service should enable this option; and not
+	other machines. Therefore, you should say N here, unless you are
+	extremely certain that this is what you want. The option otherwise has
+	bad, undesirable effects, and should not be enabled just for fun.
+
+
 config PM_WAKELOCKS
 	bool "User space wakeup sources interface"
 	depends on PM_SLEEP

base-commit: 03c765b0e3b4cb5063276b086c76f7a612856a9a
-- 
2.37.0.rc0.161.g10f37bed90-goog

