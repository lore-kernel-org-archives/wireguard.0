Return-Path: me.kalin@gmail.com
Received: from mail-yw0-f170.google.com (mail-yw0-f170.google.com
 [209.85.161.170])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0f404d0c
 for <wireguard@lists.zx2c4.com>;
 Mon, 14 Nov 2016 14:31:57 +0000 (UTC)
Received: by mail-yw0-f170.google.com with SMTP id t125so60267542ywc.1
 for <wireguard@lists.zx2c4.com>; Mon, 14 Nov 2016 06:34:33 -0800 (PST)
MIME-Version: 1.0
From: Kalin KOZHUHAROV <me.kalin@gmail.com>
Date: Mon, 14 Nov 2016 23:34:11 +0900
Message-ID: <CAKXLc7fZYEejEu0FmATWX6_8aAPRUxkPL429UK-39TGsFF4aUA@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: [WireGuard] RFE: A notion of VERSION (was: Debugging AllowedIps)
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Jason,

On Mon, Nov 14, 2016 at 11:28 AM, John Huttley <john@mib-infotech.co.nz> wrote:
> RFE: when the module loads and prints its test at startup, please print its
> version and compile flags as well.
>

I second that! There is not (yet) a notion of VERSION in the code,
better not wait till 1.0 to put it :-)

One can use the commit from git, but that assumes always build from git sources.
Examples:
GIT_COMMIT := $(shell git log -n 1 --pretty=format:"%h" HEAD 2>/dev/null)
GIT_TAG := $(shell git tag --points HEAD 2>/dev/null)

( NOTE: GIT_TAG is only available if we have a tag defined at current HEAD, e.g.

$ git checkout bebcae1
HEAD is now at bebcae1... chacha20poly1305: cleanup magic constants

$ git tag --points HEAD
experimental-0.0.20161105
)

I'd rather see a VERSION.txt file, or a `VERSION := 0.0.something`
inside Makefile.

Or even directly hardcoded in main.c:

diff --git a/src/main.c b/src/main.c
index e381d09..4991812 100644
--- a/src/main.c
+++ b/src/main.c
@@ -13,6 +13,9 @@
 #include <linux/module.h>
 #include <net/rtnetlink.h>

+#define DRV_VERSION "0.0.20161105"
+const char wireguard_driver_version[] = DRV_VERSION;
+
 static int __init mod_init(void)
 {
        int ret = 0;
@@ -29,25 +32,31 @@ static int __init mod_init(void)
        chacha20poly1305_init();
        noise_init();

+#ifdef CONFIG_WIREGUARD_PARALLEL
        ret = packet_init_data_caches();
        if (ret < 0)
                return ret;
+#endif

        ret = device_init();
        if (ret < 0) {
+#ifdef CONFIG_WIREGUARD_PARALLEL
                packet_deinit_data_caches();
+#endif
                return ret;
        }

-       pr_info("WireGuard loaded. See www.wireguard.io for information.\n");
-       pr_info("(C) Copyright 2015-2016 Jason A. Donenfeld
<Jason@zx2c4.com>. All Rights Reserved.\n");
+       pr_info("WireGuard %s loaded. See www.wireguard.io for
information.\n", wireguard_driver_version);
+       pr_info("Copyright (c) 2015-2016 Jason A. Donenfeld
<Jason@zx2c4.com>. All rights reserved.\n");
        return ret;
 }

 static void __exit mod_exit(void)
 {
        device_uninit();
+#ifdef CONFIG_WIREGUARD_PARALLEL
        packet_deinit_data_caches();
+#endif
        pr_debug("WireGuard has been unloaded\n");
 }

@@ -57,3 +66,4 @@ MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("Simple, secure, and speedy VPN tunnel");
 MODULE_AUTHOR("Jason A. Donenfeld <Jason@zx2c4.com>");
 MODULE_ALIAS_RTNL_LINK(KBUILD_MODNAME);
+MODULE_VERSION(DRV_VERSION);


Not sure if const char casting is needed (was copying from e1000e driver) ;-/

I changed slightly the Copyright pr_info, actually I guess you should
remove "All  rights reserved." altogether from it (but keep it in the
source).

Cheers,
Kalin.
