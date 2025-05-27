Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9158FC54FB3
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 27 May 2025 03:26:56 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 257cb4a6;
	Tue, 27 May 2025 03:26:55 +0000 (UTC)
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [2607:f8b0:4864:20::430])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 27abd4ad
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 May 2025 03:26:53 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-742c9563fafso1830020b3a.0
 for <wireguard@lists.zx2c4.com>; Mon, 26 May 2025 20:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748316412; x=1748921212; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v7d+kcHAwN3g2veRIP35/Cx+qKGOfglBxZ9UJox5e0Y=;
 b=F2XE96MAVvt9/8o2NnSItFX2r0Ck8kxdw60oYilrKk8Cic1hcoOdukYJIhQo3+axGQ
 3963g6bl3VeyDTFQSZzDF9FEKmUFBpQSkJZOpnj6GvqbpF3wr18+iOurAftVMYCRX7pT
 t7JKEFb71PpBtRxd5sR/750zZ9oiCzMO6zPUpRK/m0GEzBUwBHuXSQitOy7/P6aXh7ck
 2tEuCmlKdhn/gV5tivCe2pwPVmJPWkgKGKXazhDHBjlvosmb3SLVKdXub8GVRDqL7kXK
 W08Cs3aQtLMnCV9XnMYYNa36Oj7VxgPvISUmoTzYjjkDxb9sbUJH2T0Q5FPgqKm/JP+k
 FSkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748316412; x=1748921212;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v7d+kcHAwN3g2veRIP35/Cx+qKGOfglBxZ9UJox5e0Y=;
 b=vpKQ1WRM2ZtMEavDjqSQ4f0fe7nYEREGL1J1RO+d3CvoJOdP7bZuffjVANcFNi2BjB
 pISC7B+wOR/Iln7tTdF9Y0/+4dQOYvTCggdzHcGVKJD65Ursu21yC3qL94ptX4g1lKiW
 RNXw33/ac+d/72JzFiBCEx/uX1aVac3BLxuStT97ABSUo76sLoSWDsyoAZMqFjKpA6lU
 5BFzdxevfWRlFvRDRhvTB/mW3hq81qO5aSjkIKhV+snsyIRC/dMt+emGssBKXsjP9DXO
 +vm2wziPkRmHk4q2HEKmrIN6NYt06GCwrf+WX8ugstK/+AR36l8DoSmD1p6DUy5smYZJ
 nHgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXilM2U6ocCUDVNdTzGIqBn3n2mJ9BLoJUIq9+tCow8mn+9AQlZzS+gG8YsIAj/Abhx+gcxKfWmO80=@lists.zx2c4.com
X-Gm-Message-State: AOJu0Yzdzx6VfalcLRTRnFASajgAxU5EbOTDmMaRI9a8dhhjX2W7Aluc
 hPjHFFxvtzeZgG6jCQjWYNSVx7cbVfS5qt8T2ztHf4mr0gQ5iSJGbAnd
X-Gm-Gg: ASbGncs+xh7CNBsUqKR1kjjNvSqFw2cY1mDBwaDZw1meZqLi1jSVFUUwcDpX9I5/7uy
 YMsfYEwAOBeD8PabfnrLSY0PWS+O8eqtTNYzGidQ2e5hzVCK7Mvkg6ux2X8/puWtkdjJmFkx+SV
 2KW7KwkI8bPzjQ0T2svl3BYME+v3z87SbekRb1MJBPC7o803m9mllO0pfLRVfGkdUZxV4tNz6P9
 q0ptb9qVe3mHPmcCif2tOg1Gqa2jMn9TBRMJkneXzKXryfSoQvKLe0cP25/yCNeARPgG4EjVvVC
 soP4n27KGrCpo3653e52UaovVyrqT45Lx0vWstUfCbaBeb3r1IuN1MsKe0AImBLS1wrST8I+BBw
 9PiRJSA==
X-Google-Smtp-Source: AGHT+IGm5Z446VlQptWidK7f486g8CKnUCNZzW4L3XG0SUf3L5vvYXvByrkhOdRBa0b00ccZqaQmJg==
X-Received: by 2002:a05:6a00:1383:b0:742:da7c:3f27 with SMTP id
 d2e1a72fcca58-745fdb4c492mr16903913b3a.0.1748316412177; 
 Mon, 26 May 2025 20:26:52 -0700 (PDT)
Received: from fedora.dns.podman ([209.132.188.88])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74622b3b481sm865926b3a.131.2025.05.26.20.26.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 May 2025 20:26:51 -0700 (PDT)
From: Hangbin Liu <liuhangbin@gmail.com>
To: netdev@vger.kernel.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Jakub Kicinski <kuba@kernel.org>,
 Shuah Khan <shuah@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Simon Horman <horms@kernel.org>, Phil Sutter <phil@nwl.cc>,
 Florian Westphal <fw@strlen.de>, Petr Mladek <pmladek@suse.com>,
 Yoann Congal <yoann.congal@smile.fr>, wireguard@lists.zx2c4.com,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 Hangbin Liu <liuhangbin@gmail.com>
Subject: [PATCHv7 RESEND wireguard 1/2] wireguard: selftests: convert iptables
 to nft
Date: Tue, 27 May 2025 03:26:34 +0000
Message-ID: <20250527032635.10361-2-liuhangbin@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250527032635.10361-1-liuhangbin@gmail.com>
References: <20250527032635.10361-1-liuhangbin@gmail.com>
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

Convert the selftest to nft as it is the replacement for iptables, which
is used by default in most releases.

Signed-off-by: Hangbin Liu <liuhangbin@gmail.com>
---
 tools/testing/selftests/wireguard/netns.sh | 29 ++++++++++++++--------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/wireguard/netns.sh b/tools/testing/selftests/wireguard/netns.sh
index 55500f901fbc..8b840fef90af 100755
--- a/tools/testing/selftests/wireguard/netns.sh
+++ b/tools/testing/selftests/wireguard/netns.sh
@@ -75,6 +75,11 @@ pp ip netns add $netns1
 pp ip netns add $netns2
 ip0 link set up dev lo
 
+# init nft tables
+n0 nft add table ip wgtest
+n1 nft add table ip wgtest
+n2 nft add table ip wgtest
+
 ip0 link add dev wg0 type wireguard
 ip0 link set wg0 netns $netns1
 ip0 link add dev wg0 type wireguard
@@ -196,13 +201,14 @@ ip1 link set wg0 mtu 1300
 ip2 link set wg0 mtu 1300
 n1 wg set wg0 peer "$pub2" endpoint 127.0.0.1:2
 n2 wg set wg0 peer "$pub1" endpoint 127.0.0.1:1
-n0 iptables -A INPUT -m length --length 1360 -j DROP
+n0 nft add chain ip wgtest INPUT { type filter hook input priority filter \; policy accept \; }
+n0 nft add rule ip wgtest INPUT meta length 1360 drop
 n1 ip route add 192.168.241.2/32 dev wg0 mtu 1299
 n2 ip route add 192.168.241.1/32 dev wg0 mtu 1299
 n2 ping -c 1 -W 1 -s 1269 192.168.241.1
 n2 ip route delete 192.168.241.1/32 dev wg0 mtu 1299
 n1 ip route delete 192.168.241.2/32 dev wg0 mtu 1299
-n0 iptables -F INPUT
+n0 nft flush table ip wgtest
 
 ip1 link set wg0 mtu $orig_mtu
 ip2 link set wg0 mtu $orig_mtu
@@ -335,7 +341,8 @@ n0 bash -c 'printf 1 > /proc/sys/net/ipv4/ip_forward'
 [[ -e /proc/sys/net/netfilter/nf_conntrack_udp_timeout ]] || modprobe nf_conntrack
 n0 bash -c 'printf 2 > /proc/sys/net/netfilter/nf_conntrack_udp_timeout'
 n0 bash -c 'printf 2 > /proc/sys/net/netfilter/nf_conntrack_udp_timeout_stream'
-n0 iptables -t nat -A POSTROUTING -s 192.168.1.0/24 -d 10.0.0.0/24 -j SNAT --to 10.0.0.1
+n0 nft add chain ip wgtest POSTROUTING { type nat hook postrouting priority srcnat\; policy accept \; }
+n0 nft add rule ip wgtest POSTROUTING ip saddr 192.168.1.0/24 ip daddr 10.0.0.0/24 snat to 10.0.0.1
 
 n1 wg set wg0 peer "$pub2" endpoint 10.0.0.100:2 persistent-keepalive 1
 n1 ping -W 1 -c 1 192.168.241.2
@@ -349,10 +356,11 @@ n1 wg set wg0 peer "$pub2" persistent-keepalive 0
 # Test that sk_bound_dev_if works
 n1 ping -I wg0 -c 1 -W 1 192.168.241.2
 # What about when the mark changes and the packet must be rerouted?
-n1 iptables -t mangle -I OUTPUT -j MARK --set-xmark 1
+n1 nft add chain ip wgtest OUTPUT { type route hook output priority mangle\; policy accept \; }
+n1 nft add rule ip wgtest OUTPUT meta mark set 0x1
 n1 ping -c 1 -W 1 192.168.241.2 # First the boring case
 n1 ping -I wg0 -c 1 -W 1 192.168.241.2 # Then the sk_bound_dev_if case
-n1 iptables -t mangle -D OUTPUT -j MARK --set-xmark 1
+n1 nft flush table ip wgtest
 
 # Test that onion routing works, even when it loops
 n1 wg set wg0 peer "$pub3" allowed-ips 192.168.242.2/32 endpoint 192.168.241.2:5
@@ -386,16 +394,17 @@ n1 ping -W 1 -c 100 -f 192.168.99.7
 n1 ping -W 1 -c 100 -f abab::1111
 
 # Have ns2 NAT into wg0 packets from ns0, but return an icmp error along the right route.
-n2 iptables -t nat -A POSTROUTING -s 10.0.0.0/24 -d 192.168.241.0/24 -j SNAT --to 192.168.241.2
-n0 iptables -t filter -A INPUT \! -s 10.0.0.0/24 -i vethrs -j DROP # Manual rpfilter just to be explicit.
+n2 nft add chain ip wgtest POSTROUTING { type nat hook postrouting priority srcnat\; policy accept \; }
+n2 nft add rule ip wgtest POSTROUTING ip saddr 10.0.0.0/24 ip daddr 192.168.241.0/24 snat to 192.168.241.2
+n0 nft add chain ip wgtest INPUT { type filter hook input priority filter \; policy accept \; }
+n0 nft add rule ip wgtest INPUT iifname "vethrs" ip saddr != 10.0.0.0/24 drop
 n2 bash -c 'printf 1 > /proc/sys/net/ipv4/ip_forward'
 ip0 -4 route add 192.168.241.1 via 10.0.0.100
 n2 wg set wg0 peer "$pub1" remove
 [[ $(! n0 ping -W 1 -c 1 192.168.241.1 || false) == *"From 10.0.0.100 icmp_seq=1 Destination Host Unreachable"* ]]
 
-n0 iptables -t nat -F
-n0 iptables -t filter -F
-n2 iptables -t nat -F
+n0 nft flush table ip wgtest
+n2 nft flush table ip wgtest
 ip0 link del vethrc
 ip0 link del vethrs
 ip1 link del wg0
-- 
2.46.0

