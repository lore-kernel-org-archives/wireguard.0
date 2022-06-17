Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A988BC43334
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 17 Jun 2022 11:51:13 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 9ffdee94;
	Fri, 17 Jun 2022 11:40:01 +0000 (UTC)
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [2607:f8b0:4864:20::52b])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 347a100c
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 Jun 2022 11:34:24 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id d129so3826311pgc.9
 for <wireguard@lists.zx2c4.com>; Fri, 17 Jun 2022 04:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gwNsPjPqDPSgVa+mOsKwI3Wq7uE4MRyCxMN7sICLjbo=;
 b=YA8yHQYEzRTnuw7kNtP1BA8pnIwMg6p9rJ6GXgoKP/O0u9x4JROQbMRIOuf1RXrvj2
 OhargJ210czPrAruZXDBdHDB7xq1mKYBqGNHWc4BHaD09yjiurbGNTGeQFE9ODIG3ins
 cjXPEVw0VQrvAJdjqXSWYVlL+Ea7ugkx6vAg0zZmQthteuIMmDHNtI+yNtodZIDEUfTf
 3futlJ7+jKecX9L38eyWxw2OH8Gevo/eB28KWXWKVg1RGyJIa663Gk0iMLt/pMToEVyQ
 Tu8yw/sUQhXWBL+YtVxNJ3UscUItGAF0MmjmmrBJ/+cdE3q9dG0OI6WFZWh6eQ30+YWR
 qDBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gwNsPjPqDPSgVa+mOsKwI3Wq7uE4MRyCxMN7sICLjbo=;
 b=QNL2K2hMn3zKDbTyOAe4FaXOI+Of9s+xLW72fLyofSrMa4hSeVUa07znCpAg6dqiV3
 qJUsWoy9tlprov1RyxQdtaLY3AA9P4r9KwmbUnvDy840pYL1kxWJBZlDM+fJT/hNkT89
 /p4hC6kYWFVHsDFD43tBXLVcw1VHhoK084tS1brJhxRRibg86IdN3YpkfcbMrIiQOYyq
 5+F384zQv/KTQFwawtlJsDrR3AzDncMk51w7WGy1hx0UIQUpOuEbBLNXtVF1klZJwQYq
 IiRvJQnrFk9zTOSQt8gXTJl1Xw7VrQ8qBp2swM5KON4vzESk0WL7xdZnbZoaS16Ovd5M
 w78w==
X-Gm-Message-State: AJIora/TfDO++HPLmecNSOXPOXLmknGt5leGhFodSPhqhgIS8U8JBd2C
 +XHhTPSXQoP80FEpfO8NCsSuN1PW9aU=
X-Google-Smtp-Source: AGRyM1vRLyyXZKpOQFgCQaZLvWhoJKpxpKI/KxZME9/MQImpcM3faYzNYiUkpgd9l2UgsY2k/RWsmg==
X-Received: by 2002:a63:2a0c:0:b0:3fc:9b04:541d with SMTP id
 q12-20020a632a0c000000b003fc9b04541dmr8829553pgq.546.1655465662976; 
 Fri, 17 Jun 2022 04:34:22 -0700 (PDT)
Received: from localhost ([58.82.202.88]) by smtp.gmail.com with UTF8SMTPSA id
 w9-20020a17090a8a0900b001ec798b0dc4sm908172pjn.38.2022.06.17.04.34.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jun 2022 04:34:22 -0700 (PDT)
From: Tom Yan <tom.ty89@gmail.com>
To: wireguard@lists.zx2c4.com
Cc: Tom Yan <tom.ty89@gmail.com>
Subject: [PATCH] wg-quick: avoid traffics from momentarily leaking into the
 tunnel
Date: Fri, 17 Jun 2022 19:34:19 +0800
Message-Id: <20220617113419.17329-1-tom.ty89@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 17 Jun 2022 11:39:46 +0000
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

The wireguard route table ip rule should stay as a NOP until the
`suppress_prefixlength 0 table main` rule is in effect. Therefore,
add the wireguard default route to its route table after the latter
rule is added.

Signed-off-by: Tom Yan <tom.ty89@gmail.com>
---
 src/wg-quick/linux.bash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/wg-quick/linux.bash b/src/wg-quick/linux.bash
index e4d4c4f..69e5bef 100755
--- a/src/wg-quick/linux.bash
+++ b/src/wg-quick/linux.bash
@@ -220,9 +220,9 @@ add_default() {
 	fi
 	local proto=-4 iptables=iptables pf=ip
 	[[ $1 == *:* ]] && proto=-6 iptables=ip6tables pf=ip6
-	cmd ip $proto route add "$1" dev "$INTERFACE" table $table
 	cmd ip $proto rule add not fwmark $table table $table
 	cmd ip $proto rule add table main suppress_prefixlength 0
+	cmd ip $proto route add "$1" dev "$INTERFACE" table $table
 
 	local marker="-m comment --comment \"wg-quick(8) rule for $INTERFACE\"" restore=$'*raw\n' nftable="wg-quick-$INTERFACE" nftcmd 
 	printf -v nftcmd '%sadd table %s %s\n' "$nftcmd" "$pf" "$nftable"
-- 
2.36.1

