Return-Path: <SRS0=Ew3a=2R=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4BAEC2D0C3
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 27 Dec 2019 05:11:45 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F360206CB
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 27 Dec 2019 05:11:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K7zJrHnV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F360206CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 160eca75;
	Fri, 27 Dec 2019 05:11:27 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id efc66bd4
 for <wireguard@lists.zx2c4.com>;
 Fri, 27 Dec 2019 03:36:27 +0000 (UTC)
Received: from mail-yw1-xc29.google.com (mail-yw1-xc29.google.com
 [IPv6:2607:f8b0:4864:20::c29])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8d8a053a
 for <wireguard@lists.zx2c4.com>;
 Fri, 27 Dec 2019 03:36:27 +0000 (UTC)
Received: by mail-yw1-xc29.google.com with SMTP id h126so10888185ywc.6
 for <wireguard@lists.zx2c4.com>; Thu, 26 Dec 2019 19:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kDbW70ZP0KLPOA2stSJ84AofqXApPi5TrE5Cn4TAUJM=;
 b=K7zJrHnVhtE4gI3gG1S8QfJ1pO5FwHxbwvNsdD1n7Xwa7lGZ7ewrdQ0uXx9Xa/zL8H
 gr7r1HAMzChcg+b/pQU5kU0GEZhqobN1/PVNbug4dG/E3woaBP1yYV8IUuJuqgUIMGW3
 7jk36f4YyT/VB1w7Xqj8rB89TO+qqWmMXb8bihZ9VAarSPVd9CH9qdGfwOYKcVXyuMoh
 HZgq2lTq4T++lqCbJiGggqRmH6XAyetHhYjytfw0F/fc3WJ1JkjR2JpBYyBligt1Bj79
 /uI6564dPmO3JacGKR0ZeaC8A5rLWCDv+QEfaaZVJNfU+wYQ5l/5aIYfAsCTpgqKUtfi
 lbKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kDbW70ZP0KLPOA2stSJ84AofqXApPi5TrE5Cn4TAUJM=;
 b=CQ/urK7nf+paIB7OA9j4Kw86uzOmieFHD1r9TpIcThh/i17o4YSTsgQeQSiDkBlhXl
 IoLU11PIRBvEfrjryUhbrRlyBdXHoUto2Uy1V9cezm0ZjsxI7apMOfNesfk7Uu+ccx0Y
 /Aen6ddj8QlgrPxyfMLVsYKk6UQ8LtybrecVqSgP3qZcYsuRchNQeWqKYjc6ZzUPXuXe
 N4m2ssPN/zgmwIhwEHFrzwpEIHBVX1swV55GecrzIsprx7jUSogHSMWnrXHi7WvHJtZP
 2WaZTs8dJVi5I2WRLYs5n/+5D+jVzpf13crniSSM3Me7tOlNyYaN19NdrGzBUNEwztT+
 AKhw==
X-Gm-Message-State: APjAAAWHC9bFMtJ69wzK5rLrhVK4t9Hir7s9w8PKS6lJ7Vu0P+4lKs5T
 5LAH9AS6Afsl6GsbJUrtImJy/Pb+aA==
X-Google-Smtp-Source: APXvYqyUBvbsDtf/ejaRykCEWVHYtkZAq/dnpQhH48nwPmVhySUYREAudpzAuD1uHlavVDMPcSn3Vw==
X-Received: by 2002:a81:1913:: with SMTP id 19mr36785741ywz.17.1577417785987; 
 Thu, 26 Dec 2019 19:36:25 -0800 (PST)
Received: from mbp.local.devinrsmith.com (65-128-219-70.mpls.qwest.net.
 [65.128.219.70])
 by smtp.gmail.com with ESMTPSA id n1sm13286271ywe.78.2019.12.26.19.36.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 26 Dec 2019 19:36:24 -0800 (PST)
From: Devin Smith <thundza@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH wireguard-tools] man: add documentation about removing
 explicit listen-port
Date: Thu, 26 Dec 2019 21:35:26 -0600
Message-Id: <20191227033525.24478-1-thundza@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 27 Dec 2019 06:11:26 +0100
Cc: Devin Smith <thundza@gmail.com>
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

Signed-off-by: Devin Smith <thundza@gmail.com>
---
 src/man/wg.8 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/man/wg.8 b/src/man/wg.8
index ac281bc..07b9694 100644
--- a/src/man/wg.8
+++ b/src/man/wg.8
@@ -59,7 +59,7 @@ by \fICONFIGURATION FILE FORMAT\fP below.
 Sets configuration values for the specified \fI<interface>\fP. Multiple
 \fIpeer\fPs may be specified, and if the \fIremove\fP argument is given
 for a peer, that peer is removed, not configured. If \fIlisten-port\fP
-is not specified, the port will be chosen randomly when the
+is not specified, or set to 0, the port will be chosen randomly when the
 interface comes up. Both \fIprivate-key\fP and \fIpreshared-key\fP must
 be a files, because command line arguments are not considered private on
 most systems but if you are using
-- 
2.23.0

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
