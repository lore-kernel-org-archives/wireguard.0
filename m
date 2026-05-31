Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F7ECD6E56
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  1 Jun 2026 10:01:49 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id bf3bccea;
	Mon, 1 Jun 2026 10:01:49 +0000 (UTC)
Received: from mail.lekensteyn.nl (mail.lekensteyn.nl [2a02:2308::360:1:25])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id e50a5a00
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 31 May 2026 22:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=lekensteyn.nl; s=s2048-2021-q3; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=L1SNNLP4S22syUUgTkzERJr7suMfvd4UOJZgHang0rk=; b=j5IDPvlinAGT62PvJxXJYTZIKG
 5K3Nr3v3Db8V11VRtaSabapZ6CXGCqcIkA0e9qmPjnZ9GMxXuAMQRpVKvwIXhg3j+/iEBLvY4cWnE
 o33Q3hxJ8QX3BHn8snO3qmB9gDi6tnc2zeF+4iY6lnC9S95iNa6cvsIDdRQCDcDfWG1VUjkl2z4Sn
 BkEzj0TcIkgYpvv9LFCUEyyQ4uGyyuY+EmSoXuuRh7nL/Zvo+EY3Ux3a4Kj+VVcTzSSuNlYfh5gT6
 Ndfgt11Gwp5a5gi6oAj/sMUR4IHLlsShznX7R4OFrtrG6VRTeUbLz5YpNWmHVxGk/jSC/XmRrxkM7
 KifJkRKA==;
Received: by lekensteyn.nl with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <peter@lekensteyn.nl>) id 1wTp3y-0000lv-JP
 for wireguard@lists.zx2c4.com; Mon, 01 Jun 2026 00:55:22 +0200
From: Peter Wu <peter@lekensteyn.nl>
To: wireguard@lists.zx2c4.com
Subject: [PATCH 1/2] extract-handshakes: fix compatibility with upstream
 WireGuard module
Date: Mon,  1 Jun 2026 00:55:20 +0200
Message-ID: <20260531225521.576473-2-peter@lekensteyn.nl>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260531225521.576473-1-peter@lekensteyn.nl>
References: <20260531225521.576473-1-peter@lekensteyn.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 01 Jun 2026 10:01:43 +0000
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

Fix probe target, it got prefixed with wg_ in WireGuard 0.0.20181006 to
prepare for upstream Linux inclusion. Fix the trace directory, since
Linux v6.17 the old location has been disabled by default.

Signed-off-by: Peter Wu <peter@lekensteyn.nl>
---
 .../extract-handshakes/extract-handshakes.sh    | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/contrib/extract-handshakes/extract-handshakes.sh b/contrib/extract-handshakes/extract-handshakes.sh
index 135a0d3..57d397e 100755
--- a/contrib/extract-handshakes/extract-handshakes.sh
+++ b/contrib/extract-handshakes/extract-handshakes.sh
@@ -34,17 +34,22 @@ for key in "${!OFFSETS[@]}"; do
 	done
 done
 
+# Use the new tracefs dir, since Linux v4.1. The old debugfs tracing directory
+# is gone since Linux v6.17 without CONFIG_TRACEFS_AUTOMOUNT_DEPRECATED=y.
+tracefs=/sys/kernel/tracing
+[ -e "$tracefs" ] || tracefs=/sys/kernel/debug/tracing
+
 turn_off() {
 	set +e
-	[[ -f /sys/kernel/debug/tracing/events/wireguard/idxadd/enable ]] || exit
-	echo 0 > /sys/kernel/debug/tracing/events/wireguard/idxadd/enable
-	echo "-:wireguard/idxadd" >> /sys/kernel/debug/tracing/kprobe_events
+	[[ -f "$tracefs/events/wireguard/idxadd/enable" ]] || exit
+	echo 0 > "$tracefs/events/wireguard/idxadd/enable"
+	echo "-:wireguard/idxadd" >> "$tracefs/kprobe_events"
 	exit
 }
 
 trap turn_off INT TERM EXIT
-echo "p:wireguard/idxadd index_hashtable_insert ${ARGS[*]}" >> /sys/kernel/debug/tracing/kprobe_events
-echo 1 > /sys/kernel/debug/tracing/events/wireguard/idxadd/enable
+echo "p:wireguard/idxadd wg_index_hashtable_insert ${ARGS[*]}" >> "$tracefs/kprobe_events"
+echo 1 > "$tracefs/events/wireguard/idxadd/enable"
 
 unpack_u64() {
 	local i expanded="$1"
@@ -77,4 +82,4 @@ while read -r line; do
 		done
 		echo "  $key = $(printf "$bytes" | base64)"
 	done
-done < /sys/kernel/debug/tracing/trace_pipe
+done < "$tracefs/trace_pipe"
-- 
2.54.0

