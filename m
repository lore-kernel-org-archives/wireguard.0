Return-Path: <SRS0=EQWa=OY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1589EC43387
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 15 Dec 2018 16:58:13 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2C9F206C2
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 15 Dec 2018 16:58:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EK3fT0Kl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2C9F206C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a9ce0000;
	Sat, 15 Dec 2018 16:57:19 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1605d45c
 for <wireguard@lists.zx2c4.com>;
 Sat, 15 Dec 2018 16:57:17 +0000 (UTC)
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 34cfd0e4
 for <wireguard@lists.zx2c4.com>;
 Sat, 15 Dec 2018 16:56:34 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id h15so7431946edb.4
 for <wireguard@lists.zx2c4.com>; Sat, 15 Dec 2018 08:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rH2GooptTbV6gwUi1ZAj2/wzWscfG83Kyk4wmxyl7Z4=;
 b=EK3fT0Kl64ytQoXaxme6yWuSp8lE1rZRzbXya06/KZLAz3Laj9Dc/8ZzRnhsMzX0Ft
 zYNKHkdHCAwJsS+tMOvbUrQxgtAnRuUr97K2zHGvpEoBcLz1n1J623h+wJs/KuPWSOBt
 T6WkyCwQpLF3FNJm6zzWFEiYcYg6NjkcCXy0LvvneDDchJUKnBarkorS/hKTUu+CVez0
 HBGy+oYSG7U2tfqwAz6xelPZ8x3CYRUHyBEhgl+42NsqFv3ReOe8O3CasePM1CZTwBF3
 gsVeRkADoMDCIYJ1gb/XqGsPf0e5TZ6PwJtyhHJcAE2ChbHoQ5ZCdQnXKZA5KgAKaTXd
 I4rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rH2GooptTbV6gwUi1ZAj2/wzWscfG83Kyk4wmxyl7Z4=;
 b=geUeTbP6vGg9SQhLFxAwJ7Ng+AP4R8q0wVQ6gwsf7QJV9XlRQeqJkM0H5d3afjuNzt
 TaCrbsEmWfs1OIm6L10hfx7WlAy3jqwb4YdQrdMy51XRMWS/FCPwKoddR9hswHhxMR8x
 Jgi9Ck4dpNHrE23Jrou0N8gmzslo7JKZVurCUtw4yRL9G4nFsy474AXOSWmS+Mfx5HOx
 vKeZkwWOSFJI6iX/QksB4QTyVsXZgUkyAwiTvqdTxiL75wfHfY5p6CVJ5/CyQJRjcJ+H
 +LwATG2oDWfpt9UcWeBynOLpKPqUgWyW0+FWDMAP31jKee0Z/PUB/+M/HHjy/Hp2iRZ/
 Cffw==
X-Gm-Message-State: AA+aEWblZdl/zNlwvOqntfnF+SlZ2zLN8xLXaXAZCzwBxtbnDRq7Etf0
 3v3PruD5smSHv41gXbBLUNLFrHSV
X-Google-Smtp-Source: AFSGD/XIJdDUPi0Q1bOtEZQiHqpIJbiAvAx8o/N6ib1bt0psk5Gvr7khtLYFiRzwFRvQRofpoTB08w==
X-Received: by 2002:a50:d085:: with SMTP id v5mr6927513edd.61.1544892998995;
 Sat, 15 Dec 2018 08:56:38 -0800 (PST)
Received: from localhost.localdomain
 (p200300C55F2A9600228984FFFE70D494.dip0.t-ipconnect.de.
 [2003:c5:5f2a:9600:2289:84ff:fe70:d494])
 by smtp.gmail.com with ESMTPSA id q50sm2356015edd.66.2018.12.15.08.56.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 15 Dec 2018 08:56:38 -0800 (PST)
From: Julian Orth <ju.orth@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH v5 11/11] tests: add test for transit-net
Date: Sat, 15 Dec 2018 17:56:13 +0100
Message-Id: <20181215165613.5486-12-ju.orth@gmail.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181215165613.5486-1-ju.orth@gmail.com>
References: <20181215165613.5486-1-ju.orth@gmail.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

LS0tCiBzcmMvdGVzdHMvbmV0bnMuc2ggfCA0MCArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNDAgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL3NyYy90ZXN0cy9uZXRucy5zaCBiL3NyYy90ZXN0cy9uZXRucy5zaAppbmRleCA1Njg2MTJj
Li40Y2M2YjQ0IDEwMDc1NQotLS0gYS9zcmMvdGVzdHMvbmV0bnMuc2gKKysrIGIvc3JjL3Rlc3Rz
L25ldG5zLnNoCkBAIC0yMjIsNiArMjIyLDQ2IEBAIG4xIHdnIHNldCB3ZzAgcGVlciAiJG1vcmVf
c3BlY2lmaWNfa2V5IiByZW1vdmUKIGlwMSBsaW5rIGRlbCB3ZzAKIGlwMiBsaW5rIGRlbCB3ZzAK
IAorIyBUZXN0IHVzaW5nIHRyYW5zaXQgbmFtZXNwYWNlLiBXZSBub3cgY2hhbmdlIHRoZSB0b3Bv
bG9neSB0byB0aGlzIHdpdGggdHJhbnNpdC1uZXRucyBvZiAkbnMxIHdnMCA9ICRuczAKKyMg4pSM
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSQICAgIOKUjOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUkCAgICAg4pSM4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSQCisjIOKU
giAgICAkbnMxIG5hbWVzcGFjZSAgICDilIIgICAg4pSCICAgICAkbnMwIG5hbWVzcGFjZSAgICDi
lIIgICAgIOKUgiAgICAgICAgICAgICAkbnMyIG5hbWVzcGFjZSAgICAgICAgICAgICDilIIKKyMg
4pSCICAgICAgICAgICAgICAgICAgICAgIOKUgiAgICDilIIgICAgICAgICAgICAgICAgICAgICAg
IOKUgiAgICAg4pSCICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIOKUggor
IyDilIIgIOKUjOKUgOKUgOKUgOKUgOKUgOKUkCAgICAgICAgICAgICDilIIgICAg4pSCIOKUjOKU
gOKUgOKUgOKUgOKUgOKUgOKUkCAgICAgICAgICAgICAg4pSCICAgICDilIIgIOKUjOKUgOKUgOKU
gOKUgOKUgOKUkCAgICAgICAgICAgIOKUjOKUgOKUgOKUgOKUgOKUgOKUkCAgICAgICAgICAgIOKU
ggorIyDilIIgIOKUgiB3ZzAg4pSCICAgICAgICAgICAgIOKUgiAgICDilIIg4pSCdmV0aHJz4pSC
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pS84pSA4pSA4pSA4pSA
4pSA4pS84pSA4pSA4pSCdmV0aHPilILilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilIIgd2cwIOKUgiAgICAgICAgICAgIOKUggorIyDilIIgIOKUnOKUgOKUgOKUgOKUgOKUgOKU
tOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUkCAg4pSCICAgIOKUgiDilJzilIDilIDi
lIDilIDilIDilIDilLTilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilJAg4pSC
ICAgICDilIIgIOKUnOKUgOKUgOKUgOKUgOKUgOKUtOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUkCDilJzilIDilIDilIDilIDilIDilLTilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilJAg4pSCCisjIOKUgiAg4pSCMTkyLjE2OC4yNDEuMS8yNOKUgiAg4pSCICAgIOKUgiDilIIx
MC4wLjAuMS8yNCAgICAgICAg4pSCIOKUgiAgICAg4pSCICDilIIxMC4wLjAuMTAwLzI0ICAg4pSC
IOKUgjE5Mi4xNjguMjQxLjIvMjTilIIg4pSCCisjIOKUgiAg4pSCZmQwMDo6MS8yNCAgICAgIOKU
giAg4pSCICAgIOKUgiDilIJTTkFUOjE5Mi4xNjguMS4wLzI04pSCIOKUgiAgICAg4pSCICDilIIg
ICAgICAgICAgICAgICAg4pSCIOKUgmZkMDA6OjIvMjQgICAgICDilIIg4pSCCisjIOKUgiAg4pSU
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSYICDilIIg
ICAg4pSCIOKUlOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUmCDilIIgICAgIOKUgiAg4pSU4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSYIOKUlOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUmCDilIIKKyMg4pSU4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSYICAgIOKUlOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUmCAgICAg4pSU4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSYCisKK2lwMSBsaW5rIGFkZCBkZXYgd2cwIHR5cGUg
d2lyZWd1YXJkCitpcDIgbGluayBhZGQgZGV2IHdnMCB0eXBlIHdpcmVndWFyZAorY29uZmlndXJl
X3BlZXJzCituMSB3ZyBzZXQgd2cwIHRyYW5zaXQtbmV0bnMgL3J1bi9uZXRucy8kbmV0bnMwCisK
K2lwMCBsaW5rIGFkZCB2ZXRocnMgdHlwZSB2ZXRoIHBlZXIgbmFtZSB2ZXRocworaXAwIGxpbmsg
c2V0IHZldGhzIG5ldG5zICRuZXRuczIKK2lwMCBsaW5rIHNldCB2ZXRocnMgdXAKK2lwMCBhZGRy
IGFkZCAxMC4wLjAuMS8yNCBkZXYgdmV0aHJzCitpcDIgYWRkciBhZGQgMTAuMC4wLjEwMC8yNCBk
ZXYgdmV0aHMKK2lwMSByb3V0ZSBhZGQgZGVmYXVsdCBkZXYgd2cwCitpcDIgbGluayBzZXQgdmV0
aHMgdXAKK3dhaXRpZmFjZSAkbmV0bnMwIHZldGhycword2FpdGlmYWNlICRuZXRuczIgdmV0aHMK
KworbjEgd2cgc2V0IHdnMCBwZWVyICIkcHViMiIgZW5kcG9pbnQgMTAuMC4wLjEwMDoyIHBlcnNp
c3RlbnQta2VlcGFsaXZlIDEKK24xIHBpbmcgLVcgMSAtYyAxIDE5Mi4xNjguMjQxLjIKK24yIHBp
bmcgLVcgMSAtYyAxIDE5Mi4xNjguMjQxLjEKK1tbICQobjIgd2cgc2hvdyB3ZzAgZW5kcG9pbnRz
KSA9PSAiJHB1YjEJMTAuMC4wLjE6MSIgXV0KKyMgRGVtb25zdHJhdGUgbjIgY2FuIHN0aWxsIHNl
bmQgcGFja2V0cyB0byBuMSwgc2luY2UgcGVyc2lzdGVudC1rZWVwYWxpdmUgd2lsbCBwcmV2ZW50
IGNvbm5lY3Rpb24gdHJhY2tpbmcgZW50cnkgZnJvbSBleHBpcmluZyAodG8gc2VlIGVudHJpZXM6
IGBuMCBjb25udHJhY2sgLUxgKS4KK3BwIHNsZWVwIDMKK24yIHBpbmcgLVcgMSAtYyAxIDE5Mi4x
NjguMjQxLjEKKworaXAwIGxpbmsgZGVsIHZldGhycworCitpcDEgbGluayBkZWwgd2cwCitpcDIg
bGluayBkZWwgd2cwCisKICMgVGVzdCB1c2luZyBOQVQuIFdlIG5vdyBjaGFuZ2UgdGhlIHRvcG9s
b2d5IHRvIHRoaXM6CiAjIOKUjOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUkCAgICDilIzilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilJAgICAgIOKUjOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUkAogIyDilIIgICAgICAgICAgICAgJG5zMSBuYW1l
c3BhY2UgICAgICAgICAgICAg4pSCICAgIOKUgiAgICAgICAgICAgICAgICAgJG5zMCBuYW1lc3Bh
Y2UgICAgICAgICAgICAgICAgIOKUgiAgICAg4pSCICAgICAgICAgICAgICRuczIgbmFtZXNwYWNl
ICAgICAgICAgICAgIOKUggotLSAKMi4xOS4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpXaXJlR3VhcmQgbWFpbGluZyBsaXN0CldpcmVHdWFyZEBsaXN0
cy56eDJjNC5jb20KaHR0cHM6Ly9saXN0cy56eDJjNC5jb20vbWFpbG1hbi9saXN0aW5mby93aXJl
Z3VhcmQK
