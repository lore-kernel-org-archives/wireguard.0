Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A569D106ACF1
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Mar 2026 21:44:49 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id a039539f;
	Thu, 12 Mar 2026 21:44:49 +0000 (UTC)
Received: from mail1.fiberby.net (mail1.fiberby.net [193.104.135.124])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id b4c118a5
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Mar 2026 21:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fiberby.net;
 s=202008; t=1773351877;
 bh=S6H/FBN3h0HnzHc+JzuILWfzw288s51nqdlzRfSCthc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WeQ928TfAaaU4UBdflc19B2kGLYfAEiqxBQaatJEwecGhd3ZcpgkQ9sBQm88+B7gB
 qH2YlZ6ejhPpz5R4JLt3uM+IbkxNo1zfAcIzylAl+Ec2PoCjLekWrA803XDP3xu3s+
 0KQ/A3q2/QIEQTcUBFOESwdd0c2KuR5gCgNMS4R+CL4obSieJdL8dJYxxXGBsxXyRy
 vi0gPpktY0wLNa6Ym4gwZvSdQwrUTgw/XR/I6SmrMS4lVlIB0GVyKFrvwSbLSlGtDG
 6P/FX/Vk27aK5kSwXWWXKqnUlTz8v6x3XvXNogudSnlM7jRZjY/N4R3ACMFlO+2vTh
 TCQyKmPASlnIQ==
Received: from x201s (193-104-135-243.ip4.fiberby.net [193.104.135.243])
 by mail1.fiberby.net (Postfix) with ESMTPSA id 7119A600C1;
 Thu, 12 Mar 2026 21:44:37 +0000 (UTC)
Received: by x201s (Postfix, from userid 1000)
 id 4AA0D2028E2; Thu, 12 Mar 2026 21:44:21 +0000 (UTC)
From: =?UTF-8?q?Asbj=C3=B8rn=20Sloth=20T=C3=B8nnesen?= <ast@fiberby.net>
To: "Jason A . Donenfeld" <Jason@zx2c4.com>
Cc: =?UTF-8?q?Asbj=C3=B8rn=20Sloth=20T=C3=B8nnesen?= <ast@fiberby.net>,
 wireguard@lists.zx2c4.com
Subject: [PATCH wireguard-tools v4 2/3] ipc: linux: remove user-space
 netdevice filtering
Date: Thu, 12 Mar 2026 21:44:00 +0000
Message-ID: <20260312214405.589127-3-ast@fiberby.net>
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

Since the devices are now filtered kernel-side, we can remove
the code for filtering in user-space.

This breaks device listing for kernels earlier than Linux v4.6,
device-specific commands will continue to work.

Despite the subject prefix, this patch also applies to the
embeddable C library, so the two implementations stay in sync.

Signed-off-by: Asbjørn Sloth Tønnesen <ast@fiberby.net>
---
 contrib/embeddable-wg-library/wireguard.c | 16 ++--------------
 src/ipc-linux.h                           | 16 ++--------------
 2 files changed, 4 insertions(+), 28 deletions(-)

diff --git a/contrib/embeddable-wg-library/wireguard.c b/contrib/embeddable-wg-library/wireguard.c
index 7ac0d6c..eff441b 100644
--- a/contrib/embeddable-wg-library/wireguard.c
+++ b/contrib/embeddable-wg-library/wireguard.c
@@ -892,25 +892,13 @@ static int string_list_add(struct string_list *list, const char *str)
 
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
@@ -924,7 +912,7 @@ static int read_devices_cb(const struct nlmsghdr *nlh, void *data)
 	ret = mnl_attr_parse(nlh, sizeof(struct ifinfomsg), parse_infomsg, &interface);
 	if (ret != MNL_CB_OK)
 		return ret;
-	if (interface.name && interface.is_wireguard)
+	if (interface.name)
 		ret = string_list_add(list, interface.name);
 	if (ret < 0)
 		return ret;
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
2.53.0

