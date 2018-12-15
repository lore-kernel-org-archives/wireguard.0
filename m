Return-Path: <SRS0=EQWa=OY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8117CC43387
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 15 Dec 2018 16:57:51 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CACF9206C2
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 15 Dec 2018 16:57:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ogzobUo2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CACF9206C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3f58cd54;
	Sat, 15 Dec 2018 16:56:27 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 13b6f2fa
 for <wireguard@lists.zx2c4.com>;
 Sat, 15 Dec 2018 16:56:25 +0000 (UTC)
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b457b979
 for <wireguard@lists.zx2c4.com>;
 Sat, 15 Dec 2018 16:56:25 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id b3so7443836ede.1
 for <wireguard@lists.zx2c4.com>; Sat, 15 Dec 2018 08:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Zsy6yhWNd4wOEzvwOxWANmr+zFUy4r8yjshqyB/pDQo=;
 b=ogzobUo2RypgcbT6RycBngbugDj8RfiNF/gHHu56DKC2hCgh1NCCUp0kQMc0aHyaae
 3mEcCL3T+WaRXZ6RHqNcHhnG+EamxSwAjGaoznYof+bG5bBMFMqs+VAoFCcuPnES1YEr
 NxCq+UKHvvq5tWRRQS0wGKBGcXsnCGYUpPrxpCdTHp4U2m2E+oyo5Uqn8CmZ0fpfNwU1
 CzyXEBFIba/dTVkHoyk66hzPFrmHgqXs0TIuypA3lH2eGtL135WaldyDnG3YYexuGNgY
 vAd9ZWtX8M3K/JmMUSoP9tEqGyKK2KuXqU0wfzhm5tLKdkmwYKydficN5ojxdY1FN50Y
 S+bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Zsy6yhWNd4wOEzvwOxWANmr+zFUy4r8yjshqyB/pDQo=;
 b=HXYa1TKbAewhr/+740bDJEm+L3Ig6P4Ty3rvHvoedkt8u7Gc4kEhiOdnWU/OTHIjkq
 0pJFeLfZlVdEDhmkoWzHiFEm04w/7jQJfbOu/MPVFpJXEx4Bam5Zi1iH69kz2Ehf4H98
 w/Y2PaCtoxzs2t/tqZPFSfn0SBRyh9zm/qozgqlUylniIxuFnLndcj96jBNdwVwMkoyv
 ucblh/ZB4Hy/cJGfiq1OODhkG1uP7ovYeHqYn9y974DWQJrzInjAe1+xuylWLjcOUMDw
 3hQUhD/HXh8V3Gv+t8MkOoRW9I3Qy96KgQVw1IzUJ1TpesnUngzBd94rQtkhkP1bV1mF
 tVUA==
X-Gm-Message-State: AA+aEWYKPv7VOyekYjmzRlELSDoD5GgDKY8ycdEwl9aMWT1nzKBATlfD
 wKAzyrEYwphqtpOiT3UkhjdTb5rs
X-Google-Smtp-Source: AFSGD/X6KQDLi23TQINB3tKQhNAq3m4vrFmHUUrRibwQpml7HflHW6w0BfGWSeexrU5oZDFmIqnTkA==
X-Received: by 2002:a17:906:3603:: with SMTP id
 q3-v6mr5567876ejb.164.1544892989441; 
 Sat, 15 Dec 2018 08:56:29 -0800 (PST)
Received: from localhost.localdomain
 (p200300C55F2A9600228984FFFE70D494.dip0.t-ipconnect.de.
 [2003:c5:5f2a:9600:2289:84ff:fe70:d494])
 by smtp.gmail.com with ESMTPSA id q50sm2356015edd.66.2018.12.15.08.56.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 15 Dec 2018 08:56:28 -0800 (PST)
From: Julian Orth <ju.orth@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH v5 01/11] netlink: check for CAP_NET_ADMIN manually
Date: Sat, 15 Dec 2018 17:56:03 +0100
Message-Id: <20181215165613.5486-2-ju.orth@gmail.com>
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

---
 src/netlink.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/src/netlink.c b/src/netlink.c
index 18bebb8..364d4d8 100644
--- a/src/netlink.c
+++ b/src/netlink.c
@@ -163,6 +163,7 @@ err:
 static int wg_get_device_start(struct netlink_callback *cb)
 {
 	struct nlattr **attrs = genl_family_attrbuf(&genl_family);
+	struct net *dev_net = sock_net(cb->skb->sk);
 	struct wg_device *wg;
 	int ret;
 
@@ -170,6 +171,8 @@ static int wg_get_device_start(struct netlink_callback *cb)
 			  genl_family.maxattr, device_policy, NULL);
 	if (ret < 0)
 		return ret;
+	if (!netlink_ns_capable(cb->skb, dev_net->user_ns, CAP_NET_ADMIN))
+		return -EPERM;
 	cb->args[2] = (long)kzalloc(sizeof(struct allowedips_cursor),
 				    GFP_KERNEL);
 	if (unlikely(!cb->args[2]))
@@ -470,9 +473,17 @@ out:
 
 static int wg_set_device(struct sk_buff *skb, struct genl_info *info)
 {
-	struct wg_device *wg = lookup_interface(info->attrs, skb);
+	struct net *dev_net = sock_net(skb->sk);
+	struct wg_device *wg;
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
@@ -574,12 +585,10 @@ struct genl_ops genl_ops[] = {
 		.dumpit = wg_get_device_dump,
 		.done = wg_get_device_done,
 		.policy = device_policy,
-		.flags = GENL_UNS_ADMIN_PERM
 	}, {
 		.cmd = WG_CMD_SET_DEVICE,
 		.doit = wg_set_device,
 		.policy = device_policy,
-		.flags = GENL_UNS_ADMIN_PERM
 	}
 };
 
-- 
2.19.2

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
