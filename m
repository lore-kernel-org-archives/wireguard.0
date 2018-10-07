Return-Path: <SRS0=x3Nk=MT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 614B9C65C1D
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Oct 2018 14:13:03 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E011A20882
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Oct 2018 14:13:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lyVIkVWQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E011A20882
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5e2d5747;
	Sun, 7 Oct 2018 14:11:15 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 93666a21
 for <wireguard@lists.zx2c4.com>; Sun, 7 Oct 2018 14:11:14 +0000 (UTC)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3dc6dfae
 for <wireguard@lists.zx2c4.com>; Sun, 7 Oct 2018 14:11:14 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id 189-v6so5715341wmw.2
 for <wireguard@lists.zx2c4.com>; Sun, 07 Oct 2018 07:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KSMUJJoDzcvsEX+J7VwBQmboLtYbzMUEk6OX/H6uysM=;
 b=lyVIkVWQ7KjRUXyzs99BOW5IYrcw/pM5GVZIPHT75WpifWJ52XDE3y/uKwrUHEfHuu
 8d38+RuST2l+8/u8YHuPasVenENoozkNNCF8S8TiJ7kcXdImlOM5Z18TzWcZr4HHm1sz
 Wdwm9MsKcE3Ko4CMIZtUDO/2D42UP5qo1NDfnNRM+L2dPNVYs2r7NAKqeCDYk0aYl/0p
 LA+3MSXrZuMw8LtiAuWkSRk959TS7HnKtL+HiZEZSHa+tcHQQkenM3IrlNoitS5rLJ23
 oDGi6gAsDAJeEhAwcvgRNfgSSCTut1Qhq31BzvWX/Yfv2laa2C1niYb5nYoOn1sRJMrQ
 HTtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KSMUJJoDzcvsEX+J7VwBQmboLtYbzMUEk6OX/H6uysM=;
 b=NS+vyj74lpbBvEt8+V2RmO1NKrm5XzCTyqOUqc2w3o+rDRE5mvWmp5lCEg4/5DN8mz
 3yZqgQTegA+hjLaEIT+eZcCQAgla/XEXpNjTZFhSD9WotFuMpt5Os6ZWXDz7nqKEKd8D
 H2F8Y33CurhN4oSX4oTp3y2qXn4GkkvMwHikqtZYs9CkHk36dPUFrY9+KTr2xD0hxMSU
 YoNKL+thUhwi1L/geBm/7luu7TLquAFTelyEhO143aZ+KtZseSh77Npit6CcTyu7LWzK
 NCGfWFfUmHYEFJqSWFFxCBnuji1RS26LzLtxtmFP3Uij8CQhv83cNszZszwQO8FAcasS
 70RQ==
X-Gm-Message-State: ABuFfoh0MpUmV8G6HHd+NCYMxGVa93+0qop103NgQf/PfYV6+guXHZFl
 rSGuomCv9KC2XRuFHzrQVznhljSb
X-Google-Smtp-Source: ACcGV62Zva4bo3uaGtLNuNg+93WgCdnJVgnYhFOLOF+Eo/LsR/HpfW54J9a9Skjx0MvluhVVtTEpww==
X-Received: by 2002:a1c:b157:: with SMTP id
 a84-v6mr12078665wmf.18.1538921512178; 
 Sun, 07 Oct 2018 07:11:52 -0700 (PDT)
Received: from localhost.localdomain
 (p200300C55F2A9600228984FFFE70D494.dip0.t-ipconnect.de.
 [2003:c5:5f2a:9600:2289:84ff:fe70:d494])
 by smtp.gmail.com with ESMTPSA id w72-v6sm28940116wrc.52.2018.10.07.07.11.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 07 Oct 2018 07:11:51 -0700 (PDT)
From: Julian Orth <ju.orth@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH v4 01/12] device: protect socket_init with device_update_lock
Date: Sun,  7 Oct 2018 16:11:28 +0200
Message-Id: <20181007141139.26310-2-ju.orth@gmail.com>
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

`set_port` in netlink.c races with `open` in device.c. This can cause
the following code flow:

* thread 1: set_port: device is not up
* thread 2: device is opened
* thread 2: open: called and calls socket_init with the original port
* thread 1: set_port: sets incoming_port to the new port and returns

incoming_port is then inconsistent. While this is not particularly
critical, it will become more critial when ste_port also sets the
transit namespace.
---
 src/device.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/src/device.c b/src/device.c
index 72b93c7..49f9634 100644
--- a/src/device.c
+++ b/src/device.c
@@ -53,17 +53,18 @@ static int open(struct net_device *dev)
 #endif
 #endif
 
+	mutex_lock(&wg->device_update_lock);
 	ret = wg_socket_init(wg, wg->incoming_port);
 	if (ret < 0)
-		return ret;
-	mutex_lock(&wg->device_update_lock);
+		goto out;
 	list_for_each_entry (peer, &wg->peer_list, peer_list) {
 		wg_packet_send_staged_packets(peer);
 		if (peer->persistent_keepalive_interval)
 			wg_packet_send_keepalive(peer);
 	}
+out:
 	mutex_unlock(&wg->device_update_lock);
-	return 0;
+	return ret;
 }
 
 #if defined(CONFIG_PM_SLEEP) && !defined(CONFIG_ANDROID)
-- 
2.19.0

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
