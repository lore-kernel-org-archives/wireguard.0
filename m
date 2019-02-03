Return-Path: <SRS0=rgFP=QK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80294C169C4
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  3 Feb 2019 22:08:15 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 102DA217D6
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  3 Feb 2019 22:08:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=de-vri.es header.i=@de-vri.es header.b="iHHqVqEu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 102DA217D6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=de-vri.es
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 437a83ff;
	Sun, 3 Feb 2019 22:01:41 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1c5f4f41
 for <wireguard@lists.zx2c4.com>; Sun, 3 Feb 2019 22:01:39 +0000 (UTC)
Received: from mx1.de-vri.es (voyager.de-vri.es [149.210.162.205])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 097423b3
 for <wireguard@lists.zx2c4.com>; Sun, 3 Feb 2019 22:01:39 +0000 (UTC)
Received: from voyager (localhost [127.0.0.1])
 by voyager (OpenSMTPD) with ESMTP id 89c4bbf1
 for <wireguard@lists.zx2c4.com>; Sun, 3 Feb 2019 22:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=de-vri.es; h=from:to
 :subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding; s=voyager; bh=DSnwM38QaTXu9udUT2Qce5
 zC++k=; b=iHHqVqEud4tlCKnSPAZNQN9wV1BdN+DkyFqwYoBhAzAkXupl0JFIZg
 O0tPezXUs315jSvnsNeGuQ9wANbAayCwY2M+p9Zgpz6PDptNFecR7inCYWhgCw3H
 +h8z/h6Za0EnXHVkkqLdNVISpIYNa0oaGN+AwoHnQ2ccAIWRbq9AXW/IeEmU6toB
 rzppbq7kie0El32+HWibNXTPE1GYgT91K5G+uM1sj6Qb32JcY/O2v1Ai6iq83Cby
 kBJs1xgH1ZAKQDtz6hImeyryyv67Gr5rhXQ3x1j8RfT5KlHu4aAnUfX0afOXP3xJ
 STDxKtZvwZSlKHY2dqtPkEtFCSqD17xhd6QxvyjrpbpArTe+6g1+hZ17GkKfejkd
 3ZnqsK+ivey6rtVPPmrpm3oWAZjZxuzAljHx1CpCotRSntYFka8CaHp+ylPZgrBg
 y9n1fUODLOuQ7oZcdgYI9Sggf7+3cNRXmsboGlqHOSvPFDcSKu/z72qY3+DFAlFE
 uFDay0+RlkbCZBjY18K98Eovf5mlvXCe4xY25ObpoKf5FNpBGLz2+LkOKiX8WgXJ
 WR0MaQ2y2jLf7150l3AgXZewf/zhVGC1oVZqQ7aX/IyZnPnL6hN3e8QbW2cnJY3i
 MB+CQBsNcdzO7HyvuTD2o0xcV0Q3vQUmu+ZXJXIkVcZVDrJxpRPWg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=de-vri.es; h=from:to:subject
 :date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding; q=dns; s=voyager; b=iF8AkZS5fLcFrjqI
 wmDwYgpli31M6NWzQmrtBFyCRfxoVGvZtmRuxFXW+L6RsgS3VNMayINfLKCBIRmL
 jUVIIMtp5bgVfgghzRPr2zU+8ZS8fTDMljUnm2Suhs/35Vp1OHy8vA84m1wLCm7s
 X6WOLE2q6gIKf4APmnloZIYL51se+nHsQYSEWzqMT8XD4ISOVYlIy7hw6H21dZfW
 MzeSfITRQP6pMZvH2Gvw380LJg/8GmhWPw5L+pvMf9T8nctoCXGWai4VXzXJ+ERt
 29DwLdJnjeYMkyBT20eHtRPZyve4XJ/w1XC5gPNKTl/criKseIfErmc8f/mSZ+LR
 /pQuGYxnb4+oxYQxzrsDoGeQLJ8Q8UQS6pF6rIrqlK7c4aOAS/QFk1VXT8hmTdAk
 aRy9THlQ7cENY/7jNrw/zi4FbKv3F4K3XaxxivM/gJvXM/jHaj0gzv1CjZ0RVV6l
 LcEuUlOX63XOmoFkrl1H0cfqCV/MaF+Ihxi+fB4HqSWaRXZjn7rxWvwUCRyCHd++
 3BfVcAqowYZue8IESC6Boahp7XMnUzHY1rlfzntRhq+hBxn4HwgMGuZQT89Chi4f
 rLHAubXLnYhX8pRyudtfMVPIk5Uoby/Wih9XjuYiNLKnvuO7oeBG6Qogk520+K+r
 GnNWUtJMdYXqOvphyAjcd+cOTnY=
Received: from maarten-desktop.internal.de-vri.es
 (D93FCE99.cm-21.dynamic.ziggo.nl [217.63.206.153])
 by voyager (OpenSMTPD) with ESMTPSA id d5bf46c5
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 3 Feb 2019 22:08:10 +0000 (UTC)
From: Maarten de Vries <maarten@de-vri.es>
To: wireguard@lists.zx2c4.com
Subject: [PATCH] Allow changing `creator_net` after interface creation.
Date: Sun,  3 Feb 2019 23:08:06 +0100
Message-Id: <20190203220806.14327-1-maarten@de-vri.es>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190203213156.7553-1-maarten@de-vri.es>
References: <20190203213156.7553-1-maarten@de-vri.es>
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

This allows the wireguard interface to be created inside an empty
network namespace, and still use a different namespace for the tunnel
socket.

This means that the interface will never be visible outside of the
intended namespace. This is particularly useful if the interface is to
be created on the fly in an anonymous network namespace. There is no
need to generate a unique name for the interface, and there is no risk
that any process outside of the new namespace tries to configure or
otherwise use the wireguard interface.

An example of how this can be used:

$ ip netns create foo
$ ip -n foo link add wg0 type wireguard
$ ip netns exec foo wg set wg0 tunnel-netns /proc/1/ns/net
$ ip netns exec foo wg set ...
$ ip -n foo link set wg0 up

Signed-off-by: Maarten de Vries <maarten@de-vri.es>
---

Fixed the patch, previous one was broken by a manual edit. Also fixed an
error in the commit message.

 src/netlink.c          | 32 +++++++++++++++++++++++++++++++-
 src/tools/config.c     | 24 ++++++++++++++++++++++++
 src/tools/containers.h |  3 +++
 src/tools/ipc.c        | 15 +++++++++++++++
 src/tools/set.c        |  2 +-
 src/uapi/wireguard.h   |  3 +++
 6 files changed, 77 insertions(+), 2 deletions(-)

diff --git a/src/netlink.c b/src/netlink.c
index 9a33192..82e9030 100644
--- a/src/netlink.c
+++ b/src/netlink.c
@@ -24,7 +24,8 @@ static const struct nla_policy device_policy[WGDEVICE_A_MAX + 1] = {
 	[WGDEVICE_A_FLAGS]		= { .type = NLA_U32 },
 	[WGDEVICE_A_LISTEN_PORT]	= { .type = NLA_U16 },
 	[WGDEVICE_A_FWMARK]		= { .type = NLA_U32 },
-	[WGDEVICE_A_PEERS]		= { .type = NLA_NESTED }
+	[WGDEVICE_A_PEERS]		= { .type = NLA_NESTED },
+	[WGDEVICE_A_TUNNEL_NETNS_FD]	= { .type = NLA_U32 }
 };
 
 static const struct nla_policy peer_policy[WGPEER_A_MAX + 1] = {
@@ -472,6 +473,27 @@ out:
 	return ret;
 }
 
+static int set_tunnel_netns(struct wg_device *wg, u32 fd)
+{
+	struct net *new_net;
+
+	if (wg->sock4 != NULL || wg->sock6 != NULL)
+		return -EINVAL;
+
+	new_net = get_net_ns_by_fd(fd);
+
+	if (IS_ERR(new_net))
+		return PTR_ERR(new_net);
+
+	if (wg->have_creating_net_ref)
+		put_net(wg->creating_net);
+
+	wg->have_creating_net_ref = true;
+	wg->creating_net = new_net;
+
+	return 0;
+}
+
 static int wg_set_device(struct sk_buff *skb, struct genl_info *info)
 {
 	struct wg_device *wg = lookup_interface(info->attrs, skb);
@@ -558,6 +580,14 @@ static int wg_set_device(struct sk_buff *skb, struct genl_info *info)
 				goto out;
 		}
 	}
+
+	if (info->attrs[WGDEVICE_A_TUNNEL_NETNS_FD]) {
+		int fd = nla_get_u32(info->attrs[WGDEVICE_A_TUNNEL_NETNS_FD]);
+		ret = set_tunnel_netns(wg, fd);
+		if (ret < 0)
+			goto out;
+	}
+
 	ret = 0;
 
 out:
diff --git a/src/tools/config.c b/src/tools/config.c
index 5d15356..1328f74 100644
--- a/src/tools/config.c
+++ b/src/tools/config.c
@@ -157,6 +157,23 @@ out:
 	return ret;
 }
 
+static inline bool parse_netns(char **netns, const char *value)
+{
+	char *dupped;
+
+	if (strchr(value, '\n'))
+		return false;
+
+	dupped = strdup(value);
+	if (!dupped)
+		return false;
+
+	free(*netns);
+	*netns = dupped;
+
+	return true;
+}
+
 static inline bool parse_ip(struct wgallowedip *allowedip, const char *value)
 {
 	allowedip->family = AF_UNSPEC;
@@ -394,6 +411,8 @@ static bool process_line(struct config_ctx *ctx, const char *line)
 			ret = parse_port(&ctx->device->listen_port, &ctx->device->flags, value);
 		else if (key_match("FwMark"))
 			ret = parse_fwmark(&ctx->device->fwmark, &ctx->device->flags, value);
+		else if (key_match("TunnelNetNS"))
+			ret = parse_netns(&ctx->device->tunnel_netns, value);
 		else if (key_match("PrivateKey")) {
 			ret = parse_key(ctx->device->private_key, value);
 			if (ret)
@@ -530,6 +549,11 @@ struct wgdevice *config_read_cmd(char *argv[], int argc)
 				goto error;
 			argv += 2;
 			argc -= 2;
+		} else if (!strcmp(argv[0], "tunnel-netns") && argc >= 2 && !peer) {
+			if (!parse_netns(&device->tunnel_netns, argv[1]))
+				goto error;
+			argv += 2;
+			argc -= 2;
 		} else if (!strcmp(argv[0], "private-key") && argc >= 2 && !peer) {
 			if (!parse_keyfile(device->private_key, argv[1]))
 				goto error;
diff --git a/src/tools/containers.h b/src/tools/containers.h
index 59a213e..ea6eaf2 100644
--- a/src/tools/containers.h
+++ b/src/tools/containers.h
@@ -79,6 +79,8 @@ struct wgdevice {
 	uint32_t fwmark;
 	uint16_t listen_port;
 
+	char *tunnel_netns;
+
 	struct wgpeer *first_peer, *last_peer;
 };
 
@@ -89,6 +91,7 @@ static inline void free_wgdevice(struct wgdevice *dev)
 {
 	if (!dev)
 		return;
+	free(dev->tunnel_netns);
 	for (struct wgpeer *peer = dev->first_peer, *np = peer ? peer->next_peer : NULL; peer; peer = np, np = peer ? peer->next_peer : NULL) {
 		for (struct wgallowedip *allowedip = peer->first_allowedip, *na = allowedip ? allowedip->next_allowedip : NULL; allowedip; allowedip = na, na = allowedip ? allowedip->next_allowedip : NULL)
 			free(allowedip);
diff --git a/src/tools/ipc.c b/src/tools/ipc.c
index 7ab3a62..7cf9d3e 100644
--- a/src/tools/ipc.c
+++ b/src/tools/ipc.c
@@ -15,6 +15,7 @@
 #include <sys/socket.h>
 #include <net/if.h>
 #include <errno.h>
+#include <fcntl.h>
 #include <stdbool.h>
 #include <stddef.h>
 #include <stdio.h>
@@ -220,6 +221,8 @@ static int userspace_set_device(struct wgdevice *dev)
 		fprintf(f, "listen_port=%u\n", dev->listen_port);
 	if (dev->flags & WGDEVICE_HAS_FWMARK)
 		fprintf(f, "fwmark=%u\n", dev->fwmark);
+	if (dev->tunnel_netns)
+		fprintf(f, "tunnel_netns=%s\n", dev->tunnel_netns);
 	if (dev->flags & WGDEVICE_REPLACE_PEERS)
 		fprintf(f, "replace_peers=true\n");
 
@@ -559,11 +562,19 @@ static int kernel_set_device(struct wgdevice *dev)
 	struct nlattr *peers_nest, *peer_nest, *allowedips_nest, *allowedip_nest;
 	struct nlmsghdr *nlh;
 	struct mnlg_socket *nlg;
+	int tunnel_netns_fd = -1;
 
 	nlg = mnlg_socket_open(WG_GENL_NAME, WG_GENL_VERSION);
 	if (!nlg)
 		return -errno;
 
+	if (dev->tunnel_netns) {
+		ret = tunnel_netns_fd = open(dev->tunnel_netns, O_RDONLY | O_CLOEXEC);
+		if (ret < 0)
+			goto out;
+		ret = 0;
+	}
+
 again:
 	nlh = mnlg_msg_prepare(nlg, WG_CMD_SET_DEVICE, NLM_F_REQUEST | NLM_F_ACK);
 	mnl_attr_put_strz(nlh, WGDEVICE_A_IFNAME, dev->name);
@@ -577,6 +588,8 @@ again:
 			mnl_attr_put_u16(nlh, WGDEVICE_A_LISTEN_PORT, dev->listen_port);
 		if (dev->flags & WGDEVICE_HAS_FWMARK)
 			mnl_attr_put_u32(nlh, WGDEVICE_A_FWMARK, dev->fwmark);
+		if (dev->tunnel_netns)
+			mnl_attr_put_u32(nlh, WGDEVICE_A_TUNNEL_NETNS_FD, tunnel_netns_fd);
 		if (dev->flags & WGDEVICE_REPLACE_PEERS)
 			flags |= WGDEVICE_F_REPLACE_PEERS;
 		if (flags)
@@ -681,6 +694,8 @@ send:
 
 out:
 	mnlg_socket_close(nlg);
+	if (tunnel_netns_fd > -1)
+		close(tunnel_netns_fd);
 	errno = -ret;
 	return ret;
 }
diff --git a/src/tools/set.c b/src/tools/set.c
index 19f4b92..b7c5cb2 100644
--- a/src/tools/set.c
+++ b/src/tools/set.c
@@ -18,7 +18,7 @@ int set_main(int argc, char *argv[])
 	int ret = 1;
 
 	if (argc < 3) {
-		fprintf(stderr, "Usage: %s %s <interface> [listen-port <port>] [fwmark <mark>] [private-key <file path>] [peer <base64 public key> [remove] [preshared-key <file path>] [endpoint <ip>:<port>] [persistent-keepalive <interval seconds>] [allowed-ips <ip1>/<cidr1>[,<ip2>/<cidr2>]...] ]...\n", PROG_NAME, argv[0]);
+		fprintf(stderr, "Usage: %s %s <interface> [listen-port <port>] [fwmark <mark>] [private-key <file path>] [peer <base64 public key> [remove] [preshared-key <file path>] [endpoint <ip>:<port>] [persistent-keepalive <interval seconds>] [tunnel-netns <netns path>] [allowed-ips <ip1>/<cidr1>[,<ip2>/<cidr2>]...] ]...\n", PROG_NAME, argv[0]);
 		return 1;
 	}
 
diff --git a/src/uapi/wireguard.h b/src/uapi/wireguard.h
index 071ce41..a019c05 100644
--- a/src/uapi/wireguard.h
+++ b/src/uapi/wireguard.h
@@ -83,6 +83,8 @@
  *    WGDEVICE_A_PRIVATE_KEY: len WG_KEY_LEN, all zeros to remove
  *    WGDEVICE_A_LISTEN_PORT: NLA_U16, 0 to choose randomly
  *    WGDEVICE_A_FWMARK: NLA_U32, 0 to disable
+ *    WGDEVICE_A_TUNNEL_NETNS_FD: NLA_U32, fd referring to the netns to use for
+ *                                the tunnel sockets
  *    WGDEVICE_A_PEERS: NLA_NESTED
  *        0: NLA_NESTED
  *            WGPEER_A_PUBLIC_KEY: len WG_KEY_LEN
@@ -154,6 +156,7 @@ enum wgdevice_attribute {
 	WGDEVICE_A_LISTEN_PORT,
 	WGDEVICE_A_FWMARK,
 	WGDEVICE_A_PEERS,
+	WGDEVICE_A_TUNNEL_NETNS_FD,
 	__WGDEVICE_A_LAST
 };
 #define WGDEVICE_A_MAX (__WGDEVICE_A_LAST - 1)
-- 
2.20.1

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
