Return-Path: <SRS0=x3Nk=MT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54081C67797
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Oct 2018 14:15:24 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E84EC20882
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Oct 2018 14:15:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tvEc1H2u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E84EC20882
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a0869a24;
	Sun, 7 Oct 2018 14:11:37 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1c35151e
 for <wireguard@lists.zx2c4.com>; Sun, 7 Oct 2018 14:11:35 +0000 (UTC)
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b1b5ed3d
 for <wireguard@lists.zx2c4.com>; Sun, 7 Oct 2018 14:11:24 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id y11-v6so7275766wrd.4
 for <wireguard@lists.zx2c4.com>; Sun, 07 Oct 2018 07:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jLKtG5eU1ckpDrnTKXvMK9n0KIA2zddFBL0o7gkPaSk=;
 b=tvEc1H2uDn86zUj787mfyYnKPWA/0azTrp+IA/0E8+EAiX4R21tU6z8TmjXkdDtsnI
 iHOp/WSN+/gYERwsv0F3iejtcrnCQ3fOcZExL/SjjxpDaXbtUxtiyzpjDDHwRO4tz+XV
 PmPl99gkA6HxLEkLMiequSh+k2gtux17VyPmtn6y1+CSqhQA04N/EV7p/XzUvWu826lx
 VmPkCTtmo0basP7pr99ABVsJzQt7b07Y/BuRekwaerQbJlDCv05mCFgU1swMO/Yk8aHQ
 ps1AQF4a9dqHhn4quV3HVQ65/6EPn83rVVMhUSvpjQ/19nATdiwXfOJk2Vk/1DiMFQoF
 XzDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jLKtG5eU1ckpDrnTKXvMK9n0KIA2zddFBL0o7gkPaSk=;
 b=YOgk56gl0/XIVEK8+NKcSVHLNo9C2lvRU3ZwvuLwP9wAstiX6h+13jNPlZYgjir+/i
 cMOaUo1YdO0WJ+fWhWbkpb5Nlt7sZTT38nTts2vS9cB6gxsYBMHnvqK/eYVP0fHwO/lJ
 vqbLd92BxvQFAUZTIu5UHJO8BWWHPtdil1SpRo9HOCwpiFixBty84Sir1eaydjzjLRMG
 tkMgEa9Q3GPVm8GYz5xLMrc1A32Le881/CoipXJJaRCP0jU9TY8/i/9hVScSMwaRraSL
 NBVnSlNd5WkJmGBWosCHBlD5yqOzOqzU6mNhukkNC9gti0skIhyVOKDbNRumMbn0+EZR
 q//w==
X-Gm-Message-State: ABuFfohIaRr+L5k8ajDG6UYlW5HZxc/WWVakNgKrsoc/aJ/3MSJ3JenZ
 tt3jNDYnAod7vNJPnFQ8xcF/1tYs
X-Google-Smtp-Source: ACcGV63R6EUA+o4i1mkRoAADECBmXqx6VizaW5/z89GkoGXfb5z+Hw9uTeqoW4DWCgqZ6LGF4zySPA==
X-Received: by 2002:a5d:488a:: with SMTP id
 g10-v6mr13870539wrq.0.1538921522995; 
 Sun, 07 Oct 2018 07:12:02 -0700 (PDT)
Received: from localhost.localdomain
 (p200300C55F2A9600228984FFFE70D494.dip0.t-ipconnect.de.
 [2003:c5:5f2a:9600:2289:84ff:fe70:d494])
 by smtp.gmail.com with ESMTPSA id w72-v6sm28940116wrc.52.2018.10.07.07.12.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 07 Oct 2018 07:12:02 -0700 (PDT)
From: Julian Orth <ju.orth@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH v4 12/12] tests: add test for transit-net
Date: Sun,  7 Oct 2018 16:11:39 +0200
Message-Id: <20181007141139.26310-13-ju.orth@gmail.com>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20181007141139.26310-1-ju.orth@gmail.com>
References: <20181007141139.26310-1-ju.orth@gmail.com>
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
ICAgICAgICAgICAgIOKUggotLSAKMi4xOS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpXaXJlR3VhcmQgbWFpbGluZyBsaXN0CldpcmVHdWFyZEBsaXN0
cy56eDJjNC5jb20KaHR0cHM6Ly9saXN0cy56eDJjNC5jb20vbWFpbG1hbi9saXN0aW5mby93aXJl
Z3VhcmQK
