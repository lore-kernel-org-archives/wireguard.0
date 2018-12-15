Return-Path: <SRS0=EQWa=OY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C9DCC43613
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 15 Dec 2018 16:57:53 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC616206C2
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 15 Dec 2018 16:57:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mvwb7ONZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC616206C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ae303d7c;
	Sat, 15 Dec 2018 16:56:30 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5a4648c0
 for <wireguard@lists.zx2c4.com>;
 Sat, 15 Dec 2018 16:56:27 +0000 (UTC)
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 01ed3e7f
 for <wireguard@lists.zx2c4.com>;
 Sat, 15 Dec 2018 16:56:26 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id f23so7435341edb.3
 for <wireguard@lists.zx2c4.com>; Sat, 15 Dec 2018 08:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jtPv+zA9ZPZYZiD9l+zwEZWdtLzPUHgE/JazQNHjZSk=;
 b=Mvwb7ONZ8MIxul1Xf29ik7/LezyK7rdd8yU964qmGviLp3vMPecNEEPuit98OqzHW5
 +/RpFyPps1InLn3NTJRS6SFJL7V1bnKLuaB/ni/xhq/EhN9oGQcsYosP4aqRdVyOZxBD
 VMiZcsmruhphHpHi2fZKDVcwS9LKpeg2C2O3NJq+hshkC0MeZvru2Xa39pSBhwvQgBVK
 ffgX2bKPG9yQV1V+WfQie4EiSSYo9ioMkrM31opJUWw0pJTgEwPkDag8CRUxjv3m8J+E
 kmgtodci+K5LHu45cpov94vVtNIQli7iKzMYfXhg2Naese4RorEn8g6pmHkNSFm0P9Ip
 gkbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jtPv+zA9ZPZYZiD9l+zwEZWdtLzPUHgE/JazQNHjZSk=;
 b=m6iXB9wbTkli8H+zQc338tdlhRNCfcXuB9RhzNQOn+bxaCvhgMrMo1bj7CDF6H4dtc
 fhYtglOKXrPwEFu61tGgDvxbi0L6ML/yU7CguKql3lLfVBO9/vPZiD0NWU0ClhNhohdX
 N3xrmMUaGPINO3YrYYLOSGMNNgS4uAq25J7V2CcBlKB/mbu2qMX3AuWGlj/UmZftXLac
 vrfqH4c39xKrggLPJK+fqPqaRQPuvE40a0YFjcUaqkU+NDutQxr9tGhkVPHEDPXNmILp
 VS4EaXQgl3YjHub+dKQg0rmMLRuAjlb9RX23NavNm2CLy0OkxcYdzoXn7CSZYgWv4iCB
 gqqg==
X-Gm-Message-State: AA+aEWZbLf2UsfyIM0UC3qc7v3F1MUV2ZOn+ZOq6TOd6g+bfdpK/bt02
 jiEbb7WbOBld/XyTs7ICTX6b4LBb
X-Google-Smtp-Source: AFSGD/VZCbX5Oq/sSPTVQYuD806S4Z5JkkmOCPF8IxX/NIejecaW/4K9UMJeMJfmXJLqijIYwfCLfw==
X-Received: by 2002:a17:906:71cd:: with SMTP id
 i13-v6mr5487786ejk.37.1544892991202; 
 Sat, 15 Dec 2018 08:56:31 -0800 (PST)
Received: from localhost.localdomain
 (p200300C55F2A9600228984FFFE70D494.dip0.t-ipconnect.de.
 [2003:c5:5f2a:9600:2289:84ff:fe70:d494])
 by smtp.gmail.com with ESMTPSA id q50sm2356015edd.66.2018.12.15.08.56.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 15 Dec 2018 08:56:30 -0800 (PST)
From: Julian Orth <ju.orth@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH v5 03/11] netlink: restrict access to the UDP socket
Date: Sat, 15 Dec 2018 17:56:05 +0100
Message-Id: <20181215165613.5486-4-ju.orth@gmail.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181215165613.5486-1-ju.orth@gmail.com>
References: <20181215165613.5486-1-ju.orth@gmail.com>
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
index 96ad555..e17c3e1 100644
--- a/src/netlink.c
+++ b/src/netlink.c
@@ -173,6 +173,14 @@ static struct net *get_attr_net(struct nlattr *net_pid, struct nlattr *net_fd)
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
 static int wg_get_device_start(struct netlink_callback *cb)
 {
 	struct nlattr **attrs = genl_family_attrbuf(&genl_family);
@@ -249,9 +257,12 @@ static int wg_get_device_dump(struct sk_buff *skb, struct netlink_callback *cb)
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
@@ -338,7 +349,11 @@ static int wg_get_device_done(struct netlink_callback *cb)
 static int set_port(struct wg_device *wg, u16 port)
 {
 	struct wg_peer *peer;
+	int ret;
 
+	ret = test_socket_net_capable(wg->creating_net);
+	if (ret)
+		return ret;
 	if (wg->incoming_port == port)
 		return 0;
 	list_for_each_entry(peer, &wg->peer_list, peer_list)
diff --git a/src/uapi/wireguard.h b/src/uapi/wireguard.h
index bcfcf4f..8b60ad1 100644
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
2.19.2

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
