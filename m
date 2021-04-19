Return-Path: <SRS0=oIpX=JQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DA1DC433ED
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 19 Apr 2021 22:27:06 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDDE160FDC
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 19 Apr 2021 22:27:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDDE160FDC
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=toke.dk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 64170299;
	Mon, 19 Apr 2021 22:27:02 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [45.145.95.4])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8ae629f6
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Apr 2021 22:26:57 +0000 (UTC)
From: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
 t=1618871216; bh=rZFoQJ5q2I+dTUlHjdzdqzp4Q1eDbZr6vSw1MR+pE1A=;
 h=From:To:Cc:Subject:Date:From;
 b=l9JYQjD722NM+jKOvl0FcxzzlTQSS8rYu9zBvyJYm16tcvXPr25rigSyubDRPifGI
 vEmUOXKcSGa8ec1AZrSgQfDjuJ3I7Ca879mEtja/gDZYgQ7kp14/zlqR/LIFztn/oS
 V93/AGQfw/LWmYUCXqHD8Tu/OLN7XFWXrgFs2rC2tzGmwpWroNF4Uax8d8n/Jk11Ll
 xOMXKCz25sU+tY+A45q5okGZmwD+jogdlcAb28Us2TuX3DkeHz7HiyYQKO7wQrykgO
 D402fozzIZiWDnIdcDJ09nAlt06isOYwCSOzm1MOdXacRsPcueWC+s2rl5XPp+7A7D
 i2Q1eHungIpfA==
To: bird-users@network.cz
Cc: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
 wireguard@lists.zx2c4.com, Stefan Haller <stefan.haller@stha.de>
Subject: [PATCH] sysdep/bsd: propagate OS-level IFF_MULTICAST to internal
 IF_MULTICAST flag
Date: Tue, 20 Apr 2021 00:26:53 +0200
Message-Id: <20210419222653.55983-1-toke@toke.dk>
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

The BSD code did not propagate the OS-level IFF_MULTICAST flag to the
Bird-internal IF_MULTICAST flag, which causes problems with Wireguard
interfaces on FreeBSD. The Linux sysdep code does propagate the flag
already, so just copy over the same check and flag update.

Tested-by: Stefan Haller <stefan.haller@stha.de>
Signed-off-by: Toke Høiland-Jørgensen <toke@toke.dk>
---
 sysdep/bsd/krt-sock.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sysdep/bsd/krt-sock.c b/sysdep/bsd/krt-sock.c
index c2faa23dd44f..cd89544063c7 100644
--- a/sysdep/bsd/krt-sock.c
+++ b/sysdep/bsd/krt-sock.c
@@ -665,6 +665,9 @@ krt_read_ifinfo(struct ks_msg *msg, int scan)
   else
     f.flags |= IF_MULTIACCESS;      /* NBMA */
 
+  if (fl & IFF_MULTICAST)
+    f.flags |= IF_MULTICAST;
+
   iface = if_update(&f);
 
   if (!scan)
-- 
2.31.1

