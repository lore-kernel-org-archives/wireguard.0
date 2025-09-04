Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A4ACF2564
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Nov 2025 22:44:37 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f6fa4778;
	Tue, 18 Nov 2025 17:26:14 +0000 (UTC)
Received: from mail1.fiberby.net (mail1.fiberby.net [193.104.135.124])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6e80f944
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 4 Sep 2025 22:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fiberby.net;
 s=202008; t=1757023399;
 bh=ONNek9e9XXLRrSnQiiYpvkro4XvZ25Cp3066DjpUKos=;
 h=From:To:Cc:Subject:Date:From;
 b=a53Olmkqz4aRkLa/ZKdGhn7GnrBtXxsyRrkfDNYG1d/FdeeYyRthcvMvE9EjS2BFw
 gbKS4QeYgBxlk8RJFgutfGRq8144lRRUpo61hyhNdCyrBxcfdUnTb4mvZMT4fl2J0r
 808iPYKXYKXarcAHLVTwoI6uO/FZ35Qdy3o0iCStTGmbJGf+nzjhWUKoxooW1dz8Sr
 raTBQTP5Dj8lUfFp8V6ibFSkr8En1gkkKP2mGnTH+FwKg5SoHsl+8v6U/GQwEg45Yr
 qbmVfMOP1x61QVTFGUrU/iJGzkLiqM5If9LgntOKm51b5WddhaOWiPOrlarVDGTPV1
 bQxVFP+Xsia2Q==
Received: from x201s (193-104-135-243.ip4.fiberby.net [193.104.135.243])
 by mail1.fiberby.net (Postfix) with ESMTPSA id 1DBA56058A;
 Thu,  4 Sep 2025 22:03:19 +0000 (UTC)
Received: by x201s (Postfix, from userid 1000)
 id 6F0AC201EBF; Thu, 04 Sep 2025 22:01:56 +0000 (UTC)
From: =?UTF-8?q?Asbj=C3=B8rn=20Sloth=20T=C3=B8nnesen?= <ast@fiberby.net>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: =?UTF-8?q?Asbj=C3=B8rn=20Sloth=20T=C3=B8nnesen?= <ast@fiberby.net>,
 Donald Hunter <donald.hunter@gmail.com>, Simon Horman <horms@kernel.org>,
 Jacob Keller <jacob.e.keller@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net-next 00/11] tools: ynl: prepare for wireguard
Date: Thu,  4 Sep 2025 22:01:23 +0000
Message-ID: <20250904-wg-ynl-prep@fiberby.net>
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

The next batch has been posted as an RFC series here:
https://lore.kernel.org/netdev/20250904-wg-ynl-rfc@fiberby.net/

Asbjørn Sloth Tønnesen (11):
  tools: ynl-gen: allow overriding name-prefix for constants
  tools: ynl-gen: generate nested array policies
  tools: ynl-gen: add sub-type check
  tools: ynl-gen: define count iterator in print_dump()
  tools: ynl-gen: define nlattr *array in a block scope
  tools: ynl-gen: don't validate nested array attribute types
  tools: ynl-gen: rename TypeArrayNest to TypeIndexedArray
  tools: ynl: move nest packing to a helper function
  tools: ynl: encode indexed-array
  tools: ynl: decode hex input
  tools: ynl: add ipv4-or-v6 display hint

 Documentation/netlink/genetlink-legacy.yaml |  2 +-
 tools/net/ynl/pyynl/lib/ynl.py              | 36 +++++++++++++++---
 tools/net/ynl/pyynl/ynl_gen_c.py            | 42 ++++++++++++++-------
 3 files changed, 59 insertions(+), 21 deletions(-)

-- 
2.51.0

