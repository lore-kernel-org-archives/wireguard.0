Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70BB7CA1017
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  5 Sep 2025 19:54:02 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0ca00e76;
	Fri, 5 Sep 2025 19:54:00 +0000 (UTC)
Received: from mail.asbjorn.biz (mail.asbjorn.biz [194.165.56.46])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4755a1ee
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 5 Sep 2025 19:53:58 +0000 (UTC)
Received: from x201s (space.labitat.dk [45.145.93.0])
 by mail.asbjorn.biz (Postfix) with ESMTPSA id C50261C01426;
 Fri,  5 Sep 2025 19:53:57 +0000 (UTC)
Received: by x201s (Postfix, from userid 1000)
 id 6E06720228C; Fri, 05 Sep 2025 19:52:01 +0000 (UTC)
From: =?UTF-8?q?Asbj=C3=B8rn=20Sloth=20T=C3=B8nnesen?= <wireguard@asbjorn.st>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: =?UTF-8?q?Asbj=C3=B8rn=20Sloth=20T=C3=B8nnesen?= <wireguard@asbjorn.st>,
 wireguard@lists.zx2c4.com
Subject: [PATCH] ipc: linux: filter netdevices kernel-side
Date: Fri,  5 Sep 2025 19:51:49 +0000
Message-ID: <20250905195150.1134769-1-wireguard@asbjorn.st>
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

Tell the kernel that we are only interested in wireguard
netdevices, so that the kernel don't have to tells us about
all the other netdevices.

Tested with 10000 netdevices (common with ISP BNG setups),
out of which 1 was a wireguard netdevice.

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

Signed-off-by: Asbjørn Sloth Tønnesen <wireguard@asbjorn.st>
---
NB: Since this email has been on the list a long-time, then
maybe it will avoid moderation.

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

