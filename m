Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68CAAC54E65
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 00:00:08 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b41ed135;
	Tue, 20 May 2025 19:37:57 +0000 (UTC)
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [2607:f8b0:4864:20::1030])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 5f8bdc8c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 6 Jan 2025 08:11:05 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-2efd81c7ca4so16412990a91.2
 for <wireguard@lists.zx2c4.com>; Mon, 06 Jan 2025 00:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736151064; x=1736755864; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jnm8/1ru5mWA8QP24vCMz+S2YuEXrjIdcwPRZfDzES0=;
 b=AZaI5BxKkcN5TowRGF1STpi1o00XJdaHjvf4gkKXhop5a/9cTB8MMxLZHtWpHOGh2z
 eu2otvkeIegJWNe6c9HMekd4OZP9gcZt1n0vpCdv/zCPpb3DDc0QdNo58rEfDHyt96u3
 Be0oKeIkwF5mWSiJZE3nRCvFhPBenC7dGpSpNVI8cbIcP3ipTbpZ9BIo2OYSHEdU2ZSp
 LmO6957rUSABERopgAv66hwfaF13PDky9I2vRABda++LZAdvhs2CiDC4rt/kokZDks7Q
 PcHLVsBeAu0XtTZwhtanrOHkA6EzObUyaTUfbJixR490G/BDeJ3458WtNpEb22ZSCYkx
 Vn0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736151064; x=1736755864;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jnm8/1ru5mWA8QP24vCMz+S2YuEXrjIdcwPRZfDzES0=;
 b=EtEhmMKNV2aMJufUITZSamFjmnEFhNWi0u6sSVZ2Kr2JieeUcHZWWFWaw/iKKDy/O3
 pv7YS+pTekSnQGyLxHSI22qyHJlvBKQIg0VqyILh893Bw1SPl8YECbTVlc+4C5zD+Duv
 sBij+kpa/KH+UqpLjZu7/jhunCvZLvy9x2ePXUTB+ca+jCSi47MBzwqTHTw2WX9+3wmN
 AixQNETW23MqSgX0juOEmK+Za8Orq+o+UhEPv3I+yBvlsSgv47y8xJuv7jzcMDLWJpNY
 nOeurpKzgRJYEia8pve1KZ01qIL19F+SalGeoHOAdNkms1UJdu2C2lRud/gpGM49BzmF
 Jjfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXm+W6pwV6PI8gb6Pc4JVsHlvFP6XJDM3pUmdKJV8jv9SDmw0qeMNcRt8MP3v2cTuii3r2Wl1UmRsI=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YwYU0Y959qUSUZAKyVPSeEZpVPxUvuxyYNW+DLaHbv91NL3298h
 ocqukgsTyTW3bp0uVFa97jugurN3K7q2NTzIQGS8Xji+lSx/MwW6
X-Gm-Gg: ASbGnct5xZBfIb6L+xLJ1xzp7SQGAD151zReDG5ew/CGiuZnOO7r1j7joGtmWEziQ2w
 LqR6ArumT3LRCxG/aSPB+Q2f1XPPmZ2XEkJdUfXOuZukUl14+jQbW5EG5hWb3zewjKzVj6KDzYh
 8BW04WJ7MW2wX7ixDbE5mrVMM3HOh2WWWZh9Bgl6Yjfqp+ehbF18nITjAMfycv+e8wUmJ7KArLw
 fCt6BoPvxLYFzZLm7ygvG4RbUGm3X274dbbJKF4JKwK12cvPSvEAoJn/8yqnI4PCMCSzhci/qpO
X-Google-Smtp-Source: AGHT+IF9J4WZwXUUDanCj4p2aJeSviCqzCuKbMZU0vMQD/WyTGbYs8vjN7TCz1zOkBjzv4JP8Wr2Kw==
X-Received: by 2002:a05:6a00:6387:b0:72b:5a7a:e5a6 with SMTP id
 d2e1a72fcca58-72b5a7ae7edmr20980424b3a.26.1736151063865; 
 Mon, 06 Jan 2025 00:11:03 -0800 (PST)
Received: from fedora.dns.podman ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72aad835469sm31910429b3a.60.2025.01.06.00.10.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2025 00:11:03 -0800 (PST)
From: Hangbin Liu <liuhangbin@gmail.com>
To: netdev@vger.kernel.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Jakub Kicinski <kuba@kernel.org>,
 Shuah Khan <shuah@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Simon Horman <horms@kernel.org>, Phil Sutter <phil@nwl.cc>,
 Florian Westphal <fw@strlen.de>, Petr Mladek <pmladek@suse.com>,
 Yoann Congal <yoann.congal@smile.fr>, wireguard@lists.zx2c4.com,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, Hangbin Liu <liuhangbin@gmail.com>
Subject: [PATCHv4 RESEND net-next 1/2] selftests: wireguards: convert iptables
 to nft
Date: Mon,  6 Jan 2025 08:10:42 +0000
Message-ID: <20250106081043.2073169-2-liuhangbin@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250106081043.2073169-1-liuhangbin@gmail.com>
References: <20250106081043.2073169-1-liuhangbin@gmail.com>
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

Convert iptabels to nft as it is the replacement for iptables, which is used
by default in most releases.

Signed-off-by: Hangbin Liu <liuhangbin@gmail.com>
---
 tools/testing/selftests/wireguard/netns.sh | 29 ++++++++++++++--------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/wireguard/netns.sh b/tools/testing/selftests/wireguard/netns.sh
index 55500f901fbc..4032384e6747 100755
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
+n0 nft add rule ip wgtest INPUT meta length 1360 counter drop
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
+n0 nft add rule ip wgtest POSTROUTING ip saddr 192.168.1.0/24 ip daddr 10.0.0.0/24 counter snat to 10.0.0.1
 
 n1 wg set wg0 peer "$pub2" endpoint 10.0.0.100:2 persistent-keepalive 1
 n1 ping -W 1 -c 1 192.168.241.2
@@ -349,10 +356,11 @@ n1 wg set wg0 peer "$pub2" persistent-keepalive 0
 # Test that sk_bound_dev_if works
 n1 ping -I wg0 -c 1 -W 1 192.168.241.2
 # What about when the mark changes and the packet must be rerouted?
-n1 iptables -t mangle -I OUTPUT -j MARK --set-xmark 1
+n1 nft add chain ip wgtest OUTPUT { type route hook output priority mangle\; policy accept \; }
+n1 nft add rule ip wgtest OUTPUT counter meta mark set 0x1
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
+n2 nft add rule ip wgtest POSTROUTING ip saddr 10.0.0.0/24 ip daddr 192.168.241.0/24 counter snat to 192.168.241.2
+n0 nft add chain ip wgtest INPUT { type filter hook input priority filter \; policy accept \; }
+n0 nft add rule ip wgtest INPUT iifname "vethrs" ip saddr != 10.0.0.0/24 counter drop
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

