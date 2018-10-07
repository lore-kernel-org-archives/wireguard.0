Return-Path: <SRS0=x3Nk=MT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D54E8C676D4
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Oct 2018 14:13:05 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74FEE20882
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Oct 2018 14:13:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S8VJZ8HE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74FEE20882
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id af0437c8;
	Sun, 7 Oct 2018 14:11:31 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 670700dc
 for <wireguard@lists.zx2c4.com>; Sun, 7 Oct 2018 14:11:15 +0000 (UTC)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3952bf5b
 for <wireguard@lists.zx2c4.com>; Sun, 7 Oct 2018 14:11:14 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id 193-v6so5847726wme.3
 for <wireguard@lists.zx2c4.com>; Sun, 07 Oct 2018 07:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VElNDFiYhGiu1R6uMDWltRfO069AglUH7RDDqOb+MGg=;
 b=S8VJZ8HElOOw5ikiKMpvz7fEmBZXBZ3zkQ30CWTJrN+GsgUUqlCbB9K1jGYuELq5wH
 V9P4K0uCQTqXuN2nFRgZHIgecX4P5SlufrpLEHFmgXFFgqDQal0FqkvUpKudQQBgO8Jd
 bZobAIH/pAIlnl6K2/hQVWeQko/U6NfTFLjOpzKT90YgTmz9JT6hY3mrB/BX/6OrFQBW
 QNV2v40cW+xUlwiccOiu6VfIgKdFRsgaB6RfgmIMGUhLXdBEayVLuw934YlRJDGGOZz2
 PNCwUO9MNCnfkSpJGKJ5GnT3UuCnl09QrLrWYQFWnIPowNHp2CraKlSHelWEcQoJYfkn
 R8qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VElNDFiYhGiu1R6uMDWltRfO069AglUH7RDDqOb+MGg=;
 b=Xb2rVBCztdLbmrOj3NpP+foAgzaDoQXJdSr4GssT191aeCHZh4U82VE8dQTRo93/nB
 GElGlC0oIUWuE6NY/rNJ4u8gA+XkhvleMuLSO/ekX9u3ponPWbemy5TeKVVnOMdr1RGG
 fBPywWRh33SbvTj3CWBIVGFEJg2Yk0qKowOI4pR9kOt3x+mOvBuENh9iiUEZZKCbaInk
 dS55xDFsQxky8P1+gRvpVY1dqDBpJEa7iob20+63RbJkM2L68+fB8itJyxueOBJAtFsI
 ORKHQb8XcepDzk+1nIytY9MWP7azrJ95az1W8jTBQKrMxfI5ImrYn/novjHNdoMNaQDA
 tsig==
X-Gm-Message-State: ABuFfojfY4k1vffGnfW6bjkGG0xSxry/BepUTRms1CKd3R9wXQtiUI1L
 XH/E+QiC4H0ZlxUpLdGC+LRrXGjV
X-Google-Smtp-Source: ACcGV63UujVFLRigL5L7AjfrE1J0Z59Aca4K4aeU4y8Je8uqsYFMEAYxiZKnap7PmWY64qBOuOtcUw==
X-Received: by 2002:a1c:cb05:: with SMTP id b5-v6mr5842325wmg.44.1538921513201; 
 Sun, 07 Oct 2018 07:11:53 -0700 (PDT)
Received: from localhost.localdomain
 (p200300C55F2A9600228984FFFE70D494.dip0.t-ipconnect.de.
 [2003:c5:5f2a:9600:2289:84ff:fe70:d494])
 by smtp.gmail.com with ESMTPSA id w72-v6sm28940116wrc.52.2018.10.07.07.11.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 07 Oct 2018 07:11:52 -0700 (PDT)
From: Julian Orth <ju.orth@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH v4 02/12] netlink: check for CAP_NET_ADMIN manually
Date: Sun,  7 Oct 2018 16:11:29 +0200
Message-Id: <20181007141139.26310-3-ju.orth@gmail.com>
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

---
 src/netlink.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/src/netlink.c b/src/netlink.c
index 56749ba..ca90cdf 100644
--- a/src/netlink.c
+++ b/src/netlink.c
@@ -169,6 +169,7 @@ err:
 static int get_device_start(struct netlink_callback *cb)
 {
 	struct nlattr **attrs = genl_family_attrbuf(&genl_family);
+	struct net *dev_net = sock_net(cb->skb->sk);
 	struct wireguard_device *wg;
 	int ret;
 
@@ -176,6 +177,8 @@ static int get_device_start(struct netlink_callback *cb)
 			  genl_family.maxattr, device_policy, NULL);
 	if (ret < 0)
 		return ret;
+	if (!netlink_ns_capable(cb->skb, dev_net->user_ns, CAP_NET_ADMIN))
+		return -EPERM;
 	cb->args[2] = (long)kzalloc(sizeof(struct allowedips_cursor),
 				    GFP_KERNEL);
 	if (unlikely(!cb->args[2]))
@@ -477,9 +480,17 @@ out:
 
 static int set_device(struct sk_buff *skb, struct genl_info *info)
 {
-	struct wireguard_device *wg = lookup_interface(info->attrs, skb);
+	struct net *dev_net = sock_net(skb->sk);
+	struct wireguard_device *wg;
 	int ret;
 
+	if (!netlink_ns_capable(skb, dev_net->user_ns, CAP_NET_ADMIN)) {
+		ret = -EPERM;
+		goto out_nodev;
+	}
+
+	wg = lookup_interface(info->attrs, skb);
+
 	if (IS_ERR(wg)) {
 		ret = PTR_ERR(wg);
 		goto out_nodev;
@@ -581,12 +592,10 @@ struct genl_ops genl_ops[] = {
 		.dumpit = get_device_dump,
 		.done = get_device_done,
 		.policy = device_policy,
-		.flags = GENL_UNS_ADMIN_PERM
 	}, {
 		.cmd = WG_CMD_SET_DEVICE,
 		.doit = set_device,
 		.policy = device_policy,
-		.flags = GENL_UNS_ADMIN_PERM
 	}
 };
 
-- 
2.19.0

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
