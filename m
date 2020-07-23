Return-Path: <SRS0=dVqJ=BD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B50AC433EC
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Jul 2020 08:28:14 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5901206EB
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Jul 2020 08:28:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=tomcsanyi-net.20150623.gappssmtp.com header.i=@tomcsanyi-net.20150623.gappssmtp.com header.b="b4TrfdT1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5901206EB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tomcsanyi.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b162516e;
	Fri, 24 Jul 2020 08:04:12 +0000 (UTC)
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [2a00:1450:4864:20::344])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f6c0c480
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 23 Jul 2020 13:47:27 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id j18so5088345wmi.3
 for <wireguard@lists.zx2c4.com>; Thu, 23 Jul 2020 07:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tomcsanyi-net.20150623.gappssmtp.com; s=20150623;
 h=content-transfer-encoding:from:mime-version:date:subject:message-id
 :references:to;
 bh=UsnCWMprgpVwJBvBLCYPYUyElG2y/JbM630VdPNhsps=;
 b=b4TrfdT1onxiyapAYByuTWp3ds0qwKudTNQetJQuzuIQTo3HmCtKNIFmWIyg7+Nerk
 qDDuqVBc3FGZXNs4xW+5M71lCMWJfmN10ANvLs0PYsEwl14Pe8flSLyZnWmZ6Hkm8W0P
 b1C0rSgqoYm6q6q0avSZsqMA1P4Ue6Wo3e+E8gFhVAZrdM580Pv/Io5i9ggyLru6Jcs6
 POmea2juMjg+y0jupEJlgy8VgSYPc7TaLAVaZStxqnd8ZRg249s0SxkcwjqA3dSuLFJ+
 8B8nRKJybqS4YELpNptFNv708LDp2eSMNZL2J+4bPPvOI8JojMyzmsGRfKxk/dpvwAos
 4igA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version:date
 :subject:message-id:references:to;
 bh=UsnCWMprgpVwJBvBLCYPYUyElG2y/JbM630VdPNhsps=;
 b=FM09hkYdsNAnNkuLrYLfXnsM8SIzlzmhyq+UO7g0Pe/C32ErrXiVfYXZWggVquJ3XO
 fguLkuO8ExzCRr2ZfHO1youtZd2qtCT8+b+JRoLV8WCptlq4wDSJr2DE2mi2ftdPIbCa
 yUA4ETP72TOvXxSeMOMxiAWB1bgUfUuHTZX9JpKWMx2Y3n+BipOktPafSfIKlUvZrCTD
 EJGAJvWFsjmR9FLyj321/BWe0bRy9H+q7Sl+kHLaZGMUeFWrbxjPkqYy7iVeixoPuxZz
 ZIOQZKXBYs6p8We9QaSeBZk9pqVKkFNXD45UKporqeg7RKjexxIq7Tr6QueY+QqSPBFQ
 cL0g==
X-Gm-Message-State: AOAM530ysJVkG9MSx2XXi+c7LCyZpdldhnZDSw0CmM0ZHmY5xpSmTKWM
 sFYlVvJogKk1f35nqmWt9FPz4ZKS29g=
X-Google-Smtp-Source: ABdhPJz4WX/AlDvdxfRm0CNEmCg+YOE7J+PrvhAiaw5L8RtEWbtiFNQ5hmNjtsQygBqKdP6LeOnflw==
X-Received: by 2002:a7b:cb46:: with SMTP id v6mr4577986wmj.73.1595513413006;
 Thu, 23 Jul 2020 07:10:13 -0700 (PDT)
Received: from [192.168.0.102] (92-249-179-12.pool.digikabel.hu.
 [92.249.179.12])
 by smtp.gmail.com with ESMTPSA id j24sm4473419wrb.49.2020.07.23.07.10.12
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jul 2020 07:10:12 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: "Tomcsanyi, Domonkos" <domi@tomcsanyi.net>
Mime-Version: 1.0 (1.0)
Date: Thu, 23 Jul 2020 16:10:11 +0200
Subject: [PATCH] Adding support for reloading configuration via systemd
Message-Id: <865B9BD5-A256-43F8-9922-A6DE7680C216@tomcsanyi.net>
References: <VI1PR02MB52169D6F055314DCD03746EDE6760@VI1PR02MB5216.eurprd02.prod.outlook.com>
To: wireguard@lists.zx2c4.com
X-Mailer: iPhone Mail (17F80)
X-Mailman-Approved-At: Fri, 24 Jul 2020 10:04:05 +0200
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

=EF=BB=BFSigned-off-by: Domonkos P. Tomcsanyi <domi@tomcsanyi.net>
---
src/systemd/wg-quick@.service | 1 +
1 file changed, 1 insertion(+)

diff --git a/src/systemd/wg-quick@.service b/src/systemd/wg-quick@.service
index a9cbb58..8eb040b 100644
--- a/src/systemd/wg-quick@.service
+++ b/src/systemd/wg-quick@.service
@@ -15,6 +15,7 @@ Type=3Doneshot
RemainAfterExit=3Dyes
ExecStart=3D/usr/bin/wg-quick up %i
ExecStop=3D/usr/bin/wg-quick down %i
+ExecReload=3D/bin/bash -c '/usr/bin/wg syncconf %i <(/usr/bin/wg-quick stri=
p
%i)'
Environment=3DWG_ENDPOINT_RESOLUTION_RETRIES=3Dinfinity

[Install]
--
2.17.1

Not the cleanest solution, but I think it might help a lot of people, so I'm=

submitting it.
