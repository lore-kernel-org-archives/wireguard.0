Return-Path: <SRS0=uW9L=64=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 456A3C433E5
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 May 2020 19:00:32 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC0F720675
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 May 2020 19:00:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="M3EqFsbs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC0F720675
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1d16812a;
	Thu, 14 May 2020 18:46:30 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 052fde1f
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 May 2020 18:46:28 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C261B20722;
 Thu, 14 May 2020 18:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589482373;
 bh=fIKF1pDVkSW6DCJNR99hImpfok5ZmIDQ7demSS+zRYk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=M3EqFsbsvrAoZgI8kixBOZIfof+X5e65heH0oOMNn+M/il9Cl8bu6CEIg2OatGDRP
 MDwz01/o7D4pnvBNKfvve3C2WuiJlTpAFKS4R7ViQShkNxiwT9/alw9pstAHuDGmJj
 LMbxO1AghcApJzvkZKRXJwYjf7S+eIEQ8YT8uAEQ=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Arnd Bergmann <arnd@arndb.de>,
 "David S . Miller" <davem@davemloft.net>, Sasha Levin <sashal@kernel.org>,
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 clang-built-linux@googlegroups.com
Subject: [PATCH AUTOSEL 5.6 51/62] wireguard: selftests: initalize ipv6
 members to NULL to squelch clang warning
Date: Thu, 14 May 2020 14:51:36 -0400
Message-Id: <20200514185147.19716-51-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200514185147.19716-1-sashal@kernel.org>
References: <20200514185147.19716-1-sashal@kernel.org>
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

[ Upstream commit 4fed818ef54b08d4b29200e416cce65546ad5312 ]

Without setting these to NULL, clang complains in certain
configurations that have CONFIG_IPV6=n:

In file included from drivers/net/wireguard/ratelimiter.c:223:
drivers/net/wireguard/selftest/ratelimiter.c:173:34: error: variable 'skb6' is uninitialized when used here [-Werror,-Wuninitialized]
                ret = timings_test(skb4, hdr4, skb6, hdr6, &test_count);
                                               ^~~~
drivers/net/wireguard/selftest/ratelimiter.c:123:29: note: initialize the variable 'skb6' to silence this warning
        struct sk_buff *skb4, *skb6;
                                   ^
                                    = NULL
drivers/net/wireguard/selftest/ratelimiter.c:173:40: error: variable 'hdr6' is uninitialized when used here [-Werror,-Wuninitialized]
                ret = timings_test(skb4, hdr4, skb6, hdr6, &test_count);
                                                     ^~~~
drivers/net/wireguard/selftest/ratelimiter.c:125:22: note: initialize the variable 'hdr6' to silence this warning
        struct ipv6hdr *hdr6;
                            ^

We silence this warning by setting the variables to NULL as the warning
suggests.

Reported-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireguard/selftest/ratelimiter.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireguard/selftest/ratelimiter.c b/drivers/net/wireguard/selftest/ratelimiter.c
index bcd6462e45401..007cd4457c5f6 100644
--- a/drivers/net/wireguard/selftest/ratelimiter.c
+++ b/drivers/net/wireguard/selftest/ratelimiter.c
@@ -120,9 +120,9 @@ bool __init wg_ratelimiter_selftest(void)
 	enum { TRIALS_BEFORE_GIVING_UP = 5000 };
 	bool success = false;
 	int test = 0, trials;
-	struct sk_buff *skb4, *skb6;
+	struct sk_buff *skb4, *skb6 = NULL;
 	struct iphdr *hdr4;
-	struct ipv6hdr *hdr6;
+	struct ipv6hdr *hdr6 = NULL;
 
 	if (IS_ENABLED(CONFIG_KASAN) || IS_ENABLED(CONFIG_UBSAN))
 		return true;
-- 
2.20.1

