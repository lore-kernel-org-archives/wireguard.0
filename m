Return-Path: flokli@flokli.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 590fcc3e
 for <wireguard@lists.zx2c4.com>;
 Fri, 26 May 2017 08:32:27 +0000 (UTC)
Received: from zeus.flokli.de (mail.zeus.flokli.de [88.198.15.28])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b00afbc1
 for <wireguard@lists.zx2c4.com>;
 Fri, 26 May 2017 08:32:27 +0000 (UTC)
From: Florian Klink <flokli@flokli.de>
To: wireguard@lists.zx2c4.com
Subject: [PATCH] tools: add wireguard@.service
Date: Fri, 26 May 2017 10:44:23 +0200
Message-Id: <20170526084423.31088-1-flokli@flokli.de>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

If you simply want to create wireguard interfaces and configure them,
wg-quick might be too much, as it also configures Addresses, MTU and
adds routes. This unit file can be used in cases where you want to use
wg(8) to configure the wireguard interface, but do regular network
configuration on top of the link by something else (possibly not knowing
wireguard, like systemd-networkd or NetworkManager.

Signed-off-by: Florian Klink <flokli@flokli.de>
---
 src/tools/Makefile           |  3 ++-
 src/tools/wireguard@.service | 19 +++++++++++++++++++
 2 files changed, 21 insertions(+), 1 deletion(-)
 create mode 100644 src/tools/wireguard@.service

diff --git a/src/tools/Makefile b/src/tools/Makefile
index 2dd7f6a..5206832 100644
--- a/src/tools/Makefile
+++ b/src/tools/Makefile
@@ -51,6 +51,7 @@ clean:
 install: wg
 	@install -v -d "$(DESTDIR)$(BINDIR)" && install -m 0755 -v wg "$(DESTDIR)$(BINDIR)/wg"
 	@install -v -d "$(DESTDIR)$(MANDIR)/man8" && install -m 0644 -v wg.8 "$(DESTDIR)$(MANDIR)/man8/wg.8"
+	[ "$(WITH_SYSTEMDUNITS)" = "yes" ] && install -v -d "$(DESTDIR)$(SYSTEMDUNITDIR)" && install -m 0644 -v wireguard@.service "$(DESTDIR)$(SYSTEMDUNITDIR)/wireguard@.service"
 	@[ "$(WITH_BASHCOMPLETION)" = "yes" ] || exit 0; \
 	install -v -d "$(DESTDIR)$(BASHCOMPDIR)" && install -m 0644 -v completion/wg.bash-completion "$(DESTDIR)$(BASHCOMPDIR)/wg"
 	@[ "$(WITH_WGQUICK)" = "yes" ] || exit 0; \
@@ -60,7 +61,7 @@ install: wg
 	@[ "$(WITH_WGQUICK)" = "yes" -a "$(WITH_BASHCOMPLETION)" = "yes" ] || exit 0; \
 	install -m 0644 -v completion/wg-quick.bash-completion "$(DESTDIR)$(BASHCOMPDIR)/wg-quick"
 	@[ "$(WITH_WGQUICK)" = "yes" -a "$(WITH_SYSTEMDUNITS)" = "yes" ] || exit 0; \
-	install -v -d "$(DESTDIR)$(SYSTEMDUNITDIR)" && install -m 0644 -v wg-quick@.service "$(DESTDIR)$(SYSTEMDUNITDIR)/wg-quick@.service"
+	install -m 0644 -v wg-quick@.service "$(DESTDIR)$(SYSTEMDUNITDIR)/wg-quick@.service"
 
 check: clean
 	CFLAGS=-g scan-build --view --keep-going $(MAKE) wg
diff --git a/src/tools/wireguard@.service b/src/tools/wireguard@.service
new file mode 100644
index 0000000..b6d53bf
--- /dev/null
+++ b/src/tools/wireguard@.service
@@ -0,0 +1,19 @@
+[Unit]
+Description=WireGuard via wg(8) for %I
+After=network-online.target
+Wants=network-online.target
+Documentation=man:wg(8)
+Documentation=https://www.wireguard.io/
+Documentation=https://www.wireguard.io/quickstart/
+Documentation=https://git.zx2c4.com/WireGuard/about/src/tools/wg.8
+
+[Service]
+Type=oneshot
+RemainAfterExit=yes
+ExecStartPre=/sbin/ip link add dev %i type wireguard
+ExecStart=/usr/bin/wg setconf %i /etc/wireguard/%i.conf
+ExecStop=/sbin/ip link del %i
+ExecReload=/usr/bin/wg setconf %i /etc/wireguard/%i.conf
+
+[Install]
+WantedBy=multi-user.target
-- 
2.13.0
