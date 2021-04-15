Return-Path: <SRS0=S5mX=JM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA697C433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 15 Apr 2021 13:45:21 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68B6061008
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 15 Apr 2021 13:45:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68B6061008
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=toke.dk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cbe1eadc;
	Thu, 15 Apr 2021 13:45:18 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [45.145.95.4])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6ab405b9
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 15 Apr 2021 13:45:15 +0000 (UTC)
From: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
 t=1618494314; bh=Os2SQVQskkU5mGVl0JLN8W35tkLDxZPgc6vg+q4YJVc=;
 h=From:To:Cc:Subject:Date:From;
 b=l88IkRuX3xAv8UhkXp3VXzOUaAaJqV4z7QaHYD+ajgYwghpztViIoFyoY9g7c8Lee
 EYBLa3Dl1+8EeXPT+HP4Caf1xhkCVQdPY2zn7lgKxDxtttvkq9aioGiew73qMk55Zy
 AKG04Bm7Xr7aVCiyMGAHTQ0p3ywtLo+KTk8VcBkpvjtlnAUJXU346ibQyIMPb1B3PJ
 geNqFZwD2Idx3c2GRlyIDXe9PIHAry6Qt0U5tt32Q1avLgISEbVD/TpXE7ogaQ4D29
 dXepWDHITpqPz6x68BpjL7sygKgAp3cOFBaaPKNT1K1rhY2IdpGNRII+sTlT+uL90W
 Jy7z+cP6zAELg==
To: bird-users@network.cz
Cc: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
 wireguard@lists.zx2c4.com, Stefan Haller <stefan.haller@stha.de>
Subject: [PATCH] babel: Drop check for IF_MULTICAST interface flag
Date: Thu, 15 Apr 2021 15:44:50 +0200
Message-Id: <20210415134450.197661-1-toke@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

The babel protocol code was checking interfaces for the IF_MULTICAST flag
and refusing to run if this isn't present. However, there are cases where
this flag doesn't correspond to the actual capability of sending multicast
packets. For instance, Wireguard interfaces on FreeBSD doesn't set the
required flags, but Babel will run just fine over such an interface given
the right configuration.

Since we're also checking for the presence of a link-local addresses right
below the flag check, we don't really need it. So let's just drop the check
and trust that users will only configure Babel on interfaces that can
handle the traffic.

Reported-by: Stefan Haller <stefan.haller@stha.de>
Signed-off-by: Toke Høiland-Jørgensen <toke@toke.dk>
---
 proto/babel/babel.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/proto/babel/babel.c b/proto/babel/babel.c
index 4b6b9d7f9f6f..297b86b06a46 100644
--- a/proto/babel/babel.c
+++ b/proto/babel/babel.c
@@ -1658,10 +1658,6 @@ babel_if_notify(struct proto *P, unsigned flags, struct iface *iface)
     if (!(iface->flags & IF_UP))
       return;
 
-    /* We only speak multicast */
-    if (!(iface->flags & IF_MULTICAST))
-      return;
-
     /* Ignore ifaces without link-local address */
     if (!iface->llv6)
       return;
@@ -1736,10 +1732,6 @@ babel_reconfigure_ifaces(struct babel_proto *p, struct babel_config *cf)
     if (!(iface->flags & IF_UP))
       continue;
 
-    /* Ignore non-multicast ifaces */
-    if (!(iface->flags & IF_MULTICAST))
-      continue;
-
     /* Ignore ifaces without link-local address */
     if (!iface->llv6)
       continue;
-- 
2.31.1

