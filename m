Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67FFAC4332F
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  4 Nov 2022 17:02:01 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e81df672;
	Fri, 4 Nov 2022 17:02:00 +0000 (UTC)
Received: from mx2.freebsd.org (mx2.freebsd.org [96.47.72.81])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 540a3a48
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 4 Nov 2022 17:01:56 +0000 (UTC)
Received: from mx1.freebsd.org (mx1.freebsd.org [96.47.72.80])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 4N3CFf2xjvz3Qnl;
 Thu,  3 Nov 2022 18:38:46 +0000 (UTC)
 (envelope-from kevans@FreeBSD.org)
Received: from smtp.freebsd.org (smtp.freebsd.org
 [IPv6:2610:1c1:1:606c::24b:4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4N3CFf25G9z459R;
 Thu,  3 Nov 2022 18:38:46 +0000 (UTC)
 (envelope-from kevans@FreeBSD.org)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org; s=dkim;
 t=1667500726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=mNglMBNU/fGtF/g2rEvFtl0j6rSpsps2Uh3YlsOtIHA=;
 b=ybGXdAyThVP2UPSnXa+K6p0DWTtLQlPh4WIDxHTcDdTb+4h7NzyvYePqXotLmYylE+X/j3
 wXOo8Ej3MY8hUhY7q+bJ0RAZJXE9BYoNSwJzFf9ff331eqQmowAJQ6uEBXqb9pfh/hH6hD
 TGdK8lm7X/eOVOHVF9oByaOMm/wm3t4ZWJCK8sHh+MxQA8yHHA7PHB8Mu1uKh2Gs1An5Lo
 hcQWwx9lkWwx2ye6n8sqFQDy8Zxsij9q5crFybY3Ym00WxydfgrqZH7jgtSxytqKfBEn7V
 Mqi+8tKa90CTxvf1RM9geWXc36SaO80jk1iagWCbyVMWwAJ3bPJudwVcjY+4lQ==
Received: from localhost.localdomain (nat-216-240-30-25.netapp.com
 [216.240.30.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate) (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id 4N3CFd66VPztBx;
 Thu,  3 Nov 2022 18:38:45 +0000 (UTC)
 (envelope-from kevans@FreeBSD.org)
From: kevans@FreeBSD.org
To: wireguard@lists.zx2c4.com
Cc: Kyle Evans <kevans@FreeBSD.org>
Subject: [PATCH 1/2] ipc: freebsd: avoid leaking memory in kernel_get_device()
Date: Thu,  3 Nov 2022 13:38:20 -0500
Message-Id: <20221103183821.48563-1-kevans@FreeBSD.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org;
 s=dkim; t=1667500726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=mNglMBNU/fGtF/g2rEvFtl0j6rSpsps2Uh3YlsOtIHA=;
 b=Q1tIRAM+sPLoQ59lfE216CmfXEguAZi79fdg5C1hmiOrRs+CxGa/Ftk37nE39ht/YzeDQ6
 7XZ+L6DwfJNHZnhtqjBeAJ4LiCx/+pURNZsddwuF18YrMVTrvX3xktANQZCELy3AM+q14w
 jw8EATUtXWtPpOZq4M7LKgN7KjKgB0LBknhuGHgxisXG7tbPJwBquTxTHAk5nSTljyFuKK
 6eqMmnoBfUvlCQ+0TPVqPKIjjuz1y/s4vMtBIo6EAW6m9qaP0hY4ZmYngZdyIp7Ys55gIT
 wwk2IpSZIeo467VHjzekbSs5BCCUSDQ4lGQkqkXzGK11AqUWvEta+dgTy07nfA==
ARC-Seal: i=1; s=dkim; d=freebsd.org; t=1667500726; a=rsa-sha256; cv=none;
 b=I7I3lcxiVBXDP0N48+aBqOL1xrRm7vuPul06j8g0u3AEDlg4YbnplrINpe/tPFfTLf0LNQ
 2J5y+TPgr792vBCVlZFPtqwEwfZmV8pYTmPnQR3Yzs5KCiMCWiwWYgkABShff4CUPz37hz
 okzPEWjpECM2yyfXg6Wo2jPoswVU8Vgc323WEkidiJXL5Oy9scUL6JwKX+q/yevuEOmggi
 3LXKPiL2AxkrFh00kKUI9TFgFQja42qxBOvMZpatYYuX+kLTojJ1tdSr89fhUEa89teRM2
 VUHUFTvjM8PzfP1AhSaVlzWVmahaeR/32c1F27HSwtcjkoPuogYEFmuNOnhB3Q==
ARC-Authentication-Results: i=1;
	mx1.freebsd.org;
	none
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

From: Kyle Evans <kevans@FreeBSD.org>

Primarily, front-load validation of an allowed-ip entry to before we
allocate `aip`, so that we don't need to free() it if we end up skipping
this entry.  Assert that `aip` is NULL after we exit the loop, as we
should have transfered ownership to the `peer` or freed it in all paths
through the allowed-ip loop.

FreeBSD-Coverity:	1500405
Signed-off-by: Kyle Evans <kevans@FreeBSD.org>
---
 src/ipc-freebsd.h | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/src/ipc-freebsd.h b/src/ipc-freebsd.h
index b5be15b..78064e9 100644
--- a/src/ipc-freebsd.h
+++ b/src/ipc-freebsd.h
@@ -8,6 +8,8 @@
 #include <sys/sockio.h>
 #include <dev/wg/if_wg.h>
 
+#include <assert.h>
+
 #define IPC_SUPPORTS_KERNEL_INTERFACE
 
 static int get_dgram_socket(void)
@@ -118,7 +120,7 @@ static int kernel_get_device(struct wgdevice **device, const char *ifname)
 		goto skip_peers;
 	for (i = 0; i < peer_count; ++i) {
 		struct wgpeer *peer;
-		struct wgallowedip *aip;
+		struct wgallowedip *aip = NULL;
 		const nvlist_t *const *nvl_aips;
 		size_t aip_count, j;
 
@@ -169,11 +171,13 @@ static int kernel_get_device(struct wgdevice **device, const char *ifname)
 		if (!aip_count || !nvl_aips)
 			goto skip_allowed_ips;
 		for (j = 0; j < aip_count; ++j) {
+			if (!nvlist_exists_number(nvl_aips[j], "cidr"))
+				continue;
+			if (!nvlist_exists_binary(nvl_aips[j], "ipv4") && !nvlist_exists_binary(nvl_aips[j], "ipv6"))
+				continue;
 			aip = calloc(1, sizeof(*aip));
 			if (!aip)
 				goto err_allowed_ips;
-			if (!nvlist_exists_number(nvl_aips[j], "cidr"))
-				continue;
 			number = nvlist_get_number(nvl_aips[j], "cidr");
 			if (nvlist_exists_binary(nvl_aips[j], "ipv4")) {
 				binary = nvlist_get_binary(nvl_aips[j], "ipv4", &size);
@@ -184,7 +188,8 @@ static int kernel_get_device(struct wgdevice **device, const char *ifname)
 				aip->family = AF_INET;
 				aip->cidr = number;
 				memcpy(&aip->ip4, binary, sizeof(aip->ip4));
-			} else if (nvlist_exists_binary(nvl_aips[j], "ipv6")) {
+			} else {
+				assert(nvlist_exists_binary(nvl_aips[j], "ipv6"));
 				binary = nvlist_get_binary(nvl_aips[j], "ipv6", &size);
 				if (!binary || number > 128) {
 					ret = EINVAL;
@@ -193,14 +198,14 @@ static int kernel_get_device(struct wgdevice **device, const char *ifname)
 				aip->family = AF_INET6;
 				aip->cidr = number;
 				memcpy(&aip->ip6, binary, sizeof(aip->ip6));
-			} else
-				continue;
+			}
 
 			if (!peer->first_allowedip)
 				peer->first_allowedip = aip;
 			else
 				peer->last_allowedip->next_allowedip = aip;
 			peer->last_allowedip = aip;
+			aip = NULL;
 			continue;
 
 		err_allowed_ips:
@@ -209,6 +214,12 @@ static int kernel_get_device(struct wgdevice **device, const char *ifname)
 			free(aip);
 			goto err_peer;
 		}
+
+		/*
+		 * Nothing leaked, hopefully -- ownership transferred or aip
+		 * freed.
+		 */
+		assert(aip == NULL);
 	skip_allowed_ips:
 		if (!dev->first_peer)
 			dev->first_peer = peer;
-- 
2.36.1

