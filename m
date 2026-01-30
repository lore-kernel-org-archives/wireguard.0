Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B5E7E6BF0A
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 30 Jan 2026 19:11:52 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f435949e;
	Fri, 30 Jan 2026 19:11:51 +0000 (UTC)
Received: from mail1.fiberby.net (mail1.fiberby.net [193.104.135.124])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2148a500
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 30 Jan 2026 19:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fiberby.net;
 s=202008; t=1769800307;
 bh=o49/9catq5AQ18PFNfj7m+IU5ZuDDZZi+MTcapHwo4c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=n7c7sPAtb97N3qJ/oSPwfefDVFPHiobGhozdvaQR7LxQgYLf7G8Pg7GoO8IW3zoa8
 vQnyOOMFYSTO9ihw1kwbywQvV7c7B0wMnuHAhBj1z+dO6sK847F/g67zqu1fatCn1h
 e1v9Vl4KjuxuEsYLduFUS2VP7L1f1+4uN0gI3Y57yAs0ilgh6/NgBBZnwaHJUBpiyy
 lDoePqcmOJsVqkR1HCW8nvahI2UUec9mNOXnEiNfzURRj+OspcnmJQE6UueDc9WQ8y
 zSX3D6eC4l2w772jdAWzXFX2FKTOkY6KCKceAtv7kEJS178QZ5voSyJHYj/EUfIpga
 h90op2JM7ITKg==
Received: from x201s (193-104-135-243.ip4.fiberby.net [193.104.135.243])
 by mail1.fiberby.net (Postfix) with ESMTPSA id A81E1600C1;
 Fri, 30 Jan 2026 19:11:47 +0000 (UTC)
Received: by x201s (Postfix, from userid 1000)
 id 80A2D2021A9; Fri, 30 Jan 2026 19:11:17 +0000 (UTC)
From: =?UTF-8?q?Asbj=C3=B8rn=20Sloth=20T=C3=B8nnesen?= <ast@fiberby.net>
To: "Jason A . Donenfeld" <Jason@zx2c4.com>
Cc: =?UTF-8?q?Asbj=C3=B8rn=20Sloth=20T=C3=B8nnesen?= <ast@fiberby.net>,
 wireguard@lists.zx2c4.com
Subject: [PATCH wireguard-tools v3 2/3] ipc: linux: skip statistics on
 netdevice listing
Date: Fri, 30 Jan 2026 19:10:54 +0000
Message-ID: <20260130191058.5123-3-ast@fiberby.net>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260130191058.5123-1-ast@fiberby.net>
References: <20260130191058.5123-1-ast@fiberby.net>
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

Gathering interface statistics can be a relatively expensive operation
on certain systems as it requires iterating over all the cpus.

This patch instructs the kernel to not include netdevice statistics,
in the netdevice listing.

Kernel-side support for this was added in Linux v4.4 in commit
d5566fd72ec1 ("rtnetlink: RTEXT_FILTER_SKIP_STATS support to avoid
dumping inet/inet6 stats"), this saves 368 bytes of statistics.

In the Linux v6.19 commit 105bae321862 ("rtnetlink: honor
RTEXT_FILTER_SKIP_STATS in IFLA_STATS"), it is expanded to skip more
statistics bringing the savings to 800 bytes per netdevice.

As the minimum kernel version for wireguard-tools is unclear, it's
wrapped in a #ifdef guard. If the minimum version is v4.4+ it can be
removed.

Signed-off-by: Asbjørn Sloth Tønnesen <ast@fiberby.net>
---
 src/ipc-linux.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/src/ipc-linux.h b/src/ipc-linux.h
index c56fede..61e2c1a 100644
--- a/src/ipc-linux.h
+++ b/src/ipc-linux.h
@@ -106,6 +106,9 @@ static int kernel_get_wireguard_interfaces(struct string_list *list)
 	nlh->nlmsg_seq = seq;
 	ifm = mnl_nlmsg_put_extra_header(nlh, sizeof(*ifm));
 	ifm->ifi_family = AF_UNSPEC;
+#ifdef RTEXT_FILTER_SKIP_STATS
+	mnl_attr_put_u32(nlh, IFLA_EXT_MASK, RTEXT_FILTER_SKIP_STATS);
+#endif
 
 	linkinfo_nest = mnl_attr_nest_start(nlh, IFLA_LINKINFO);
 	mnl_attr_put_strz(nlh, IFLA_INFO_KIND, WG_GENL_NAME);
-- 
2.51.0

