Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C2D1C52D6F
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  2 Aug 2024 16:40:09 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7436daf2;
	Fri, 2 Aug 2024 16:20:38 +0000 (UTC)
Received: from smtp2.eurecom.fr (smtp2.eurecom.fr [193.55.113.211])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8f3c9914
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 1 Aug 2024 09:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=eurecom.fr; i=@eurecom.fr; q=dns/txt; s=default;
 t=1722505213; x=1754041213;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:reply-to:mime-version: content-transfer-encoding;
 bh=912Uk+Gje1PVMC8wL02J/UxOYyqiI3APSTFP4Ds6/JE=;
 b=S1Gqz4otuLQzp27O0jj+FRBZbEMH+8OhJT/DiwXkQ2ROlc448ToWfcX4
 Py8z3OSK1ObnNwCbBeymBLrtPmGPQk92dG1Hl8yd5bwYSkfQcxL4KQhiz
 hRyx5Fo7pHP73c6vQ1Vy9SJopk0dagiPyas1N29qdvL1E+NqoylFj73dF w=;
X-CSE-ConnectionGUID: X0e/v2VdTdOFkjvGpjhRMw==
X-CSE-MsgGUID: k7uVxShRTfaxi+kD6+FJXw==
X-IronPort-AV: E=Sophos;i="6.09,254,1716242400"; d="scan'208";a="15992021"
Received: from waha.eurecom.fr (HELO smtps.eurecom.fr) ([10.3.2.236])
 by drago2i.eurecom.fr with ESMTP; 01 Aug 2024 11:33:07 +0200
Received: from arc.fortinet-emea.com (unknown [78.242.93.188])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtps.eurecom.fr (Postfix) with ESMTPSA id 5B6932591;
 Thu,  1 Aug 2024 11:33:07 +0200 (CEST)
From: Ariel Otilibili <otilibil@eurecom.fr>
To: wireguard@lists.zx2c4.com
Cc: Ariel Otilibili <otilibil@eurecom.fr>
Subject: [PATCH] wireguard-tools: Extracted error message for the sake of
 legibility
Date: Thu,  1 Aug 2024 11:32:25 +0200
Message-ID: <20240801093257.2700-3-otilibil@eurecom.fr>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240801093257.2700-2-otilibil@eurecom.fr>
References: <20240801093257.2700-2-otilibil@eurecom.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Reply-To: Ariel Otilibili <otilibil@eurecom.fr>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Signed-off-by: Ariel Otilibili <otilibil@eurecom.fr>
---
 src/set.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/src/set.c b/src/set.c
index 75560fd..b2fbd54 100644
--- a/src/set.c
+++ b/src/set.c
@@ -16,9 +16,19 @@ int set_main(int argc, const char *argv[])
 {
 	struct wgdevice *device = NULL;
 	int ret = 1;
+	const char *error_message = "Usage: %s %s <interface>"
+	  " [listen-port <port>]"
+	  " [fwmark <mark>]"
+	  " [private-key <file path>]"
+	  " [peer <base64 public key> [remove]"
+	  " [preshared-key <file path>]"
+	  " [endpoint <ip>:<port>]"
+	  " [persistent-keepalive <interval seconds>]"
+	  " [allowed-ips <ip1>/<cidr1>[,<ip2>/<cidr2>]...]"
+	  " ]...\n";
 
 	if (argc < 3) {
-		fprintf(stderr, "Usage: %s %s <interface> [listen-port <port>] [fwmark <mark>] [private-key <file path>] [peer <base64 public key> [remove] [preshared-key <file path>] [endpoint <ip>:<port>] [persistent-keepalive <interval seconds>] [allowed-ips <ip1>/<cidr1>[,<ip2>/<cidr2>]...] ]...\n", PROG_NAME, argv[0]);
+		fprintf(stderr, error_message, PROG_NAME, argv[0]);
 		return 1;
 	}
 
-- 
2.45.2

