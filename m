Return-Path: linux-wireguard@vittgam.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2b5fdd12
 for <wireguard@lists.zx2c4.com>;
 Sat, 10 Dec 2016 16:25:21 +0000 (UTC)
Received: from mail.vittgam.net (server1.vittgam.net [213.239.197.142])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 34b95253
 for <wireguard@lists.zx2c4.com>;
 Sat, 10 Dec 2016 16:25:21 +0000 (UTC)
Date: Sat, 10 Dec 2016 17:31:08 +0100
Message-Id: <201612101631.uBAGV8fe049290@mail.vittgam.net>
From: "Vittorio Gambaletta (VittGam)" <linux-wireguard@vittgam.net>
To: wireguard@lists.zx2c4.com
Subject: [PATCH] contrib: Set addrgenmode to none for WireGuard interfaces.
Content-Type: text/plain; charset=UTF-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This stops addrconf from adding a temporary IPv6 address to the
interface when it is brought up.

I'm not sure if this can be done in a clean way from inside the
kernel without touching addrconf itself; but for now, let's fix this
from userspace.

Signed-off-by: Vittorio Gambaletta <linux-wireguard@vittgam.net>
---
 contrib/examples/ncat-client-server/client.sh | 1 +
 contrib/examples/ncat-client-server/server.sh | 1 +
 contrib/examples/synergy/synergy-client.sh    | 1 +
 contrib/examples/systemd/wgserver.service     | 1 +
 contrib/examples/wg-config/wg-config          | 1 +
 5 files changed, 5 insertions(+)

diff --git a/contrib/examples/ncat-client-server/client.sh b/contrib/examples/ncat-client-server/client.sh
index e59d9ce..a4e0008 100755
--- a/contrib/examples/ncat-client-server/client.sh
+++ b/contrib/examples/ncat-client-server/client.sh
@@ -12,6 +12,7 @@ IFS=: read -r status server_pubkey server_port internal_ip <&3
 [[ $status == OK ]]
 ip link del dev wg0 2>/dev/null || true
 ip link add dev wg0 type wireguard
+ip link set addrgenmode none dev wg0
 wg set wg0 private-key /tmp/wg_private_key peer "$server_pubkey" allowed-ips 0.0.0.0/0 endpoint "demo.wireguard.io:$server_port" persistent-keepalive 25
 ip address add "$internal_ip"/24 dev wg0
 ip link set up dev wg0
diff --git a/contrib/examples/ncat-client-server/server.sh b/contrib/examples/ncat-client-server/server.sh
index 2680afd..825b015 100755
--- a/contrib/examples/ncat-client-server/server.sh
+++ b/contrib/examples/ncat-client-server/server.sh
@@ -6,6 +6,7 @@ if [[ -z $NCAT_REMOTE_ADDR ]]; then
 	ip link del dev wg0 2>/dev/null
 	set -e
 	ip link add dev wg0 type wireguard
+	ip link set addrgenmode none dev wg0
 	ip address add 192.168.4.1/24 dev wg0
 	wg set wg0 private-key <(wg genkey) listen-port 12912
 	ip link set up dev wg0
diff --git a/contrib/examples/synergy/synergy-client.sh b/contrib/examples/synergy/synergy-client.sh
index 07b32d3..f9d9e70 100755
--- a/contrib/examples/synergy/synergy-client.sh
+++ b/contrib/examples/synergy/synergy-client.sh
@@ -6,6 +6,7 @@ set -ex
 if [[ $UID == 0 ]]; then
 	ip link del dev synergy || true
 	ip link add dev synergy type wireguard
+	ip link set addrgenmode none dev synergy
 	ip address add 10.193.125.39/32 peer 10.193.125.38/32 dev synergy
 	wg set synergy \
 		listen-port 29184 \
diff --git a/contrib/examples/systemd/wgserver.service b/contrib/examples/systemd/wgserver.service
index dfce1e9..dcf1ca3 100644
--- a/contrib/examples/systemd/wgserver.service
+++ b/contrib/examples/systemd/wgserver.service
@@ -5,6 +5,7 @@ Description=WireGuard Server
 Type=oneshot
 RemainAfterExit=yes
 ExecStart=/bin/ip link add dev wgserver type wireguard
+ExecStart=/bin/ip link set addrgenmode none dev wgserver
 ExecStart=/bin/ip address add 192.168.177.1/24 dev wgserver
 ExecStart=/usr/bin/wg setconf wgserver /etc/wireguard-server.conf
 ExecStart=/bin/ip link set up dev wgserver
diff --git a/contrib/examples/wg-config/wg-config b/contrib/examples/wg-config/wg-config
index eaa45f2..9bd9800 100755
--- a/contrib/examples/wg-config/wg-config
+++ b/contrib/examples/wg-config/wg-config
@@ -21,6 +21,7 @@ unwind() {
 add_if() {
 	ip link delete dev "$INTERFACE" 2>/dev/null || true
 	cmd ip link add "$INTERFACE" type wireguard
+	cmd ip link set addrgenmode none dev "$INTERFACE"
 }
 
 del_if() {
-- 
2.10.0
