Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E36BC4167B
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 12 Dec 2022 11:47:23 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e8c79ea8;
	Mon, 12 Dec 2022 11:47:21 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 1aaef889
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Dec 2022 11:47:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9D13160F98;
 Mon, 12 Dec 2022 11:47:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0E18C433EF;
 Mon, 12 Dec 2022 11:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670845637;
 bh=lWioGeYIzIqesYApk/JLuJOXnJyD7SbY2I0mQPcKIf4=;
 h=From:To:Cc:Subject:Date:From;
 b=q2dVmV6WTikcdIc/5QOlHYjekbmceuvLBIbn/4dUN2RrdzUR9NuvOsOv0wuCX7s1w
 d/yIWo7deyNFS6gFnNcLw2VUtIymGjxptAA2rp3KR10Qs0aAJOb7Fio46OxFaHTmJu
 wqh6b0toEmp8bdm0rVHZgDdRdVRjuVyfCqtLEpoov1bbjYMcWH05MXb8eWgoHnS67+
 k2viP/B7jHJIBKzgNMuj58+5bCz1kM92RcH7HsCBUG+MwR206G1lMi1x7vQIF1PoGI
 dnqKB7pjkb+y0u5ob1RinY8P4T2H90caG1gcEPj9SK9Aaa6ZaL/qc1BBxtu/6D/hUW
 hi+2lwA2vH4QA==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: Jason@zx2c4.com
Cc: linux-kernel@vger.kernel.org, "Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
 Martin Liska <mliska@suse.cz>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org
Subject: [PATCH v2] wireguard (gcc13): move ULLs limits away from enum
Date: Mon, 12 Dec 2022 12:47:12 +0100
Message-Id: <20221212114712.11802-1-jirislaby@kernel.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
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

Since gcc13, each member of an enum has the same type as the enum [1]. And
that is inherited from its members. Provided these two:
  REKEY_AFTER_MESSAGES = 1ULL << 60
  REJECT_AFTER_MESSAGES = U64_MAX - COUNTER_WINDOW_SIZE - 1
the named type is unsigned long.

This generates warnings with gcc-13:
  error: format '%d' expects argument of type 'int', but argument 6 has type 'long unsigned int'

Define such high values as macros instead of in the enum. Note that
enums are not guaranteed to hold unsigned longs in any way.

And use BIT_ULL() for REKEY_AFTER_MESSAGES.

[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=36113

Cc: Martin Liska <mliska@suse.cz>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: wireguard@lists.zx2c4.com
Cc: netdev@vger.kernel.org
Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
---

Notes:
    [v2] move the constant out of enum (David)

 drivers/net/wireguard/messages.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireguard/messages.h b/drivers/net/wireguard/messages.h
index 208da72673fc..048125bdcd23 100644
--- a/drivers/net/wireguard/messages.h
+++ b/drivers/net/wireguard/messages.h
@@ -37,9 +37,10 @@ enum counter_values {
 	COUNTER_WINDOW_SIZE = COUNTER_BITS_TOTAL - COUNTER_REDUNDANT_BITS
 };
 
+#define REKEY_AFTER_MESSAGES	BIT_ULL(60)
+#define REJECT_AFTER_MESSAGES	(U64_MAX - COUNTER_WINDOW_SIZE - 1)
+
 enum limits {
-	REKEY_AFTER_MESSAGES = 1ULL << 60,
-	REJECT_AFTER_MESSAGES = U64_MAX - COUNTER_WINDOW_SIZE - 1,
 	REKEY_TIMEOUT = 5,
 	REKEY_TIMEOUT_JITTER_MAX_JIFFIES = HZ / 3,
 	REKEY_AFTER_TIME = 120,
-- 
2.38.1

