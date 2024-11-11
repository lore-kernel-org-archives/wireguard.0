Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D98C0D10F5A
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Nov 2024 03:58:56 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4b6e5195;
	Mon, 18 Nov 2024 01:39:18 +0000 (UTC)
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [2607:f8b0:4864:20::42f])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 88cd077f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 Nov 2024 04:19:19 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-723f37dd76cso4137486b3a.0
 for <wireguard@lists.zx2c4.com>; Sun, 10 Nov 2024 20:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731298757; x=1731903557; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2kfYr0e+lfSP5A5S7yQYeLHhETZcSLDUVzUjAyoz5V4=;
 b=QnnSZxmv9g3pR0S3JveDjAurwGxhXMUUMoWINe/2CcoRraum/1VjJihmtR1HjNEC7S
 ugT/aH05RDiB1AmD0IXwv3K7pYTq6BI66f+w6CDW3WrDe02zHZdCVvriIkc26p808T3B
 Ty8gnueIVhC8UcfI115xYsBQo50a06vJRyVjBRhAqqrX6ZGc5ara44l7S0r2odYuXJby
 4Hz8+f7lx+EzVgOj4GhzY95jIGzOC2KU2JgRu+uUbblp2hA21fRF45GZ1Fm88JUbnKL0
 eNgLtuoUeHtO0LZpWJfWmcGS2bQPNtHXv1rDCCgKS46Vt/BrbCIsnJzxi3ccUFmxP5Ac
 sIiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731298757; x=1731903557;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2kfYr0e+lfSP5A5S7yQYeLHhETZcSLDUVzUjAyoz5V4=;
 b=v8cxSz8jioYXrwmwkZS0/CnE/GThfC+U94DvzoZqH7J2CAvoFQufPlfosxKu18j/Q9
 M8uViXaUzo2iPrhgQJEsk7RpkrRPhxeEFOxymBcjvNnsNCEsDAxT1WueYMfdKyFqf7rQ
 MSH6mtZ1CX4eFK0wScpkFlOlmoKNlU+IgKStgHm6Xx7g63FyrF6CqeR4PQixUMXGfHu0
 SUP1bi3kxoh0aqyWgd27lB6YcyE6k5gMH/IYxvjoywfFixPqFGok5ihyJRnTS4bGEX+C
 6HULdy+8jo3iMlX7LbwIO5Q/evroNE33Abkh36c7SEG0SNHU6czUTCq/8FLrXf9XM/Vo
 vG2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHK4tsdDHpgZw14Ev0VKkmKfkiU48ogl13YXbfYnapGElHkNRD6SQDUEx+afDIrZqgk0uL9VxvCVU=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YxMqhOr3mqJ10W712RMwMFSK6kJzFEBZh811aEJx3XulTzSXGEc
 tWxlC28DRK3c2JfAXgMjVByre6nR3dAmbgLa3Tf8ljL6mdkTtZZv
X-Google-Smtp-Source: AGHT+IF/Oz2jJGRqfqTHsKPVq3hRoDvVlN+qOnlYNHsdLV1V8ulh0CgVqEmmwxZX+osclR1I9VSBoQ==
X-Received: by 2002:a05:6a20:c890:b0:1db:e328:dd13 with SMTP id
 adf61e73a8af0-1dc2294ae47mr15124117637.11.1731298757269; 
 Sun, 10 Nov 2024 20:19:17 -0800 (PST)
Received: from fedora.dns.podman ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e99a62bd09sm9635460a91.46.2024.11.10.20.19.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Nov 2024 20:19:16 -0800 (PST)
From: Hangbin Liu <liuhangbin@gmail.com>
To: netdev@vger.kernel.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Shuah Khan <shuah@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Florian Westphal <fw@strlen.de>,
 Phil Sutter <phil@nwl.cc>, wireguard@lists.zx2c4.com,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 Hangbin Liu <liuhangbin@gmail.com>
Subject: [PATCHv2 net-next] selftests: wireguards: use nft by default
Date: Mon, 11 Nov 2024 04:19:02 +0000
Message-ID: <20241111041902.25814-1-liuhangbin@gmail.com>
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
v2: use one nft table for testing (Phil Sutter)
---
 tools/testing/selftests/wireguard/netns.sh | 63 ++++++++++++++++++----
 1 file changed, 53 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/wireguard/netns.sh b/tools/testing/selftests/wireguard/netns.sh
index 405ff262ca93..be4e3b13ed22 100755
--- a/tools/testing/selftests/wireguard/netns.sh
+++ b/tools/testing/selftests/wireguard/netns.sh
@@ -44,6 +44,7 @@ sleep() { read -t "$1" -N 1 || true; }
 waitiperf() { pretty "${1//*-}" "wait for iperf:${3:-5201} pid $2"; while [[ $(ss -N "$1" -tlpH "sport = ${3:-5201}") != *\"iperf3\",pid=$2,fd=* ]]; do sleep 0.1; done; }
 waitncatudp() { pretty "${1//*-}" "wait for udp:1111 pid $2"; while [[ $(ss -N "$1" -ulpH 'sport = 1111') != *\"ncat\",pid=$2,fd=* ]]; do sleep 0.1; done; }
 waitiface() { pretty "${1//*-}" "wait for $2 to come up"; ip netns exec "$1" bash -c "while [[ \$(< \"/sys/class/net/$2/operstate\") != up ]]; do read -t .1 -N 0 || true; done;"; }
+use_nft() { nft --version &> /dev/null; }
 
 cleanup() {
 	set +e
@@ -75,6 +76,12 @@ pp ip netns add $netns1
 pp ip netns add $netns2
 ip0 link set up dev lo
 
+if use_nft; then
+	n0 nft add table ip wgtest
+	n1 nft add table ip wgtest
+	n2 nft add table ip wgtest
+fi
+
 ip0 link add dev wg0 type wireguard
 ip0 link set wg0 netns $netns1
 ip0 link add dev wg0 type wireguard
@@ -196,13 +203,22 @@ ip1 link set wg0 mtu 1300
 ip2 link set wg0 mtu 1300
 n1 wg set wg0 peer "$pub2" endpoint 127.0.0.1:2
 n2 wg set wg0 peer "$pub1" endpoint 127.0.0.1:1
-n0 iptables -A INPUT -m length --length 1360 -j DROP
+if use_nft; then
+	n0 nft add chain ip wgtest INPUT { type filter hook input priority filter \; policy accept \; }
+	n0 nft add rule ip wgtest INPUT meta length 1360 counter drop
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
+	n0 nft flush table ip wgtest
+else
+	n0 iptables -F INPUT
+fi
 
 ip1 link set wg0 mtu $orig_mtu
 ip2 link set wg0 mtu $orig_mtu
@@ -334,7 +350,12 @@ waitiface $netns2 veths
 n0 bash -c 'printf 1 > /proc/sys/net/ipv4/ip_forward'
 n0 bash -c 'printf 2 > /proc/sys/net/netfilter/nf_conntrack_udp_timeout'
 n0 bash -c 'printf 2 > /proc/sys/net/netfilter/nf_conntrack_udp_timeout_stream'
-n0 iptables -t nat -A POSTROUTING -s 192.168.1.0/24 -d 10.0.0.0/24 -j SNAT --to 10.0.0.1
+if use_nft; then
+	n0 nft add chain ip wgtest POSTROUTING { type nat hook postrouting priority srcnat\; policy accept \; }
+	n0 nft add rule ip wgtest POSTROUTING ip saddr 192.168.1.0/24 ip daddr 10.0.0.0/24 counter snat to 10.0.0.1
+else
+	n0 iptables -t nat -A POSTROUTING -s 192.168.1.0/24 -d 10.0.0.0/24 -j SNAT --to 10.0.0.1
+fi
 
 n1 wg set wg0 peer "$pub2" endpoint 10.0.0.100:2 persistent-keepalive 1
 n1 ping -W 1 -c 1 192.168.241.2
@@ -348,10 +369,19 @@ n1 wg set wg0 peer "$pub2" persistent-keepalive 0
 # Test that sk_bound_dev_if works
 n1 ping -I wg0 -c 1 -W 1 192.168.241.2
 # What about when the mark changes and the packet must be rerouted?
-n1 iptables -t mangle -I OUTPUT -j MARK --set-xmark 1
+if use_nft; then
+	n1 nft add chain ip wgtest OUTPUT { type route hook output priority mangle\; policy accept \; }
+	n1 nft add rule ip wgtest OUTPUT counter meta mark set 0x1
+else
+	n1 iptables -t mangle -I OUTPUT -j MARK --set-xmark 1
+fi
 n1 ping -c 1 -W 1 192.168.241.2 # First the boring case
 n1 ping -I wg0 -c 1 -W 1 192.168.241.2 # Then the sk_bound_dev_if case
-n1 iptables -t mangle -D OUTPUT -j MARK --set-xmark 1
+if use_nft; then
+	n1 nft flush table ip wgtest
+else
+	n1 iptables -t mangle -D OUTPUT -j MARK --set-xmark 1
+fi
 
 # Test that onion routing works, even when it loops
 n1 wg set wg0 peer "$pub3" allowed-ips 192.168.242.2/32 endpoint 192.168.241.2:5
@@ -385,16 +415,29 @@ n1 ping -W 1 -c 100 -f 192.168.99.7
 n1 ping -W 1 -c 100 -f abab::1111
 
 # Have ns2 NAT into wg0 packets from ns0, but return an icmp error along the right route.
-n2 iptables -t nat -A POSTROUTING -s 10.0.0.0/24 -d 192.168.241.0/24 -j SNAT --to 192.168.241.2
-n0 iptables -t filter -A INPUT \! -s 10.0.0.0/24 -i vethrs -j DROP # Manual rpfilter just to be explicit.
+if use_nft; then
+	n2 nft add chain ip wgtest POSTROUTING { type nat hook postrouting priority srcnat\; policy accept \; }
+	n2 nft add rule ip wgtest POSTROUTING ip saddr 10.0.0.0/24 ip daddr 192.168.241.0/24 counter snat to 192.168.241.2
+
+	n0 nft add chain ip wgtest INPUT { type filter hook input priority filter \; policy accept \; }
+	n0 nft add rule ip wgtest INPUT iifname "vethrs" ip saddr != 10.0.0.0/24 counter drop
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
+	n0 nft flush table ip wgtest
+	n2 nft flush table ip wgtest
+else
+	n0 iptables -t nat -F
+	n0 iptables -t filter -F
+	n2 iptables -t nat -F
+fi
 ip0 link del vethrc
 ip0 link del vethrs
 ip1 link del wg0
-- 
2.39.5 (Apple Git-154)

