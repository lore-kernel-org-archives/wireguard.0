Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D84E8E6BF36
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 30 Jan 2026 19:11:55 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a759bc95;
	Fri, 30 Jan 2026 19:11:55 +0000 (UTC)
Received: from mail1.fiberby.net (mail1.fiberby.net [193.104.135.124])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 93f011b5
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 30 Jan 2026 19:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fiberby.net;
 s=202008; t=1769800307;
 bh=DxW3T4ZRdnRKrNhGlqV5Rfl4582qkYZ7qZUdsZlxHnc=;
 h=From:To:Cc:Subject:Date:From;
 b=cCcKOZWIt5y8FUJwDOnoTtbTS+GTTPqCppO730VoU+Ep4dFNJFHd3af88mqwYHpsl
 EMchBa2ZpVA0cJg7Ao2ZwSRCP8VK5L1RJTxStue3Yxq8ec3rACm2J5ylMOiRejM6CI
 e8bBbjuRbnJ7/E3/VO4AUh99lpEy0zeOeAZjkHnybi32EAbs86bVnJKi0h+vqMf5Bw
 qE8m/sYyjmDoPf/NbciyFcxSxanWvCGX50y1n2qtTdE3ZeL2LJRn/cs2gMqagDuteX
 3QhXK3GhpsyFByzBFOTWbN8FyZ36/C1OV9mrQt4MJ6vLzux6JriCrh+D9gxPiXHTc7
 L2yTuCXIqH1Ng==
Received: from x201s (193-104-135-243.ip4.fiberby.net [193.104.135.243])
 by mail1.fiberby.net (Postfix) with ESMTPSA id B4053600FC;
 Fri, 30 Jan 2026 19:11:47 +0000 (UTC)
Received: by x201s (Postfix, from userid 1000)
 id 433D52016B3; Fri, 30 Jan 2026 19:11:07 +0000 (UTC)
From: =?UTF-8?q?Asbj=C3=B8rn=20Sloth=20T=C3=B8nnesen?= <ast@fiberby.net>
To: "Jason A . Donenfeld" <Jason@zx2c4.com>
Cc: =?UTF-8?q?Asbj=C3=B8rn=20Sloth=20T=C3=B8nnesen?= <ast@fiberby.net>,
 wireguard@lists.zx2c4.com
Subject: [PATCH wireguard-tools v3 0/3] ipc: linux: kernel-side netdevice
 filtering
Date: Fri, 30 Jan 2026 19:10:52 +0000
Message-ID: <20260130191058.5123-1-ast@fiberby.net>
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

The second patch requests that the kernel doesn't include statistics
in netdevice dumps.

The third patch removes the old filtering code, as an
additional step, which breaks on earlier than Linux v4.6.

I assume that a dependency on Linux v4.6+ is acceptable for wg-tools
now, as wireguard-linux-compat haven't been updated for 3 years.

---
Changes:
v3:
- Added patch to set RTEXT_FILTER_SKIP_STATS
- Re-worked commit messages a bit.

v2: https://lists.zx2c4.com/pipermail/wireguard/2025-October/009080.html
- Added info about kernel-support to commit message
- Added another patch, for removing client-side filtering

v1: https://lists.zx2c4.com/pipermail/wireguard/2025-September/009004.html

Asbjørn Sloth Tønnesen (3):
  ipc: linux: filter netdevices kernel-side
  ipc: linux: skip statistics on netdevice listing
  ipc: linux: remove user-space netdevice filtering

 src/ipc-linux.h | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

-- 
2.51.0

