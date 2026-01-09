Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE73EF06E9
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Feb 2026 18:13:17 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5e4704c3;
	Sun, 8 Feb 2026 17:13:07 +0000 (UTC)
Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com
 [2001:41d0:1004:224b::b6])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 9be864f6
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 9 Jan 2026 14:41:33 +0000 (UTC)
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xn--sb-lka.org;
 s=key1; t=1767969692;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nHe/jC5ej17ekDM9xfeuFx/1Sd3+SMmX/MN2TEYqgpE=;
 b=RWO/IYicDzpwuS3u599l0APFQdoTt/oghQU9pQC9x/eLSiJbHcGzfJ7w3LtGPWj8p3Lccv
 8SOLW3rxfzUpBdlJSF7qzgMDJbhiikJuJVDgxBNFosbH039pANdI/uICdmg4s4hqupgJER
 gSdGAx2SneCFE7TDKxBzJUoDIVhbJf50GwXjqbNASrVg/b8PMIH5F4+mlAn/Y6CZiv9WEl
 I1JiQnuXH5xFAbQPRZ4iBQE/R/Aoi8xa01MGmkvQos98prcEE7IAzgaPkEfkhiWlxiuJeA
 ORoQJPEb2QmnrizwPCLqiCP/gnwMXjISXg8rjXEfI94onf0o6qBP6Dosi4vLcg==
Date: Fri, 09 Jan 2026 14:41:31 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: "Nicolai S" <wg@xn--sb-lka.org>
Message-ID: <e37fde7db37eec624d87e6c9d18a5e94d791c387@xn--sb-lka.org>
TLS-Required: No
Subject: wg-quick: Add flag `WG_QUICK_PREFER_USERSPACE_IMPLEMENTATION`
To: wireguard@lists.zx2c4.com
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Sun, 08 Feb 2026 17:12:58 +0000
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

While developing a userspace implementation of wireguard, or if users hav=
e
special requirements for which implementation of wg to use, etc, it would=
 be
nice to be able to force `wg-quick` to use `WG_QUICK_USERSPACE_IMPLEMENTA=
TION`.

But currently, if your kernel supports wireguard, then `wg-quick` will ig=
nore
the `WG_QUICK_USERSPACE_IMPLEMENTATION` environment variable (on linux).

This patch introduces `WG_QUICK_PREFER_USERSPACE_IMPLEMENTATION` to get `=
wg-quick`
to use the userspace implementation.

Note that `darwin.bash` already prefers `WG_QUICK_USERSPACE_IMPLEMENTATIO=
N` if set.

If we instead want the darwin behavior in `linux.bash` then I suggest mer=
ging
this patch: https://lists.zx2c4.com/pipermail/wireguard/2025-March/008773=
.html

Signed-off-by: Nicolai S=C3=B8borg <wg @ xn--sb-lka.org>
---
 src/wg-quick/linux.bash   | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletions(-)

diff --git a/src/wg-quick/linux.bash b/src/wg-quick/linux.bash
index 34fa5f9..be867d5 100755
--- a/src/wg-quick/linux.bash
+++ b/src/wg-quick/linux.bash
@@ -88,7 +88,10 @@ auto_su() {
=20
=20add_if() {
 	local ret
-	if ! cmd ip link add dev "$INTERFACE" type wireguard; then
+	if [[ -n "$WG_QUICK_PREFER_USERSPACE_IMPLEMENTATION" ]]; then
+		echo "[!] Forcing userspace implementation." >&2
+		cmd "${WG_QUICK_USERSPACE_IMPLEMENTATION:-wireguard-go}" "$INTERFACE"
+	elif ! cmd ip link add dev "$INTERFACE" type wireguard; then
 		ret=3D$?
 		[[ -e /sys/module/wireguard ]] || ! command -v "${WG_QUICK_USERSPACE_I=
MPLEMENTATION:-wireguard-go}" >/dev/null && exit $ret
 		echo "[!] Missing WireGuard kernel module. Falling back to slow usersp=
ace implementation." >&2
