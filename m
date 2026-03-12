Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4D0F106ACEC
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Mar 2026 21:44:48 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 58a4ed23;
	Thu, 12 Mar 2026 21:44:48 +0000 (UTC)
Received: from mail1.fiberby.net (mail1.fiberby.net [193.104.135.124])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id d34db598
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Mar 2026 21:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fiberby.net;
 s=202008; t=1773351877;
 bh=9xpEXLvULOnKPuz3XIM5lWsHgqHw7na6cIWmA+57y70=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NEFXrLuInlhbKGKJkzCbJkEFQh8DgVrZ4kuW5JMwJdFcHfcqUSu7YFy5tgDyS9hDW
 RRWhA+gZsLFUGkXXzDDrWF7zDSZqiZYIfH4iWo/PWH31JqXc+Im6QaI+Ywg6gV/84/
 Zu9zyYw23H+Gf6238jn4UlvzNrGJgD3nGDS2Z87Qy3wGjufA0WdKuur86mjAkHT0aP
 DPuO4aFyJO8cttm/U7t9JXrFYa6DduUILqF6LuapMIi6rX5T/ATVtJaBRvh1CNWKmR
 Di7VUjqrQ2fl3oAbUX2E1h2ebwv4dWmyYqNZ4Ic5MmeC0r5n8aMTI36ob+nvZAo4sq
 3pSZ904lBPOEw==
Received: from x201s (193-104-135-243.ip4.fiberby.net [193.104.135.243])
 by mail1.fiberby.net (Postfix) with ESMTPSA id 623B6600BF;
 Thu, 12 Mar 2026 21:44:37 +0000 (UTC)
Received: by x201s (Postfix, from userid 1000)
 id ABD4A202A16; Thu, 12 Mar 2026 21:44:21 +0000 (UTC)
From: =?UTF-8?q?Asbj=C3=B8rn=20Sloth=20T=C3=B8nnesen?= <ast@fiberby.net>
To: "Jason A . Donenfeld" <Jason@zx2c4.com>
Cc: =?UTF-8?q?Asbj=C3=B8rn=20Sloth=20T=C3=B8nnesen?= <ast@fiberby.net>,
 wireguard@lists.zx2c4.com
Subject: [PATCH wireguard-tools v4 3/3] ipc: linux: skip statistics on
 netdevice listing
Date: Thu, 12 Mar 2026 21:44:01 +0000
Message-ID: <20260312214405.589127-4-ast@fiberby.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260312214405.589127-1-ast@fiberby.net>
References: <20260312214405.589127-1-ast@fiberby.net>
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

Despite the subject prefix, this patch also applies to the
embeddable C library, so the two implementations stay in sync.

Signed-off-by: Asbjørn Sloth Tønnesen <ast@fiberby.net>
---
 contrib/embeddable-wg-library/wireguard.c | 1 +
 src/ipc-linux.h                           | 1 +
 2 files changed, 2 insertions(+)

diff --git a/contrib/embeddable-wg-library/wireguard.c b/contrib/embeddable-wg-library/wireguard.c
index eff441b..686cd3a 100644
--- a/contrib/embeddable-wg-library/wireguard.c
+++ b/contrib/embeddable-wg-library/wireguard.c
@@ -957,6 +957,7 @@ static int fetch_device_names(struct string_list *list)
 	nlh->nlmsg_seq = seq;
 	ifm = mnl_nlmsg_put_extra_header(nlh, sizeof(*ifm));
 	ifm->ifi_family = AF_UNSPEC;
+	mnl_attr_put_u32(nlh, IFLA_EXT_MASK, RTEXT_FILTER_SKIP_STATS);
 
 	linkinfo_nest = mnl_attr_nest_start(nlh, IFLA_LINKINFO);
 	mnl_attr_put_strz(nlh, IFLA_INFO_KIND, WG_GENL_NAME);
diff --git a/src/ipc-linux.h b/src/ipc-linux.h
index 45bb55c..791eb84 100644
--- a/src/ipc-linux.h
+++ b/src/ipc-linux.h
@@ -94,6 +94,7 @@ static int kernel_get_wireguard_interfaces(struct string_list *list)
 	nlh->nlmsg_seq = seq;
 	ifm = mnl_nlmsg_put_extra_header(nlh, sizeof(*ifm));
 	ifm->ifi_family = AF_UNSPEC;
+	mnl_attr_put_u32(nlh, IFLA_EXT_MASK, RTEXT_FILTER_SKIP_STATS);
 
 	linkinfo_nest = mnl_attr_nest_start(nlh, IFLA_LINKINFO);
 	mnl_attr_put_strz(nlh, IFLA_INFO_KIND, WG_GENL_NAME);
-- 
2.53.0

