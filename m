Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D013C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 14 Mar 2022 17:17:01 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 0e7c7229;
	Mon, 14 Mar 2022 17:11:49 +0000 (UTC)
Received: from smtp-out.titan.email (mail19.out.titan.email [3.64.226.213])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 2d0d1781
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 11 Mar 2022 05:29:38 +0000 (UTC)
Received: from smtp-out.flockmail.com
 (ip-10-10-86-103.eu-central-1.compute.internal [10.10.86.103])
 by smtp-out.titan.email (Postfix) with ESMTP id A107C12002F
 for <wireguard@lists.zx2c4.com>; Fri, 11 Mar 2022 05:29:38 +0000 (UTC)
Received: from smtp-out.flockmail.com (localhost [127.0.0.1])
 by smtp-out.flockmail.com (Postfix) with ESMTP id 4348F10000D;
 Fri, 11 Mar 2022 05:29:38 +0000 (UTC)
X-F-Verdict: SPFVALID
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=t12smtp-sign003.email; s=titan1; t=1646976578;
 bh=bWOjIaEQYWkf30K+KKT/ZGEr7+RPUnv1KHH/Hh79ExI=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:From:To:Cc:
 Subject:Message-ID;
 b=OlQMMN8q/YlQz+tn3HIDThelWNQVu/UrWI6TJ7xpLMUgt8YFagZ0r9OaONErd7tjv
 c8VwBlk2iWe+jCyyL8+nXrr0KUA7PPD0nVEV19Vn2V9G868+k/RgsThP6SMF6pY9fi
 ydBJCYuOLVX58gJbRBP3IkcCEwuxZYYkGMZL6O8Q=
Received: from localhost.localdomain (173.44.49.91.adsl.inet-telecom.org
 [173.44.49.91])
 by smtp-out.flockmail.com (Postfix) with ESMTPA id A0C49100009;
 Fri, 11 Mar 2022 05:29:37 +0000 (UTC)
Feedback-ID: :john@gravitl.com:gravitl.com:flockmailId
From: john@gravitl.com
To: wireguard@lists.zx2c4.com
Cc: John Sahhar <john@gravitl.com>
Subject: [PATCH] tun/netstack: implement MaxHeaderLength
Date: Thu, 10 Mar 2022 23:28:32 -0600
Message-Id: <20220311052832.86700-1-john@gravitl.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.4 cv=VdbkgXl9 c=1 sm=1 tr=0 ts=622ade42
 a=QEpn2SubEkQh6g3vIi6XXA==:117 a=QEpn2SubEkQh6g3vIi6XXA==:17
 a=CEWIc4RMnpUA:10 a=eYKfDJU5AAAA:8 a=-pCSf-5qJv81JgzTw4gA:9
 a=lmb810DE-YoBXuhcsDRM:22
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Mon, 14 Mar 2022 17:11:40 +0000
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

From: John Sahhar <john@gravitl.com>

Signed-off-by: John Sahhar <john@gravitl.com>
---
 tun/netstack/tun.go | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tun/netstack/tun.go b/tun/netstack/tun.go
index 8b1bb7f..94b59f8 100644
--- a/tun/netstack/tun.go
+++ b/tun/netstack/tun.go
@@ -71,8 +71,11 @@ func (*endpoint) Capabilities() stack.LinkEndpointCapabilities {
 	return stack.CapabilityNone
 }
 
-func (*endpoint) MaxHeaderLength() uint16 {
-	return 0
+func (e *endpoint) MaxHeaderLength() uint16 {
+	if e.hasV6 && !e.hasV4 {
+		return 40
+	}
+	return 60
 }
 
 func (*endpoint) LinkAddress() tcpip.LinkAddress {
-- 
2.32.0

