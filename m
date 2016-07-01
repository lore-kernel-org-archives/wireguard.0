Return-Path: dkg@fifthhorseman.net
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8cd56fc5
 for <wireguard@lists.zx2c4.com>; Fri, 1 Jul 2016 12:37:33 +0000 (UTC)
Received: from fifthhorseman.net (unknown [38.109.115.130])
 by che.mayfirst.org (Postfix) with ESMTPSA id E5278F98B
 for <wireguard@lists.zx2c4.com>; Fri,  1 Jul 2016 08:40:29 -0400 (EDT)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Date: Fri,  1 Jul 2016 08:40:28 -0400
Message-Id: <1467376828-10126-1-git-send-email-dkg@fifthhorseman.net>
Subject: [WireGuard] [PATCH] use /run not /tmp in example/test code
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

/run is both ephemeral and typically only writable by root, while /tmp
is often persistent and world-writable.  This change avoids possible
symlink attacks and makes it less likely for generated keys to hit the
disks.

These changes are for example/test code, so this isn't a security
vulnerability, but it's better for the example/test code to use good
form, since inevitably someone will crib their system config scripts
from these bits.
---
 contrib/client-server-example/client.sh | 7 ++++---
 contrib/stress-testing/self-send.sh     | 8 +++++---
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/contrib/client-server-example/client.sh b/contrib/client-server-example/client.sh
index fbae46a..97b444d 100755
--- a/contrib/client-server-example/client.sh
+++ b/contrib/client-server-example/client.sh
@@ -2,14 +2,15 @@
 set -e
 [[ $UID == 0 ]] || { echo "You must be root to run this."; exit 1; }
 umask 077
-trap 'rm -f /tmp/wg_private_key' EXIT INT TERM
+mkdir -p -m 0700 /run/wireguard
+trap 'rm -f /run/wireguard/private_key' EXIT INT TERM
 exec 3<>/dev/tcp/demo.wireguard.io/42912
-wg genkey | tee /tmp/wg_private_key | wg pubkey >&3
+wg genkey | tee /run/wireguard/private_key | wg pubkey >&3
 IFS=: read -r status server_pubkey server_port internal_ip <&3
 [[ $status == OK ]]
 ip link del dev wg0 2>/dev/null || true
 ip link add dev wg0 type wireguard
-wg set wg0 private-key /tmp/wg_private_key peer "$server_pubkey" allowed-ips 0.0.0.0/0 endpoint "demo.wireguard.io:$server_port"
+wg set wg0 private-key /run/wireguard/private_key peer "$server_pubkey" allowed-ips 0.0.0.0/0 endpoint "demo.wireguard.io:$server_port"
 ip address add "$internal_ip"/24 dev wg0
 ip link set up dev wg0
 if [ "$1" == "default-route" ]; then
diff --git a/contrib/stress-testing/self-send.sh b/contrib/stress-testing/self-send.sh
index eb7947b..4599b49 100755
--- a/contrib/stress-testing/self-send.sh
+++ b/contrib/stress-testing/self-send.sh
@@ -4,6 +4,8 @@ set -e
 PRIVATE_KEYS=("")
 PUBLIC_KEYS=("")
 
+mkdir -p -m 0700 /run/wireguard
+
 resetwg() {
 	for i in {1..64}; do
 		ip link delete dev wg${i} 2>/dev/null >/dev/null || true
@@ -31,12 +33,12 @@ for i in {1..64}; do
 		echo "AllowedIPs = 192.168.8.${j}/32"
 		echo "Endpoint = 127.0.0.1:$(( $j + 31222 ))"
 	  done
-	} > "/tmp/deviceload.conf"
+	} > "/run/wireguard/deviceload.conf"
 
 	ip link add dev wg${i} type wireguard
-	wg setconf wg${i} "/tmp/deviceload.conf"
+	wg setconf wg${i} "/run/wireguard/deviceload.conf"
 	ip link set up dev wg${i}
-	rm "/tmp/deviceload.conf"
+	rm "/run/wireguard/deviceload.conf"
 done
 
 ip address add dev wg1 192.168.8.1/24
-- 
2.8.1
