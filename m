Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D993CC2D0CD
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 09:18:19 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5b04a251;
	Tue, 20 May 2025 19:34:48 +0000 (UTC)
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com
 [2607:f8b0:4864:20::649])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e29c9162
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 4 Dec 2024 01:53:40 +0000 (UTC)
Received: by mail-pl1-x649.google.com with SMTP id
 d9443c01a7336-2154e1cdf72so41511175ad.3
 for <wireguard@lists.zx2c4.com>; Tue, 03 Dec 2024 17:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1733277219; x=1733882019; darn=lists.zx2c4.com;
 h=content-transfer-encoding:cc:to:from:subject:message-id
 :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Dv4heYaGR4g4M8CWYEn3h62ZBrXdPkty7ZaSDudDp5s=;
 b=SMj25BjAByLsF99oBU/Q5fLTyW3X2jXrTpW66/XrfeER0t2uuYTDcx/DOrw05liPSk
 wW4sNkLnpT4A+l1wyrSGjxd3dGMO5QWZkJmns3e4IVPfPc3MoafuoMBwJ2Awd7L/n8mx
 pembT3hcX1HwBaqQDunH4t2glNDazomune0wjPV6IeeRZJM+ycfqgSzZ5QUUN+GnDFfL
 vWtojVso0L27UXzfy+4mJN8FS2+bTK3uCXjO2oBjECYG7ealaVS0SsBeLWFhmK2VzHV+
 xKed8CjKftAX8pxacdcP38CtMkef6OsdGAbbHqjGLnK7wExlL3AF4rFMFPYHdIcxIzkt
 TvNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733277219; x=1733882019;
 h=content-transfer-encoding:cc:to:from:subject:message-id
 :mime-version:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dv4heYaGR4g4M8CWYEn3h62ZBrXdPkty7ZaSDudDp5s=;
 b=oriS/GZg8uXvFN/tJcFCRlkXxhRE7vDR/1jlvXF2AGxzFUGiTxQdbjIrHffCYvDCkb
 jKGEV2NGb3lSTNsgU/BjxWtWFEjw/8pLvsqBxuQ5gxHZHGCVvC8OKcuOFslw7XJGKRhK
 uDnOMV5DwNoYQN7LvATHQK30yyuYHs0yxJHXtllRe6b72UA+IoFCwECqOYFlRWxfHRnv
 0I2MPCByunM9TRZyFxAVfxBUCOsGrPgL2CEB/ZQsCI08bVIIShp84uDXCG1/nX1yw4o5
 MGa+eDhDyJnOxBCoAQXdKm61G0qNSYsAxiBq3ojJe0YIfi8MpOjhqgHwnWNsay6uNMsd
 af2Q==
X-Gm-Message-State: AOJu0YwGfMT/IGbONTmn5NYeIM2xSHCZu7eVxjTuyTlwzD2rfqZ27w3D
 TrtqPPxc6iuLl2WxToBeI6KBBQCmZNusOMeoeUlKK3ODwd1Arnb8597JuVVqhLp4EiN5UxvflAu
 oKnEeVDm2xvdyXX4zOvoghv885aBSu7LoiaEutXKoCIA10DWsxaDQAxK0Bn3kV3x4T8rkF2JO9X
 mvfOQj4IuzcON41qZ5AfePJUBiNZIMv2o=
X-Google-Smtp-Source: AGHT+IEbzu2XR7hhQrgQOY8r3QB7p/qGzcYT0LPhErf/K+agwOnfYuVJLMhAPMMEmhxSuKhAJa7EQEN43Q==
X-Received: from pllj12.prod.google.com ([2002:a17:902:758c:b0:215:515c:124e])
 (user=jrife job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:32cc:b0:215:aecf:802f
 with SMTP id d9443c01a7336-215bd1585a5mr61249285ad.37.1733277218956; Tue, 03
 Dec 2024 17:53:38 -0800 (PST)
Date: Wed,  4 Dec 2024 01:53:27 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241204015331.2762169-1-jrife@google.com>
Subject: [PATCH v1 wireguard-tools] ipc: linux: Support incremental allowed
 ips updates
From: Jordan Rife <jrife@google.com>
To: wireguard@lists.zx2c4.com, "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Jordan Rife <jrife@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

[1] adds support for the WGALLOWEDIP_F_REMOVE_ME flag to WireGuard's
Linux driver which is a direct way of removing a single allowed ip from
a peer. Extend the interface of `wg set` to leverage this feature,
allowing for incremental updates to a peer's configuration. By default,
allowed-ips fully replaces a peer's allowed ips using
WGPEER_REPLACE_ALLOWEDIPS under the hood. When '+' or '-' is prepended
to any ip in the list, wg clears WGPEER_F_REPLACE_ALLOWEDIPS and sets
the WGALLOWEDIP_F_REMOVE_ME flag on any ip prefixed with '-'.

$ wg set wg0 peer <PUBKEY> allowed-ips +192.168.88.0/24,-192.168.0.1/32

This command means "add 192.168.88.0/24 to this peer's allowed ips if
not present, and remove 192.168.0.1/32 if present".

Currently, this feature is only enabled for Linux builds.

[1]: https://lore.kernel.org/netdev/20241204014909.2760696-1-jrife@google.c=
om/T/#u

Signed-off-by: Jordan Rife <jrife@google.com>
---
 src/config.c                     | 27 +++++++++++++++++++++++++++
 src/containers.h                 |  5 +++++
 src/ipc-linux.h                  |  2 ++
 src/man/wg.8                     |  8 ++++++--
 src/set.c                        |  2 +-
 src/uapi/linux/linux/wireguard.h |  9 +++++++++
 6 files changed, 50 insertions(+), 3 deletions(-)

diff --git a/src/config.c b/src/config.c
index 81ccb47..b740f73 100644
--- a/src/config.c
+++ b/src/config.c
@@ -337,6 +337,29 @@ static bool validate_netmask(struct wgallowedip *allow=
edip)
 	return true;
 }
=20
+#if defined(__linux__)
+static inline void parse_ip_prefix(struct wgpeer *peer, uint32_t *flags, c=
har **mask)
+{
+	/* If the IP is prefixed with either '+' or '-' consider
+	 * this an incremental change. Disable WGPEER_REPLACE_ALLOWEDIPS.
+	 */
+	switch ((*mask)[0]) {
+	case '-':
+		*flags |=3D WGALLOWEDIP_REMOVE_ME;
+		/* fall through */
+	case '+':
+		peer->flags &=3D ~WGPEER_REPLACE_ALLOWEDIPS;
+		(*mask)++;
+	}
+}
+#else
+static inline void parse_ip_prefix(struct wgpeer *peer __attribute__ ((unu=
sed)),
+				   uint32_t *flags     __attribute__ ((unused)),
+				   char **mask         __attribute__ ((unused)))
+{
+}
+#endif
+
 static inline bool parse_allowedips(struct wgpeer *peer, struct wgallowedi=
p **last_allowedip, const char *value)
 {
 	struct wgallowedip *allowedip =3D *last_allowedip, *new_allowedip;
@@ -353,9 +376,12 @@ static inline bool parse_allowedips(struct wgpeer *pee=
r, struct wgallowedip **la
 	}
 	sep =3D mutable;
 	while ((mask =3D strsep(&sep, ","))) {
+		uint32_t flags =3D 0;
 		unsigned long cidr;
 		char *end, *ip;
=20
+		parse_ip_prefix(peer, &flags, &mask);
+
 		saved_entry =3D strdup(mask);
 		ip =3D strsep(&mask, "/");
=20
@@ -387,6 +413,7 @@ static inline bool parse_allowedips(struct wgpeer *peer=
, struct wgallowedip **la
 		else
 			goto err;
 		new_allowedip->cidr =3D cidr;
+		new_allowedip->flags =3D flags;
=20
 		if (!validate_netmask(new_allowedip))
 			fprintf(stderr, "Warning: AllowedIP has nonzero host part: %s/%s\n", ip=
, mask);
diff --git a/src/containers.h b/src/containers.h
index a82e8dd..8fd813a 100644
--- a/src/containers.h
+++ b/src/containers.h
@@ -28,6 +28,10 @@ struct timespec64 {
 	int64_t tv_nsec;
 };
=20
+enum {
+	WGALLOWEDIP_REMOVE_ME =3D 1U << 0,
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
=20
diff --git a/src/ipc-linux.h b/src/ipc-linux.h
index d29c0c5..01247f1 100644
--- a/src/ipc-linux.h
+++ b/src/ipc-linux.h
@@ -228,6 +228,8 @@ again:
 				}
 				if (!mnl_attr_put_u8_check(nlh, SOCKET_BUFFER_SIZE, WGALLOWEDIP_A_CIDR=
_MASK, allowedip->cidr))
 					goto toobig_allowedips;
+				if (allowedip->flags && !mnl_attr_put_u32_check(nlh, SOCKET_BUFFER_SIZ=
E, WGALLOWEDIP_A_FLAGS, allowedip->flags))
+					goto toobig_allowedips;
 				mnl_attr_nest_end(nlh, allowedip_nest);
 				allowedip_nest =3D NULL;
 			}
diff --git a/src/man/wg.8 b/src/man/wg.8
index 7984539..1ec68df 100644
--- a/src/man/wg.8
+++ b/src/man/wg.8
@@ -55,7 +55,7 @@ transfer-rx, transfer-tx, persistent-keepalive.
 Shows the current configuration of \fI<interface>\fP in the format describ=
ed
 by \fICONFIGURATION FILE FORMAT\fP below.
 .TP
-\fBset\fP \fI<interface>\fP [\fIlisten-port\fP \fI<port>\fP] [\fIfwmark\fP=
 \fI<fwmark>\fP] [\fIprivate-key\fP \fI<file-path>\fP] [\fIpeer\fP \fI<base=
64-public-key>\fP [\fIremove\fP] [\fIpreshared-key\fP \fI<file-path>\fP] [\=
fIendpoint\fP \fI<ip>:<port>\fP] [\fIpersistent-keepalive\fP \fI<interval s=
econds>\fP] [\fIallowed-ips\fP \fI<ip1>/<cidr1>\fP[,\fI<ip2>/<cidr2>\fP]...=
] ]...
+\fBset\fP \fI<interface>\fP [\fIlisten-port\fP \fI<port>\fP] [\fIfwmark\fP=
 \fI<fwmark>\fP] [\fIprivate-key\fP \fI<file-path>\fP] [\fIpeer\fP \fI<base=
64-public-key>\fP [\fIremove\fP] [\fIpreshared-key\fP \fI<file-path>\fP] [\=
fIendpoint\fP \fI<ip>:<port>\fP] [\fIpersistent-keepalive\fP \fI<interval s=
econds>\fP] [\fIallowed-ips\fP \fI[+|-]<ip1>/<cidr1>\fP[,\fI[+|-]<ip2>/<cid=
r2>\fP]...] ]...
 Sets configuration values for the specified \fI<interface>\fP. Multiple
 \fIpeer\fPs may be specified, and if the \fIremove\fP argument is given
 for a peer, that peer is removed, not configured. If \fIlisten-port\fP
@@ -72,7 +72,11 @@ the device. The use of \fIpreshared-key\fP is optional, =
and may be omitted;
 it adds an additional layer of symmetric-key cryptography to be mixed into
 the already existing public-key cryptography, for post-quantum resistance.
 If \fIallowed-ips\fP is specified, but the value is the empty string, all
-allowed ips are removed from the peer. The use of \fIpersistent-keepalive\=
fP
+allowed ips are removed from the peer. By default, \fIallowed-ips\fP repla=
ces
+a peer's allowed ips. (Linux only) If + or - is prepended to any of the ip=
s then
+the update is incremental; ips prefixed with '+' or '' are added to the pe=
er's
+allowed ips if not present while ips prefixed with '-' are removed if pres=
ent.
+The use of \fIpersistent-keepalive\fP
 is optional and is by default off; setting it to 0 or "off" disables it.
 Otherwise it represents, in seconds, between 1 and 65535 inclusive, how of=
ten
 to send an authenticated empty packet to the peer, for the purpose of keep=
ing
diff --git a/src/set.c b/src/set.c
index 75560fd..992ffa2 100644
--- a/src/set.c
+++ b/src/set.c
@@ -18,7 +18,7 @@ int set_main(int argc, const char *argv[])
 	int ret =3D 1;
=20
 	if (argc < 3) {
-		fprintf(stderr, "Usage: %s %s <interface> [listen-port <port>] [fwmark <=
mark>] [private-key <file path>] [peer <base64 public key> [remove] [presha=
red-key <file path>] [endpoint <ip>:<port>] [persistent-keepalive <interval=
 seconds>] [allowed-ips <ip1>/<cidr1>[,<ip2>/<cidr2>]...] ]...\n", PROG_NAM=
E, argv[0]);
+		fprintf(stderr, "Usage: %s %s <interface> [listen-port <port>] [fwmark <=
mark>] [private-key <file path>] [peer <base64 public key> [remove] [presha=
red-key <file path>] [endpoint <ip>:<port>] [persistent-keepalive <interval=
 seconds>] [allowed-ips [+|-]<ip1>/<cidr1>[,[+|-]<ip2>/<cidr2>]...] ]...\n"=
, PROG_NAME, argv[0]);
 		return 1;
 	}
=20
diff --git a/src/uapi/linux/linux/wireguard.h b/src/uapi/linux/linux/wiregu=
ard.h
index 0efd52c..6ca266a 100644
--- a/src/uapi/linux/linux/wireguard.h
+++ b/src/uapi/linux/linux/wireguard.h
@@ -101,6 +101,10 @@
  *                    WGALLOWEDIP_A_FAMILY: NLA_U16
  *                    WGALLOWEDIP_A_IPADDR: struct in_addr or struct in6_a=
ddr
  *                    WGALLOWEDIP_A_CIDR_MASK: NLA_U8
+ *                    WGALLOWEDIP_A_FLAGS: NLA_U32, WGALLOWEDIP_F_REMOVE_M=
E if
+ *                                         the specified IP should be remo=
ved;
+ *                                         otherwise, this IP will be adde=
d if
+ *                                         it is not already present.
  *                0: NLA_NESTED
  *                    ...
  *                0: NLA_NESTED
@@ -184,11 +188,16 @@ enum wgpeer_attribute {
 };
 #define WGPEER_A_MAX (__WGPEER_A_LAST - 1)
=20
+enum wgallowedip_flag {
+	WGALLOWEDIP_F_REMOVE_ME =3D 1U << 0,
+	__WGALLOWEDIP_F_ALL =3D WGALLOWEDIP_F_REMOVE_ME
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
--=20
2.47.0.338.g60cca15819-goog

