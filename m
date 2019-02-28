Return-Path: <SRS0=YN3W=RD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DA8FC43381
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 28 Feb 2019 18:22:26 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8D3E2084D
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 28 Feb 2019 18:22:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=qq.com header.i=@qq.com header.b="cnLnjoQO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8D3E2084D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=qq.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5f4edbb8;
	Thu, 28 Feb 2019 18:12:40 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ed89226a
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Feb 2019 07:00:44 +0000 (UTC)
Received: from smtpbg65.qq.com (smtpbg65.qq.com [103.7.28.233])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c16fafd9
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Feb 2019 07:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1551337817; bh=SUsPqUM7/3gJaEsGWKkprKCn1/Hf9bvWBOz8HTYiFxM=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Transfer-Encoding;
 b=cnLnjoQO14Kuhw6kruczj8z3/0l6RUvSxGU2Ub47g/LfhlKB+9l7T7PTQI7VvHr3h
 +ef7TvStTgJuv0eSuY4bWqYyYcHk641B/44pNcLMNnz0soNebG6UDO04Bl6aqkh/+W
 Mpw8F+QnMpK306oxLm4v3EuFWyGGJIq6UX0xtan4=
X-QQ-mid: esmtp3t1551337815t7dgs15yo
Received: from localhost.localdomain (unknown [182.40.172.8])
 by esmtp4.qq.com (ESMTP) with 
 id ; Thu, 28 Feb 2019 15:10:14 +0800 (CST)
X-QQ-SSF: B1000000000000F0FMF02400000000T
X-QQ-FEAT: 0ESs8nxzjD9wJFNJ6Yc56DOqVjCmpwrJCXTK0q5e9y3duQuRtahujHPE5FsgK
 Z/ShIlzpkvSpCkq//b8dRLz4ooa+oX2KjvhMMwWl/DA2QtTH6UFqMc9iqUetyqpSADbrLoQ
 y5zda7HX52/t4J55sU+kt9emQvhEHroOPlegaEqDTrfamhb29Or4K0GCoun6HDNssmPBxmn
 GV8MvzqsA852jy+gMhbXg1EU/cuyEHNNNUNKgaQgQRLIJoQViBX9urixzk7L0E59eY1oaTF
 yJrAMalIB5Y5JNT1uHxoFtThA=
X-QQ-GoodBg: 0
From: 517067180@qq.com
To: wireguard@lists.zx2c4.com
Subject: [PATCH 1/2] tools: Rename IPC functions to reduce misleading
Date: Thu, 28 Feb 2019 15:10:12 +0800
Message-Id: <20190228071013.10640-1-517067180@qq.com>
X-Mailer: git-send-email 2.20.1.windows.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: esmtp:qq.com:bgforeign:bgforeign2
X-QQ-Bgrelay: 1
X-Mailman-Approved-At: Thu, 28 Feb 2019 19:12:38 +0100
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

From: Liu Qun <517067180@qq.com>

The function name like ipc_get_device() is a little bit misleading.
To make the code more readable for new developers, here are some suggestions:
* Rename ipc_get_device(&dev) to ipc_fetch_conf(&conf) because it only fetches the runtime configuations from kernel.
* Funtion prototype ipc_set_device(struct wgdevice *dev) is changed to ipc_set_device(const struct wgdevice *newconf).

Change the following IPC function names and parameters which used to be confusing:
ipc_set_device(dev)                  => ipc_set_device(newconf)
ipc_get_device(dev, interface)       => ipc_fetch_conf(conf, interface)
kernel_set_device(dev)               => kernel_set_device(newconf)
kernel_get_device(device, interface) => kernel_fetch_conf(conf, interface)
userspace_set_device(dev)            => userspace_set_device(newconf)
userspace_get_device(out, interface) => userspace_fetch_conf(out, interface)

Renamed local variable/parameter symbols:
* In showconf_main(), show_main():
  device => conf
* In ipc_fetch_conf(), kernel_fetch_conf(), userspace_fetch_conf():
  dev => conf
* In ipc_set_device(), kernel_set_device(), userspace_set_device():
  dev => newconf

Note:
A lot of braces are added to the if-else code blocks to keep ourselves from making unexpected mistakes in the future.

Changed function prototypes:
int ipc_set_device(struct wgdevice *) => int ipc_set_device(const struct wgdevice *newconf)
int kernel_set_device(struct wgdevice *) => int kernel_set_device(const struct wgdevice *newconf)
int userspace_set_device(struct wgdevice *) => int userspace_set_device(const struct wgdevice *newconf)

Signed-off-by: Liu Qun <517067180@qq.com>
---
 src/tools/ipc.c      | 220 +++++++++++++++++++++++++------------------
 src/tools/ipc.h      |   4 +-
 src/tools/show.c     |  36 +++----
 src/tools/showconf.c |  56 ++++++-----
 4 files changed, 185 insertions(+), 131 deletions(-)

diff --git a/src/tools/ipc.c b/src/tools/ipc.c
index 7ab3a62..528a780 100644
--- a/src/tools/ipc.c
+++ b/src/tools/ipc.c
@@ -198,7 +198,7 @@ out:
 	return ret;
 }
 
-static int userspace_set_device(struct wgdevice *dev)
+static int userspace_set_device(const struct wgdevice *newconf)
 {
 	char hex[WG_KEY_LEN_HEX], ip[INET6_ADDRSTRLEN], host[4096 + 1], service[512 + 1];
 	struct wgpeer *peer;
@@ -207,23 +207,27 @@ static int userspace_set_device(struct wgdevice *dev)
 	int ret;
 	socklen_t addr_len;
 
-	f = userspace_interface_file(dev->name);
-	if (!f)
+	f = userspace_interface_file(newconf->name);
+	if (!f) {
 		return -errno;
+	}
 	fprintf(f, "set=1\n");
 
-	if (dev->flags & WGDEVICE_HAS_PRIVATE_KEY) {
-		key_to_hex(hex, dev->private_key);
+	if (newconf->flags & WGDEVICE_HAS_PRIVATE_KEY) {
+		key_to_hex(hex, newconf->private_key);
 		fprintf(f, "private_key=%s\n", hex);
 	}
-	if (dev->flags & WGDEVICE_HAS_LISTEN_PORT)
-		fprintf(f, "listen_port=%u\n", dev->listen_port);
-	if (dev->flags & WGDEVICE_HAS_FWMARK)
-		fprintf(f, "fwmark=%u\n", dev->fwmark);
-	if (dev->flags & WGDEVICE_REPLACE_PEERS)
+	if (newconf->flags & WGDEVICE_HAS_LISTEN_PORT) {
+		fprintf(f, "listen_port=%u\n", newconf->listen_port);
+	}
+	if (newconf->flags & WGDEVICE_HAS_FWMARK) {
+		fprintf(f, "fwmark=%u\n", newconf->fwmark);
+	}
+	if (newconf->flags & WGDEVICE_REPLACE_PEERS) {
 		fprintf(f, "replace_peers=true\n");
+	}
 
-	for_each_wgpeer(dev, peer) {
+	for_each_wgpeer(newconf, peer) {
 		key_to_hex(hex, peer->public_key);
 		fprintf(f, "public_key=%s\n", hex);
 		if (peer->flags & WGPEER_REMOVE_ME) {
@@ -236,38 +240,45 @@ static int userspace_set_device(struct wgdevice *dev)
 		}
 		if (peer->endpoint.addr.sa_family == AF_INET || peer->endpoint.addr.sa_family == AF_INET6) {
 			addr_len = 0;
-			if (peer->endpoint.addr.sa_family == AF_INET)
+			if (peer->endpoint.addr.sa_family == AF_INET) {
 				addr_len = sizeof(struct sockaddr_in);
-			else if (peer->endpoint.addr.sa_family == AF_INET6)
+			} else if (peer->endpoint.addr.sa_family == AF_INET6) {
 				addr_len = sizeof(struct sockaddr_in6);
+			}
 			if (!getnameinfo(&peer->endpoint.addr, addr_len, host, sizeof(host), service, sizeof(service), NI_DGRAM | NI_NUMERICSERV | NI_NUMERICHOST)) {
-				if (peer->endpoint.addr.sa_family == AF_INET6 && strchr(host, ':'))
+				if (peer->endpoint.addr.sa_family == AF_INET6 && strchr(host, ':')) {
 					fprintf(f, "endpoint=[%s]:%s\n", host, service);
-				else
+				} else {
 					fprintf(f, "endpoint=%s:%s\n", host, service);
+				}
 			}
 		}
-		if (peer->flags & WGPEER_HAS_PERSISTENT_KEEPALIVE_INTERVAL)
+		if (peer->flags & WGPEER_HAS_PERSISTENT_KEEPALIVE_INTERVAL) {
 			fprintf(f, "persistent_keepalive_interval=%u\n", peer->persistent_keepalive_interval);
-		if (peer->flags & WGPEER_REPLACE_ALLOWEDIPS)
+		} if (peer->flags & WGPEER_REPLACE_ALLOWEDIPS) {
 			fprintf(f, "replace_allowed_ips=true\n");
+		}
 		for_each_wgallowedip(peer, allowedip) {
 			if (allowedip->family == AF_INET) {
-				if (!inet_ntop(AF_INET, &allowedip->ip4, ip, INET6_ADDRSTRLEN))
+				if (!inet_ntop(AF_INET, &allowedip->ip4, ip, INET6_ADDRSTRLEN)) {
 					continue;
+				}
 			} else if (allowedip->family == AF_INET6) {
-				if (!inet_ntop(AF_INET6, &allowedip->ip6, ip, INET6_ADDRSTRLEN))
+				if (!inet_ntop(AF_INET6, &allowedip->ip6, ip, INET6_ADDRSTRLEN)) {
 					continue;
-			} else
+				}
+			} else {
 				continue;
+			}
 			fprintf(f, "allowed_ip=%s/%d\n", ip, allowedip->cidr);
 		}
 	}
 	fprintf(f, "\n");
 	fflush(f);
 
-	if (fscanf(f, "errno=%d\n\n", &ret) != 1)
+	if (fscanf(f, "errno=%d\n\n", &ret) != 1) {
 		ret = errno ? -errno : -EPROTO;
+	}
 	fclose(f);
 	errno = -ret;
 	return ret;
@@ -284,9 +295,9 @@ static int userspace_set_device(struct wgdevice *dev)
 	num; \
 })
 
-static int userspace_get_device(struct wgdevice **out, const char *interface)
+static int userspace_fetch_conf(struct wgdevice **out, const char *interface)
 {
-	struct wgdevice *dev;
+	struct wgdevice *conf;
 	struct wgpeer *peer = NULL;
 	struct wgallowedip *allowedip = NULL;
 	size_t line_buffer_len = 0, line_len;
@@ -294,19 +305,21 @@ static int userspace_get_device(struct wgdevice **out, const char *interface)
 	FILE *f;
 	int ret = -EPROTO;
 
-	*out = dev = calloc(1, sizeof(*dev));
-	if (!dev)
+	*out = conf = calloc(1, sizeof(*conf));
+	if (!conf) {
 		return -errno;
+	}
 
 	f = userspace_interface_file(interface);
-	if (!f)
+	if (!f) {
 		return -errno;
+	}
 
 	fprintf(f, "get=1\n\n");
 	fflush(f);
 
-	strncpy(dev->name, interface, IFNAMSIZ - 1);
-	dev->name[IFNAMSIZ - 1] = '\0';
+	strncpy(conf->name, interface, IFNAMSIZ - 1);
+	conf->name[IFNAMSIZ - 1] = '\0';
 
 	while (getline(&key, &line_buffer_len, f) > 0) {
 		line_len = strlen(key);
@@ -316,21 +329,23 @@ static int userspace_get_device(struct wgdevice **out, const char *interface)
 			return ret;
 		}
 		value = strchr(key, '=');
-		if (!value || line_len == 0 || key[line_len - 1] != '\n')
+		if (!value || line_len == 0 || key[line_len - 1] != '\n') {
 			break;
+		}
 		*value++ = key[--line_len] = '\0';
 
 		if (!peer && !strcmp(key, "private_key")) {
-			if (!key_from_hex(dev->private_key, value))
+			if (!key_from_hex(conf->private_key, value)) {
 				break;
-			curve25519_generate_public(dev->public_key, dev->private_key);
-			dev->flags |= WGDEVICE_HAS_PRIVATE_KEY | WGDEVICE_HAS_PUBLIC_KEY;
+			}
+			curve25519_generate_public(conf->public_key, conf->private_key);
+			conf->flags |= WGDEVICE_HAS_PRIVATE_KEY | WGDEVICE_HAS_PUBLIC_KEY;
 		} else if (!peer && !strcmp(key, "listen_port")) {
-			dev->listen_port = NUM(0xffffU);
-			dev->flags |= WGDEVICE_HAS_LISTEN_PORT;
+			conf->listen_port = NUM(0xffffU);
+			conf->flags |= WGDEVICE_HAS_LISTEN_PORT;
 		} else if (!peer && !strcmp(key, "fwmark")) {
-			dev->fwmark = NUM(0xffffffffU);
-			dev->flags |= WGDEVICE_HAS_FWMARK;
+			conf->fwmark = NUM(0xffffffffU);
+			conf->flags |= WGDEVICE_HAS_FWMARK;
 		} else if (!strcmp(key, "public_key")) {
 			struct wgpeer *new_peer = calloc(1, sizeof(*new_peer));
 
@@ -339,19 +354,23 @@ static int userspace_get_device(struct wgdevice **out, const char *interface)
 				goto err;
 			}
 			allowedip = NULL;
-			if (peer)
+			if (peer) {
 				peer->next_peer = new_peer;
-			else
-				dev->first_peer = new_peer;
+			} else {
+				conf->first_peer = new_peer;
+			}
 			peer = new_peer;
-			if (!key_from_hex(peer->public_key, value))
+			if (!key_from_hex(peer->public_key, value)) {
 				break;
+			}
 			peer->flags |= WGPEER_HAS_PUBLIC_KEY;
 		} else if (peer && !strcmp(key, "preshared_key")) {
-			if (!key_from_hex(peer->preshared_key, value))
+			if (!key_from_hex(peer->preshared_key, value)) {
 				break;
-			if (!key_is_zero(peer->preshared_key))
+			}
+			if (!key_is_zero(peer->preshared_key)) {
 				peer->flags |= WGPEER_HAS_PRESHARED_KEY;
+			}
 		} else if (peer && !strcmp(key, "endpoint")) {
 			char *begin, *end;
 			struct addrinfo *resolved;
@@ -360,8 +379,9 @@ static int userspace_get_device(struct wgdevice **out, const char *interface)
 				.ai_socktype = SOCK_DGRAM,
 				.ai_protocol = IPPROTO_UDP
 			};
-			if (!strlen(value))
+			if (!strlen(value)) {
 				break;
+			}
 			if (value[0] == '[') {
 				begin = &value[1];
 				end = strchr(value, ']');
@@ -382,9 +402,9 @@ static int userspace_get_device(struct wgdevice **out, const char *interface)
 				goto err;
 			}
 			if ((resolved->ai_family == AF_INET && resolved->ai_addrlen == sizeof(struct sockaddr_in)) ||
-			    (resolved->ai_family == AF_INET6 && resolved->ai_addrlen == sizeof(struct sockaddr_in6)))
+			    (resolved->ai_family == AF_INET6 && resolved->ai_addrlen == sizeof(struct sockaddr_in6))) {
 				memcpy(&peer->endpoint.addr, resolved->ai_addr, resolved->ai_addrlen);
-			else  {
+			} else {
 				freeaddrinfo(resolved);
 				break;
 			}
@@ -396,44 +416,50 @@ static int userspace_get_device(struct wgdevice **out, const char *interface)
 			struct wgallowedip *new_allowedip;
 			char *end, *mask = value, *ip = strsep(&mask, "/");
 
-			if (!mask || !isdigit(mask[0]))
+			if (!mask || !isdigit(mask[0])) {
 				break;
+			}
 			new_allowedip = calloc(1, sizeof(*new_allowedip));
 			if (!new_allowedip) {
 				ret = -ENOMEM;
 				goto err;
 			}
-			if (allowedip)
+			if (allowedip) {
 				allowedip->next_allowedip = new_allowedip;
-			else
+			} else {
 				peer->first_allowedip = new_allowedip;
+			}
 			allowedip = new_allowedip;
 			allowedip->family = AF_UNSPEC;
 			if (strchr(ip, ':')) {
-				if (inet_pton(AF_INET6, ip, &allowedip->ip6) == 1)
+				if (inet_pton(AF_INET6, ip, &allowedip->ip6) == 1) {
 					allowedip->family = AF_INET6;
+				}
 			} else {
-				if (inet_pton(AF_INET, ip, &allowedip->ip4) == 1)
+				if (inet_pton(AF_INET, ip, &allowedip->ip4) == 1) {
 					allowedip->family = AF_INET;
+				}
 			}
 			allowedip->cidr = strtoul(mask, &end, 10);
-			if (*end || allowedip->family == AF_UNSPEC || (allowedip->family == AF_INET6 && allowedip->cidr > 128) || (allowedip->family == AF_INET && allowedip->cidr > 32))
+			if (*end || allowedip->family == AF_UNSPEC || (allowedip->family == AF_INET6 && allowedip->cidr > 128) || (allowedip->family == AF_INET && allowedip->cidr > 32)) {
 				break;
-		} else if (peer && !strcmp(key, "last_handshake_time_sec"))
+			}
+		} else if (peer && !strcmp(key, "last_handshake_time_sec")) {
 			peer->last_handshake_time.tv_sec = NUM(0x7fffffffffffffffULL);
-		else if (peer && !strcmp(key, "last_handshake_time_nsec"))
+		} else if (peer && !strcmp(key, "last_handshake_time_nsec")) {
 			peer->last_handshake_time.tv_nsec = NUM(0x7fffffffffffffffULL);
-		else if (peer && !strcmp(key, "rx_bytes"))
+		} else if (peer && !strcmp(key, "rx_bytes")) {
 			peer->rx_bytes = NUM(0xffffffffffffffffULL);
-		else if (peer && !strcmp(key, "tx_bytes"))
+		} else if (peer && !strcmp(key, "tx_bytes")) {
 			peer->tx_bytes = NUM(0xffffffffffffffffULL);
-		else if (!strcmp(key, "errno"))
+		} else if (!strcmp(key, "errno")) {
 			ret = -NUM(0x7fffffffU);
+		}
 	}
 	ret = -EPROTO;
 err:
 	free(key);
-	free_wgdevice(dev);
+	free_wgdevice(conf);
 	*out = NULL;
 	fclose(f);
 	errno = -ret;
@@ -551,7 +577,7 @@ cleanup:
 	return ret;
 }
 
-static int kernel_set_device(struct wgdevice *dev)
+static int kernel_set_device(const struct wgdevice *newconf)
 {
 	int ret = 0;
 	struct wgpeer *peer = NULL;
@@ -561,32 +587,39 @@ static int kernel_set_device(struct wgdevice *dev)
 	struct mnlg_socket *nlg;
 
 	nlg = mnlg_socket_open(WG_GENL_NAME, WG_GENL_VERSION);
-	if (!nlg)
+	if (!nlg) {
 		return -errno;
+	}
 
 again:
 	nlh = mnlg_msg_prepare(nlg, WG_CMD_SET_DEVICE, NLM_F_REQUEST | NLM_F_ACK);
-	mnl_attr_put_strz(nlh, WGDEVICE_A_IFNAME, dev->name);
+	mnl_attr_put_strz(nlh, WGDEVICE_A_IFNAME, newconf->name);
 
 	if (!peer) {
 		uint32_t flags = 0;
 
-		if (dev->flags & WGDEVICE_HAS_PRIVATE_KEY)
-			mnl_attr_put(nlh, WGDEVICE_A_PRIVATE_KEY, sizeof(dev->private_key), dev->private_key);
-		if (dev->flags & WGDEVICE_HAS_LISTEN_PORT)
-			mnl_attr_put_u16(nlh, WGDEVICE_A_LISTEN_PORT, dev->listen_port);
-		if (dev->flags & WGDEVICE_HAS_FWMARK)
-			mnl_attr_put_u32(nlh, WGDEVICE_A_FWMARK, dev->fwmark);
-		if (dev->flags & WGDEVICE_REPLACE_PEERS)
+		if (newconf->flags & WGDEVICE_HAS_PRIVATE_KEY) {
+			mnl_attr_put(nlh, WGDEVICE_A_PRIVATE_KEY, sizeof(newconf->private_key), newconf->private_key);
+		}
+		if (newconf->flags & WGDEVICE_HAS_LISTEN_PORT) {
+			mnl_attr_put_u16(nlh, WGDEVICE_A_LISTEN_PORT, newconf->listen_port);
+		}
+		if (newconf->flags & WGDEVICE_HAS_FWMARK) {
+			mnl_attr_put_u32(nlh, WGDEVICE_A_FWMARK, newconf->fwmark);
+		}
+		if (newconf->flags & WGDEVICE_REPLACE_PEERS) {
 			flags |= WGDEVICE_F_REPLACE_PEERS;
-		if (flags)
+		}
+		if (flags) {
 			mnl_attr_put_u32(nlh, WGDEVICE_A_FLAGS, flags);
+		}
 	}
-	if (!dev->first_peer)
+	if (!newconf->first_peer) {
 		goto send;
+	}
 	peers_nest = peer_nest = allowedips_nest = allowedip_nest = NULL;
 	peers_nest = mnl_attr_nest_start(nlh, WGDEVICE_A_PEERS);
-	for (peer = peer ? peer : dev->first_peer; peer; peer = peer->next_peer) {
+	for (peer = peer ? peer : newconf->first_peer; peer; peer = peer->next_peer) {
 		uint32_t flags = 0;
 
 		peer_nest = mnl_attr_nest_start_check(nlh, SOCKET_BUFFER_SIZE, 0);
@@ -885,21 +918,22 @@ static void coalesce_peers(struct wgdevice *device)
 	}
 }
 
-static int kernel_get_device(struct wgdevice **device, const char *interface)
+static int kernel_fetch_conf(struct wgdevice **conf, const char *interface)
 {
 	int ret = 0;
 	struct nlmsghdr *nlh;
 	struct mnlg_socket *nlg;
 
 try_again:
-	*device = calloc(1, sizeof(**device));
-	if (!*device)
+	*conf = calloc(1, sizeof(**conf));
+	if (!*conf) {
 		return -errno;
+	}
 
 	nlg = mnlg_socket_open(WG_GENL_NAME, WG_GENL_VERSION);
 	if (!nlg) {
-		free_wgdevice(*device);
-		*device = NULL;
+		free_wgdevice(*conf);
+		*conf = NULL;
 		return -errno;
 	}
 
@@ -910,20 +944,22 @@ try_again:
 		goto out;
 	}
 	errno = 0;
-	if (mnlg_socket_recv_run(nlg, read_device_cb, *device) < 0) {
+	if (mnlg_socket_recv_run(nlg, read_device_cb, *conf) < 0) {
 		ret = errno ? -errno : -EINVAL;
 		goto out;
 	}
-	coalesce_peers(*device);
+	coalesce_peers(*conf);
 
 out:
-	if (nlg)
+	if (nlg) {
 		mnlg_socket_close(nlg);
+	}
 	if (ret) {
-		free_wgdevice(*device);
-		if (ret == -EINTR)
+		free_wgdevice(*conf);
+		if (ret == -EINTR) {
 			goto try_again;
-		*device = NULL;
+		}
+		*conf = NULL;
 	}
 	errno = -ret;
 	return ret;
@@ -959,24 +995,26 @@ cleanup:
 	return buffer.buffer;
 }
 
-int ipc_get_device(struct wgdevice **dev, const char *interface)
+int ipc_fetch_conf(struct wgdevice **conf, const char *interface)
 {
 #ifdef __linux__
-	if (userspace_has_wireguard_interface(interface))
-		return userspace_get_device(dev, interface);
-	return kernel_get_device(dev, interface);
+	if (userspace_has_wireguard_interface(interface)) {
+		return userspace_fetch_conf(conf, interface);
+	}
+	return kernel_fetch_conf(conf, interface);
 #else
-	return userspace_get_device(dev, interface);
+	return userspace_fetch_conf(conf, interface);
 #endif
 }
 
-int ipc_set_device(struct wgdevice *dev)
+int ipc_set_device(const struct wgdevice *newconf)
 {
 #ifdef __linux__
-	if (userspace_has_wireguard_interface(dev->name))
-		return userspace_set_device(dev);
-	return kernel_set_device(dev);
+	if (userspace_has_wireguard_interface(newconf->name)) {
+		return userspace_set_device(newconf);
+	}
+	return kernel_set_device(newconf);
 #else
-	return userspace_set_device(dev);
+	return userspace_set_device(newconf);
 #endif
 }
diff --git a/src/tools/ipc.h b/src/tools/ipc.h
index 6c564be..b9923d3 100644
--- a/src/tools/ipc.h
+++ b/src/tools/ipc.h
@@ -10,8 +10,8 @@
 
 struct wgdevice;
 
-int ipc_set_device(struct wgdevice *dev);
-int ipc_get_device(struct wgdevice **dev, const char *interface);
+int ipc_set_device(const struct wgdevice *conf);
+int ipc_fetch_conf(struct wgdevice **conf, const char *interface);
 char *ipc_list_devices(void);
 
 #endif
diff --git a/src/tools/show.c b/src/tools/show.c
index 4cc34ab..fc63d3c 100644
--- a/src/tools/show.c
+++ b/src/tools/show.c
@@ -398,24 +398,25 @@ int show_main(int argc, char *argv[])
 		ret = !!*interfaces;
 		interface = interfaces;
 		for (size_t len = 0; (len = strlen(interface)); interface += len + 1) {
-			struct wgdevice *device = NULL;
+			struct wgdevice *conf = NULL;
 
-			if (ipc_get_device(&device, interface) < 0) {
+			if (ipc_fetch_conf(&conf, interface) < 0) {
 				fprintf(stderr, "Unable to access interface %s: %s\n", interface, strerror(errno));
 				continue;
 			}
 			if (argc == 3) {
-				if (!ugly_print(device, argv[2], true)) {
+				if (!ugly_print(conf, argv[2], true)) {
 					ret = 1;
-					free_wgdevice(device);
+					free_wgdevice(conf);
 					break;
 				}
 			} else {
-				pretty_print(device);
-				if (strlen(interface + len + 1))
+				pretty_print(conf);
+				if (strlen(interface + len + 1)) {
 					printf("\n");
+				}
 			}
-			free_wgdevice(device);
+			free_wgdevice(conf);
 			ret = 0;
 		}
 		free(interfaces);
@@ -432,24 +433,27 @@ int show_main(int argc, char *argv[])
 			return 1;
 		}
 		interface = interfaces;
-		for (size_t len = 0; (len = strlen(interface)); interface += len + 1)
+		for (size_t len = 0; (len = strlen(interface)); interface += len + 1) {
 			printf("%s%c", interface, strlen(interface + len + 1) ? ' ' : '\n');
+		}
 		free(interfaces);
-	} else if (argc == 2 && (!strcmp(argv[1], "-h") || !strcmp(argv[1], "--help") || !strcmp(argv[1], "help")))
+	} else if (argc == 2 && (!strcmp(argv[1], "-h") || !strcmp(argv[1], "--help") || !strcmp(argv[1], "help"))) {
 		show_usage();
-	else {
-		struct wgdevice *device = NULL;
+	} else {
+		struct wgdevice *conf = NULL;
 
-		if (ipc_get_device(&device, argv[1]) < 0) {
+		if (ipc_fetch_conf(&conf, argv[1]) < 0) {
 			perror("Unable to access interface");
 			return 1;
 		}
 		if (argc == 3) {
-			if (!ugly_print(device, argv[2], false))
+			if (!ugly_print(conf, argv[2], false)) {
 				ret = 1;
-		} else
-			pretty_print(device);
-		free_wgdevice(device);
+			}
+		} else {
+			pretty_print(conf);
+		}
+		free_wgdevice(conf);
 	}
 	return ret;
 }
diff --git a/src/tools/showconf.c b/src/tools/showconf.c
index ad76b7f..e7b0b5e 100644
--- a/src/tools/showconf.c
+++ b/src/tools/showconf.c
@@ -22,7 +22,7 @@ int showconf_main(int argc, char *argv[])
 {
 	char base64[WG_KEY_LEN_BASE64];
 	char ip[INET6_ADDRSTRLEN];
-	struct wgdevice *device = NULL;
+	struct wgdevice *conf = NULL;
 	struct wgpeer *peer;
 	struct wgallowedip *allowedip;
 	int ret = 1;
@@ -32,72 +32,84 @@ int showconf_main(int argc, char *argv[])
 		return 1;
 	}
 
-	if (ipc_get_device(&device, argv[1])) {
+	if (ipc_fetch_conf(&conf, argv[1])) {
 		perror("Unable to access interface");
 		goto cleanup;
 	}
 
 	printf("[Interface]\n");
-	if (device->listen_port)
-		printf("ListenPort = %u\n", device->listen_port);
-	if (device->fwmark)
-		printf("FwMark = 0x%x\n", device->fwmark);
-	if (device->flags & WGDEVICE_HAS_PRIVATE_KEY) {
-		key_to_base64(base64, device->private_key);
+	if (conf->listen_port) {
+		printf("ListenPort = %u\n", conf->listen_port);
+	}
+	if (conf->fwmark) {
+		printf("FwMark = 0x%x\n", conf->fwmark);
+	}
+	if (conf->flags & WGDEVICE_HAS_PRIVATE_KEY) {
+		key_to_base64(base64, conf->private_key);
 		printf("PrivateKey = %s\n", base64);
 	}
 	printf("\n");
-	for_each_wgpeer(device, peer) {
+	for_each_wgpeer(conf, peer) {
 		key_to_base64(base64, peer->public_key);
 		printf("[Peer]\nPublicKey = %s\n", base64);
 		if (peer->flags & WGPEER_HAS_PRESHARED_KEY) {
 			key_to_base64(base64, peer->preshared_key);
 			printf("PresharedKey = %s\n", base64);
 		}
-		if (peer->first_allowedip)
+		if (peer->first_allowedip) {
 			printf("AllowedIPs = ");
+		}
 		for_each_wgallowedip(peer, allowedip) {
 			if (allowedip->family == AF_INET) {
-				if (!inet_ntop(AF_INET, &allowedip->ip4, ip, INET6_ADDRSTRLEN))
+				if (!inet_ntop(AF_INET, &allowedip->ip4, ip, INET6_ADDRSTRLEN)) {
 					continue;
+				}
 			} else if (allowedip->family == AF_INET6) {
-				if (!inet_ntop(AF_INET6, &allowedip->ip6, ip, INET6_ADDRSTRLEN))
+				if (!inet_ntop(AF_INET6, &allowedip->ip6, ip, INET6_ADDRSTRLEN)) {
 					continue;
-			} else
+				}
+			} else {
 				continue;
+			}
 			printf("%s/%d", ip, allowedip->cidr);
-			if (allowedip->next_allowedip)
+			if (allowedip->next_allowedip) {
 				printf(", ");
+			}
 		}
-		if (peer->first_allowedip)
+		if (peer->first_allowedip) {
 			printf("\n");
+		}
 
 		if (peer->endpoint.addr.sa_family == AF_INET || peer->endpoint.addr.sa_family == AF_INET6) {
 			char host[4096 + 1];
 			char service[512 + 1];
 			socklen_t addr_len = 0;
 
-			if (peer->endpoint.addr.sa_family == AF_INET)
+			if (peer->endpoint.addr.sa_family == AF_INET) {
 				addr_len = sizeof(struct sockaddr_in);
-			else if (peer->endpoint.addr.sa_family == AF_INET6)
+			} else if (peer->endpoint.addr.sa_family == AF_INET6) {
 				addr_len = sizeof(struct sockaddr_in6);
+			}
 			if (!getnameinfo(&peer->endpoint.addr, addr_len, host, sizeof(host), service, sizeof(service), NI_DGRAM | NI_NUMERICSERV | NI_NUMERICHOST)) {
-				if (peer->endpoint.addr.sa_family == AF_INET6 && strchr(host, ':'))
+				if (peer->endpoint.addr.sa_family == AF_INET6 && strchr(host, ':')) {
 					printf("Endpoint = [%s]:%s\n", host, service);
-				else
+				} else {
 					printf("Endpoint = %s:%s\n", host, service);
+				}
 			}
 		}
 
-		if (peer->persistent_keepalive_interval)
+		if (peer->persistent_keepalive_interval) {
 			printf("PersistentKeepalive = %u\n", peer->persistent_keepalive_interval);
+		}
 
-		if (peer->next_peer)
+		if (peer->next_peer) {
 			printf("\n");
+		}
 	}
 	ret = 0;
 
 cleanup:
-	free_wgdevice(device);
+	free_wgdevice(conf);
 	return ret;
 }
-- 
2.20.1.windows.1



_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
