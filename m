Return-Path: <SRS0=K46V=QL=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1A47C169C4
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 Feb 2019 00:06:10 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE2542177E
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 Feb 2019 00:06:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=de-vri.es header.i=@de-vri.es header.b="E2AoHd4K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE2542177E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=de-vri.es
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3ea95c02;
	Sun, 3 Feb 2019 23:59:35 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2075fac3
 for <wireguard@lists.zx2c4.com>; Sun, 3 Feb 2019 23:59:33 +0000 (UTC)
Received: from mx1.de-vri.es (voyager.de-vri.es [149.210.162.205])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c6917cc5
 for <wireguard@lists.zx2c4.com>; Sun, 3 Feb 2019 23:59:33 +0000 (UTC)
Received: from voyager (localhost [127.0.0.1])
 by voyager (OpenSMTPD) with ESMTP id cfbb2c97
 for <wireguard@lists.zx2c4.com>; Mon, 4 Feb 2019 00:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=de-vri.es; h=from:to
 :subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding; s=voyager; bh=KYFyhw55kpQUnIZGM/6gsK
 28suE=; b=E2AoHd4KgenLRuy2xPsNMvytEOXBv+eFCzRJXK9mM347ThxW2SJ9k0
 hHscOBMD97Otz9Kc9ZjEScgPZZCq8i5UwoRqRopK/xY+v0GA4qv99hkOd0r7616m
 sapSEW7J9ruqK7hplabztDUuNX5VuZw1wY6th3GiF4WiwShLKIVmcdcz6WuiKkYg
 7RUzxUrxvi3MBMPclQW31XQfOQVxeI+t0TMLGYuxOTlVZ5aRixt0DNUPxPPJI0no
 Xsm9v26Yz8F+kfrkeRDckI6RWEL9bsq1E/ySananMVZxVoYruVLZo/yeuwoLg9ro
 YUOnShYK6zpcdVL7AodjTU/YsB8LBpq8IGTIrVVu869gp5ScIYvwuzRPhWAix6uu
 53OLHgsiUL3UjigYZNYWXTlMF2YK1vuft0tu3ZGpoyrrJM9X1HnftrcZ1cNtw1J2
 CNgwZCZMhBiNikRB3QxI5qc64MquxycnuuSm86GD6GCcHfm8ONechuI0dN0EnCIW
 18pY5Pn0trbxGXbvZr87CmWu3RJg1rfDr2O/P3I6nzHEjnA/qk8LOE6BmYm/4qjY
 ZX59WLIU9TZ/XT2P24OIWvwRfEZgduaGJ7KWKnXuEnhtPYfMOzVHKm9p+tOkQIOo
 q9uwV+G3HpVcJkxm/9GMLPHcxzJt4yyI0OkV9oC5KSaop+a+KzbRY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=de-vri.es; h=from:to:subject
 :date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding; q=dns; s=voyager; b=J5nOZ/dQTIMF3qgG
 yhHFi6hBO6nrlCQOMw1hEQukL75XwfERwWROVZxyF2kLCDzIvHeaiAeeoJh3x5CU
 D4JcQvfIoZlJ4a/dc5cizP5PwhqFhWwi7VD65rgN9tXymORViCLHiU3ZxxHXCR0U
 9VVVTUh/4pGQJSVWYORu0Ssbi3vMpa0T2Fo7Au+vKYxaZJaaRdjALTp14BvUSSFe
 ygfdO5fLja2lejil3IStaNyp4z3yPxJfAIGRFyiH/scFIi8tfdUDAeGZCcrYTujw
 XXHsd+ipi24vby7PRjFKKUKGKwov4Y2kfG71visZf15hEdrlXD4ABN1G+59IRg3R
 AZMWMSn/rm3L/PCeM1hPF4sAoggyot6rKHz7/NAM8dvvqB5k869ICforpa5OwwIu
 sCNnp7DdlLBgSR5KTewAt5wMDxq0lCBheOBWtOKTnMKZJ/aAlaf4zu/1o+axa2//
 niIF9m8o2ZH3Zb4iKADsWl5mZcik2b6de2/FPlDkP8J7QKJ+pLxqhz8GL4rDefyB
 5BS2gmRkfnHR3U5L8jJrMvJWmKc1l2vDb3PQy3NNrcSPv/rkaqNV/mpXZtk1ngrw
 m0FKK30TETIuMftBGqI7LKlRLHeoSblOCDfKzzZ0Ri6DoVpvFuGvV5wzwbxN/JIw
 nARMzKJjrGbxNeYaqPhoFmijMSc=
Received: from maarten-desktop.internal.de-vri.es
 (D93FCE99.cm-21.dynamic.ziggo.nl [217.63.206.153])
 by voyager (OpenSMTPD) with ESMTPSA id 88f320a0
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 4 Feb 2019 00:06:00 +0000 (UTC)
From: Maarten de Vries <maarten@de-vri.es>
To: wireguard@lists.zx2c4.com
Subject: [PATCH] Check CAP_NET_ADMIN in old and new ns before changing network
 ns.
Date: Mon,  4 Feb 2019 01:05:49 +0100
Message-Id: <20190204000549.24287-1-maarten@de-vri.es>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190203220806.14327-1-maarten@de-vri.es>
References: <20190203220806.14327-1-maarten@de-vri.es>
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

---

Forgot to check for CAP_NET_ADMIN. Quite important actually :)

 src/netlink.c | 60 +++++++++++++++++++++++++++++----------------------
 1 file changed, 34 insertions(+), 26 deletions(-)

diff --git a/src/netlink.c b/src/netlink.c
index 82e9030..2999593 100644
--- a/src/netlink.c
+++ b/src/netlink.c
@@ -473,30 +473,10 @@ out:
 	return ret;
 }
 
-static int set_tunnel_netns(struct wg_device *wg, u32 fd)
-{
-	struct net *new_net;
-
-	if (wg->sock4 != NULL || wg->sock6 != NULL)
-		return -EINVAL;
-
-	new_net = get_net_ns_by_fd(fd);
-
-	if (IS_ERR(new_net))
-		return PTR_ERR(new_net);
-
-	if (wg->have_creating_net_ref)
-		put_net(wg->creating_net);
-
-	wg->have_creating_net_ref = true;
-	wg->creating_net = new_net;
-
-	return 0;
-}
-
 static int wg_set_device(struct sk_buff *skb, struct genl_info *info)
 {
 	struct wg_device *wg = lookup_interface(info->attrs, skb);
+	struct net *new_net = NULL;
 	int ret;
 
 	if (IS_ERR(wg)) {
@@ -509,10 +489,34 @@ static int wg_set_device(struct sk_buff *skb, struct genl_info *info)
 
 	ret = -EPERM;
 	if ((info->attrs[WGDEVICE_A_LISTEN_PORT] ||
-	     info->attrs[WGDEVICE_A_FWMARK]) &&
+	     info->attrs[WGDEVICE_A_FWMARK] ||
+	     info->attrs[WGDEVICE_A_TUNNEL_NETNS_FD]) &&
 	    !ns_capable(wg->creating_net->user_ns, CAP_NET_ADMIN))
 		goto out;
 
+	if (info->attrs[WGDEVICE_A_TUNNEL_NETNS_FD]) {
+		int fd = nla_get_u32(info->attrs[WGDEVICE_A_TUNNEL_NETNS_FD]);
+		new_net = get_net_ns_by_fd(fd);
+
+		if (IS_ERR(new_net)) {
+			ret = PTR_ERR(new_net);
+			new_net = NULL;
+			goto out;
+		}
+
+		/* Also check that we've got CAP_NET_ADMIN in the new namespace. */
+		if (!ns_capable(new_net->user_ns, CAP_NET_ADMIN)) {
+			ret = -EPERM;
+			goto out;
+		}
+
+		/* And check that there are no initialized sockets. */
+		if (wg->sock4 != NULL || wg->sock6 != NULL) {
+			ret = -EINVAL;
+			goto out;
+		}
+	}
+
 	++wg->device_update_gen;
 
 	if (info->attrs[WGDEVICE_A_FWMARK]) {
@@ -582,15 +586,19 @@ static int wg_set_device(struct sk_buff *skb, struct genl_info *info)
 	}
 
 	if (info->attrs[WGDEVICE_A_TUNNEL_NETNS_FD]) {
-		int fd = nla_get_u32(info->attrs[WGDEVICE_A_TUNNEL_NETNS_FD]);
-		ret = set_tunnel_netns(wg, fd);
-		if (ret < 0)
-			goto out;
+		if (wg->have_creating_net_ref)
+			put_net(wg->creating_net);
+
+		wg->have_creating_net_ref = true;
+		wg->creating_net = new_net;
+		new_net = NULL;
 	}
 
 	ret = 0;
 
 out:
+	if (new_net)
+		put_net(new_net);
 	mutex_unlock(&wg->device_update_lock);
 	rtnl_unlock();
 	dev_put(wg->dev);
-- 
2.20.1

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
