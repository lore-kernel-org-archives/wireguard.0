Return-Path: <SRS0=x3Nk=MT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2549C676D5
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Oct 2018 14:13:04 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7261C20882
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Oct 2018 14:13:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FoN9kIXv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7261C20882
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8e853b95;
	Sun, 7 Oct 2018 14:11:28 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 02fb66f2
 for <wireguard@lists.zx2c4.com>; Sun, 7 Oct 2018 14:11:26 +0000 (UTC)
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 56353e19
 for <wireguard@lists.zx2c4.com>; Sun, 7 Oct 2018 14:11:16 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id s12-v6so5725130wmc.0
 for <wireguard@lists.zx2c4.com>; Sun, 07 Oct 2018 07:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UWG8TUE1WpEzpxVUQp+12nGWifuN53SM4OMri1BYe6o=;
 b=FoN9kIXvP/mMcQEQc4B1/OEwUOTm9f1+UWcoqkigonWbBec9BFAxRAUp7B9YFf2MRU
 B0c01io/CZVyQvCX4iM0BPf2uB+r3uB6tBWVST9afG6YabljYZsJWIWe4qtHzO53tsq4
 UM6B+PuyI6umirdRKAt9V7rxJ5VegmgMoCh425vC9yJeOPhcCBRuA1P4yOoIQNKxzhYO
 DXLZrfk5xY5ext914chDwrdPLr6Vb2HiGxWzWE/R0+3eITV5sG79Xi5BZdEouax8dMjp
 nDAon1KPGBhVAgG5R9oBN0GlyxoxSm7OXep88GdrSTAkvD3gTR3PJOgxlJ3I8wGp3WX0
 iTng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UWG8TUE1WpEzpxVUQp+12nGWifuN53SM4OMri1BYe6o=;
 b=RukbFhCzX+ryYXZgiQEPuZdePZtJ3eIwfRuqvKiple7HHXMWbkwQV/VlznKKoPqduN
 Y13W74/wAFIBcMsv1auf2oLXkecE5js4YuRvJq9Py7WE8Z0uDj/mp3QDeCP/hkLk3wr5
 d6NgWZ9YtJ8Qvp5Wlc5O6d05fo+ZLhlSILhw+Kt+BrEsjD/I/9sXQaaRRWCBPrqQCvBc
 kMUeaL9A1DhLj9m6fuf3c/aG6cLPOjYvJGRJXnDx/+jYfQfr3sf4Q7r38CFrWA8IJXRy
 aVszibldlQMvrDycYko+TrvwZYhGy0luW4i9V03FNzl27xB0GhJllHmf83X8M7KoaK7a
 HpSA==
X-Gm-Message-State: ABuFfohLKfLujwuEM+DUqZlw7EMyxeGTWDO/7rjB/TI5inKNcTdsPq+c
 I7e/7aGbtcfsXKUuoWZqdrEmdxtS
X-Google-Smtp-Source: ACcGV60NIou/SIX49lP5vuPjvuvNynfbQh4xxBlCs+B+/wNR2XEwa1HLKC231k78S/bmeCAZZbOXkQ==
X-Received: by 2002:a1c:ef15:: with SMTP id
 n21-v6mr11832259wmh.151.1538921515188; 
 Sun, 07 Oct 2018 07:11:55 -0700 (PDT)
Received: from localhost.localdomain
 (p200300C55F2A9600228984FFFE70D494.dip0.t-ipconnect.de.
 [2003:c5:5f2a:9600:2289:84ff:fe70:d494])
 by smtp.gmail.com with ESMTPSA id w72-v6sm28940116wrc.52.2018.10.07.07.11.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 07 Oct 2018 07:11:54 -0700 (PDT)
From: Julian Orth <ju.orth@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH v4 04/12] netlink: restrict access to the UDP socket
Date: Sun,  7 Oct 2018 16:11:31 +0200
Message-Id: <20181007141139.26310-5-ju.orth@gmail.com>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20181007141139.26310-1-ju.orth@gmail.com>
References: <20181007141139.26310-1-ju.orth@gmail.com>
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

To interact with the UDP socket the caller must either be in the
network namespace of the socket or have CAP_NET_ADMIN in that network
namespace.
---
 src/netlink.c        | 21 ++++++++++++++++++---
 src/uapi/wireguard.h |  7 +++++++
 2 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/src/netlink.c b/src/netlink.c
index 6c7d084..4cba5ab 100644
--- a/src/netlink.c
+++ b/src/netlink.c
@@ -179,6 +179,14 @@ static struct net *get_attr_net(struct nlattr *net_pid, struct nlattr *net_fd)
 	return NULL;
 }
 
+static int test_socket_net_capable(struct net *net)
+{
+	if (net != current->nsproxy->net_ns &&
+			!ns_capable(net->user_ns, CAP_NET_ADMIN))
+		return -EPERM;
+	return 0;
+}
+
 static int get_device_start(struct netlink_callback *cb)
 {
 	struct nlattr **attrs = genl_family_attrbuf(&genl_family);
@@ -256,9 +264,12 @@ static int get_device_dump(struct sk_buff *skb, struct netlink_callback *cb)
 	genl_dump_check_consistent(cb, hdr);
 
 	if (!last_peer_cursor) {
-		if (nla_put_u16(skb, WGDEVICE_A_LISTEN_PORT,
-				wg->incoming_port) ||
-		    nla_put_u32(skb, WGDEVICE_A_FWMARK, wg->fwmark) ||
+		if (test_socket_net_capable(wg->creating_net) == 0) {
+			if (nla_put_u16(skb, WGDEVICE_A_LISTEN_PORT,
+						wg->incoming_port))
+				goto out;
+		}
+		if (nla_put_u32(skb, WGDEVICE_A_FWMARK, wg->fwmark) ||
 		    nla_put_u32(skb, WGDEVICE_A_IFINDEX, wg->dev->ifindex) ||
 		    nla_put_string(skb, WGDEVICE_A_IFNAME, wg->dev->name))
 			goto out;
@@ -345,7 +356,11 @@ static int get_device_done(struct netlink_callback *cb)
 static int set_port(struct wireguard_device *wg, u16 port)
 {
 	struct wireguard_peer *peer;
+	int ret;
 
+	ret = test_socket_net_capable(wg->creating_net);
+	if (ret)
+		return ret;
 	if (wg->incoming_port == port)
 		return 0;
 	list_for_each_entry (peer, &wg->peer_list, peer_list)
diff --git a/src/uapi/wireguard.h b/src/uapi/wireguard.h
index 2afa6c3..4f60a02 100644
--- a/src/uapi/wireguard.h
+++ b/src/uapi/wireguard.h
@@ -30,6 +30,9 @@
  * socket. The caller must have CAP_NET_ADMIN in the namespace of the Wireguard
  * device.
  *
+ * If the caller is not in the transit namespace and does not have CAP_NET_ADMIN
+ * in the transit namespace, then the WGDEVICE_A_LISTEN_PORT is not returned.
+ *
  * The kernel will then return several messages (NLM_F_MULTI) containing the
  * following tree of nested items:
  *
@@ -92,6 +95,10 @@
  * of the netlink socket. The caller must have CAP_NET_ADMIN in the namespace of
  * the Wireguard device.
  *
+ * If WGDEVICE_A_LISTEN_PORT is provided and the calling process is not in the
+ * transit namespace, then the calling process must have CAP_NET_ADMIN the
+ * transit namespace.
+ *
  *    WGDEVICE_A_IFINDEX: NLA_U32
  *    WGDEVICE_A_IFNAME: NLA_NUL_STRING, maxlen IFNAMESIZ - 1
  *    WGDEVICE_A_FLAGS: NLA_U32, 0 or WGDEVICE_F_REPLACE_PEERS if all current
-- 
2.19.0

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
