Return-Path: <SRS0=ZSUP=4L=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3406CC35673
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 23 Feb 2020 10:35:13 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 796C7214DB
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 23 Feb 2020 10:35:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oliver-net-au.20150623.gappssmtp.com header.i=@oliver-net-au.20150623.gappssmtp.com header.b="QbgjlqcI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 796C7214DB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=oliver.net.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a836e132;
	Sun, 23 Feb 2020 10:27:48 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a2dea21c
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Feb 2020 03:54:57 +0000 (UTC)
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4efd962d
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Feb 2020 03:54:56 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id f2so1839924pjq.1
 for <wireguard@lists.zx2c4.com>; Sun, 16 Feb 2020 19:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oliver-net-au.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ctEC9DwUBRHB/Da/nJ3Vy245Xa6Ui5eynHVwZbABR0k=;
 b=QbgjlqcIMwW1utD/uWhMit/iPlf5Zuwo5okvxeq40RTsHj+AIQ6OnGIe09qCOIgcK0
 64q7qS9dHqW3r4l44OH7Z+iqV7q17EXV7Lc7p6MSm0uL3XV4/KsKefiSI0I6cLY1qk1O
 0ckOhBAS8R4WUzYUdjsD+26bsOoyGPvX+CXvUvdOlobUoYeEaYbFR/EzqW1E1IiGqO60
 7o5ywJXbPnI1/GDdXuymkzJ0WTB/At8FM1oRT6mALNoYV6fNZFj3Lry68ExKuNo1ChD9
 FeaGqvTg22GFQBZOiPdbr2J7j+03OEQuNjZUdNq56nBfwCGKuZwzHKr5bC9HlIlF9l51
 sv8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ctEC9DwUBRHB/Da/nJ3Vy245Xa6Ui5eynHVwZbABR0k=;
 b=pgzb103ZdbazQ3wK4CpPuV/ym3IkIGdFA0sOXPWQhJRiYHYUMhQM1LoggjWP2Jkrba
 k52OHVIbKYKr5cTz2VemX2qsEuJcBCbLxW3xM0SBjHuyHLjKedUlH6e5Yd+N912hi/RQ
 YGrPwvuFwfPr6McfVa+q3jdNlqHDnkjd/zTfJUio5VyAj67n6cly2RFmQ43HH6O1sbzJ
 TAYeJsNN/JPINrT83cJOWcvyqgd7xFBED29NEnLGDR0i8vH+IDMOT3q1qFH8IBpyGOR2
 YN51XrGzCtRRih9PvFRgolBqMvrHCwLrSmO/QASr2wiiBVZP78cCRTb4X8Y5V0Q0vcbp
 loZw==
X-Gm-Message-State: APjAAAVfPvo8VnLIRVfQPUVqlbvhakBSscElot2jBp3TsOdLeHs8cFsO
 PWVaFWXW43xNFjqNEU9HB6HXKI4AHlweEQ==
X-Google-Smtp-Source: APXvYqwBkc3ftMgBs4mQ+ExXhj97rXIfdNLQTtj4v6YD7f0qkn1kFTswr2cpMZSdXnb+aVJuiu8Buw==
X-Received: by 2002:a17:902:9349:: with SMTP id
 g9mr14277509plp.110.1581911842137; 
 Sun, 16 Feb 2020 19:57:22 -0800 (PST)
Received: from linux-85iy.suse.com (56.060.dsl.syd.iprimus.net.au.
 [211.27.250.56])
 by smtp.googlemail.com with ESMTPSA id z10sm10618114pgf.35.2020.02.16.19.57.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Feb 2020 19:57:21 -0800 (PST)
From: Matthew Oliver <matt@oliver.net.au>
To: wireguard@lists.zx2c4.com
Subject: [PATCH] wg show: Add json output
Date: Mon, 17 Feb 2020 14:57:01 +1100
Message-Id: <20200217035701.28261-1-matt@oliver.net.au>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 23 Feb 2020 11:27:41 +0100
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

This patch adds a new option to `wg show` called json. When
specified it'll output the WG interface in json output.

It works with both given an interface or all.

  # wg show wg1 json
  [
    {
      "interface": "wg1",
      "public_key": "Yh0kKjoqnJsxbCsTkQ/3uncEhdqa+EtJXCYcVzMdugs=",
      "private_key": "MKVTz8NCXL0uaE77MJfgIWSSy1AfqSmLFRx16oxmrmk=",
      "port": "51831",
      "fwmark": null,
      "peers": [
         {
           "peer": "GzY59HlXkCkfXl9uSkEFTHzOtBsxQFKu3KWGFH5P9Qc=",
           "preshared_key": null,
           "endpoint": "172.16.3.104:51834",
           "allowed_ips": [
             "10.0.3.0/24", "224.0.0.0/8", "172.16.0.0/16"
           ],
           "latest_handshake": 1581909869,
           "transfer": {
            "received": 3949216,
            "sent": 4531428
           },
           "persistent_keepalive": 30
         }
      ]
    }
  ]

Note however, that this will print out the private key.

Signed-off-by: Matthew Oliver <matt@oliver.net.au>
---
 src/show.c | 75 +++++++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 72 insertions(+), 3 deletions(-)

diff --git a/src/show.c b/src/show.c
index e772339..f8c7543 100644
--- a/src/show.c
+++ b/src/show.c
@@ -202,7 +202,62 @@ static char *bytes(uint64_t b)
 static const char *COMMAND_NAME;
 static void show_usage(void)
 {
-	fprintf(stderr, "Usage: %s %s { <interface> | all | interfaces } [public-key | private-key | listen-port | fwmark | peers | preshared-keys | endpoints | allowed-ips | latest-handshakes | transfer | persistent-keepalive | dump]\n", PROG_NAME, COMMAND_NAME);
+	fprintf(stderr, "Usage: %s %s { <interface> | all | interfaces } [public-key | private-key | listen-port | fwmark | peers | preshared-keys | endpoints | allowed-ips | latest-handshakes | transfer | persistent-keepalive | dump | json]\n", PROG_NAME, COMMAND_NAME);
+}
+
+static void json_print(struct wgdevice *device)
+{
+	struct wgpeer *peer;
+	struct wgallowedip *allowedip;
+	terminal_printf(TERMINAL_RESET);
+	terminal_printf("  {\n");
+	terminal_printf("    \"interface\": \"%s\",\n", device->name);
+	terminal_printf("    \"public_key\": \"%s\",\n", key(device->public_key));
+	terminal_printf("    \"private_key\": \"%s\",\n", key(device->private_key));
+	terminal_printf("    \"port\": \"%d\",\n", device->listen_port);
+	if (device->fwmark)
+		terminal_printf("    \"fwmark\": \"0x%x\",\n", device->fwmark);
+	else
+		terminal_printf("    \"fwmark\": null,\n");
+	terminal_printf("    \"peers\": [\n");
+	sort_peers(device);
+	for_each_wgpeer(device, peer) {
+		terminal_printf("       {\n");
+		terminal_printf("         \"peer\": \"%s\",\n", key(peer->public_key));
+		if (peer->flags & WGPEER_HAS_PRESHARED_KEY)
+			terminal_printf("         \"preshared_key\": \"%s\",\n", key(peer->preshared_key));
+		else
+			terminal_printf("         \"preshared_key\": null,\n");
+		if (peer->endpoint.addr.sa_family == AF_INET || peer->endpoint.addr.sa_family == AF_INET6)
+			terminal_printf("         \"endpoint\": \"%s\",\n", endpoint(&peer->endpoint.addr));
+		else
+			terminal_printf("         \"endpoint\": null,\n");
+		terminal_printf("         \"allowed_ips\": [\n");
+		if (peer->first_allowedip) {
+			terminal_printf("           ");
+			for_each_wgallowedip(peer, allowedip)
+				terminal_printf("\"%s/%u\"%s", ip(allowedip), allowedip->cidr, allowedip->next_allowedip ? ", " : "\n");
+		}
+		terminal_printf("         ],\n");
+		if (peer->last_handshake_time.tv_sec)
+			terminal_printf("         \"latest_handshake\": %ld,\n", peer->last_handshake_time.tv_sec);
+		else
+			terminal_printf("         \"latest_handshake\": null,\n");
+		terminal_printf("         \"transfer\": {\n");
+		terminal_printf("          \"received\": %ld,\n", peer->rx_bytes);
+		terminal_printf("          \"sent\": %ld\n", peer->tx_bytes);
+		terminal_printf("         },\n");
+		if (peer->persistent_keepalive_interval)
+			terminal_printf("         \"persistent_keepalive\": %d\n", peer->persistent_keepalive_interval);
+		else
+			terminal_printf("         \"persistent_keepalive\": null\n");
+		if (peer->next_peer)
+			terminal_printf("       },\n");
+		else
+			terminal_printf("       }\n");
+	}
+	terminal_printf("    ]\n");
+	terminal_printf("  }");
 }
 
 static void pretty_print(struct wgdevice *device)
@@ -396,6 +451,8 @@ int show_main(int argc, char *argv[])
 		}
 		ret = !!*interfaces;
 		interface = interfaces;
+		if (argc == 3 && !strcmp(argv[2], "json"))
+			terminal_printf("[\n");
 		for (size_t len = 0; (len = strlen(interface)); interface += len + 1) {
 			struct wgdevice *device = NULL;
 
@@ -404,7 +461,13 @@ int show_main(int argc, char *argv[])
 				continue;
 			}
 			if (argc == 3) {
-				if (!ugly_print(device, argv[2], true)) {
+				if (!strcmp(argv[2], "json")) {
+					json_print(device);
+					if (strlen(interface + len + 1))
+						terminal_printf(",\n");
+					else
+						terminal_printf("\n");
+				} else if (!ugly_print(device, argv[2], true)) {
 					ret = 1;
 					free_wgdevice(device);
 					break;
@@ -417,6 +480,8 @@ int show_main(int argc, char *argv[])
 			free_wgdevice(device);
 			ret = 0;
 		}
+		if (argc == 3 && !strcmp(argv[2], "json"))
+			terminal_printf("]\n");
 		free(interfaces);
 	} else if (!strcmp(argv[1], "interfaces")) {
 		char *interfaces, *interface;
@@ -444,7 +509,11 @@ int show_main(int argc, char *argv[])
 			return 1;
 		}
 		if (argc == 3) {
-			if (!ugly_print(device, argv[2], false))
+			if (!strcmp(argv[2], "json")) {
+				terminal_printf("[\n");
+				json_print(device);
+				terminal_printf("\n]\n");
+			} else if (!ugly_print(device, argv[2], false))
 				ret = 1;
 		} else
 			pretty_print(device);
-- 
2.22.0

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
