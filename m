Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3187106ACEE
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Mar 2026 21:44:43 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id ab5598fc;
	Thu, 12 Mar 2026 21:44:41 +0000 (UTC)
Received: from mail1.fiberby.net (mail1.fiberby.net [193.104.135.124])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id d2c5a451
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Mar 2026 21:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fiberby.net;
 s=202008; t=1773351877;
 bh=Z+QbvAI46HYH/IvoK5SofvBAx57Gkh77cVsq2YdY0X0=;
 h=From:To:Cc:Subject:Date:From;
 b=LWvnvNoCDD15NLT4zihV+GUyKksU1taPuSmbyubsNjabUots7alOIO+Y8dYrLJmAN
 +VeNC0T3tQRohhcCKRuC2b5TSEWPGPn8urH4ShIR80LbS+LQ1wQIJC509NfdyKo4+E
 YDiau1vrN/SURA/kudgWu2XaDnvv8470QBQ0xBiwlzClX2r5Eio2lJdkXyCXjGwgen
 0zN5ExZuy/xZ/m2lBxYknJPm9JhZitpuWLiQGV81pivmQK/nUXZDvXgV7iJkf51Wx7
 +cZTryyXjgh37IcR40BFC5D4JcLYyrANUe7qj6la3KB83FrdLg1zZJgzcz7mJjE+T2
 EhqEIRXGgakOw==
Received: from x201s (193-104-135-243.ip4.fiberby.net [193.104.135.243])
 by mail1.fiberby.net (Postfix) with ESMTPSA id 387666000C;
 Thu, 12 Mar 2026 21:44:37 +0000 (UTC)
Received: by x201s (Postfix, from userid 1000)
 id 15496201F62; Thu, 12 Mar 2026 21:44:20 +0000 (UTC)
From: =?UTF-8?q?Asbj=C3=B8rn=20Sloth=20T=C3=B8nnesen?= <ast@fiberby.net>
To: "Jason A . Donenfeld" <Jason@zx2c4.com>
Cc: =?UTF-8?q?Asbj=C3=B8rn=20Sloth=20T=C3=B8nnesen?= <ast@fiberby.net>,
 wireguard@lists.zx2c4.com
Subject: [PATCH wireguard-tools v4 0/3] ipc: linux: kernel-side netdevice
 filtering
Date: Thu, 12 Mar 2026 21:43:58 +0000
Message-ID: <20260312214405.589127-1-ast@fiberby.net>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Move device filtering to the kernel, thereby reducing netlink traffic.

The first patch request kernel-side filtering.

The second patch removes the old filtering code, as an
additional step, which breaks on earlier than Linux v4.6.

The third patch requests that the kernel doesn't include statistics
in netdevice dumps.

This bumps the minimum supported Linux kernel version to v4.6.

---
Changes:
v4:
- Remove #ifdef RTEXT_FILTER_SKIP_STATS.
- Sync changes to the embeddable C library.
- Now that Linux v4.6+ is fine, swap the order of patch 2 and 3.
- Dusted of the commit messages a bit.

v3: https://lists.zx2c4.com/pipermail/wireguard/2026-January/009471.html
- Added patch to set RTEXT_FILTER_SKIP_STATS
- Re-worked commit messages a bit.

v2: https://lists.zx2c4.com/pipermail/wireguard/2025-October/009080.html
- Added info about kernel-support to commit message
- Added another patch, for removing client-side filtering

v1: https://lists.zx2c4.com/pipermail/wireguard/2025-September/009004.html


Asbjørn Sloth Tønnesen (3):
  ipc: linux: filter netdevices kernel-side
  ipc: linux: remove user-space netdevice filtering
  ipc: linux: skip statistics on netdevice listing

 contrib/embeddable-wg-library/wireguard.c | 23 +++++++++--------------
 src/ipc-linux.h                           | 23 +++++++++--------------
 2 files changed, 18 insertions(+), 28 deletions(-)

-- 
2.53.0

