Return-Path: <SRS0=VbKr=4W=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59B0AC3F2D7
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  5 Mar 2020 02:53:09 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7740220838
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  5 Mar 2020 02:53:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7740220838
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=distanz.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1cad39df;
	Thu, 5 Mar 2020 02:47:43 +0000 (UTC)
Received: from sym2.noone.org (sym2.noone.org [178.63.92.236])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4117b3f7
 for <wireguard@lists.zx2c4.com>; Wed, 4 Mar 2020 16:17:22 +0000 (UTC)
Received: by sym2.noone.org (Postfix, from userid 1002)
 id 48XfKH0xSMzvjc1; Wed,  4 Mar 2020 17:21:54 +0100 (CET)
From: Tobias Klauser <tklauser@distanz.ch>
To: wireguard@lists.zx2c4.com
Subject: [PATCH wireguard-go] global: use RTMGRP_* consts from x/sys/unix
Date: Wed,  4 Mar 2020 17:21:54 +0100
Message-Id: <20200304162154.8600-1-tklauser@distanz.ch>
X-Mailer: git-send-email 2.11.0
X-Mailman-Approved-At: Thu, 05 Mar 2020 03:47:41 +0100
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Update the golang.org/x/sys/unix dependency and use the newly introduced
RTMGRP_* consts instead of using the corresponding RTNLGRP_* const to
create a mask.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 device/conn_linux.go | 2 +-
 go.mod               | 2 +-
 go.sum               | 4 ++--
 tun/tun_linux.go     | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/device/conn_linux.go b/device/conn_linux.go
index 94b6d5c072c7..e90b0e35b456 100644
--- a/device/conn_linux.go
+++ b/device/conn_linux.go
@@ -118,7 +118,7 @@ func createNetlinkRouteSocket() (int, error) {
 	}
 	saddr := &unix.SockaddrNetlink{
 		Family: unix.AF_NETLINK,
-		Groups: uint32(1 << (unix.RTNLGRP_IPV4_ROUTE - 1)),
+		Groups: unix.RTMGRP_IPV4_ROUTE,
 	}
 	err = unix.Bind(sock, saddr)
 	if err != nil {
diff --git a/go.mod b/go.mod
index 34b1e720a8ea..f4e7b97c993e 100644
--- a/go.mod
+++ b/go.mod
@@ -5,6 +5,6 @@ go 1.12
 require (
 	golang.org/x/crypto v0.0.0-20191002192127-34f69633bfdc
 	golang.org/x/net v0.0.0-20191003171128-d98b1b443823
-	golang.org/x/sys v0.0.0-20191003212358-c178f38b412c
+	golang.org/x/sys v0.0.0-20200302150141-5c8b2ff67527
 	golang.org/x/text v0.3.2
 )
diff --git a/go.sum b/go.sum
index 970f4cbade71..be3d0cfdf4f3 100644
--- a/go.sum
+++ b/go.sum
@@ -6,8 +6,8 @@ golang.org/x/net v0.0.0-20191003171128-d98b1b443823 h1:Ypyv6BNJh07T1pUSrehkLemqP
 golang.org/x/net v0.0.0-20191003171128-d98b1b443823/go.mod h1:z5CRVTTTmAJ677TzLLGU+0bjPO0LkuOLi4/5GtJWs/s=
 golang.org/x/sys v0.0.0-20190215142949-d0b11bdaac8a/go.mod h1:STP8DvDyc/dI5b8T5hshtkjS+E42TnysNCUPdjciGhY=
 golang.org/x/sys v0.0.0-20190412213103-97732733099d/go.mod h1:h1NjWce9XRLGQEsW7wpKNCjG9DtNlClVuFLEZdDNbEs=
-golang.org/x/sys v0.0.0-20191003212358-c178f38b412c h1:6Zx7DRlKXf79yfxuQ/7GqV3w2y7aDsk6bGg0MzF5RVU=
-golang.org/x/sys v0.0.0-20191003212358-c178f38b412c/go.mod h1:h1NjWce9XRLGQEsW7wpKNCjG9DtNlClVuFLEZdDNbEs=
+golang.org/x/sys v0.0.0-20200302150141-5c8b2ff67527 h1:uYVVQ9WP/Ds2ROhcaGPeIdVq0RIXVLwsHlnvJ+cT1So=
+golang.org/x/sys v0.0.0-20200302150141-5c8b2ff67527/go.mod h1:h1NjWce9XRLGQEsW7wpKNCjG9DtNlClVuFLEZdDNbEs=
 golang.org/x/text v0.3.0/go.mod h1:NqM8EUOU14njkJ3fqMW+pc6Ldnwhi/IjpwHt7yyuwOQ=
 golang.org/x/text v0.3.2 h1:tW2bmiBqwgJj/UpqtC8EpXEZVYOwU0yG4iWbprSVAcs=
 golang.org/x/text v0.3.2/go.mod h1:bEr9sfX3Q8Zfm5fL9x+3itogRgK3+ptLWKqgva+5dAk=
diff --git a/tun/tun_linux.go b/tun/tun_linux.go
index 36b43ea4d094..7ab062314662 100644
--- a/tun/tun_linux.go
+++ b/tun/tun_linux.go
@@ -85,7 +85,7 @@ func createNetlinkSocket() (int, error) {
 	}
 	saddr := &unix.SockaddrNetlink{
 		Family: unix.AF_NETLINK,
-		Groups: uint32((1 << (unix.RTNLGRP_LINK - 1)) | (1 << (unix.RTNLGRP_IPV4_IFADDR - 1)) | (1 << (unix.RTNLGRP_IPV6_IFADDR - 1))),
+		Groups: unix.RTMGRP_LINK | unix.RTMGRP_IPV4_IFADDR | unix.RTMGRP_IPV6_IFADDR,
 	}
 	err = unix.Bind(sock, saddr)
 	if err != nil {
-- 
2.25.0

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
