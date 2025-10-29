Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1567CF3966
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Nov 2025 17:17:20 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id be87d0fa;
	Tue, 18 Nov 2025 17:32:51 +0000 (UTC)
Received: from mail1.fiberby.net (mail1.fiberby.net [193.104.135.124])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 91c41531
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Oct 2025 20:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fiberby.net;
 s=202008; t=1761771115;
 bh=KV9UVgCkqouJnikGNIjL29VEwbmmtAbHwtbsaIvTk2s=;
 h=From:To:Cc:Subject:Date:From;
 b=FLF1GT7qr19AGWmGkFOlLhJpotsQeztnM/cvmXV8BDFjNK0Safqa2JBEE0NdZCC+2
 7Z06qImjnZTVd+1WXnBm8YWJ/O3rU+R8oTqcPUR5B6OgKWH50S2XNwoXmQxfYxkNkp
 Ic7aPKA20q0BBGhXyJmsqswAMrwopq7AFQLvN3oYPQ8KPFRAZGsDL2FndquGJQOGvJ
 0uGi8LSu5NoFsGkuU0sCQRTA0s11dCvOoyDCTXFjxlbxD8Z7iXKDBeyT+kjfWJJJ6p
 SqPVZMtpfT4W6OJvHyVu7HnxKRrtp/JonnYZA7IbEYCgwEtL4CgVyC8mmwMK9Mxz0J
 +CCtc277b24yQ==
Received: from x201s (193-104-135-243.ip4.fiberby.net [193.104.135.243])
 by mail1.fiberby.net (Postfix) with ESMTPSA id 43E3460115;
 Wed, 29 Oct 2025 20:51:55 +0000 (UTC)
Received: by x201s (Postfix, from userid 1000)
 id CDBD92021CC; Wed, 29 Oct 2025 20:51:29 +0000 (UTC)
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
Subject: [PATCH net-next v1 00/11] wireguard: netlink: ynl conversion
Date: Wed, 29 Oct 2025 20:51:08 +0000
Message-ID: <20251029205123.286115-1-ast@fiberby.net>
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

This series completes the implementation of YNL for wireguard,
as previously announced[1].

This series consist of 5 parts:
1) Patch 01-03 - Misc. changes
2) Patch    04 - Add YNL specification for wireguard
3) Patch 05-07 - Transition to a generated UAPI header
4) Patch    08 - Adds a sample program for the generated C library
5) Patch 09-11 - Transition to generated netlink policy code

The main benefit of having a YNL specification is unlocked after the
first 2 parts, the RFC version seems to already have spawned a new
Rust netlink binding[2] using wireguard as it's main example.

Part 3 and 5 validates that the specification is complete and aligned,
the generated code might have a few warts, but they don't matter too
much, and are mostly a transitional problem[3].

Part 4 is possible after part 2, but is ordered after part 3,
as it needs to duplicate the UAPI header in tools/include.

For the non-generated kernel C code the diff stat looks like this:

$ git diff --stat net-next/main..wg-ynl include/ drivers/ \
	':(exclude)*netlink_gen*'
 drivers/net/wireguard/Makefile  |   1 +
 drivers/net/wireguard/netlink.c |  70 +++---------
 include/uapi/linux/wireguard.h  | 190 ++++++--------------------------
 3 files changed, 47 insertions(+), 214 deletions(-)

[1] [PATCH net 0/4] tools: ynl-gen: misc fixes + wireguard ynl plan
    https://lore.kernel.org/r/20250901145034.525518-1-ast@fiberby.net/

[2] https://github.com/one-d-wide/netlink-bindings/

[3] https://lore.kernel.org/r/20251014123201.6ecfd146@kernel.org/

---
v1:
- Policy arguement to nla_parse_nested() changed to NULL (thanks Johannes).
- Added attr-cnt-name to the spec, to reduce the diff a bit.
- Refined the doc in the spec a bit.
- Reword commit messages a bit.
- Reordered the patches, and reduced the series from 14 to 11 patches.

RFC: https://lore.kernel.org/r/20250904-wg-ynl-rfc@fiberby.net/

diff -Naur a/sent/0904/b/0002-wireguard-netlink-validate-nested-arrays-in-policy.patch 0001-wireguard-netlink-validate-nested-arrays-in-policy.patch
diff -Naur a/sent/0904/b/0001-wireguard-netlink-use-WG_KEY_LEN-in-policies.patch 0002-wireguard-netlink-use-WG_KEY_LEN-in-policies.patch
diff -Naur a/sent/0904/b/0013-wireguard-netlink-enable-strict-genetlink-validation.patch 0003-wireguard-netlink-enable-strict-genetlink-validation.patch
diff -Naur a/sent/0904/b/0003-netlink-specs-add-specification-for-wireguard.patch 0004-netlink-specs-add-specification-for-wireguard.patch





Asbjørn Sloth Tønnesen (11):
  wireguard: netlink: validate nested arrays in policy
  wireguard: netlink: use WG_KEY_LEN in policies
  wireguard: netlink: enable strict genetlink validation
  netlink: specs: add specification for wireguard
  uapi: wireguard: move enum wg_cmd
  uapi: wireguard: move flag enums
  uapi: wireguard: generate header with ynl-gen
  tools: ynl: add sample for wireguard
  wireguard: netlink: convert to split ops
  wireguard: netlink: rename netlink handlers
  wireguard: netlink: generate netlink code

 Documentation/netlink/specs/wireguard.yaml | 307 +++++++++++++++++++++
 MAINTAINERS                                |   3 +
 drivers/net/wireguard/Makefile             |   1 +
 drivers/net/wireguard/netlink.c            |  70 +----
 drivers/net/wireguard/netlink_gen.c        |  77 ++++++
 drivers/net/wireguard/netlink_gen.h        |  29 ++
 include/uapi/linux/wireguard.h             | 190 +++----------
 tools/include/uapi/linux/wireguard.h       |  79 ++++++
 tools/net/ynl/samples/.gitignore           |   1 +
 tools/net/ynl/samples/wireguard.c          | 104 +++++++
 10 files changed, 647 insertions(+), 214 deletions(-)
 create mode 100644 Documentation/netlink/specs/wireguard.yaml
 create mode 100644 drivers/net/wireguard/netlink_gen.c
 create mode 100644 drivers/net/wireguard/netlink_gen.h
 create mode 100644 tools/include/uapi/linux/wireguard.h
 create mode 100644 tools/net/ynl/samples/wireguard.c

-- 
2.51.0

