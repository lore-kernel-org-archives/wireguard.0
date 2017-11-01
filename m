Return-Path: gregkh@linuxfoundation.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1558f354
 for <wireguard@lists.zx2c4.com>; Wed, 1 Nov 2017 09:44:48 +0000 (UTC)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org
 [140.211.169.12])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 346f0c85
 for <wireguard@lists.zx2c4.com>; Wed, 1 Nov 2017 09:44:48 +0000 (UTC)
Date: Wed, 1 Nov 2017 10:47:26 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [PATCH] Kconfig: remove trailing whitespace
Message-ID: <20171101094726.GA22004@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Git complains when applying this Kconfig file as part of a patch to the
kernel tree, so drop the trailing whitespace.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

diff --git a/src/Kconfig b/src/Kconfig
index 811d1e230531..4385995d61c5 100644
--- a/src/Kconfig
+++ b/src/Kconfig
@@ -26,5 +26,5 @@ config WIREGUARD_DEBUG
 	  that occur for a WireGuard interface. It will also perform some
 	  extra validation checks and unit tests at various points. This is
 	  only useful for debugging.
-	  
+
 	  Say N here unless you know what you're doing.
