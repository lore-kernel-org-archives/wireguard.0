Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D47DD10F5A
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Nov 2024 03:47:18 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eea43017;
	Mon, 18 Nov 2024 01:39:12 +0000 (UTC)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [2607:f8b0:4864:20::62e])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id dc534530
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 7 Nov 2024 02:54:54 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-20c8b557f91so5148255ad.2
 for <wireguard@lists.zx2c4.com>; Wed, 06 Nov 2024 18:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730948092; x=1731552892; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kXUgljRAh0gr52NTMyiqOJGETbvRr4tGYCjS3T7hbU4=;
 b=lksITuQnEAzdFKdhS0Q8TfNRi+UJjO/BTmj+tRwbmhmOBGvGYSEZRROvEk6xVdHGe7
 ew4paR5bWDM3DvCJyysUlHuJvShzsoA897T5de5MSJ44t3EFr8QccfpbjIPtXDmWuHIX
 RJ7NweTg0+UP4R0rvnP+6F28CKuIZxWGpYVzfhlSMtoscxPR0lI5Hc3YC/uVNDoZxkT3
 FWgZ5R5pXLERGgxkj5CwOwv9CwlwZD8XXEKzevsZy9kGaDU02roxoMYB6GLSk82la4Pa
 CahjeoEypGYVvUgl7RtJq16cIFtR3E5fBuxYY7k23eyzcQj1I409KGWqknxjur0IFYLD
 4gDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730948092; x=1731552892;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kXUgljRAh0gr52NTMyiqOJGETbvRr4tGYCjS3T7hbU4=;
 b=YoU0ssINMyaSEl2jQ9SEnb5z7DduKpbsGDLf9fP7F9NFq1RsgKev8lXIWEsTZr6y6J
 Im57e9aJTXIjcreJUyTb2v9YlRa7sLA7MuIOzh1axEmvJEzf+LMuRyWxbHAPPEqQ2Wvq
 aTbsK0sKYMz3gMNh1rwCKXyLco5JDjv2CRrSbtBEisFD3k+dyWXy+MvJJgdps1LsRCPh
 UCcCTmhId8Pq4vD/qX8+FDGdXimzCOSnYIWvpvmUpEeE8X5Xwec3Sp23v1kdPYeaAlD/
 kUjIaDAtG++UMZOyrQUnt4zj4k33A8tRsPq+0pl7juwsRuH8N1EDLicK/q1nAWwVsy7V
 ac7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWI/Cua77oHBF2ZfNF4/rLYvWjjA/jKYa+nJ4rGsqivblk0j6aoZYs1uZ/ttpPdezjeRWQlDkA4Tr0=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YwRhvdgvnDbEq5XWLMEO5ysv6XD0VTToDv6tGtd3Gi0X0bcJ2hc
 /DkRvTPIoxTuQ7ZKnBbo4OyDozeVHsZDFDY4rzteRQpysXYcecDI
X-Google-Smtp-Source: AGHT+IHvh3IYq+Pk+cmQrRzRR2//8ZHBrqmgQAH00s2k4zSSPfdKFWQy6LEZZKd5gwHxfEhFKXPnUA==
X-Received: by 2002:a17:903:189:b0:20f:c225:f28c with SMTP id
 d9443c01a7336-210c6c9417amr568555575ad.52.1730948092394; 
 Wed, 06 Nov 2024 18:54:52 -0800 (PST)
Received: from fedora.dns.podman ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21177de041dsm1910365ad.103.2024.11.06.18.54.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2024 18:54:51 -0800 (PST)
From: Hangbin Liu <liuhangbin@gmail.com>
To: netdev@vger.kernel.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Shuah Khan <shuah@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Florian Westphal <fw@strlen.de>,
 Phil Sutter <phil@nwl.cc>, wireguard@lists.zx2c4.com,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 Hangbin Liu <liuhangbin@gmail.com>
Subject: [PATCH net-next] selftests: wireguards: use nft by default
Date: Thu,  7 Nov 2024 02:54:38 +0000
Message-ID: <20241107025438.3766-1-liuhangbin@gmail.com>
X-Mailer: git-send-email 2.46.0
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

Use nft by default if it's supported, as nft is the replacement for iptables,
which is used by default in some releases. Additionally, iptables is dropped
in some releases.

Signed-off-by: Hangbin Liu <liuhangbin@gmail.com>
---
CC nft developers to see if there are any easier configurations,
as I'm not very familiar with nft commands.
---
 tools/testing/selftests/wireguard/netns.sh | 63 ++++++++++++++++++----
 1 file changed, 53 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/wireguard/netns.sh b/tools/testing/selftests/wireguard/netns.sh
index 405ff262ca93..4e29c1a7003c 100755
--- a/tools/testing/selftests/wireguard/netns.sh
+++ b/tools/testing/selftests/wireguard/netns.sh
@@ -44,6 +44,7 @@ sleep() { read -t "$1" -N 1 || true; }
 waitiperf() { pretty "${1//*-}" "wait for iperf:${3:-5201} pid $2"; while [[ $(ss -N "$1" -tlpH "sport = ${3:-5201}") != *\"iperf3\",pid=$2,fd=* ]]; do sleep 0.1; done; }
 waitncatudp() { pretty "${1//*-}" "wait for udp:1111 pid $2"; while [[ $(ss -N "$1" -ulpH 'sport = 1111') != *\"ncat\",pid=$2,fd=* ]]; do sleep 0.1; done; }
 waitiface() { pretty "${1//*-}" "wait for $2 to come up"; ip netns exec "$1" bash -c "while [[ \$(< \"/sys/class/net/$2/operstate\") != up ]]; do read -t .1 -N 0 || true; done;"; }
+use_nft() { nft --version &> /dev/null; }
 
 cleanup() {
 	set +e
@@ -196,13 +197,23 @@ ip1 link set wg0 mtu 1300
 ip2 link set wg0 mtu 1300
 n1 wg set wg0 peer "$pub2" endpoint 127.0.0.1:2
 n2 wg set wg0 peer "$pub1" endpoint 127.0.0.1:1
-n0 iptables -A INPUT -m length --length 1360 -j DROP
+if use_nft; then
+	n0 nft add table inet filter
+	n0 nft add chain inet filter INPUT { type filter hook input priority filter \; policy accept \; }
+	n0 nft add rule inet filter INPUT meta length 1360 counter drop
+else
+	n0 iptables -A INPUT -m length --length 1360 -j DROP
+fi
 n1 ip route add 192.168.241.2/32 dev wg0 mtu 1299
 n2 ip route add 192.168.241.1/32 dev wg0 mtu 1299
 n2 ping -c 1 -W 1 -s 1269 192.168.241.1
 n2 ip route delete 192.168.241.1/32 dev wg0 mtu 1299
 n1 ip route delete 192.168.241.2/32 dev wg0 mtu 1299
-n0 iptables -F INPUT
+if use_nft; then
+	n0 nft delete table inet filter
+else
+	n0 iptables -F INPUT
+fi
 
 ip1 link set wg0 mtu $orig_mtu
 ip2 link set wg0 mtu $orig_mtu
@@ -334,7 +345,13 @@ waitiface $netns2 veths
 n0 bash -c 'printf 1 > /proc/sys/net/ipv4/ip_forward'
 n0 bash -c 'printf 2 > /proc/sys/net/netfilter/nf_conntrack_udp_timeout'
 n0 bash -c 'printf 2 > /proc/sys/net/netfilter/nf_conntrack_udp_timeout_stream'
-n0 iptables -t nat -A POSTROUTING -s 192.168.1.0/24 -d 10.0.0.0/24 -j SNAT --to 10.0.0.1
+if use_nft; then
+	n0 nft add table inet nat
+	n0 nft add chain inet nat POSTROUTING { type nat hook postrouting priority srcnat\; policy accept \; }
+	n0 nft add rule inet nat POSTROUTING ip saddr 192.168.1.0/24 ip daddr 10.0.0.0/24 counter snat to 10.0.0.1
+else
+	n0 iptables -t nat -A POSTROUTING -s 192.168.1.0/24 -d 10.0.0.0/24 -j SNAT --to 10.0.0.1
+fi
 
 n1 wg set wg0 peer "$pub2" endpoint 10.0.0.100:2 persistent-keepalive 1
 n1 ping -W 1 -c 1 192.168.241.2
@@ -348,10 +365,20 @@ n1 wg set wg0 peer "$pub2" persistent-keepalive 0
 # Test that sk_bound_dev_if works
 n1 ping -I wg0 -c 1 -W 1 192.168.241.2
 # What about when the mark changes and the packet must be rerouted?
-n1 iptables -t mangle -I OUTPUT -j MARK --set-xmark 1
+if use_nft; then
+	n1 nft add table inet mangle
+	n1 nft add chain inet mangle OUTPUT { type route hook output priority mangle\; policy accept \; }
+	n1 nft add rule inet mangle OUTPUT counter meta mark set 0x1
+else
+	n1 iptables -t mangle -I OUTPUT -j MARK --set-xmark 1
+fi
 n1 ping -c 1 -W 1 192.168.241.2 # First the boring case
 n1 ping -I wg0 -c 1 -W 1 192.168.241.2 # Then the sk_bound_dev_if case
-n1 iptables -t mangle -D OUTPUT -j MARK --set-xmark 1
+if use_nft; then
+	n1 nft delete table inet mangle
+else
+	n1 iptables -t mangle -D OUTPUT -j MARK --set-xmark 1
+fi
 
 # Test that onion routing works, even when it loops
 n1 wg set wg0 peer "$pub3" allowed-ips 192.168.242.2/32 endpoint 192.168.241.2:5
@@ -385,16 +412,32 @@ n1 ping -W 1 -c 100 -f 192.168.99.7
 n1 ping -W 1 -c 100 -f abab::1111
 
 # Have ns2 NAT into wg0 packets from ns0, but return an icmp error along the right route.
-n2 iptables -t nat -A POSTROUTING -s 10.0.0.0/24 -d 192.168.241.0/24 -j SNAT --to 192.168.241.2
-n0 iptables -t filter -A INPUT \! -s 10.0.0.0/24 -i vethrs -j DROP # Manual rpfilter just to be explicit.
+if use_nft; then
+	n2 nft add table inet nat
+	n2 nft add chain inet nat POSTROUTING { type nat hook postrouting priority srcnat\; policy accept \; }
+	n2 nft add rule inet nat POSTROUTING ip saddr 10.0.0.0/24 ip daddr 192.168.241.0/24 counter snat to 192.168.241.2
+
+	n0 nft add table inet filter
+	n0 nft add chain inet filter INPUT { type filter hook input priority filter \; policy accept \; }
+	n0 nft add rule inet filter INPUT iifname "vethrs" ip saddr != 10.0.0.0/24 counter drop
+else
+	n2 iptables -t nat -A POSTROUTING -s 10.0.0.0/24 -d 192.168.241.0/24 -j SNAT --to 192.168.241.2
+	n0 iptables -t filter -A INPUT \! -s 10.0.0.0/24 -i vethrs -j DROP # Manual rpfilter just to be explicit.
+fi
 n2 bash -c 'printf 1 > /proc/sys/net/ipv4/ip_forward'
 ip0 -4 route add 192.168.241.1 via 10.0.0.100
 n2 wg set wg0 peer "$pub1" remove
 [[ $(! n0 ping -W 1 -c 1 192.168.241.1 || false) == *"From 10.0.0.100 icmp_seq=1 Destination Host Unreachable"* ]]
 
-n0 iptables -t nat -F
-n0 iptables -t filter -F
-n2 iptables -t nat -F
+if use_nft; then
+	n0 nft delete table inet nat
+	n0 nft delete table inet filter
+	n2 nft delete table inet nat
+else
+	n0 iptables -t nat -F
+	n0 iptables -t filter -F
+	n2 iptables -t nat -F
+fi
 ip0 link del vethrc
 ip0 link del vethrs
 ip1 link del wg0
-- 
2.46.0

