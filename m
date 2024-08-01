Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DD7FC52D71
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  2 Aug 2024 16:40:10 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8a9491f1;
	Fri, 2 Aug 2024 16:20:42 +0000 (UTC)
Received: from smtp2.eurecom.fr (smtp2.eurecom.fr [193.55.113.211])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b53f4202
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 1 Aug 2024 09:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=eurecom.fr; i=@eurecom.fr; q=dns/txt; s=default;
 t=1722505781; x=1754041781;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:reply-to:mime-version: content-transfer-encoding;
 bh=912Uk+Gje1PVMC8wL02J/UxOYyqiI3APSTFP4Ds6/JE=;
 b=tTSyC48SH51NSYPmKzbf2X0Q2FKge9ysHp+fcc6h98ZDUDH0TzR49bMa
 JBNf/IQpkU2p51+O4rtjDeFbFqLZ2mnNV0W2j86S09gUdRM4Gxa6auPbF
 IvqyOF12G/PnWbBs2hgsuKih5Yj+P/rbKAQV3sWlHT0drdbReKtREzd23 Q=;
X-CSE-ConnectionGUID: Km3pYFRmR6OCK0FICQ92iw==
X-CSE-MsgGUID: S5LS4dTrShK5v/fBe1TmaQ==
X-IronPort-AV: E=Sophos;i="6.09,254,1716242400"; d="scan'208";a="15992035"
Received: from waha.eurecom.fr (HELO smtps.eurecom.fr) ([10.3.2.236])
 by drago2i.eurecom.fr with ESMTP; 01 Aug 2024 11:49:41 +0200
Received: from arc.fortinet-emea.com (unknown [78.242.93.188])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtps.eurecom.fr (Postfix) with ESMTPSA id 3F924259E;
 Thu,  1 Aug 2024 11:49:40 +0200 (CEST)
From: Ariel Otilibili <otilibil@eurecom.fr>
To: wireguard@lists.zx2c4.com
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>,
 Ariel Otilibili <otilibil@eurecom.fr>
Subject: [PATCH] wireguard-tools: Extracted error message for the sake of
 legibility
Date: Thu,  1 Aug 2024 11:43:58 +0200
Message-ID: <20240801094932.4502-2-otilibil@eurecom.fr>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240801094932.4502-1-otilibil@eurecom.fr>
References: <20240725204917.192647-2-otilibil@eurecom.fr>
 <20240801094932.4502-1-otilibil@eurecom.fr>
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

