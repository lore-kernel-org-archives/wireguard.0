Return-Path: <SRS0=0td0=MH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,
	T_DKIM_INVALID,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8631ECE561
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 25 Sep 2018 03:17:11 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35BE021480
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 25 Sep 2018 03:17:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="dMmUBnOO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35BE021480
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=cloudflare.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bd83b192;
	Tue, 25 Sep 2018 03:14:36 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7bc38e47
 for <wireguard@lists.zx2c4.com>;
 Thu, 20 Sep 2018 12:26:58 +0000 (UTC)
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f6eb237a
 for <wireguard@lists.zx2c4.com>;
 Thu, 20 Sep 2018 12:26:58 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id j15-v6so5118544wrt.8
 for <wireguard@lists.zx2c4.com>; Thu, 20 Sep 2018 05:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloudflare.com; s=google; h=from:to:subject:date:message-id;
 bh=oMDsq+WWNhnODV69bukD1RV0rv4UfAtrF750fI1ZkeU=;
 b=dMmUBnOOojtkXp6nfMIUK74HuoZBc9KgWSblUxXrM1vcF9GH1tr51x0TsM2yQhbNFj
 DQsYL22hEbE2yyR2nYS4U0Cp1H3CzYMivnO+nfwhZa307oih9H+1tsHPy361s7yUHxwk
 Q8w/a5S+bvJTlhAN2qV2MvodxfoD1WFnEvWjQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=oMDsq+WWNhnODV69bukD1RV0rv4UfAtrF750fI1ZkeU=;
 b=smJbpxLALcyOGSNORNqWs9Js0jfNUi7B6M5w259oK2TR2BKkZBCWloLOVGqLpWrae6
 I/2hfAxtV0ZR9n2rPeMPi06qhEc2HTJbrDy647jyVGTiA28Nh1PLhUGcUsC9Vld+3lc4
 1yMOHvgAL0oKQnRzpQj0ykm/dBEopGH3efJihNrnbhxY53CtqfageZHRoRNYLu+87cu4
 PRMBF7n9jR/ura60PpzuiFh2Re8haSoFhnwMdW3Vr58Y4xD4xFpvBMk44SY3q9FTlB5l
 sFYVwBBarrqaQAxLBqae9rZAoB11vRU+B1BHAm+H8PArwd7M8Xr3Nku3paeXoMhfqyvn
 CmCg==
X-Gm-Message-State: APzg51A+gaoTu4vL8ZJmFthzT5+si5ZRrwBxqsIO3UnIIlnkg5+Cq+um
 GObKJdQrJYTwQ6t/xro04eT/g0OJMdAeLA==
X-Google-Smtp-Source: ANB0Vdb6djKhseNF7kL6bw3z1bR2n46owATEnEZGaH663TXJRGJu1oGgRzohZwaJ1ov5WhCHpb4IEQ==
X-Received: by 2002:adf:eaca:: with SMTP id
 o10-v6mr30090743wrn.98.1537446536691; 
 Thu, 20 Sep 2018 05:28:56 -0700 (PDT)
Received: from cbranch-vm.localdomain
 (cpc86393-seve24-2-0-cust856.13-3.cable.virginm.net. [81.103.91.89])
 by smtp.gmail.com with ESMTPSA id a37-v6sm52987995wrc.21.2018.09.20.05.28.55
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 20 Sep 2018 05:28:55 -0700 (PDT)
From: Chris Branch <cbranch@cloudflare.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH] Fix transport message length check
Date: Thu, 20 Sep 2018 13:28:53 +0100
Message-Id: <20180920122853.33762-1-cbranch@cloudflare.com>
X-Mailer: git-send-email 2.11.0
X-Mailman-Approved-At: Tue, 25 Sep 2018 05:14:34 +0200
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

wireguard-go has a bad length check in its transport message handling.
Although it cannot be exploited because of another length check earlier in the
function, this should be fixed regardless.

---
 receive.go | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/receive.go b/receive.go
index 6b6543c..cbc3fd1 100644
--- a/receive.go
+++ b/receive.go
@@ -146,7 +146,7 @@ func (device *Device) RoutineReceiveIncoming(IP int, bind Bind) {
 
 			// check size
 
-			if len(packet) < MessageTransportType {
+			if len(packet) < MessageTransportSize {
 				continue
 			}
 
-- 
2.11.0

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
