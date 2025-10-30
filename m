Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8546ACCF9FE
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Oct 2025 19:13:28 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id af6539cd;
	Thu, 30 Oct 2025 19:13:27 +0000 (UTC)
Received: from mail.asbjorn.biz (mail.asbjorn.biz [194.165.56.46])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7caa1e3d
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Oct 2025 19:13:23 +0000 (UTC)
Received: from x201s (space.labitat.dk [45.145.93.0])
 by mail.asbjorn.biz (Postfix) with ESMTPSA id EF3421C0142A;
 Thu, 30 Oct 2025 19:13:22 +0000 (UTC)
Received: by x201s (Postfix, from userid 1000)
 id DBB2020308B; Thu, 30 Oct 2025 19:13:15 +0000 (UTC)
From: =?UTF-8?q?Asbj=C3=B8rn=20Sloth=20T=C3=B8nnesen?= <wireguard@asbjorn.st>
To: "Jason A . Donenfeld" <Jason@zx2c4.com>
Cc: =?UTF-8?q?Asbj=C3=B8rn=20Sloth=20T=C3=B8nnesen?= <wireguard@asbjorn.st>,
 wireguard@lists.zx2c4.com
Subject: [PATCH wireguard-tools v2 2/2] ipc: linux: remove user-space device
 filtering
Date: Thu, 30 Oct 2025 19:13:02 +0000
Message-ID: <20251030191305.800464-3-wireguard@asbjorn.st>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251030191305.800464-1-wireguard@asbjorn.st>
References: <20251030191305.800464-1-wireguard@asbjorn.st>
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

This breaks device listing for kernels earlier than Linux v4.6.

Signed-off-by: Asbjørn Sloth Tønnesen <wireguard@asbjorn.st>
---
 src/ipc-linux.h | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/src/ipc-linux.h b/src/ipc-linux.h
index c56fede..45bb55c 100644
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

