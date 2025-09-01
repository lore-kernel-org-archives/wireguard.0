Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00722CEE347
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Nov 2025 18:31:21 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eb7aaed0;
	Tue, 18 Nov 2025 17:24:19 +0000 (UTC)
Received: from mail1.fiberby.net (mail1.fiberby.net [193.104.135.124])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6ced7aff
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 1 Sep 2025 14:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fiberby.net;
 s=202008; t=1756738334;
 bh=bwutvYte2v5M5foMclZwyKV+peJI6XWuEXuXe4HoaBw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SfTXFqewM4mrjsNbqjjJYpkzNzQSs7ILBxImJU2Q2lcDK1cdNpH0oOh/BRtAGjOvy
 +telnDst07ECMTXoE312nn9vwMyp6X3wGPj5qjxhBZeX/5zuOSmk0Zf7muQPW8wmgQ
 nSRlxYeZKCZ7N21bs9DYXi+6ZFjbHLa52GINp5PCyUY4h5filyjlPVzm4V8rFL6qgz
 szjTmpdfv4rm/y/KomFOD05ixOEbs74pQF72HHQH3SzQ9TY7PbB4ioCChQOCsexwsC
 TCATXFxr/xnZicSZUWjWdYzqEUGJ1+Jl64mnFRP9uBHxn4cSDlPpwaBJsvRQGkdEnk
 PGuFwq/cqDh8A==
Received: from x201s (193-104-135-243.ip4.fiberby.net [193.104.135.243])
 by mail1.fiberby.net (Postfix) with ESMTPSA id EADA26012E;
 Mon,  1 Sep 2025 14:51:16 +0000 (UTC)
Received: by x201s (Postfix, from userid 1000)
 id 1106A202271; Mon, 01 Sep 2025 14:50:56 +0000 (UTC)
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
Subject: [PATCH net 2/4] tools: ynl-gen: use macro for binary min-len check
Date: Mon,  1 Sep 2025 14:50:21 +0000
Message-ID: <20250901145034.525518-3-ast@fiberby.net>
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

This patch changes the generated min-len check for binary
attributes to use the NLA_POLICY_MIN_LEN() macro, and thereby
ensures that .validation_type is not left at NLA_VALIDATE_NONE.

This doesn't change any currently generated code, as it isn't
used in any specs currently used for generating code.

Fixes: be5bea1cc0bf ("net: add basic C code generators for Netlink")
Signed-off-by: Asbjørn Sloth Tønnesen <ast@fiberby.net>
---
 tools/net/ynl/pyynl/ynl_gen_c.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/net/ynl/pyynl/ynl_gen_c.py b/tools/net/ynl/pyynl/ynl_gen_c.py
index ef032e17fec44..52f955ed84a7f 100755
--- a/tools/net/ynl/pyynl/ynl_gen_c.py
+++ b/tools/net/ynl/pyynl/ynl_gen_c.py
@@ -556,7 +556,7 @@ class TypeBinary(Type):
         elif 'exact-len' in self.checks:
             mem = 'NLA_POLICY_EXACT_LEN(' + self.get_limit_str('exact-len') + ')'
         elif 'min-len' in self.checks:
-            mem = '{ .len = ' + self.get_limit_str('min-len') + ', }'
+            mem = 'NLA_POLICY_MIN_LEN(' + self.get_limit_str('min-len') + ')'
         elif 'max-len' in self.checks:
             mem = 'NLA_POLICY_MAX_LEN(' + self.get_limit_str('max-len') + ')'
 
-- 
2.50.1

