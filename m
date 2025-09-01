Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C89D8CEE343
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Nov 2025 18:22:51 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2c895f65;
	Tue, 18 Nov 2025 17:24:11 +0000 (UTC)
Received: from mail1.fiberby.net (mail1.fiberby.net [193.104.135.124])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id fcbfbd4f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 1 Sep 2025 14:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fiberby.net;
 s=202008; t=1756738334;
 bh=KRQXLnLWCIStjwU1PJ0qUlA5bTV+OsW/zTXcSrBlAVQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lEoyYAZE4LBlNvQLwJDr+z53za758eHXv0ULf741D8USuM3M+5V4EJdihow8dsQBP
 n2axbvChSsi6Qn8X43XBpwezhTGHy/rojp7OhEokMtUTlJYOWKuYsgFDBBf62vwQKO
 +iODzQf/LbVokRz8AcM1LwK3aYBPWPTxzUTKEmlPx6EkJ1YzTsnUwkOwYWmk6848L+
 fqi/DQuCrwJxV5nLPY7aXX/8O3LRnhKcLtRN2lfc1XnwkLskpU4fIGqntljvbjmfgT
 HNNg6wIYNcgfdoON75UEgLmLAIjho6ClRd2g3tyGfqkxQ7MrGKQn/f+TcyXuLwpjTT
 BDrOpsEx/BRRg==
Received: from x201s (193-104-135-243.ip4.fiberby.net [193.104.135.243])
 by mail1.fiberby.net (Postfix) with ESMTPSA id E873660128;
 Mon,  1 Sep 2025 14:51:16 +0000 (UTC)
Received: by x201s (Postfix, from userid 1000)
 id EC95420226D; Mon, 01 Sep 2025 14:50:54 +0000 (UTC)
From: =?UTF-8?q?Asbj=C3=B8rn=20Sloth=20T=C3=B8nnesen?= <ast@fiberby.net>
To: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: =?UTF-8?q?Asbj=C3=B8rn=20Sloth=20T=C3=B8nnesen?= <ast@fiberby.net>,
 Donald Hunter <donald.hunter@gmail.com>, Simon Horman <horms@kernel.org>,
 Jacob Keller <jacob.e.keller@intel.com>,
 Stanislav Fomichev <sdf@fomichev.me>,
 "Matthieu Baerts (NGI0)" <matttbe@kernel.org>,
 David Ahern <dsahern@kernel.org>, Chuck Lever <chuck.lever@oracle.com>,
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH net 1/4] netlink: specs: fou: change local-v6/peer-v6 check
Date: Mon,  1 Sep 2025 14:50:20 +0000
Message-ID: <20250901145034.525518-2-ast@fiberby.net>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250901145034.525518-1-ast@fiberby.net>
References: <20250901145034.525518-1-ast@fiberby.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 18 Nov 2025 17:23:15 +0000
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

While fixing the binary min-len implementaion, I noticed that
the only user, should AFAICT be using exact-len instead.

In net/ipv4/fou_core.c FOU_ATTR_LOCAL_V6 and FOU_ATTR_PEER_V6
are only used for singular IPv6 addresses, a exact-len policy,
therefore seams like a better fit.

AFAICT this was caused by lacking support for the exact-len check
at the time of the blamed commit, which was later remedied by
c63ad379526 ("tools: ynl-gen: add support for exact-len validation").

This patch therefore changes the local-v6/peer-v6 attributes to
use an exact-len check, instead of a min-len check.

Fixes: 4eb77b4ecd3c ("netlink: add a proto specification for FOU")
Signed-off-by: Asbjørn Sloth Tønnesen <ast@fiberby.net>
---
 Documentation/netlink/specs/fou.yaml | 4 ++--
 net/ipv4/fou_nl.c                    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/netlink/specs/fou.yaml b/Documentation/netlink/specs/fou.yaml
index 57735726262ec..8e7974ec453fc 100644
--- a/Documentation/netlink/specs/fou.yaml
+++ b/Documentation/netlink/specs/fou.yaml
@@ -52,7 +52,7 @@ attribute-sets:
         name: local-v6
         type: binary
         checks:
-          min-len: 16
+          exact-len: 16
       -
         name: peer-v4
         type: u32
@@ -60,7 +60,7 @@ attribute-sets:
         name: peer-v6
         type: binary
         checks:
-          min-len: 16
+          exact-len: 16
       -
         name: peer-port
         type: u16
diff --git a/net/ipv4/fou_nl.c b/net/ipv4/fou_nl.c
index 3d9614609b2d3..506260b4a4dc2 100644
--- a/net/ipv4/fou_nl.c
+++ b/net/ipv4/fou_nl.c
@@ -18,9 +18,9 @@ const struct nla_policy fou_nl_policy[FOU_ATTR_IFINDEX + 1] = {
 	[FOU_ATTR_TYPE] = { .type = NLA_U8, },
 	[FOU_ATTR_REMCSUM_NOPARTIAL] = { .type = NLA_FLAG, },
 	[FOU_ATTR_LOCAL_V4] = { .type = NLA_U32, },
-	[FOU_ATTR_LOCAL_V6] = { .len = 16, },
+	[FOU_ATTR_LOCAL_V6] = NLA_POLICY_EXACT_LEN(16),
 	[FOU_ATTR_PEER_V4] = { .type = NLA_U32, },
-	[FOU_ATTR_PEER_V6] = { .len = 16, },
+	[FOU_ATTR_PEER_V6] = NLA_POLICY_EXACT_LEN(16),
 	[FOU_ATTR_PEER_PORT] = { .type = NLA_BE16, },
 	[FOU_ATTR_IFINDEX] = { .type = NLA_S32, },
 };
-- 
2.50.1

