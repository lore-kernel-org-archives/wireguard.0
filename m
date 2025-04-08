Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33CF3C2D0CD
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 16:10:18 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1ca498d8;
	Tue, 20 May 2025 19:43:55 +0000 (UTC)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [2607:f8b0:4864:20::634])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6c1d336e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 8 Apr 2025 08:17:18 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-224100e9a5cso54658445ad.2
 for <wireguard@lists.zx2c4.com>; Tue, 08 Apr 2025 01:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744100237; x=1744705037; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v7d+kcHAwN3g2veRIP35/Cx+qKGOfglBxZ9UJox5e0Y=;
 b=CmfNhyw/aKT0aB0deczp6F773+wwIM+FN4gdGBmb414bWmGfXLbdUYtci/dE3a9fo3
 I3fXrOI3z9CUb7t9d59tVH+TBnR5o3CD6NCDgDm2jMfF++ntKFAzUju+k0pZ4hMGrjkC
 lY23nKTFMrDG9hgPdS9ebLQFwQE++dF86yxAOWNPvdhI6ZHr2K7D9c+sxP0UBRQPz4KD
 7MMwCIS4hpQmj7OJhE4xvZcvEskhi7W/VlbRRVDTYZcb0goAqTf+Ci2X++DRz8zZtJrv
 7agQKIdmw42vhzJ9+Qg7++VE6hTKQbEw1UtTlpv2cBlE4yvOykJgRjFOHv9wo4pvKlr3
 2bGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744100237; x=1744705037;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v7d+kcHAwN3g2veRIP35/Cx+qKGOfglBxZ9UJox5e0Y=;
 b=TtXvosIN7smyf/HFpsNC+rbpsnz9c0buJtre59tYkVDRnAyoLfxOlngyl2kD3jNE1f
 mg1RCcmN9gCpEhOAY94sML4/ivI2HI+h8LrIsPF4+KkTB15GSFzceS2yD+dlea9/yfpk
 Vun9p6XjO7p4b37+GSBj26SnmzKdRFBPaR8NkUzwqR/3t81uTx8T3jHerh/IEocQUOsd
 H8xt+gI3UXpfxGLqg2IU3tBzewjgAaSyFRgPXAd87mf+cFG6UMMYjlklbGowmFhLDiJl
 0/iCfLBugUgSMBeAe3mbNWJ9xSDjGTdnZ8m1YC6xp9w92eSR40e6w8IO2a8Qx7Tl/567
 fwjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgyhbsbgMgAJSxA0uo4s7Y7GtoO7/YQ3DdK1rkSEW547lPZsmnwBIJA6IRoTzV+G64LgTBlnFN99E=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YwtV8mScebt+SRxl0eZrpLqGRm/hknrl7yVHtCTeCKSUCm7FkW5
 mnv+yjjPdOeXpq1YVxKXuunLDJT/XTXFOndEOLPN2iAn8gi2M3aL
X-Gm-Gg: ASbGnctDR+pOESyYWJlO+6mEaoRkUkrOnqVAro0DSmSWHM1zrE/OFi34Zf9w33Ng017
 7vNo4omCfYO8Ay4pmSX+M4NZ7Ish4LmO2Cj6A/aA+L9Y7Zy8g21cGo9hsA8mnBd/lwPgaTZUzz4
 d5CjoQ92L/ibjj85RkISeEq9JhItaHKR9qAoX9qoZoXsOa4lGzCrcmy5nNXgzIKgmwZpms6oosZ
 LOxrl9GlWYYRWw3JiUEeww8nmCyM5ojkQ68lJYyQ4H2IppQAGNtdRSJQbRt9M4cuv621cDxG8UI
 NkQxOw4h60Ky0qTrQxZLVx3IjNteZ0Qs6EjU8lyLGZBH4AGyZIpP/HVkyu5awRob+2nxvg==
X-Google-Smtp-Source: AGHT+IFhbmP2Y/X1Y+SFXIUub7l0AG/Zk7maUw6wnkw48Kd+ctJdyuBAxMTAkuTD1VllYRNhyEWJ+A==
X-Received: by 2002:a17:902:e809:b0:220:cb1a:da5 with SMTP id
 d9443c01a7336-22a8a8cec34mr230595595ad.40.1744100236572; 
 Tue, 08 Apr 2025 01:17:16 -0700 (PDT)
Received: from fedora.dns.podman ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-229785ada20sm94319535ad.46.2025.04.08.01.17.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 01:17:16 -0700 (PDT)
From: Hangbin Liu <liuhangbin@gmail.com>
To: netdev@vger.kernel.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Jakub Kicinski <kuba@kernel.org>,
 Shuah Khan <shuah@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Simon Horman <horms@kernel.org>, Phil Sutter <phil@nwl.cc>,
 Florian Westphal <fw@strlen.de>, Petr Mladek <pmladek@suse.com>,
 Yoann Congal <yoann.congal@smile.fr>, wireguard@lists.zx2c4.com,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 Hangbin Liu <liuhangbin@gmail.com>
Subject: [PATCHv6 net-next 1/2] wireguard: selftests: convert iptables to nft
Date: Tue,  8 Apr 2025 08:16:51 +0000
Message-ID: <20250408081652.1330-2-liuhangbin@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250408081652.1330-1-liuhangbin@gmail.com>
References: <20250408081652.1330-1-liuhangbin@gmail.com>
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

