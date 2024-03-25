Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD439C54E64
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 25 Mar 2024 17:40:14 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1dfa2e2d;
	Mon, 25 Mar 2024 17:37:26 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2abb8cf6
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 25 Mar 2024 17:37:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 149F0CE1C05;
 Mon, 25 Mar 2024 17:37:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 288C2C433C7;
 Mon, 25 Mar 2024 17:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711388240;
 bh=zToG1hFCeQB1XgiB0v2xJ0mvYREmFeQmr+zThIKsi+w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Oar/HiK5RbSKemfSl3gFGSQeldZEfPqq5jFV289bSoyGqBwivqrQDpiV8V4WL6ZH5
 5FZOkP1xUUMUwS7FG56uWNGyuaLE4A3cc7IILcMRxy1W119avRd/AM6GguHQIzTuaw
 Uov7t9OuD60fdqtODQ0xEwryZzQDsRmzPHUTxGRQhATj7vFf97m18i298zHVGwc1cm
 jQtcLb2J/RGryhhIox43Tnk4Y3qFDK81WF81UavGHFkqRL8nG9oJ8xDywF7FHmo95E
 9QdMrsvh/d8+7WgOaST6eP6u2QOW4fSmRPqvkOL8LrMrr4CB2qdhG8ZMwJyERxilF9
 qhVDrnNy1R0VQ==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
 dw@davidwei.uk, jiri@resnulli.us, andriy.shevchenko@linux.intel.com,
 Jakub Kicinski <kuba@kernel.org>, Sven Eckelmann <sven@narfation.org>,
 Jason@zx2c4.com, mareklindner@neomailbox.ch, sw@simonwunderlich.de,
 a@unstable.cc, pshelar@ovn.org, wireguard@lists.zx2c4.com,
 dev@openvswitch.org
Subject: [PATCH net-next v2 3/3] genetlink: remove linux/genetlink.h
Date: Mon, 25 Mar 2024 10:37:16 -0700
Message-ID: <20240325173716.2390605-4-kuba@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240325173716.2390605-1-kuba@kernel.org>
References: <20240325173716.2390605-1-kuba@kernel.org>
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

genetlink.h is a shell of what used to be a combined uAPI
and kernel header over a decade ago. It has fewer than
10 lines of code. Merge it into net/genetlink.h.
In some ways it'd be better to keep the combined header
under linux/ but it would make looking through git history
harder.

Acked-by: Sven Eckelmann <sven@narfation.org>
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
v2:
 - remove extern
 - include linux/net.h
 - improve the comment, not "all" requests are serialized

CC: Jason@zx2c4.com
CC: mareklindner@neomailbox.ch
CC: sw@simonwunderlich.de
CC: a@unstable.cc
CC: pshelar@ovn.org
CC: andriy.shevchenko@linux.intel.com
CC: wireguard@lists.zx2c4.com
CC: dev@openvswitch.org
---
 drivers/net/wireguard/main.c      |  2 +-
 include/linux/genetlink.h         | 14 --------------
 include/linux/genl_magic_struct.h |  2 +-
 include/net/genetlink.h           | 10 +++++++++-
 net/batman-adv/main.c             |  2 +-
 net/batman-adv/netlink.c          |  1 -
 net/openvswitch/datapath.c        |  1 -
 7 files changed, 12 insertions(+), 20 deletions(-)
 delete mode 100644 include/linux/genetlink.h

diff --git a/drivers/net/wireguard/main.c b/drivers/net/wireguard/main.c
index ee4da9ab8013..a00671b58701 100644
--- a/drivers/net/wireguard/main.c
+++ b/drivers/net/wireguard/main.c
@@ -14,7 +14,7 @@
 
 #include <linux/init.h>
 #include <linux/module.h>
-#include <linux/genetlink.h>
+#include <net/genetlink.h>
 #include <net/rtnetlink.h>
 
 static int __init wg_mod_init(void)
diff --git a/include/linux/genetlink.h b/include/linux/genetlink.h
deleted file mode 100644
index 9dbd7ba9b858..000000000000
--- a/include/linux/genetlink.h
+++ /dev/null
@@ -1,14 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __LINUX_GENERIC_NETLINK_H
-#define __LINUX_GENERIC_NETLINK_H
-
-#include <uapi/linux/genetlink.h>
-
-/* All generic netlink requests are serialized by a global lock.  */
-extern void genl_lock(void);
-extern void genl_unlock(void);
-
-#define MODULE_ALIAS_GENL_FAMILY(family)\
- MODULE_ALIAS_NET_PF_PROTO_NAME(PF_NETLINK, NETLINK_GENERIC, "-family-" family)
-
-#endif	/* __LINUX_GENERIC_NETLINK_H */
diff --git a/include/linux/genl_magic_struct.h b/include/linux/genl_magic_struct.h
index a419d93789ff..621b87a87d74 100644
--- a/include/linux/genl_magic_struct.h
+++ b/include/linux/genl_magic_struct.h
@@ -15,8 +15,8 @@
 #endif
 
 #include <linux/args.h>
-#include <linux/genetlink.h>
 #include <linux/types.h>
+#include <net/genetlink.h>
 
 extern int CONCATENATE(GENL_MAGIC_FAMILY, _genl_register)(void);
 extern void CONCATENATE(GENL_MAGIC_FAMILY, _genl_unregister)(void);
diff --git a/include/net/genetlink.h b/include/net/genetlink.h
index 9ece6e5a3ea8..7648dd6b8754 100644
--- a/include/net/genetlink.h
+++ b/include/net/genetlink.h
@@ -2,12 +2,20 @@
 #ifndef __NET_GENERIC_NETLINK_H
 #define __NET_GENERIC_NETLINK_H
 
-#include <linux/genetlink.h>
+#include <linux/net.h>
 #include <net/netlink.h>
 #include <net/net_namespace.h>
+#include <uapi/linux/genetlink.h>
 
 #define GENLMSG_DEFAULT_SIZE (NLMSG_DEFAULT_SIZE - GENL_HDRLEN)
 
+/* Non-parallel generic netlink requests are serialized by a global lock.  */
+void genl_lock(void);
+void genl_unlock(void);
+
+#define MODULE_ALIAS_GENL_FAMILY(family) \
+ MODULE_ALIAS_NET_PF_PROTO_NAME(PF_NETLINK, NETLINK_GENERIC, "-family-" family)
+
 /* Binding to multicast group requires %CAP_NET_ADMIN */
 #define GENL_MCAST_CAP_NET_ADMIN	BIT(0)
 /* Binding to multicast group requires %CAP_SYS_ADMIN */
diff --git a/net/batman-adv/main.c b/net/batman-adv/main.c
index 75119f1ffccc..8e0f44c71696 100644
--- a/net/batman-adv/main.c
+++ b/net/batman-adv/main.c
@@ -14,7 +14,6 @@
 #include <linux/crc32c.h>
 #include <linux/device.h>
 #include <linux/errno.h>
-#include <linux/genetlink.h>
 #include <linux/gfp.h>
 #include <linux/if_ether.h>
 #include <linux/if_vlan.h>
@@ -38,6 +37,7 @@
 #include <linux/string.h>
 #include <linux/workqueue.h>
 #include <net/dsfield.h>
+#include <net/genetlink.h>
 #include <net/rtnetlink.h>
 #include <uapi/linux/batadv_packet.h>
 #include <uapi/linux/batman_adv.h>
diff --git a/net/batman-adv/netlink.c b/net/batman-adv/netlink.c
index 0954757f0b8b..9362cd9d6f3d 100644
--- a/net/batman-adv/netlink.c
+++ b/net/batman-adv/netlink.c
@@ -15,7 +15,6 @@
 #include <linux/cache.h>
 #include <linux/err.h>
 #include <linux/errno.h>
-#include <linux/genetlink.h>
 #include <linux/gfp.h>
 #include <linux/if_ether.h>
 #include <linux/if_vlan.h>
diff --git a/net/openvswitch/datapath.c b/net/openvswitch/datapath.c
index 11c69415c605..99d72543abd3 100644
--- a/net/openvswitch/datapath.c
+++ b/net/openvswitch/datapath.c
@@ -15,7 +15,6 @@
 #include <linux/delay.h>
 #include <linux/time.h>
 #include <linux/etherdevice.h>
-#include <linux/genetlink.h>
 #include <linux/kernel.h>
 #include <linux/kthread.h>
 #include <linux/mutex.h>
-- 
2.44.0

