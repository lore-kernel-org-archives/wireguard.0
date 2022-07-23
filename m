Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD714C43334
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 26 Jul 2022 13:12:11 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 5fb44c30;
	Tue, 26 Jul 2022 13:07:49 +0000 (UTC)
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id f92f6c25
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 23 Jul 2022 21:32:22 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id l23so14199683ejr.5
 for <wireguard@lists.zx2c4.com>; Sat, 23 Jul 2022 14:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7fI3VkMOB8lORY8703Y9EecyZqOcqLHGqz9qWScVRxQ=;
 b=mgdLCrWSDaaBTExkRfxixkIu8hFPXvLK66NGh2MI6qQ6zVwov73QJpTl+M/e62klPA
 u67N1uEGC+x3ilrB0D5Bj++C2r/h0nPsm2v5cOzc+vgrl4nplt+Vk7GfMoMBeMer85US
 psACjdLgXKNyX3r1/wbzvD8U/1vEs+56784thRnAYsQ28CwJin8Fikw+gkFRLRs/LdQe
 HBYsRsrhPukSTu6cuD062tg6p1MuL9b5Ic6HGrdaY+67Rj/sDYV83qvatapX3vSLsier
 mnZLgyY4Phz3AEshNcct39kn1TnMWj2mwoYJhZmrb0Tfde+1Go+kXbY7jveC5NUuFlWz
 Jgzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7fI3VkMOB8lORY8703Y9EecyZqOcqLHGqz9qWScVRxQ=;
 b=Bah3KU+fPl6aYSTQaEVHecasuJK2kt2Uvf6KgcIQwYqPTUPI9taax+dTPC1QaxOUb7
 2boz8uzuwa/w1QIKrT5PF//IStZudiCfcz/L0IfICMprCgktFU2D78amsInTItprvjrN
 HQ3GoFf0MwM7JXNHruxbYNpk93xwAzq2Vmi9WgXrlEwiGEYjwWB7epFRSd93SM2BUe7E
 VLhHFpLgQ+4h/rQwO7FlOzlVnUPFfGj2n8jm37iMo6rdcWnFY/g3n0Zkjf53uyq0E4IL
 IhfXWF41mYiT19gKYArPl6CYGPN0qJ+n21Fa8TPPJi5y85SXqO8UJcZwAIdlWr6GPuYO
 CCpw==
X-Gm-Message-State: AJIora/579pQu/GDh8W5gFeucReBJpvuoTIo0ANqF7KN+ua172T7QGgA
 x7u9N5la1gnMPA1j1dVahZM=
X-Google-Smtp-Source: AGRyM1umUdv7RlUWM4AXd8VFZPpoRRsmUXY03AotVREk792PVlreOrZccy4mXcBb6H5UUeyjMTWrlw==
X-Received: by 2002:a17:907:6087:b0:72f:36ff:7fa2 with SMTP id
 ht7-20020a170907608700b0072f36ff7fa2mr4527504ejc.162.1658611941852; 
 Sat, 23 Jul 2022 14:32:21 -0700 (PDT)
Received: from junglepc.fritz.box (h081217087223.dyn.cm.kabsi.at.
 [81.217.87.223]) by smtp.gmail.com with ESMTPSA id
 y19-20020aa7d513000000b0043a7293a03dsm4585399edq.7.2022.07.23.14.32.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jul 2022 14:32:21 -0700 (PDT)
From: Sotir Danailov <sndanailov@gmail.com>
To: Jason@zx2c4.com
Cc: wireguard@lists.zx2c4.com,
	Sotir Danailov <sndanailov@gmail.com>
Subject: [PATCH] man: wg-quick: kill-switch rules for firewalld
Date: Sat, 23 Jul 2022 23:32:17 +0200
Message-Id: <20220723213217.29475-1-sndanailov@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 26 Jul 2022 13:07:47 +0000
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

Signed-off-by: Sotir Danailov <sndanailov@gmail.com>
---
 src/man/wg-quick.8 | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/src/man/wg-quick.8 b/src/man/wg-quick.8
index b84eb64..9f8414e 100644
--- a/src/man/wg-quick.8
+++ b/src/man/wg-quick.8
@@ -156,6 +156,13 @@ two lines `PostUp` and `PreDown` lines to the `[Interface]` section:
     \fBPreDown = iptables -D OUTPUT ! -o %i -m mark ! --mark $(wg show %i fwmark) -m addrtype ! --dst-type LOCAL -j REJECT\fP
 .br
 
+When using `firewalld', the ``kill-switch'' can be done like so:
+
+    \fBPostUp = firewall-cmd --permanent --direct --add-rule ipv4 filter OUTPUT 0 ! -o %i -m mark ! --mark $(wg show %i fwmark) -m addrtype ! --dst-type LOCAL -j REJECT && firewall-cmd --reload\fP
+.br
+    \fBPreDown = firewall-cmd --permanent --direct --remove-rule ipv4 filter OUTPUT 0 ! -o %i -m mark ! --mark $(wg show %i fwmark) -m addrtype ! --dst-type LOCAL -j REJECT && firewall-cmd --reload\fP
+.br
+
 The `PostUp' and `PreDown' fields have been added to specify an
 .BR iptables (8)
 command which, when used with interfaces that have a peer that specifies 0.0.0.0/0 as part of the
-- 
2.37.1

