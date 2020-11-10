Return-Path: <SRS0=x2E1=EQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FC47C5517A
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Nov 2020 03:54:13 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BF4420781
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Nov 2020 03:54:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="hcSBE3aU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BF4420781
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a87c2e4b;
	Tue, 10 Nov 2020 03:50:20 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 5134b2aa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Nov 2020 03:50:18 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3D82320731;
 Tue, 10 Nov 2020 03:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604980436;
 bh=vggjhxlZ0nTVehZ6/y+P9Re4mUYV/sXpTjZQ/ky4jjs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hcSBE3aUyFVlBkLXt6UBZ5YLM9oimBvcHUC9txUZ4o3rLwTHYVQK39R/wjcwmhJiH
 4z1Q5E1H6+igdU/zRzXhIhssM1/Zi68n+zl/gM+5UXKqXW+HzgbdFigbJb982ATy5J
 DgUO0/5KS12wJKNsfuLZtVQd7WnyYNCGvM+QOETs=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Chen Minqiang <ptpt52@gmail.com>,
 Pablo Neira Ayuso <pablo@netfilter.org>, Sasha Levin <sashal@kernel.org>,
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Subject: [PATCH AUTOSEL 5.9 26/55] wireguard: selftests: check that
 route_me_harder packets use the right sk
Date: Mon,  9 Nov 2020 22:52:49 -0500
Message-Id: <20201110035318.423757-26-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201110035318.423757-1-sashal@kernel.org>
References: <20201110035318.423757-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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

From: "Jason A. Donenfeld" <Jason@zx2c4.com>

[ Upstream commit af8afcf1fdd5f365f70e2386c2d8c7a1abd853d7 ]

If netfilter changes the packet mark, the packet is rerouted. The
ip_route_me_harder family of functions fails to use the right sk, opting
to instead use skb->sk, resulting in a routing loop when used with
tunnels. With the next change fixing this issue in netfilter, test for
the relevant condition inside our test suite, since wireguard was where
the bug was discovered.

Reported-by: Chen Minqiang <ptpt52@gmail.com>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/testing/selftests/wireguard/netns.sh           | 8 ++++++++
 tools/testing/selftests/wireguard/qemu/kernel.config | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/tools/testing/selftests/wireguard/netns.sh b/tools/testing/selftests/wireguard/netns.sh
index d77f4829f1e07..74c69b75f6f5a 100755
--- a/tools/testing/selftests/wireguard/netns.sh
+++ b/tools/testing/selftests/wireguard/netns.sh
@@ -316,6 +316,14 @@ pp sleep 3
 n2 ping -W 1 -c 1 192.168.241.1
 n1 wg set wg0 peer "$pub2" persistent-keepalive 0
 
+# Test that sk_bound_dev_if works
+n1 ping -I wg0 -c 1 -W 1 192.168.241.2
+# What about when the mark changes and the packet must be rerouted?
+n1 iptables -t mangle -I OUTPUT -j MARK --set-xmark 1
+n1 ping -c 1 -W 1 192.168.241.2 # First the boring case
+n1 ping -I wg0 -c 1 -W 1 192.168.241.2 # Then the sk_bound_dev_if case
+n1 iptables -t mangle -D OUTPUT -j MARK --set-xmark 1
+
 # Test that onion routing works, even when it loops
 n1 wg set wg0 peer "$pub3" allowed-ips 192.168.242.2/32 endpoint 192.168.241.2:5
 ip1 addr add 192.168.242.1/24 dev wg0
diff --git a/tools/testing/selftests/wireguard/qemu/kernel.config b/tools/testing/selftests/wireguard/qemu/kernel.config
index d531de13c95b0..4eecb432a66c1 100644
--- a/tools/testing/selftests/wireguard/qemu/kernel.config
+++ b/tools/testing/selftests/wireguard/qemu/kernel.config
@@ -18,10 +18,12 @@ CONFIG_NF_NAT=y
 CONFIG_NETFILTER_XTABLES=y
 CONFIG_NETFILTER_XT_NAT=y
 CONFIG_NETFILTER_XT_MATCH_LENGTH=y
+CONFIG_NETFILTER_XT_MARK=y
 CONFIG_NF_CONNTRACK_IPV4=y
 CONFIG_NF_NAT_IPV4=y
 CONFIG_IP_NF_IPTABLES=y
 CONFIG_IP_NF_FILTER=y
+CONFIG_IP_NF_MANGLE=y
 CONFIG_IP_NF_NAT=y
 CONFIG_IP_ADVANCED_ROUTER=y
 CONFIG_IP_MULTIPLE_TABLES=y
-- 
2.27.0

