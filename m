Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB45FE6BF35
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 30 Jan 2026 19:11:54 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 59e31248;
	Fri, 30 Jan 2026 19:11:54 +0000 (UTC)
Received: from mail1.fiberby.net (mail1.fiberby.net [193.104.135.124])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 581246a3
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 30 Jan 2026 19:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fiberby.net;
 s=202008; t=1769800307;
 bh=++larkRBm2fTfFyrarp6DuqdULr6t6HyuTAZ8NT/9wc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AUrCmWEYxYzk0McrCeRXmnplliLMZR7bYsPOU0d+5uE4NLjOcJS7hEB8x1BzxdVSL
 x3oaUa7hZOxRelPcvak4ITLI/ORFs4b+K7TTX2qfKZjQGsU9mf6dPhugVsR/u0ppQJ
 n//e7sJfESKtAX49bouRrmKuTyp8XhBe/UuFF8O2Hp+khtdW9R6ajZXQMXzF4Mf79A
 MY6zxE/QMygelPBDBrO/MLPyUy4s5Z2iqDn9MFlrVcyoDuBaNjAnosQB95zCvxBS9t
 4QMiF/23GNPIbX/hFdT5SqaRD1JPqJcK/UTE6wFykR6Vu67qG0wiLhuQUIcfVWvAJV
 7DwiqzecHJugQ==
Received: from x201s (193-104-135-243.ip4.fiberby.net [193.104.135.243])
 by mail1.fiberby.net (Postfix) with ESMTPSA id A6179600BF;
 Fri, 30 Jan 2026 19:11:47 +0000 (UTC)
Received: by x201s (Postfix, from userid 1000)
 id D441F20225A; Fri, 30 Jan 2026 19:11:17 +0000 (UTC)
From: =?UTF-8?q?Asbj=C3=B8rn=20Sloth=20T=C3=B8nnesen?= <ast@fiberby.net>
To: "Jason A . Donenfeld" <Jason@zx2c4.com>
Cc: =?UTF-8?q?Asbj=C3=B8rn=20Sloth=20T=C3=B8nnesen?= <ast@fiberby.net>,
 wireguard@lists.zx2c4.com
Subject: [PATCH wireguard-tools v3 3/3] ipc: linux: remove user-space
 netdevice filtering
Date: Fri, 30 Jan 2026 19:10:55 +0000
Message-ID: <20260130191058.5123-4-ast@fiberby.net>
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

As devices are now filtered kernel-side, then we can remove
the code for filtering in user-space.

This breaks device listing for kernels earlier than Linux v4.6,
device-specific commands will continue to work.

As the minimum kernel version for wireguard-tools is unclear, it's
unclear if the user-space filtering can be removed yet.

Signed-off-by: Asbjørn Sloth Tønnesen <ast@fiberby.net>
---
 src/ipc-linux.h | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/src/ipc-linux.h b/src/ipc-linux.h
index 61e2c1a..639fb00 100644
--- a/src/ipc-linux.h
+++ b/src/ipc-linux.h
@@ -29,25 +29,13 @@
 
 struct interface {
 	const char *name;
-	bool is_wireguard;
 };
 
-static int parse_linkinfo(const struct nlattr *attr, void *data)
-{
-	struct interface *interface = data;
-
-	if (mnl_attr_get_type(attr) == IFLA_INFO_KIND && !strcmp(WG_GENL_NAME, mnl_attr_get_str(attr)))
-		interface->is_wireguard = true;
-	return MNL_CB_OK;
-}
-
 static int parse_infomsg(const struct nlattr *attr, void *data)
 {
 	struct interface *interface = data;
 
-	if (mnl_attr_get_type(attr) == IFLA_LINKINFO)
-		return mnl_attr_parse_nested(attr, parse_linkinfo, data);
-	else if (mnl_attr_get_type(attr) == IFLA_IFNAME)
+	if (mnl_attr_get_type(attr) == IFLA_IFNAME)
 		interface->name = mnl_attr_get_str(attr);
 	return MNL_CB_OK;
 }
@@ -61,7 +49,7 @@ static int read_devices_cb(const struct nlmsghdr *nlh, void *data)
 	ret = mnl_attr_parse(nlh, sizeof(struct ifinfomsg), parse_infomsg, &interface);
 	if (ret != MNL_CB_OK)
 		return ret;
-	if (interface.name && interface.is_wireguard)
+	if (interface.name)
 		ret = string_list_add(list, interface.name);
 	if (ret < 0)
 		return ret;
-- 
2.51.0

