Return-Path: <SRS0=n59I=76=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F519C433E2
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jun 2020 07:45:21 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D1FC208B3
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jun 2020 07:45:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=garrit.xyz header.i=@garrit.xyz header.b="UK8ko45c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D1FC208B3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=garrit.xyz
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d08424ce;
	Wed, 17 Jun 2020 07:26:40 +0000 (UTC)
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [85.215.255.21])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6f8959c5
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 May 2020 18:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1590691876;
 s=strato-dkim-0002; d=garrit.xyz;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=VciUAxExoaBhCLR55X3K4gXUqR+/N+oFT0Ja4soqPzI=;
 b=UK8ko45ciV9JhawHZMoIIQa3F9GUABq7Mg988/p3Wy2d5pukI0UWej+WZnRPnw8Ore
 ltoBgvX5yEtrQJ0hXPB5cgbv+bNIbMdPIdk/Qxx2Lgf26ocyijee1478shffeVNCv1Z1
 rHQWy6fjcfzSamhHZgyWapDasUYub3Lnh1hzgzNO1B4httdx+cpRhCZsJE9zUNstWH5P
 Q6S+cbhychDMVSZFZZ8bM8e+pD98vJFZnK0iDfPVA3EWGA5HuyKWPcxtaxFPS+WbytU7
 P9AxOClSHq7jOOIQUwzgxcQ9ucN+1LjcocsshY8cT64olARJ6gx3L/kIRzW0La3PBfVr
 aCbQ==
X-RZG-AUTH: ":L2MKYUGrb9+g6Yo/9DacaXP5UKUF1pzQZq8rlTFv9/FqKkfMj7DG0ltwUYiU2bdoyq/9lSg="
X-RZG-CLASS-ID: mo00
Received: from CKC-BS-N0240.fritz.box by smtp.strato.de (RZmta 46.9.0 AUTH)
 with ESMTPSA id k0b835w4SIja4YJ
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 28 May 2020 20:45:36 +0200 (CEST)
From: Garrit Franke <contact@garrit.xyz>
To: wireguard@lists.zx2c4.com
Cc: Garrit Franke <contact@garrit.xyz>
Subject: [PATCH 4/6] wg-quick: linux: add notice to restart command
Date: Thu, 28 May 2020 20:45:08 +0200
Message-Id: <20200528184510.51675-5-contact@garrit.xyz>
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
 src/wg-quick/linux.bash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/src/wg-quick/linux.bash b/src/wg-quick/linux.bash
index 6f42b7f..b888d63 100755
--- a/src/wg-quick/linux.bash
+++ b/src/wg-quick/linux.bash
@@ -353,6 +353,7 @@ cmd_down() {
 }
 
 cmd_restart() {
+	[[ " $(wg show interfaces) " == *" $INTERFACE "* ]] || die "\`$INTERFACE' is not a WireGuard interface"
 	cmd_down
 	cmd_up
 }
-- 
2.24.3 (Apple Git-128)

