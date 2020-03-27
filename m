Return-Path: <SRS0=1oQw=5P=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A30CCC43331
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Mar 2020 02:28:39 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43CE720578
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Mar 2020 02:28:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nicze.de header.i=@nicze.de header.b="kKpba0Gk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43CE720578
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nicze.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e31f7804;
	Mon, 30 Mar 2020 02:10:51 +0000 (UTC)
Received: from vie01a-dmta-de02-1.mx.upcmail.net
 (vie01a-dmta-de02-1.mx.upcmail.net [84.116.36.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d377cc41
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 27 Mar 2020 17:21:06 +0000 (UTC)
Received: from [172.31.216.235] (helo=vie01a-pemc-psmtp-pe12.mail.upcmail.net)
 by vie01a-dmta-de02.mx.upcmail.net with esmtp (Exim 4.92)
 (envelope-from <suyjuris.gi@nicze.de>) id 1jHsmb-0004qR-6l
 for wireguard@lists.zx2c4.com; Fri, 27 Mar 2020 18:28:37 +0100
Received: from mail.nicze.de ([5.147.172.5])
 by vie01a-pemc-psmtp-pe12.mail.upcmail.net with ESMTPA
 id HsmZjUD6w6Jy6HsmajQnHt; Fri, 27 Mar 2020 18:28:36 +0100
X-Env-Mailfrom: suyjuris.gi@nicze.de
X-Env-Rcptto: wireguard@lists.zx2c4.com
X-SourceIP: 5.147.172.5
X-CNFS-Analysis: v=2.3 cv=GKl27dFK c=1 sm=1 tr=0
 a=/5kknKd2Jpx1Os9ibyM9kw==:117 a=/5kknKd2Jpx1Os9ibyM9kw==:17
 a=SS2py6AdgQ4A:10 a=ZRvcX2vtjEA36wY3-fMA:9 a=pHzHmUro8NiASowvMSCR:22
 a=n87TN5wuljxrRezIQYnT:22
X-Authenticated-Sender: peter.czerner@unitybox.de
Received: from localhost.localdomain (p5790B815.dip0.t-ipconnect.de
 [87.144.184.21])
 by mail.nicze.de (Postfix) with ESMTPSA id B6E1CF20A82;
 Fri, 27 Mar 2020 18:28:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=nicze.de; s=mail;
 t=1585330115; bh=mfUZc4n5+fIni5fozSZxHWMwU4ec3JtXtevADKT4c68=;
 h=From:To:Cc:Subject:Date:From;
 b=kKpba0GkX4yg12qCVynwQ0mXd9hCfC9fuKJmyc78QD9HCsVjyvlwmdalPP2n470/7
 zWMNm3dRlDR/QCRzn4Fd7E49GZU6LUAKU1M4BlG5lbJuoaSlldD26/sFJq5xvaVgMM
 iWJ4YM82sW3BDYXQYLEpsDt3sdTidmQhikAVf640=
From: Philipp Czerner <suyjuris.gi@nicze.de>
To: wireguard@lists.zx2c4.com
Cc: Philipp Czerner <suyjuris.gi@nicze.de>
Subject: [PATCH wireguard-windows] Calculate the actual route metric by
 summing interface and route metric.
Date: Fri, 27 Mar 2020 18:07:50 +0100
Message-Id: <20200327170750.5285-1-suyjuris.gi@nicze.de>
X-Mailer: git-send-email 2.17.1
X-CMAE-Envelope: MS4wfBAwE9kt2+XDt3pvDk7KFH0uEPPbEwYJqtleMXklFfI1SRF+uNuoSvHdUSoRLPxYhx+NHjJC/PnhMv025ONuuny6iCoKXdk/5wf0aFluoZh/MPF6eUQs
 QT0fLRc+/wsJ6I7qyOm08ONIqwA7CyfGQ3gCat7VllNPMJdr3QRpKaiv
X-Mailman-Approved-At: Mon, 30 Mar 2020 04:10:43 +0200
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

Signed-off-by: Philipp Czerner <suyjuris.gi@nicze.de>
---
Hi,

I had some issues setting up Wireguard behind another VPN. Curiously, it bound the physical interface instead of the other VPN, which was the default route. According to MSDN "the actual route metric used to compute the route preference is the summation of interface metric specified in the Metric member of the MIB_IPINTERFACE_ROW structure and the route metric offset specified in this member" (documentation for MIB_IPFORWARD_ROW2), but the code did not seem to consider this. After I changed the calculation, I got the expected behaviour.

Cheers,
Philipp

 tunnel/defaultroutemonitor.go | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/tunnel/defaultroutemonitor.go b/tunnel/defaultroutemonitor.go
index c102b64..4b24e8e 100644
--- a/tunnel/defaultroutemonitor.go
+++ b/tunnel/defaultroutemonitor.go
@@ -33,8 +33,14 @@ func bindSocketRoute(family winipcfg.AddressFamily, device *device.Device, ourLU
 		if err != nil || ifrow.OperStatus != winipcfg.IfOperStatusUp {
 			continue
 		}
-		if r[i].Metric < lowestMetric {
-			lowestMetric = r[i].Metric
+
+		iface, err := r[i].InterfaceLUID.IPInterface(family)
+		if err != nil {
+			continue
+		}
+
+		if r[i].Metric + iface.Metric < lowestMetric {
+			lowestMetric = r[i].Metric + iface.Metric;
 			index = r[i].InterfaceIndex
 			luid = r[i].InterfaceLUID
 		}
-- 
2.17.1

