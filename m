Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A74CBCA5FCE
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Oct 2026 08:48:05 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 19c7c087;
	Mon, 5 Oct 2026 06:56:40 +0000 (UTC)
Received: from mail.ilvokhin.com (mail.ilvokhin.com [178.62.254.231])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 7724511e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 30 Sep 2026 10:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ilvokhin.com;
 s=mail; t=1790764254;
 bh=OJGkyrR8iAozDwgxGVLHOVY/LqhureQpAP+Bypjdis8=;
 h=From:To:Cc:Subject:Date;
 b=HVsPYzhajL6/H4nQLn5btf9ryM5FEvcZ/F4li7okcvUA+zIWMSvSQAgbQNP45jngk
 ODyvBypyqv1/Yis389wBL70I/BcQ9TGGbKp+GM/ihrfTh2n5da2jaFlP1t1S+W+Shh
 rwd9GK7oQSchReY/GlT5yynzxIQA1iPhF2ZBNmf8=
Received: from localhost.localdomain (shell.ilvokhin.com [138.68.190.75])
 (Authenticated sender: d@ilvokhin.com)
 by mail.ilvokhin.com (Postfix) with ESMTPSA id 78325F1F8D;
 Wed, 30 Sep 2026 10:30:54 +0000 (UTC)
From: Dmitry Ilvokhin <d@ilvokhin.com>
To: "Jason A . Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com,
	Dmitry Ilvokhin <d@ilvokhin.com>
Subject: [PATCH] wg-quick: darwin: fix set_dns() and del_dns() race
Date: Wed, 30 Sep 2026 10:30:41 +0000
Message-ID: <20260930103041.102065-1-d@ilvokhin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 05 Oct 2026 06:55:46 +0000
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

The monitor deamon restores the DNS servers by running del_dns() from
its INT, TERM and EXIT trap. Every route event also schedules an ALRM 2
seconds later, and the ALRM trap runs set_dns().

If ALRM arrives during cleanup, set_dns() can run in the middle of
del_dns(), and the DNS servers may not be restored after the WireGuard
interface is removed.

Ignore ALRM in cleanup signal handler to avoid this race.

Signed-off-by: Dmitry Ilvokhin <d@ilvokhin.com>
---
Resending the patch, since mailing list didn't accept it first time,
because I was not a member of the list.

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

