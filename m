Return-Path: eworm@leda.eworm.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1377f82f
 for <wireguard@lists.zx2c4.com>; Thu, 8 Dec 2016 09:06:59 +0000 (UTC)
Received: from mx.mylinuxtime.de (mx.mylinuxtime.de [148.251.109.235])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 684a1236
 for <wireguard@lists.zx2c4.com>; Thu, 8 Dec 2016 09:06:59 +0000 (UTC)
From: Christian Hesse <list@eworm.de>
To: wireguard@lists.zx2c4.com
Subject: [PATCH 1/1] make the systemd unit example more general
Date: Thu,  8 Dec 2016 10:12:14 +0100
Message-Id: <20161208091214.15449-1-list@eworm.de>
Cc: Christian Hesse <mail@eworm.de>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

From: Christian Hesse <mail@eworm.de>

Signed-off-by: Christian Hesse <mail@eworm.de>
---
 contrib/examples/systemd/README            |  5 +++--
 contrib/examples/systemd/example.address   |  1 +
 contrib/examples/systemd/example.conf      |  8 ++++++++
 contrib/examples/systemd/wgserver.service  | 15 ---------------
 contrib/examples/systemd/wgserver@.service | 15 +++++++++++++++
 5 files changed, 27 insertions(+), 17 deletions(-)
 create mode 100644 contrib/examples/systemd/example.address
 create mode 100644 contrib/examples/systemd/example.conf
 delete mode 100644 contrib/examples/systemd/wgserver.service
 create mode 100644 contrib/examples/systemd/wgserver@.service

diff --git a/contrib/examples/systemd/README b/contrib/examples/systemd/README
index 1ef51aa..b8f4455 100644
--- a/contrib/examples/systemd/README
+++ b/contrib/examples/systemd/README
@@ -1,5 +1,6 @@
 Until WireGuard receives full integration to the various network
 management utilities, there are a number of ways of setting up
 a WireGuard tunnel at boot time. This systemd unit file is one
-such way of doing things. Probably it should be tweaked before
-using.
+such way of doing things.
+Configuration files example.address and example.conf are expected
+in /etc/wireguard/, then start service wgserver@example.service.
diff --git a/contrib/examples/systemd/example.address b/contrib/examples/systemd/example.address
new file mode 100644
index 0000000..983bb76
--- /dev/null
+++ b/contrib/examples/systemd/example.address
@@ -0,0 +1 @@
+ADDRESS=10.10.10.1/24
diff --git a/contrib/examples/systemd/example.conf b/contrib/examples/systemd/example.conf
new file mode 100644
index 0000000..1cfc5ee
--- /dev/null
+++ b/contrib/examples/systemd/example.conf
@@ -0,0 +1,8 @@
+[Interface]
+PrivateKey = gI6EdUSYvn8ugXOt8QQD6Yc+JyiZxIhp3GInSWRfWGE=
+ListenPort = 21841
+
+[Peer]
+PublicKey = HIgo9xNzJMWLKASShiTqIybxZ0U3wGLiUeJ1PKf8ykw=
+Endpoint = 192.95.5.69:41414
+AllowedIPs = 10.10.10.0/24
diff --git a/contrib/examples/systemd/wgserver.service b/contrib/examples/systemd/wgserver.service
deleted file mode 100644
index dfce1e9..0000000
--- a/contrib/examples/systemd/wgserver.service
+++ /dev/null
@@ -1,15 +0,0 @@
-[Unit]
-Description=WireGuard Server
-
-[Service]
-Type=oneshot
-RemainAfterExit=yes
-ExecStart=/bin/ip link add dev wgserver type wireguard
-ExecStart=/bin/ip address add 192.168.177.1/24 dev wgserver
-ExecStart=/usr/bin/wg setconf wgserver /etc/wireguard-server.conf
-ExecStart=/bin/ip link set up dev wgserver
-ExecStop=/bin/sh -c 'umask 077; /usr/bin/wg showconf wgserver > /etc/wireguard-server.conf.tmp && mv /etc/wireguard-server.conf.tmp /etc/wireguard-server.conf'
-ExecStop=/bin/ip link del dev wgserver
-
-[Install]
-WantedBy=multi-user.target
diff --git a/contrib/examples/systemd/wgserver@.service b/contrib/examples/systemd/wgserver@.service
new file mode 100644
index 0000000..721ce88
--- /dev/null
+++ b/contrib/examples/systemd/wgserver@.service
@@ -0,0 +1,15 @@
+[Unit]
+Description=WireGuard Server %I
+
+[Service]
+Type=oneshot
+RemainAfterExit=yes
+EnvironmentFile=/etc/wireguard/%i.address
+ExecStart=/bin/ip link add dev %i type wireguard
+ExecStart=/bin/ip address add $ADDRESS dev %i
+ExecStart=/usr/bin/wg setconf %i /etc/wireguard/%i.conf
+ExecStart=/bin/ip link set up dev %i
+ExecStop=/bin/ip link del dev %i
+
+[Install]
+WantedBy=multi-user.target
-- 
2.10.2
