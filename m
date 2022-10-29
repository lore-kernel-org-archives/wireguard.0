Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2BEFFA3741
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 29 Oct 2022 01:45:29 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id b501dcae;
	Sat, 29 Oct 2022 01:45:27 +0000 (UTC)
Received: from mx2.freebsd.org (mx2.freebsd.org [96.47.72.81])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id b0582840
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 29 Oct 2022 01:45:25 +0000 (UTC)
Received: from mx1.freebsd.org (mx1.freebsd.org [96.47.72.80])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 4Mzj0g6wCcz3cst;
 Sat, 29 Oct 2022 01:45:23 +0000 (UTC)
 (envelope-from kevans@FreeBSD.org)
Received: from smtp.freebsd.org (smtp.freebsd.org
 [IPv6:2610:1c1:1:606c::24b:4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4Mzj0g5x96z3fpN;
 Sat, 29 Oct 2022 01:45:23 +0000 (UTC)
 (envelope-from kevans@FreeBSD.org)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org; s=dkim;
 t=1667007923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=LFgsZTpMK4sBGQ6CpQUHXeOxaRHG3XNKdL0yCBHM/9g=;
 b=EUECgnDrVGnk6kMKFE+IK3iMVnsJZVsu28nG/VfRFS67/8ISwB02E1qFoAhrPCuc2Uhusc
 xeekKM+1JaesF3Luyh57vz395xygD1EmTyTmCiHiVZuJ0EDD5nEycf6C5eSFsS5M1OYBlf
 +O2v0PI58DduCEM0ntqPPLfTzlAY6PlxTuo3ZCWunqVaFnJPAdGeZ/i+WPO373bIAL1Zuf
 iWPhtJo5rDLw/QAY2+kQAz9DdMZWueAELBpMp4Coyv2KXdoRccp9DIuV0O1K8jC171GJGj
 5UETdhgTFfQMpZUVO9pcsAFztC5tBOAXtqAGqfd6Nnv+RoV1RZKQ4FQ39sI/Wg==
Received: from localhost.localdomain (nat-216-240-30-23.netapp.com
 [216.240.30.23])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate) (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id 4Mzj0g3LHRz1SSv;
 Sat, 29 Oct 2022 01:45:23 +0000 (UTC)
 (envelope-from kevans@FreeBSD.org)
From: kevans@FreeBSD.org
To: wireguard@lists.zx2c4.com
Cc: Kyle Evans <kevans@FreeBSD.org>
Subject: [PATCH] wg: freebsd: move if_wg path to reflect new in-tree location
Date: Fri, 28 Oct 2022 20:45:05 -0500
Message-Id: <20221029014505.2679-1-kevans@FreeBSD.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org;
 s=dkim; t=1667007923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=LFgsZTpMK4sBGQ6CpQUHXeOxaRHG3XNKdL0yCBHM/9g=;
 b=I7poN063UxHm8hv7hdKhvMi0rKfp3lpC4OQ/hp+7sTecbqmQ3qdzFr7E7w7A+P/6h/foO5
 927Kyd/lMeX/u+Y6h5bJTolybfDsAV/NBtrxjKy04wcqNQyIHiHsjqwuI4y3DJtJd0ENvj
 nRlQSiOJsNMJjWH304bKU/285fJZ5pny/hMNxBJUngtvhi9nad4uqcEYlEwySqlQLWGgeO
 lBvDUFHsXNuSSomxHxaj7/t8MVPxuGUPFN3OJFSge3uANPJwD9xIP9oTWTtnuQmE+9sTT+
 3a+ZB9r1xymxJFS1n0M8yKSgbFzGC/zIjWqf4B1h69ujJWFOVIio1nt51E6//w==
ARC-Seal: i=1; s=dkim; d=freebsd.org; t=1667007923; a=rsa-sha256; cv=none;
 b=gqq9GLyMCHwZDoXJSN5KYBV/WCnRQq6ZpbXZGFrn5rUuqG6QWAiMsnppPPMOTj4kdHzJud
 /fG2CmgC9f3CBZxM5sWfBWZ5uu/LKHcrbUAvxFCM5fcLCBH1kHo9d5JBYBA22x6Njtk8Fi
 4ruJYMx+BnGEn7ToCa13lTzDWghJI5oaPVBLmsDrOLKbSh98wgrvOl0Dt/spE/OsbTxm7I
 apTym+8zJeQXDS9FleNQCW1MkKQerlDA2wIcDmmFKenzOBP7LJBAc3hTpy995LgRouEVUP
 EZACaAAuDfbQwUOi0+PXtuJh2Iy2P+5UZ7ti8SlAsCCSsLdnL6AQPfjRz2EG6A==
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

When we re-added if_wg to the tree, we changed directories in dev to
strip the if_ (we don't use this prefix for other interfaces'
directories). Adjust it here as a convenience, so that when we import
wireguard-tools to FreeBSD the path will just work as-is with our usual
build.

Signed-off-by: Kyle Evans <kevans@FreeBSD.org>
---
 src/ipc-freebsd.h                          | 2 +-
 src/uapi/freebsd/dev/{if_wg => wg}/if_wg.h | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename src/uapi/freebsd/dev/{if_wg => wg}/if_wg.h (100%)

diff --git a/src/ipc-freebsd.h b/src/ipc-freebsd.h
index 2c10c10..b5be15b 100644
--- a/src/ipc-freebsd.h
+++ b/src/ipc-freebsd.h
@@ -6,7 +6,7 @@
 
 #include <sys/nv.h>
 #include <sys/sockio.h>
-#include <dev/if_wg/if_wg.h>
+#include <dev/wg/if_wg.h>
 
 #define IPC_SUPPORTS_KERNEL_INTERFACE
 
diff --git a/src/uapi/freebsd/dev/if_wg/if_wg.h b/src/uapi/freebsd/dev/wg/if_wg.h
similarity index 100%
rename from src/uapi/freebsd/dev/if_wg/if_wg.h
rename to src/uapi/freebsd/dev/wg/if_wg.h
-- 
2.36.1

