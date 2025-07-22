Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D19C83F27
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 22 Jul 2025 17:18:41 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 92219e99;
	Tue, 22 Jul 2025 17:18:39 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0fda07cb
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 22 Jul 2025 17:18:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D1FA661444;
 Tue, 22 Jul 2025 17:18:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E765C4CEF1;
 Tue, 22 Jul 2025 17:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753204716;
 bh=UnNuwo/BfQjXh7XFgPBvTHasv/WlnvVIhRYKBEoO4OM=;
 h=From:To:Cc:Subject:Date:From;
 b=f6+S8bM7CeQ3p9S6Tyot3Lnuz+8SKrMnJfPpK2LxFEdqhA0SpCo9mnXvn/etxb9lY
 f3T5zLqsawoIV11hdjIsXrtTe1RUv52LRmsh4FM5AA5oeHFO8y+J/QrqINMJaCkC5R
 sWcay7+pf0THhp8XKiGZRcMGVwJh+yBf4is6nuzysW3D4ROn2zC72KtmZnLTkxXbGU
 TR/GFQBlf2ZxoGDngLY4PSwb3cUHQZDd5hKHuF9D8fGat76NCuP/0YUbCwOGiml0/r
 r++qnlJohLskB46xLSp4ghvqSRq0d/sjCN8ET3l1eflD3ZnAMBhzY0EPbeeMNG2tk0
 aa0UGSycZqmgw==
From: Kees Cook <kees@kernel.org>
To: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
Cc: Kees Cook <kees@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Xin Long <lucien.xin@gmail.com>, Simon Horman <horms@kernel.org>,
 linux-kernel@vger.kernel.org, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, linux-sctp@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: [PATCH net-next 0/3] net: Add sockaddr_inet unified address structure
Date: Tue, 22 Jul 2025 10:18:30 -0700
Message-Id: <20250722171528.work.209-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2090; i=kees@kernel.org;
 h=from:subject:message-id; bh=UnNuwo/BfQjXh7XFgPBvTHasv/WlnvVIhRYKBEoO4OM=;
 b=owGbwMvMwCVmps19z/KJym7G02pJDBn1x59fDJn7O3mP3sJrcp2XTuYsbeGNcX64IZBtnqjN6
 4/tixoXd5SyMIhxMciKKbIE2bnHuXi8bQ93n6sIM4eVCWQIAxenAEyESYCR4XqOqQ5Hw+1lMo37
 RQ6JmQbq/zyUv8m641KfrMDbptR9DowMm0+eOVsY+6FWc49m1/X79rmv23fr8jOkyHqHKjG5KnH
 zAwA=
X-Developer-Key: i=kees@kernel.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
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

Hi!

Repeating patch 1, as it has the rationale:

    There are cases in networking (e.g. wireguard, sctp) where a union is
    used to provide coverage for either IPv4 or IPv6 network addresses,
    and they include an embedded "struct sockaddr" as well (for "sa_family"
    and raw "sa_data" access). The current struct sockaddr contains a
    flexible array, which means these unions should not be further embedded
    in other structs because they do not technically have a fixed size (and
    are generating warnings for the coming -Wflexible-array-not-at-end flag
    addition). But the future changes to make struct sockaddr a fixed size
    (i.e. with a 14 byte sa_data member) make the "sa_data" uses with an IPv6
    address a potential place for the compiler to get upset about object size
    mismatches. Therefore, we need a sockaddr that cleanly provides both an
    sa_family member and an appropriately fixed-sized sa_data member that does
    not bloat member usage via the potential alternative of sockaddr_storage
    to cover both IPv4 and IPv6, to avoid unseemly churn in the affected code
    bases.

    Introduce sockaddr_inet as a unified structure for holding both IPv4 and
    IPv6 addresses (i.e. large enough to accommodate sockaddr_in6).

    The structure is defined in linux/in6.h since its max size is sized
    based on sockaddr_in6 and provides a more specific alternative to the
    generic sockaddr_storage for IPv4 with IPv6 address family handling.

    The "sa_family" member doesn't use the sa_family_t type to avoid needing
    layer violating header inclusions.

Also includes the replacements for wireguard and sctp.

Thanks,

-Kees

Kees Cook (3):
  ipv6: Add sockaddr_inet unified address structure
  wireguard: peer: Replace sockaddr with sockaddr_inet
  sctp: Replace sockaddr with sockaddr_inet in sctp_addr union

 drivers/net/wireguard/peer.h | 2 +-
 include/linux/in6.h          | 7 +++++++
 include/net/sctp/structs.h   | 2 +-
 3 files changed, 9 insertions(+), 2 deletions(-)

-- 
2.34.1

