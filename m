Return-Path: <SRS0=FiAf=34=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EB9EC35242
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  8 Feb 2020 20:24:13 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 889A321775
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  8 Feb 2020 20:24:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qPYtAMVQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 889A321775
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6dc2029b;
	Sat, 8 Feb 2020 20:22:47 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cbf60d13
 for <wireguard@lists.zx2c4.com>; Sat, 8 Feb 2020 20:22:45 +0000 (UTC)
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b918ae58
 for <wireguard@lists.zx2c4.com>; Sat, 8 Feb 2020 20:22:45 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id g3so1781799wrs.12
 for <wireguard@lists.zx2c4.com>; Sat, 08 Feb 2020 12:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZOst2vz2bC5j7yuXqXgvd+gDk9JFyL+rjn0ePhl/BBY=;
 b=qPYtAMVQII9bFT/ukttakenPzqMmJZ31VUuLoSh0u60SfjcR0Pp9DA8sCy2N2CZXiE
 NQ4VEZkMH9sTCRXtA8ZWocLAbMh8DlZg+nTid+XEijeDvDvVz0a4ayFg0AXE67+TAOAX
 QIHd7baWvc7fiuGicX2WDLaa2mPThEnT0Uba3tFNXAN6HdtJwcbgwB51huiB+V4jKV7B
 aQZNeJLuaYVNlPCnvbpPEKqKdqL2xS9Hp4fnPta8fD5yVSerDhIuP7cqSchJrxhb+9iC
 OkRO4+gyEFrhIYaNGhJSsA6ni2u8sX8sQ3JHix9xWBrm5vkJi90HPta6mCWeNr4AUcS6
 O4yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZOst2vz2bC5j7yuXqXgvd+gDk9JFyL+rjn0ePhl/BBY=;
 b=BPmDqqW2oOUgRnMNresjh8OGbFHBgBcVrt/p4rPhy0ellXuhPW9P27qMprLiB0WzQQ
 rCITvU3J82/q1VeuGh6F+e3NXngpqezwxxM25VCqPN/wJStT6NL5Hygy931Eox5ezJHD
 HvV3y/X7Lw+C3gARlKY7HeojvSDaTh6M5j7rD4JRJ6r+bc3VJGn3xe/PLHi3zhQuARGA
 1wRNSG/cmdmxbEylpVYYSZwjgLdSutJdvYgwtm1ZMSEOSiJxMwgUEs3t+wy0uFg8qDSL
 q/UYR5hxvn+vHD4gBD7YGl7XwcJJprEAnbKgLV94Rb/flpKpAQQPAxdDmcjM6sWczyJu
 bAvA==
X-Gm-Message-State: APjAAAVNu328RQ3N01s/upLGOOWyFJ7U8PILPGL0bojxEZXQfQ4raQ51
 jMsc8g7FIIZ43Q33Gk61Y4A=
X-Google-Smtp-Source: APXvYqxVogdznfWzrHb0qKgL5YUDFSOTNp4vUkXNwffpIVx6PmTkeF0hM8oKGMhPCfQ2Ak22vk6EIQ==
X-Received: by 2002:a5d:62c8:: with SMTP id o8mr6615662wrv.316.1581193445837; 
 Sat, 08 Feb 2020 12:24:05 -0800 (PST)
Received: from localhost.localdomain
 (p2003000601FCB63093D51F0CE694D5FA.dip0.t-ipconnect.de.
 [2003:6:1fc:b630:93d5:1f0c:e694:d5fa])
 by smtp.googlemail.com with ESMTPSA id w7sm8101956wmi.9.2020.02.08.12.24.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2020 12:24:05 -0800 (PST)
From: Kai Haberzettl <khaberz@gmail.com>
To: Jason@zx2c4.com,
	wireguard@lists.zx2c4.com
Subject: [PATCH] Small cleanups in man wg(8)
Date: Sat,  8 Feb 2020 21:23:47 +0100
Message-Id: <20200208202347.23048-1-khaberz@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Signed-off-by: Kai Haberzettl <khaberz@gmail.com>
---
 src/man/wg.8 | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/src/man/wg.8 b/src/man/wg.8
index 27860c8..43ef43c 100644
--- a/src/man/wg.8
+++ b/src/man/wg.8
@@ -40,7 +40,7 @@ Sub-commands that take an INTERFACE must be passed a WireGuard interface.
 Shows current WireGuard configuration and runtime information of specified \fI<interface>\fP.
 If no \fI<interface>\fP is specified, \fI<interface>\fP defaults to \fIall\fP.
 If \fIinterfaces\fP is specified, prints a list of all WireGuard interfaces,
-one per line, and quit. If no options are given after the interface
+one per line, and quits. If no options are given after the interface
 specification, then prints a list of all attributes in a visually pleasing way
 meant for the terminal. Otherwise, prints specified information grouped by
 newlines and tabs, meant to be used in scripts. For this script-friendly display,
@@ -61,7 +61,7 @@ Sets configuration values for the specified \fI<interface>\fP. Multiple
 for a peer, that peer is removed, not configured. If \fIlisten-port\fP
 is not specified, or set to 0, the port will be chosen randomly when the
 interface comes up. Both \fIprivate-key\fP and \fIpreshared-key\fP must
-be a files, because command line arguments are not considered private on
+be files, because command line arguments are not considered private on
 most systems but if you are using
 .BR bash (1),
 you may safely pass in a string by specifying as \fIprivate-key\fP or
@@ -163,8 +163,8 @@ port number. This endpoint will be updated automatically to the most recent
 source IP address and port of correctly authenticated packets from the peer.
 Optional.
 .IP \(bu
-PersistentKeepalive \(em a seconds interval, between 1 and 65535 inclusive, of
-how often to send an authenticated empty packet to the peer for the purpose of keeping a
+PersistentKeepalive \(em a seconds interval, between 1 and 65535 inclusive, how
+often to send an authenticated empty packet to the peer for the purpose of keeping a
 stateful firewall or NAT mapping valid persistently. For example, if the interface
 very rarely sends traffic, but it might at anytime receive traffic from a peer,
 and it is behind NAT, the interface might benefit from having a persistent keepalive
-- 
2.20.1

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
