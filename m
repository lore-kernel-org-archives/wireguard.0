Return-Path: gregkh@linuxfoundation.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a4dc12cb
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Nov 2017 15:18:13 +0000 (UTC)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org
 [140.211.169.12])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6631b97d
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Nov 2017 15:18:12 +0000 (UTC)
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jason@zx2c4.com
Subject: [PATCH 6/6] src/uapi/wireguard: add SPDX tag
Date: Thu, 30 Nov 2017 15:23:55 +0000
Message-Id: <20171130152355.25387-7-gregkh@linuxfoundation.org>
In-Reply-To: <20171130152355.25387-1-gregkh@linuxfoundation.org>
References: <20171130152355.25387-1-gregkh@linuxfoundation.org>
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

It's good to have SPDX identifiers in all files as the Linux kernel
developers are working to add these identifiers to all files.

Update the wireguard.h file with the currently convential GPL2+userspace
exception tag.

Note, this is a different license than what the text itself says in the
file, if you wish to stick with the MIT license for this file, that's
fine, but then it should be listed as:
	((GPL-2.0 WITH Linux-syscall-note) OR MIT)

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 src/uapi/wireguard.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/src/uapi/wireguard.h b/src/uapi/wireguard.h
index 411d5a462f0e..37e2e7bf1402 100644
--- a/src/uapi/wireguard.h
+++ b/src/uapi/wireguard.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
 /* Copyright (C) 2015-2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
  *
  * The following MIT license applies only to this file:
-- 
2.15.1
