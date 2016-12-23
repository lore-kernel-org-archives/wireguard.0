Return-Path: zdzichu@mother.pipebreaker.pl
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f63246a3
 for <wireguard@lists.zx2c4.com>;
 Fri, 23 Dec 2016 19:18:33 +0000 (UTC)
Received: from mother.pipebreaker.pl (185-6-29-55-rev.logitus.pl [185.6.29.55])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 147fb5aa
 for <wireguard@lists.zx2c4.com>;
 Fri, 23 Dec 2016 19:18:33 +0000 (UTC)
From: Tomasz Torcz <tomek@pipebreaker.pl>
To: wireguard@lists.zx2c4.com
Subject: [PATCH] rename 'bandwidth' to 'transfer' in output
Date: Fri, 23 Dec 2016 20:25:55 +0100
Message-Id: <20161223192555.34239-1-tomek@pipebreaker.pl>
Cc: Tomasz Torcz <tomek@pipebreaker.pl>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

  'bandwidth' is a measure of speed, but wg's output shows only
 total number of bytes transferred. Thus 'transfer' is a better label.
  For script-friendly output mode, both 'transfer' and 'bandwidth'
 are accepted (for backward compatibility) but only former is documented.
---
 src/tools/show.c | 6 +++---
 src/tools/wg.8   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/src/tools/show.c b/src/tools/show.c
index 7c32af9..de0717d 100644
--- a/src/tools/show.c
+++ b/src/tools/show.c
@@ -203,7 +203,7 @@ static char *bytes(uint64_t b)
 static const char *COMMAND_NAME = NULL;
 static void show_usage(void)
 {
-	fprintf(stderr, "Usage: %s %s { <interface> | all | interfaces } [public-key | private-key | preshared-key | listen-port | peers | endpoints | allowed-ips | latest-handshakes | bandwidth | persistent-keepalive]\n", PROG_NAME, COMMAND_NAME);
+	fprintf(stderr, "Usage: %s %s { <interface> | all | interfaces } [public-key | private-key | preshared-key | listen-port | peers | endpoints | allowed-ips | latest-handshakes | transfer | persistent-keepalive]\n", PROG_NAME, COMMAND_NAME);
 }
 
 static void pretty_print(struct wgdevice *device)
@@ -239,7 +239,7 @@ static void pretty_print(struct wgdevice *device)
 		if (peer->last_handshake_time.tv_sec)
 			terminal_printf("  " TERMINAL_BOLD "latest handshake" TERMINAL_RESET ": %s\n", ago(&peer->last_handshake_time));
 		if (peer->rx_bytes || peer->tx_bytes) {
-			terminal_printf("  " TERMINAL_BOLD "bandwidth" TERMINAL_RESET ": ");
+			terminal_printf("  " TERMINAL_BOLD "transfer" TERMINAL_RESET ": ");
 			terminal_printf("%s received, ", bytes(peer->rx_bytes));
 			terminal_printf("%s sent\n", bytes(peer->tx_bytes));
 		}
@@ -298,7 +298,7 @@ static bool ugly_print(struct wgdevice *device, const char *param, bool with_int
 				printf("%s\t", device->interface);
 			printf("%s\t%llu\n", key(peer->public_key), (unsigned long long)peer->last_handshake_time.tv_sec);
 		}
-	} else if (!strcmp(param, "bandwidth")) {
+	} else if (!strcmp(param, "transfer") || !strcmp(param, "bandwidth")) {
 		for_each_wgpeer(device, peer, i) {
 			if (with_interface)
 				printf("%s\t", device->interface);
diff --git a/src/tools/wg.8 b/src/tools/wg.8
index 1ec7ec4..18edba3 100644
--- a/src/tools/wg.8
+++ b/src/tools/wg.8
@@ -36,7 +36,7 @@ Sub-commands that take an INTERFACE must be passed a WireGuard interface.
 .SH COMMANDS
 
 .TP
-\fBshow\fP { \fI<interface>\fP | \fIall\fP | \fIinterfaces\fP } [\fIpublic-key\fP | \fIprivate-key\fP | \fIpreshared-key\fP | \fIlisten-port\fP | \fIpeers\fP | \fIendpoints\fP | \fIallowed-ips\fP | \fIlatest-handshakes\fP | \fIpersistent-keepalive\fP | \fIbandwidth\fP]
+\fBshow\fP { \fI<interface>\fP | \fIall\fP | \fIinterfaces\fP } [\fIpublic-key\fP | \fIprivate-key\fP | \fIpreshared-key\fP | \fIlisten-port\fP | \fIpeers\fP | \fIendpoints\fP | \fIallowed-ips\fP | \fIlatest-handshakes\fP | \fIpersistent-keepalive\fP | \fItransfer\fP]
 Shows current WireGuard configuration of specified \fI<interface>\fP.
 If no \fI<interface>\fP is specified, \fI<interface>\fP defaults to \fIall\fP.
 If \fIinterfaces\fP is specified, prints a list of all WireGuard interfaces,
-- 
2.9.3
