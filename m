Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DDE4CCF9F8
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Oct 2025 19:13:26 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d562c4b7;
	Thu, 30 Oct 2025 19:13:24 +0000 (UTC)
Received: from mail.asbjorn.biz (mail.asbjorn.biz [194.165.56.46])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 04b2c660
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Oct 2025 19:13:23 +0000 (UTC)
Received: from x201s (space.labitat.dk [45.145.93.0])
 by mail.asbjorn.biz (Postfix) with ESMTPSA id B4A2B1C01429;
 Thu, 30 Oct 2025 19:13:22 +0000 (UTC)
Received: by x201s (Postfix, from userid 1000)
 id D888F2021E1; Thu, 30 Oct 2025 19:13:08 +0000 (UTC)
From: =?UTF-8?q?Asbj=C3=B8rn=20Sloth=20T=C3=B8nnesen?= <wireguard@asbjorn.st>
To: "Jason A . Donenfeld" <Jason@zx2c4.com>
Cc: =?UTF-8?q?Asbj=C3=B8rn=20Sloth=20T=C3=B8nnesen?= <wireguard@asbjorn.st>,
 wireguard@lists.zx2c4.com
Subject: [PATCH wireguard-tools v2 0/2] ipc: linux: kernel-side device
 filtering
Date: Thu, 30 Oct 2025 19:13:00 +0000
Message-ID: <20251030191305.800464-1-wireguard@asbjorn.st>
X-Mailer: git-send-email 2.51.0
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

I assume that a dependency on Linux v4.6+ is acceptable for wg-tools
now, as wireguard-linux-compat haven't been updated for 3 years.

---
Changes:
v2:
- Added info about kernel-support to commit message
- Added another patch, for removing client-side filtering

v1: https://lists.zx2c4.com/pipermail/wireguard/2025-September/009004.html

Asbjørn Sloth Tønnesen (2):
  ipc: linux: filter netdevices kernel-side
  ipc: linux: remove user-space device filtering

 src/ipc-linux.h | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

-- 
2.51.0

