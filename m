Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DFA8606A326
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  4 Nov 2026 11:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ilvokhin.com header.i=@ilvokhin.com header.a=rsa-sha256 header.s=mail header.b=ruNRLjFr
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 7dd703ec;
	Wed, 4 Nov 2026 11:22:22 +0000 (UTC)
Received: from mail.ilvokhin.com (mail.ilvokhin.com [178.62.254.231])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 6437ed82
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 4 Nov 2026 11:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ilvokhin.com;
 s=mail; t=1793791340;
 bh=NRYMUswHU9EXVk5ENJbdXnGb5bZgB4OZRzXtIPt1Kg0=;
 h=From:To:Cc:Subject:Date;
 b=ruNRLjFrv3R+NWp/e/Onf3wJITaYNSGVLeucPX/H3KIDz4y9BIU0kHzDVkyo+992w
 z6BKkXHAJSr6LAyazyM2BpFzwv8i2T2k9SZPOivd3Bk+PrsrgJEwsRzjEGpe5DdyzM
 3ukB3nT7qUQR0QTW5Y94wODtd5lDx9ThscR9sAZM=
Received: from localhost.localdomain (shell.ilvokhin.com [138.68.190.75])
 (Authenticated sender: d@ilvokhin.com)
 by mail.ilvokhin.com (Postfix) with ESMTPSA id 40E901015CC;
 Wed, 04 Nov 2026 11:22:20 +0000 (UTC)
From: Dmitry Ilvokhin <d@ilvokhin.com>
To: "Jason A . Donenfeld" <jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com,
	Dmitry Ilvokhin <d@ilvokhin.com>
Subject: [PATCH RESEND] wg-quick: darwin: fix set_dns() and del_dns() race
Date: Wed,  4 Nov 2026 11:22:08 +0000
Message-ID: <20261104112208.46921-1-d@ilvokhin.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The monitor deamon restores the DNS servers by running del_dns() from
its INT, TERM and EXIT trap. Every route event also schedules an ALRM 2
seconds later, and the ALRM trap runs set_dns().

If ALRM arrives during cleanup, set_dns() can run in the middle of
del_dns(), and the DNS servers may not be restored after the WireGuard
interface is removed.

Ignore ALRM in cleanup signal handler to avoid this race.

Signed-off-by: Dmitry Ilvokhin <d@ilvokhin.com>
---
 src/wg-quick/darwin.bash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/wg-quick/darwin.bash b/src/wg-quick/darwin.bash
index 0179afb..20a21ce 100755
--- a/src/wg-quick/darwin.bash
+++ b/src/wg-quick/darwin.bash
@@ -323,7 +323,7 @@ del_dns() {
 
 monitor_daemon() {
 	echo "[+] Backgrounding route monitor" >&2
-	(trap 'del_routes; del_dns; exit 0' INT TERM EXIT
+	(trap 'trap "" ALRM; del_routes; del_dns; exit 0' INT TERM EXIT
 	exec >/dev/null 2>&1
 	exec 19< <(exec route -n monitor)
 	local event bpid=$BASHPID mpid=$!
-- 
2.54.0 (Apple Git-157)

