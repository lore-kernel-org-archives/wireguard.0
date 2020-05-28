Return-Path: <SRS0=n59I=76=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35EA5C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jun 2020 07:47:42 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D259D208D5
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jun 2020 07:47:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=garrit.xyz header.i=@garrit.xyz header.b="UZW4+YD6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D259D208D5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=garrit.xyz
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3938b68a;
	Wed, 17 Jun 2020 07:26:43 +0000 (UTC)
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.218])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3074613b
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 May 2020 18:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1590691877;
 s=strato-dkim-0002; d=garrit.xyz;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=hqWWK6EDkci8BDmo2FGv/UWFRBA7n/dGozeuou/5nLM=;
 b=UZW4+YD69jQwrsJm3371TlhBUrZVkUkM4X055JVUP4GysDsAybr2IQ0f4BFBkgfeFd
 MgS9qPK/gE8UB5mNrRztKGh5IAGmUud4PueXle+GWB9+vvscGgdUK/xjebAd7WpCsMJu
 oHlXzHvw8ZiZh0EBAS3Z6Yw82QDN+8ZFYzHaWZ0Jdz2Is0s1r0RxOcIBG+pXh8b7IN5Z
 YzXZDC3jZw36CyAwGokhXCfB74et5/fw9efMMKUUutO7B+u9Jrx3JlpWArnlRRqzEipG
 Tn06y8FuuMsJAj8UGY4MKiMgdDtRRD6L6HVakH1C3ig4JUQYHJPUNs+T+WorrD8Jo2Q5
 wGiA==
X-RZG-AUTH: ":L2MKYUGrb9+g6Yo/9DacaXP5UKUF1pzQZq8rlTFv9/FqKkfMj7DG0ltwUYiU2bdoyq/9lSg="
X-RZG-CLASS-ID: mo00
Received: from CKC-BS-N0240.fritz.box by smtp.strato.de (RZmta 46.9.0 AUTH)
 with ESMTPSA id k0b835w4SIjZ4YH
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 28 May 2020 20:45:35 +0200 (CEST)
From: Garrit Franke <contact@garrit.xyz>
To: wireguard@lists.zx2c4.com
Cc: Garrit Franke <contact@garrit.xyz>
Subject: [PATCH 2/6] wg-quick: add restart man page
Date: Thu, 28 May 2020 20:45:06 +0200
Message-Id: <20200528184510.51675-3-contact@garrit.xyz>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20200528184510.51675-1-contact@garrit.xyz>
References: <20200528184510.51675-1-contact@garrit.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 17 Jun 2020 09:26:34 +0200
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

---
 src/man/wg-quick.8 | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/src/man/wg-quick.8 b/src/man/wg-quick.8
index c693a89..01b99ff 100644
--- a/src/man/wg-quick.8
+++ b/src/man/wg-quick.8
@@ -10,6 +10,8 @@ wg-quick - set up a WireGuard interface simply
 |
 .I down
 |
+.I restart
+|
 .I save
 |
 .I strip
@@ -24,11 +26,11 @@ wg-quick - set up a WireGuard interface simply
 This is an extremely simple script for easily bringing up a WireGuard interface,
 suitable for a few common use cases.
 
-Use \fIup\fP to add and set up an interface, and use \fIdown\fP to tear down and remove
-an interface. Running \fIup\fP adds a WireGuard interface, brings up the interface with the
+Use \fIup\fP to add and set up an interface, use \fIdown\fP to tear down and remove
+an interface, and use \fIrestart\fP to restart an interface. Running \fIup\fP adds a WireGuard interface, brings up the interface with the
 supplied IP addresses, sets up mtu and routes, and optionally runs pre/post up scripts. Running \fIdown\fP
 optionally saves the current configuration, removes the WireGuard interface, and optionally
-runs pre/post down scripts. Running \fIsave\fP saves the configuration of an existing
+runs pre/post down scripts. \fIrestart\fP simply combines the \fIup\fP and \fIdown\fP command. Running \fIsave\fP saves the configuration of an existing
 interface without bringing the interface down. Use \fIstrip\fP to output a configuration file
 with all
 .BR wg-quick (8)-specific
-- 
2.24.3 (Apple Git-128)

