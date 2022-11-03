Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E77C4332F
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  4 Nov 2022 17:01:57 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1d84079d;
	Fri, 4 Nov 2022 17:01:55 +0000 (UTC)
Received: from mx2.freebsd.org (mx2.freebsd.org [2610:1c1:1:606c::19:2])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 02c240c0
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 4 Nov 2022 17:01:53 +0000 (UTC)
Received: from mx1.freebsd.org (mx1.freebsd.org [IPv6:2610:1c1:1:606c::19:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 4N3CFf5lQ7z3QjD;
 Thu,  3 Nov 2022 18:38:46 +0000 (UTC)
 (envelope-from kevans@FreeBSD.org)
Received: from smtp.freebsd.org (smtp.freebsd.org
 [IPv6:2610:1c1:1:606c::24b:4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4N3CFf4zPvz45Ng;
 Thu,  3 Nov 2022 18:38:46 +0000 (UTC)
 (envelope-from kevans@FreeBSD.org)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org; s=dkim;
 t=1667500726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YZV7t77eN5tEmeo0W4XwqH39oYX1r3fD04m9cclUPuo=;
 b=eXXmfWdo46ehwXqJfTzDC5FmGHQkeJpdp27v8DieimA0d037hBzEZSQsgTu5pxBOccHwkN
 C7yVrvox0X9u3F4pS1fr698LPJgxK4KayA40b7ZgOsAP56lZauX4O2JfCi8h8czdURtbZV
 jDDa5ok5PUrQ5WI+tqvP/lJPDpBMelLVizB4j+iSuV8d58c6dzDO8LznvANwBIk8XHUTAs
 zE4loUp4lNHMVBzYe3F81M66KBDDAIN5oTh2Ti9gtsrTgAZD8Lc4d/mif9e/pGDkjiS4EW
 b3sDu2UIFwYSzKyU8425vVqtzmG6Tgn7Q/2lbFpWsugeVgj150jaiDs81Qr+vg==
Received: from localhost.localdomain (nat-216-240-30-25.netapp.com
 [216.240.30.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate) (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id 4N3CFf29BBztBy;
 Thu,  3 Nov 2022 18:38:46 +0000 (UTC)
 (envelope-from kevans@FreeBSD.org)
From: kevans@FreeBSD.org
To: wireguard@lists.zx2c4.com
Cc: Kyle Evans <kevans@FreeBSD.org>
Subject: [PATCH 2/2] ipc: freebsd: NULL out some freed memory in
 kernel_set_device()
Date: Thu,  3 Nov 2022 13:38:21 -0500
Message-Id: <20221103183821.48563-2-kevans@FreeBSD.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20221103183821.48563-1-kevans@FreeBSD.org>
References: <20221103183821.48563-1-kevans@FreeBSD.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org;
 s=dkim; t=1667500726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YZV7t77eN5tEmeo0W4XwqH39oYX1r3fD04m9cclUPuo=;
 b=lTL7bVrX2H2xZ47qx+sWBVZAL386tGIVunGM4mP6h0ICuBSs3GGNMaC6w7F7Is7YWrKB1o
 xwWhlo5/qSIEw74KGJKfdTeoG1BOtmKxGund02Cra1KUTNTcO5DbeCDsKwBp0kNqtDI9MS
 LllR9TCVwdwiV70LFmIXC3VW3RqTpbLfKmTlbUUxqFPEFRnQKD5PyQ2XGBd4o2ACACTt85
 jzkyXVijStNJG4NnQXblrJcK3XtUxbZnz2uUiM7rCkS6PvXnE1cD6hBdBiDoXEF9wX+qr7
 zdAbTf+CXjPMJPoDPtYeYCvXfQnY2cWTM254DM4g7GgUlWePlz7ikEM9/0mdWg==
ARC-Seal: i=1; s=dkim; d=freebsd.org; t=1667500726; a=rsa-sha256; cv=none;
 b=bpA1Fp6ocvyu6vOIBYbQx5oTdtpWftcyGvmrk8cGeDMS8gIqjqp1EJ4sTlVLcZdJ6jc0yA
 W2rAqopCNUElQWZUiyBZExo+tN+du9pP46hs/Zid47YjNO3FRL3os0BZgR6hKIwuVBofKS
 LLcIqPwIftu3bvQWYJYxZtHnnV4EPmuWdbEPV09+Ufh8z7g+l1NgzXuVH9XwWs6/FjMCeq
 dd+N+jqgFarDXQ0cYQij7Mz6SvvaGUehXSfgUr/gY3CtUaeiw+P8r9A976BHbZ1zDAXghe
 erJpr/O0XpBjIaX5SoMFRfjEEFO52A2atKaeJW6I+045nXpLs7bCwQBGko2+oQ==
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

The `err` path in kernel_set_device() will attempt to free() allocated
nvl_peers, but these two cases meant we could end up attempting a use
after free or a double free, as we rely on nvlist_destroy(NULL) being
a NOP as well as free(NULL).

FreeBSD-Coverity:	1500421
Signed-off-by: Kyle Evans <kevans@FreeBSD.org>
---
 src/ipc-freebsd.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/src/ipc-freebsd.h b/src/ipc-freebsd.h
index 78064e9..f9d3550 100644
--- a/src/ipc-freebsd.h
+++ b/src/ipc-freebsd.h
@@ -333,6 +333,7 @@ static int kernel_set_device(struct wgdevice *dev)
 			nvlist_destroy(nvl_aips[j]);
 		free(nvl_aips);
 		nvlist_destroy(nvl_peers[i]);
+		nvl_peers[i] = NULL;
 		goto err;
 	}
 	if (i) {
@@ -340,9 +341,11 @@ static int kernel_set_device(struct wgdevice *dev)
 		for (i = 0; i < peer_count; ++i)
 			nvlist_destroy(nvl_peers[i]);
 		free(nvl_peers);
+		nvl_peers = NULL;
 	}
 	wgd.wgd_data = nvlist_pack(nvl_device, &wgd.wgd_size);
 	nvlist_destroy(nvl_device);
+	nvl_device = NULL;
 	if (!wgd.wgd_data)
 		goto err;
 	s = get_dgram_socket();
-- 
2.36.1

