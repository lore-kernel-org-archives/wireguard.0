Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E63CC3DA4A
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  2 Aug 2024 16:40:07 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d92825a4;
	Fri, 2 Aug 2024 16:20:26 +0000 (UTC)
Received: from smtp2.eurecom.fr (smtp2.eurecom.fr [193.55.113.211])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 885d0822
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 25 Jul 2024 20:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=eurecom.fr; i=@eurecom.fr; q=dns/txt; s=default;
 t=1721940576; x=1753476576;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=912Uk+Gje1PVMC8wL02J/UxOYyqiI3APSTFP4Ds6/JE=;
 b=IRTxfmLvRjpbaEN518IenUfRfBNixp2dnkYOJiMa9n8EGiEQT8zCjbuI
 w1DZ9PPw5bgrjqrJ8vptfZmWD44qrmKu6CN0imS6OifZ3KPw4T6gzZzwO
 4Qb0RpNEBzyX8891ZZ6B9PDFUSiaKsBYrba4805//vyCdE4zOGPe0EQtB w=;
X-CSE-ConnectionGUID: vSRKG81kSv6fEEC43uiThA==
X-CSE-MsgGUID: EWG7py2LRsKqdiCHhwcFlg==
X-IronPort-AV: E=Sophos;i="6.09,236,1716242400"; d="scan'208";a="15981993"
Received: from waha.eurecom.fr (HELO smtps.eurecom.fr) ([10.3.2.236])
 by drago2i.eurecom.fr with ESMTP; 25 Jul 2024 22:49:35 +0200
Received: from arc.fortinet-emea.com (91-175-7-2.subs.proxad.net [91.175.7.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by smtps.eurecom.fr (Postfix) with ESMTPSA id 2FF8B20CB;
 Thu, 25 Jul 2024 22:49:35 +0200 (CEST)
From: Ariel Otilibili <otilibil@eurecom.fr>
To: wireguard@lists.zx2c4.com
Cc: Ariel Otilibili <otilibil@eurecom.fr>
Subject: [PATCH] Extracted error message for the sake of legibility
Date: Thu, 25 Jul 2024 22:42:38 +0200
Message-ID: <20240725204917.192647-3-otilibil@eurecom.fr>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240725204917.192647-2-otilibil@eurecom.fr>
References: <20240725204917.192647-2-otilibil@eurecom.fr>
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

