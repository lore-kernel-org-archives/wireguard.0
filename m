Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28AEFCF2592
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Nov 2025 07:07:13 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a1784b2c;
	Tue, 18 Nov 2025 17:30:13 +0000 (UTC)
Received: from mail1.fiberby.net (mail1.fiberby.net [193.104.135.124])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 5f7eb6b1
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 13 Sep 2025 23:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fiberby.net;
 s=202008; t=1757807953;
 bh=WEAYPSa2cbIp0UFaudtrcyt/21OA9AIcAOuHxxlvsEQ=;
 h=From:To:Cc:Subject:Date:From;
 b=nOeZyzL7ngnAeneb1vFuBo1FYIqWH+3V4VvQ+ipRqLa3JjmfbKNHIjYlu8JY5CQAp
 OFDPpsWnU7xq37Tbduw7yo8lmXfDXbsaFXcZnERmXTaY1g7zm16H+MMMoNwpCz19G2
 eo8AAxMxaUkHJZY4JUxjhhYA+MN6+U2r0HEO1bqsr6iLh3b/1k65SGosI9y0NMymXa
 wevH8nVWsdVlIu/0+YI6zRr7xKkdDjwaQOY/5KcB30dyT4j6ymVk7rwy9VE8jqYCaa
 gdn/JmRp0KyyRL/VUKn58fjQPl5WvxFYJ5KSP9OkPAGVf0jhRSgYGG2d1s0d1PsHxk
 jLYZhA2JwceSw==
Received: from x201s (193-104-135-243.ip4.fiberby.net [193.104.135.243])
 by mail1.fiberby.net (Postfix) with ESMTPSA id 9BDE96013D;
 Sat, 13 Sep 2025 23:59:13 +0000 (UTC)
Received: by x201s (Postfix, from userid 1000)
 id 29DD9201DC8; Sat, 13 Sep 2025 23:58:57 +0000 (UTC)
From: =?UTF-8?q?Asbj=C3=B8rn=20Sloth=20T=C3=B8nnesen?= <ast@fiberby.net>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: =?UTF-8?q?Asbj=C3=B8rn=20Sloth=20T=C3=B8nnesen?= <ast@fiberby.net>,
 Donald Hunter <donald.hunter@gmail.com>, Simon Horman <horms@kernel.org>,
 Jacob Keller <jacob.e.keller@intel.com>,
 Sabrina Dubroca <sd@queasysnail.net>, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net-next v4 00/11] tools: ynl: prepare for wireguard
Date: Sat, 13 Sep 2025 23:58:21 +0000
Message-ID: <20250913235847.358851-1-ast@fiberby.net>
X-Mailer: git-send-email 2.51.0
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

This series contains the last batch of YNL changes to support
the wireguard YNL conversion.

The wireguard changes, to be applied on top of this series,
has been posted as an RFC series here:
  https://lore.kernel.org/netdev/20250904-wg-ynl-rfc@fiberby.net/

---
v4:
- Added a few Reviewed-by (thanks Donald).
- In patch 4, changed the implementation a bit, to avoid overloading.
- In patch 6, expose __ynl_attr_validate(), and move ynl_attr_validate()
  to ynl-priv.h, as an inline function.
- Dropped v3 patch 5 and 6 from this series.
v3: https://lore.kernel.org/netdev/20250911200508.79341-1-ast@fiberby.net/
- Rebased on top of new net-next, after Matthieu's cleanup.
- Added a Reviewed-by (thanks Donald).
- Added the parsing local vars cleanup as patch 7
- In patch 4, change to use set() for deduplication.
- In patch 8, declare __ynl_attr_validate() as static.
v2: https://lore.kernel.org/netdev/20250910230841.384545-1-ast@fiberby.net/
- Added Reviewed-by's to unchanged patches. Thanks to all reviewers.
- Patch 4, refactors local variables for .attr_put() callers, and
  replaces the old patch 4 and 5.
- Patch 5 and 6 are new, and reduces the differences between the 3
  .attr_put() callers, so it might be easier to keep them in sync.
- Patch 7, now validates the nested payload (thanks Jakub).
- Patch 8, now renames more variables (thanks Jakub),
- Patch 10, got a dead line remove (thanks Donald).
- Patch 11, revised hex input to support macsec (suggested by Sabrina).
v1: https://lore.kernel.org/netdev/20250904-wg-ynl-prep@fiberby.net/

Asbjørn Sloth Tønnesen (11):
  tools: ynl-gen: allow overriding name-prefix for constants
  tools: ynl-gen: generate nested array policies
  tools: ynl-gen: add sub-type check
  tools: ynl-gen: refactor local vars for .attr_put() callers
  tools: ynl-gen: avoid repetitive variables definitions
  tools: ynl-gen: validate nested arrays
  tools: ynl-gen: rename TypeArrayNest to TypeIndexedArray
  tools: ynl: move nest packing to a helper function
  tools: ynl: encode indexed-arrays
  tools: ynl: decode hex input
  tools: ynl: add ipv4-or-v6 display hint

 Documentation/netlink/genetlink-legacy.yaml |  2 +-
 tools/net/ynl/lib/ynl-priv.h                | 10 ++-
 tools/net/ynl/lib/ynl.c                     |  6 +-
 tools/net/ynl/pyynl/lib/ynl.py              | 38 +++++++--
 tools/net/ynl/pyynl/ynl_gen_c.py            | 93 +++++++++++++--------
 5 files changed, 101 insertions(+), 48 deletions(-)

-- 
2.51.0

