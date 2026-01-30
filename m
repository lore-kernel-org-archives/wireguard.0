Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C59ECE6BF0A
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 30 Jan 2026 19:11:56 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f8dc2cb1;
	Fri, 30 Jan 2026 19:11:56 +0000 (UTC)
Received: from mail1.fiberby.net (mail1.fiberby.net [193.104.135.124])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id cbd3235c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 30 Jan 2026 19:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fiberby.net;
 s=202008; t=1769800308;
 bh=0AiP2nIUh34g7fpqUtP5HA9PnQnAA/zIijQfQYwaEzE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YLcoDpx+J8c/4oayxduNKGMiscoPQL4OIieY3eCD+nxd6L31kvHOzqFs+2tB208Wf
 dOyzARd2Qdg6ULUPa6SnueMlWayYgW23vIV8MDQXokzqK37rEW5wzPbHiib0CXKMop
 t2dySk7Y1VeF7FpdDJPP9Tc7HMHRRiV+EL4/2oeC92WtCWhn6z17vdOTpBYRwdwSfR
 /fdkUVwMrVy4xI4jkb30of2+ya35wbMb6k2S/MYBh808viR6yLOAalwtoBJkUr4+py
 7SMsr2dB+0mpDWjWjSyiVzx2PA8QgzZqgkMnBBoPXBjMXDCye7owwpAto4M4k2SO5o
 j10+7k9EFt2fQ==
Received: from x201s (193-104-135-243.ip4.fiberby.net [193.104.135.243])
 by mail1.fiberby.net (Postfix) with ESMTPSA id 2B46660107;
 Fri, 30 Jan 2026 19:11:48 +0000 (UTC)
Received: by x201s (Postfix, from userid 1000)
 id 15A61202088; Fri, 30 Jan 2026 19:11:17 +0000 (UTC)
From: =?UTF-8?q?Asbj=C3=B8rn=20Sloth=20T=C3=B8nnesen?= <ast@fiberby.net>
To: "Jason A . Donenfeld" <Jason@zx2c4.com>
Cc: =?UTF-8?q?Asbj=C3=B8rn=20Sloth=20T=C3=B8nnesen?= <ast@fiberby.net>,
 wireguard@lists.zx2c4.com
Subject: [PATCH wireguard-tools v3 1/3] ipc: linux: filter netdevices
 kernel-side
Date: Fri, 30 Jan 2026 19:10:53 +0000
Message-ID: <20260130191058.5123-2-ast@fiberby.net>
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

Tell the kernel that we are only interested in wireguard netdevices,
so that the kernel don't have to dump all the other netdevices.

Kernel-side support for this was added in Linux v4.6 in
commit dc599f76c22b ("net: Add support for filtering link dump by
master device and kind").

Tested with 10000 netdevices (common with ISP BNG setups), and a
single wireguard netdevice.

Baseline:
  # time ./src/wg show
  real    0m0.342s
  user    0m0.013s
  sys     0m0.290s

With patch:
  # time ./src/wg show
  real    0m0.006s
  user    0m0.000s
  sys     0m0.005s

Signed-off-by: Asbjørn Sloth Tønnesen <ast@fiberby.net>
---
 src/ipc-linux.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/src/ipc-linux.h b/src/ipc-linux.h
index 01247f1..c56fede 100644
--- a/src/ipc-linux.h
+++ b/src/ipc-linux.h
@@ -80,6 +80,7 @@ static int kernel_get_wireguard_interfaces(struct string_list *list)
 	int ret = 0;
 	struct nlmsghdr *nlh;
 	struct ifinfomsg *ifm;
+	struct nlattr *linkinfo_nest;
 
 	ret = -ENOMEM;
 	rtnl_buffer = calloc(SOCKET_BUFFER_SIZE, 1);
@@ -105,6 +106,11 @@ static int kernel_get_wireguard_interfaces(struct string_list *list)
 	nlh->nlmsg_seq = seq;
 	ifm = mnl_nlmsg_put_extra_header(nlh, sizeof(*ifm));
 	ifm->ifi_family = AF_UNSPEC;
+
+	linkinfo_nest = mnl_attr_nest_start(nlh, IFLA_LINKINFO);
+	mnl_attr_put_strz(nlh, IFLA_INFO_KIND, WG_GENL_NAME);
+	mnl_attr_nest_end(nlh, linkinfo_nest);
+
 	message_len = nlh->nlmsg_len;
 
 	if (mnl_socket_sendto(nl, rtnl_buffer, message_len) < 0) {
-- 
2.51.0

