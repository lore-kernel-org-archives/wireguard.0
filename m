Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8761C3DA6D
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 20 May 2025 23:11:29 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d6855f8a;
	Tue, 20 May 2025 19:55:34 +0000 (UTC)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [2607:f8b0:4864:20::42a])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 675a8940
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 17 May 2025 19:30:41 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-742c1145a38so90727b3a.3
 for <wireguard@lists.zx2c4.com>; Sat, 17 May 2025 12:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jrife-io.20230601.gappssmtp.com; s=20230601; t=1747510240; x=1748115040;
 darn=lists.zx2c4.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=c7l0p8CaQ/XFmABztCQ+JzuVdL1ScH6EF1ATeQN94o8=;
 b=l6ROPkF9sZH+qyBgztkgUHuwUn23fw3iRW2pL/iv5/3vqSnYS7rpZRc3Iu0z2HyB6f
 Q1p9h+GrBcfRLfoHkZXcVo5k6Drv2xvoYn9teRf3aXOylbDOfYJ+Yt3xfRd7flFk9ZI1
 ZCHs3pHqaaLFzhKcwiEEd3Q+tFddubsIA2rnAVu6uQ7iEQrbC8G7+k7QHEii5rx8aUFP
 AmEc/Mp1sb5+kaditvqsL2NODMFJ573pIegwKKyNLiYN6TwQ9E+uTmHJP8CyBGo/SFX0
 C9DljETRMSJpjYJ4iBAlWNf3KSs3CeOOOXNe6Hia/mtZwmFBIl0x1L3exHny8iWRdwVN
 L95Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747510240; x=1748115040;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=c7l0p8CaQ/XFmABztCQ+JzuVdL1ScH6EF1ATeQN94o8=;
 b=ah5rvoYmNV72jUHfE9J1f5mddVQ0OAIefhR7q8lrToxxh8GuwK+BZxOQyEavxUmlGJ
 C/ZBynxCCmJDdoApq4XYxhekk6PU+e3Up9R18vJ6KjNdb4xKgt68ZJBnuOgXT/FbGSug
 gqMP/uwNIwTYZdEMJNIBg58c+b8XBTEAvLmtWqHtNY6O5UlKmQHh8m1xYVfVxLsinCxd
 GQxxWYnmZUrwP4g+0j8QR0XaUW0iKGuegbjVAep6wP6KI0aGtoZC1ZjC/Wuyz56XYw/z
 9T69UQqU5/MHU1PJrsszA22zGn6ZGKCMJnnkZ4Tdq70sNZajbHpYPoabhbs1NsluEeeP
 QJRA==
X-Gm-Message-State: AOJu0Yy640D8OzmMOPOyUFz/5vrSGfCpKdkP+qvuRIa18Nu/I/TKfTii
 hpIFPb9V0XQYMG4Q0RrabtyC7jL02R4XJu9pNtusWc3nFhovWfNZiYikBy+CWhxLyIEJpI+X2Qu
 87vR5CfM=
X-Gm-Gg: ASbGncvRC+YghhwansubtjxiyKZNd4MpN1GTdjnSWZ2r5DQGLVrQ9RWvYwWcGi2eqJa
 oNaJYn9EFseoo8ULdW9gZ0aflrOSA/6IwHmJJuGJWiBwX86FfcIL5dGacw6pzhZNgPOlLXtW5RK
 QXNevW+9F5VUWAlopBhT3A4azuS/YBzBD0YKEYop4h2WS7+9g2oC/x1v0C98k7St81PJ0uEM2pM
 l7XYDjsRGUeQkkjn9wPCKGL++Wjtk+3/lAwoQvJpGunaTW1JESHnytb3ttxWR89YRwwXSRKEOze
 drRtcehuRzG/mfaNeeFH7wKiF4XjwO9DnqUnTXggHT8/nEWrUI4=
X-Google-Smtp-Source: AGHT+IGEraykoYstz5Xzl781U8iMZXW7h88E1vbeQWD49pAFFxZSEUjuHAukjls3PDkLENkXTnXLFA==
X-Received: by 2002:a05:6a21:3a8f:b0:1ee:dd0f:2c72 with SMTP id
 adf61e73a8af0-21819c04410mr1723458637.1.1747510239547; 
 Sat, 17 May 2025 12:30:39 -0700 (PDT)
Received: from t14.. ([2001:5a8:4528:b100:51db:41c9:89d4:648c])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b26eb084650sm3508814a12.61.2025.05.17.12.30.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 May 2025 12:30:39 -0700 (PDT)
From: Jordan Rife <jordan@jrife.io>
To: wireguard@lists.zx2c4.com,
	"Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Jordan Rife <jordan@jrife.io>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>
Subject: [RESEND PATCH v1 wireguard-tools] ipc: linux: Support incremental
 allowed ips updates
Date: Sat, 17 May 2025 12:29:51 -0700
Message-ID: <20250517192955.594735-1-jordan@jrife.io>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 20 May 2025 19:52:08 +0000
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

Extend the interface of `wg set` to leverage the WGALLOWEDIP_F_REMOVE_ME
flag, a direct way of removing a single allowed ip from a peer,
allowing for incremental updates to a peer's configuration. By default,
allowed-ips fully replaces a peer's allowed ips using
WGPEER_REPLACE_ALLOWEDIPS under the hood. When '+' or '-' is prepended
to any ip in the list, wg clears WGPEER_F_REPLACE_ALLOWEDIPS and sets
the WGALLOWEDIP_F_REMOVE_ME flag on any ip prefixed with '-'.

$ wg set wg0 peer <PUBKEY> allowed-ips +192.168.88.0/24,-192.168.0.1/32

This command means "add 192.168.88.0/24 to this peer's allowed ips if
not present, and remove 192.168.0.1/32 if present".

Use -isystem so that headers in uapi/ take precedence over system
headers; otherwise, the build will fail on systems running kernels
without the WGALLOWEDIP_F_REMOVE_ME flag.

Note that this patch is meant to be merged alongside the kernel patch
that introduces the flag.

Signed-off-by: Jordan Rife <jordan@jrife.io>
---
 src/Makefile                     |  2 +-
 src/config.c                     | 27 +++++++++++++++++++++++++++
 src/containers.h                 |  5 +++++
 src/ipc-linux.h                  |  2 ++
 src/man/wg.8                     |  8 ++++++--
 src/set.c                        |  2 +-
 src/uapi/linux/linux/wireguard.h |  9 +++++++++
 7 files changed, 51 insertions(+), 4 deletions(-)

diff --git a/src/Makefile b/src/Makefile
index 0533910..1c4b3f6 100644
--- a/src/Makefile
+++ b/src/Makefile
@@ -39,7 +39,7 @@ PLATFORM ?= $(shell uname -s | tr '[:upper:]' '[:lower:]')
 
 CFLAGS ?= -O3
 ifneq ($(wildcard uapi/$(PLATFORM)/.),)
-CFLAGS += -idirafter uapi/$(PLATFORM)
+CFLAGS += -isystem uapi/$(PLATFORM)
 endif
 CFLAGS += -std=gnu99 -D_GNU_SOURCE
 CFLAGS += -Wall -Wextra
diff --git a/src/config.c b/src/config.c
index 81ccb47..b740f73 100644
--- a/src/config.c
+++ b/src/config.c
@@ -337,6 +337,29 @@ static bool validate_netmask(struct wgallowedip *allowedip)
 	return true;
 }
 
+#if defined(__linux__)
+static inline void parse_ip_prefix(struct wgpeer *peer, uint32_t *flags, char **mask)
+{
+	/* If the IP is prefixed with either '+' or '-' consider
+	 * this an incremental change. Disable WGPEER_REPLACE_ALLOWEDIPS.
+	 */
+	switch ((*mask)[0]) {
+	case '-':
+		*flags |= WGALLOWEDIP_REMOVE_ME;
+		/* fall through */
+	case '+':
+		peer->flags &= ~WGPEER_REPLACE_ALLOWEDIPS;
+		(*mask)++;
+	}
+}
+#else
+static inline void parse_ip_prefix(struct wgpeer *peer __attribute__ ((unused)),
+				   uint32_t *flags     __attribute__ ((unused)),
+				   char **mask         __attribute__ ((unused)))
+{
+}
+#endif
+
 static inline bool parse_allowedips(struct wgpeer *peer, struct wgallowedip **last_allowedip, const char *value)
 {
 	struct wgallowedip *allowedip = *last_allowedip, *new_allowedip;
@@ -353,9 +376,12 @@ static inline bool parse_allowedips(struct wgpeer *peer, struct wgallowedip **la
 	}
 	sep = mutable;
 	while ((mask = strsep(&sep, ","))) {
+		uint32_t flags = 0;
 		unsigned long cidr;
 		char *end, *ip;
 
+		parse_ip_prefix(peer, &flags, &mask);
+
 		saved_entry = strdup(mask);
 		ip = strsep(&mask, "/");
 
@@ -387,6 +413,7 @@ static inline bool parse_allowedips(struct wgpeer *peer, struct wgallowedip **la
 		else
 			goto err;
 		new_allowedip->cidr = cidr;
+		new_allowedip->flags = flags;
 
 		if (!validate_netmask(new_allowedip))
 			fprintf(stderr, "Warning: AllowedIP has nonzero host part: %s/%s\n", ip, mask);
diff --git a/src/containers.h b/src/containers.h
index a82e8dd..8fd813a 100644
--- a/src/containers.h
+++ b/src/containers.h
@@ -28,6 +28,10 @@ struct timespec64 {
 	int64_t tv_nsec;
 };
 
+enum {
+	WGALLOWEDIP_REMOVE_ME = 1U << 0,
+};
+
 struct wgallowedip {
 	uint16_t family;
 	union {
@@ -35,6 +39,7 @@ struct wgallowedip {
 		struct in6_addr ip6;
 	};
 	uint8_t cidr;
+	uint32_t flags;
 	struct wgallowedip *next_allowedip;
 };
 
diff --git a/src/ipc-linux.h b/src/ipc-linux.h
index d29c0c5..01247f1 100644
--- a/src/ipc-linux.h
+++ b/src/ipc-linux.h
@@ -228,6 +228,8 @@ again:
 				}
 				if (!mnl_attr_put_u8_check(nlh, SOCKET_BUFFER_SIZE, WGALLOWEDIP_A_CIDR_MASK, allowedip->cidr))
 					goto toobig_allowedips;
+				if (allowedip->flags && !mnl_attr_put_u32_check(nlh, SOCKET_BUFFER_SIZE, WGALLOWEDIP_A_FLAGS, allowedip->flags))
+					goto toobig_allowedips;
 				mnl_attr_nest_end(nlh, allowedip_nest);
 				allowedip_nest = NULL;
 			}
diff --git a/src/man/wg.8 b/src/man/wg.8
index 7984539..1ec68df 100644
--- a/src/man/wg.8
+++ b/src/man/wg.8
@@ -55,7 +55,7 @@ transfer-rx, transfer-tx, persistent-keepalive.
 Shows the current configuration of \fI<interface>\fP in the format described
 by \fICONFIGURATION FILE FORMAT\fP below.
 .TP
-\fBset\fP \fI<interface>\fP [\fIlisten-port\fP \fI<port>\fP] [\fIfwmark\fP \fI<fwmark>\fP] [\fIprivate-key\fP \fI<file-path>\fP] [\fIpeer\fP \fI<base64-public-key>\fP [\fIremove\fP] [\fIpreshared-key\fP \fI<file-path>\fP] [\fIendpoint\fP \fI<ip>:<port>\fP] [\fIpersistent-keepalive\fP \fI<interval seconds>\fP] [\fIallowed-ips\fP \fI<ip1>/<cidr1>\fP[,\fI<ip2>/<cidr2>\fP]...] ]...
+\fBset\fP \fI<interface>\fP [\fIlisten-port\fP \fI<port>\fP] [\fIfwmark\fP \fI<fwmark>\fP] [\fIprivate-key\fP \fI<file-path>\fP] [\fIpeer\fP \fI<base64-public-key>\fP [\fIremove\fP] [\fIpreshared-key\fP \fI<file-path>\fP] [\fIendpoint\fP \fI<ip>:<port>\fP] [\fIpersistent-keepalive\fP \fI<interval seconds>\fP] [\fIallowed-ips\fP \fI[+|-]<ip1>/<cidr1>\fP[,\fI[+|-]<ip2>/<cidr2>\fP]...] ]...
 Sets configuration values for the specified \fI<interface>\fP. Multiple
 \fIpeer\fPs may be specified, and if the \fIremove\fP argument is given
 for a peer, that peer is removed, not configured. If \fIlisten-port\fP
@@ -72,7 +72,11 @@ the device. The use of \fIpreshared-key\fP is optional, and may be omitted;
 it adds an additional layer of symmetric-key cryptography to be mixed into
 the already existing public-key cryptography, for post-quantum resistance.
 If \fIallowed-ips\fP is specified, but the value is the empty string, all
-allowed ips are removed from the peer. The use of \fIpersistent-keepalive\fP
+allowed ips are removed from the peer. By default, \fIallowed-ips\fP replaces
+a peer's allowed ips. (Linux only) If + or - is prepended to any of the ips then
+the update is incremental; ips prefixed with '+' or '' are added to the peer's
+allowed ips if not present while ips prefixed with '-' are removed if present.
+The use of \fIpersistent-keepalive\fP
 is optional and is by default off; setting it to 0 or "off" disables it.
 Otherwise it represents, in seconds, between 1 and 65535 inclusive, how often
 to send an authenticated empty packet to the peer, for the purpose of keeping
diff --git a/src/set.c b/src/set.c
index 75560fd..992ffa2 100644
--- a/src/set.c
+++ b/src/set.c
@@ -18,7 +18,7 @@ int set_main(int argc, const char *argv[])
 	int ret = 1;
 
 	if (argc < 3) {
-		fprintf(stderr, "Usage: %s %s <interface> [listen-port <port>] [fwmark <mark>] [private-key <file path>] [peer <base64 public key> [remove] [preshared-key <file path>] [endpoint <ip>:<port>] [persistent-keepalive <interval seconds>] [allowed-ips <ip1>/<cidr1>[,<ip2>/<cidr2>]...] ]...\n", PROG_NAME, argv[0]);
+		fprintf(stderr, "Usage: %s %s <interface> [listen-port <port>] [fwmark <mark>] [private-key <file path>] [peer <base64 public key> [remove] [preshared-key <file path>] [endpoint <ip>:<port>] [persistent-keepalive <interval seconds>] [allowed-ips [+|-]<ip1>/<cidr1>[,[+|-]<ip2>/<cidr2>]...] ]...\n", PROG_NAME, argv[0]);
 		return 1;
 	}
 
diff --git a/src/uapi/linux/linux/wireguard.h b/src/uapi/linux/linux/wireguard.h
index 0efd52c..6ca266a 100644
--- a/src/uapi/linux/linux/wireguard.h
+++ b/src/uapi/linux/linux/wireguard.h
@@ -101,6 +101,10 @@
  *                    WGALLOWEDIP_A_FAMILY: NLA_U16
  *                    WGALLOWEDIP_A_IPADDR: struct in_addr or struct in6_addr
  *                    WGALLOWEDIP_A_CIDR_MASK: NLA_U8
+ *                    WGALLOWEDIP_A_FLAGS: NLA_U32, WGALLOWEDIP_F_REMOVE_ME if
+ *                                         the specified IP should be removed;
+ *                                         otherwise, this IP will be added if
+ *                                         it is not already present.
  *                0: NLA_NESTED
  *                    ...
  *                0: NLA_NESTED
@@ -184,11 +188,16 @@ enum wgpeer_attribute {
 };
 #define WGPEER_A_MAX (__WGPEER_A_LAST - 1)
 
+enum wgallowedip_flag {
+	WGALLOWEDIP_F_REMOVE_ME = 1U << 0,
+	__WGALLOWEDIP_F_ALL = WGALLOWEDIP_F_REMOVE_ME
+};
 enum wgallowedip_attribute {
 	WGALLOWEDIP_A_UNSPEC,
 	WGALLOWEDIP_A_FAMILY,
 	WGALLOWEDIP_A_IPADDR,
 	WGALLOWEDIP_A_CIDR_MASK,
+	WGALLOWEDIP_A_FLAGS,
 	__WGALLOWEDIP_A_LAST
 };
 #define WGALLOWEDIP_A_MAX (__WGALLOWEDIP_A_LAST - 1)
-- 
2.43.0

