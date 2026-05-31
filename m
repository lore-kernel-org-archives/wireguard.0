Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC7A3CD6E61
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  1 Jun 2026 10:01:47 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 2d58799c;
	Mon, 1 Jun 2026 10:01:47 +0000 (UTC)
Received: from mail.lekensteyn.nl (mail.lekensteyn.nl [2a02:2308::360:1:25])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 41f48618
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 31 May 2026 22:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=lekensteyn.nl; s=s2048-2021-q3; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2WPCm8Pk7uK8ld1tBRG/FfxpFjtfUejAmKNluzkSoyc=; b=GBhwujyyrmGFmjJ4W4+3Up4owM
 m7LcpwP6fCxeJbYr1xhkBdMPHfp4o6kg+CRku2Gr5jK/g1X0vQ0WzI5nd/OoKtP8W4NsY5mrro1Vp
 N5gu80FQ4I4ta6V0urSbCFuc7b+L46K4Cu3102kx++p7pG1ROVWVnG8TS0Tr2RJO3VRk0FuGRbrzC
 iNe+BfXbpVqObXQfRf5wiLZYMc0i4/9JKltE5142qN++daN60wl+bPFVBBraaYWM0LoIOR/53E6Kd
 5TJLzqN3H0DOiSXHxwdb5YN6ws5UB6QMuW2B2VNEvZErbs5x9ZpGrg57cXrLGOInOdajJdJ1fwyok
 kxUehyUw==;
Received: by lekensteyn.nl with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <peter@lekensteyn.nl>) id 1wTp3z-0000lv-0O
 for wireguard@lists.zx2c4.com; Mon, 01 Jun 2026 00:55:23 +0200
From: Peter Wu <peter@lekensteyn.nl>
To: wireguard@lists.zx2c4.com
Subject: [PATCH 2/2] extract-handshakes: add a more user-friendly BTF approach
Date: Mon,  1 Jun 2026 00:55:21 +0200
Message-ID: <20260531225521.576473-3-peter@lekensteyn.nl>
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

The previous implementation requires a copy of WireGuard kernel module
module sources matching the current kernel and a writeable directory.
Add an alternative implementation that reads the module offsets at
runtime using BTF (BPF Type Format).

The previous module-based implementation is maintained in case BTF is
unavailable, like hardened systems with structure layout randomization.

A fprobetrace-based approach was also considered as that would avoid the
need to manually extract BTF offsets. It is currently not feasible
however since the wg_index_hashtable_insert entry parameter cannot be
typecast to the larger structure it was embedded in.

Signed-off-by: Peter Wu <peter@lekensteyn.nl>
---
 contrib/extract-handshakes/README             |  7 +-
 .../extract-handshakes/extract-handshakes.sh  |  8 ++-
 contrib/extract-handshakes/make-offsets.sh    | 70 +++++++++++++++++++
 3 files changed, 82 insertions(+), 3 deletions(-)
 create mode 100755 contrib/extract-handshakes/make-offsets.sh

diff --git a/contrib/extract-handshakes/README b/contrib/extract-handshakes/README
index 1d030fa..568d142 100644
--- a/contrib/extract-handshakes/README
+++ b/contrib/extract-handshakes/README
@@ -6,7 +6,12 @@ to them being sent, via kprobes. It exports the bare minimum to be
 able to then decrypt all packets in the handshake and in the subsequent
 transport data session.
 
-Build:
+These probes depend on knowledge of kernel structure offsets. Ideally
+from BTF (BPF Type Format), available with CONFIG_DEBUG_INFO_BTF=y
+and Linux 5.2+. On systems where this is not available, an alternative
+approach is possible when WireGuard module sources are available.
+
+Build (only if BTF is unavailable):
 
     $ make
 
diff --git a/contrib/extract-handshakes/extract-handshakes.sh b/contrib/extract-handshakes/extract-handshakes.sh
index 57d397e..284749f 100755
--- a/contrib/extract-handshakes/extract-handshakes.sh
+++ b/contrib/extract-handshakes/extract-handshakes.sh
@@ -2,13 +2,17 @@
 # SPDX-License-Identifier: GPL-2.0
 #
 # Copyright (C) 2015-2026 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
-# Copyright (C) 2017-2018 Peter Wu <peter@lekensteyn.nl>. All Rights Reserved.
+# Copyright (C) 2017-2026 Peter Wu <peter@lekensteyn.nl>. All Rights Reserved.
 
 set -e
 
 ME_DIR="${BASH_SOURCE[0]}"
 ME_DIR="${ME_DIR%/*}"
-source "$ME_DIR/offsets.include" || { echo "Did you forget to run make?" >&2; exit 1; }
+if [ -e "$ME_DIR/offsets.include" ]; then
+	source "$ME_DIR/offsets.include"
+else
+	source "$ME_DIR/make-offsets.sh"
+fi
 
 case "$(uname -m)" in
 	x86_64) ARGUMENT_REGISTER="%si" ;;
diff --git a/contrib/extract-handshakes/make-offsets.sh b/contrib/extract-handshakes/make-offsets.sh
new file mode 100755
index 0000000..ed7e6b4
--- /dev/null
+++ b/contrib/extract-handshakes/make-offsets.sh
@@ -0,0 +1,70 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# Copyright (C) 2026 Peter Wu <peter@lekensteyn.nl>. All Rights Reserved.
+
+set -eu -o pipefail
+
+if ! [ -e /sys/kernel/btf/vmlinux ]; then
+	echo "kernel BTF is missing, requires Linux v5.2+ with CONFIG_DEBUG_INFO_BTF=y" >&2
+	exit 1
+fi
+
+if ! [ -e /sys/kernel/btf/wireguard ]; then
+	echo "BTF not available for wireguard, ensure kernel module is loaded." >&2
+	exit 1
+fi
+
+for tool in bpftool jq; do
+	if ! type "$tool" &>/dev/null; then
+		echo "Extracting offsets using BTF requires tool: $tool" >&2
+		exit 1
+	fi
+done
+
+declare -A struct_offsets
+while read -r struct field offset; do
+	struct_offsets["$struct.$field"]="$offset"
+done < <(
+	bpftool -j btf dump file /sys/kernel/btf/wireguard |
+		jq -cr '.types[]|select(.kind=="STRUCT" and
+		(.name=="noise_handshake" or .name=="noise_static_identity")
+		) as $t|.members[]|[$t.name, .name, .bits_offset/8]|@tsv'
+)
+
+struct_offset() {
+	local struct="$1" field="$2" offset
+	offset="${struct_offsets[$struct.$field]:-}"
+	if [ -z "$offset" ]; then
+		echo "Failed to find offset for struct $struct $field" >&2
+		exit 1
+	fi
+	echo "$offset"
+}
+
+declare -A OFFSETS
+OFFSETS[LOCAL_STATIC_PRIVATE_KEY]=$(struct_offset noise_static_identity static_private),$(struct_offset noise_handshake static_identity)
+OFFSETS[LOCAL_EPHEMERAL_PRIVATE_KEY]=$(struct_offset noise_handshake ephemeral_private)
+OFFSETS[REMOTE_STATIC_PUBLIC_KEY]=$(struct_offset noise_handshake remote_static)
+OFFSETS[PRESHARED_KEY]=$(struct_offset noise_handshake preshared_key)
+
+if [ -e /sys/kernel/cpu_byteorder ]; then
+	# Since Linux 6.2 (February 2023)
+	read -r ENDIAN < /sys/kernel/cpu_byteorder
+else
+	[[ "$(lscpu)" == *Byte\ Order:*Big* ]] && ENDIAN=big || ENDIAN=little
+fi
+
+# Pretty-print values if not sourced.
+if ! (return 0 2>/dev/null); then
+	# Pretty-print version of 'declare -p OFFSETS'
+	cat <<EOF
+declare -A OFFSETS=(
+	[LOCAL_STATIC_PRIVATE_KEY]=${OFFSETS[LOCAL_STATIC_PRIVATE_KEY]}
+	[LOCAL_EPHEMERAL_PRIVATE_KEY]=${OFFSETS[LOCAL_EPHEMERAL_PRIVATE_KEY]}
+	[REMOTE_STATIC_PUBLIC_KEY]=${OFFSETS[REMOTE_STATIC_PUBLIC_KEY]}
+	[PRESHARED_KEY]=${OFFSETS[PRESHARED_KEY]}
+)
+ENDIAN=$ENDIAN
+EOF
+fi
-- 
2.54.0

