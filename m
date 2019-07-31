Return-Path: <SRS0=EGLd=WR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E020C41514
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 Aug 2019 15:43:09 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A770722DA7
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 Aug 2019 15:43:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mt/FA6DX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A770722DA7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fdd4ed5e;
	Wed, 21 Aug 2019 15:43:07 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eb64c6f6
 for <wireguard@lists.zx2c4.com>;
 Wed, 31 Jul 2019 13:36:31 +0000 (UTC)
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fe1ea62c
 for <wireguard@lists.zx2c4.com>;
 Wed, 31 Jul 2019 13:36:31 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id p15so65689744eds.8
 for <wireguard@lists.zx2c4.com>; Wed, 31 Jul 2019 06:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:date:to:from:subject:mime-version;
 bh=zL4wSdIeIK87TV3Kx1x6+oDhuLAb6skVxZ/14AQAXPU=;
 b=Mt/FA6DX13gCWD6U6KJtfBbTmvzKVTIBkipfQyth0h7pa/sH6u+NPAQfs6WE84NgER
 URXIEiD0EVSzzNCOqpytpOUy52vx6Bu1OGH0awMKCYd9nUfV539qPE1jNYm6jX5HOGor
 hBze8Rm8c6L8b194nOMDuBXq/lUwJ3U3gKT7QOpZjVQK1ZCP7mkYmMoRE91Uaa/qKuHE
 zb6FOKssa5gGmmagATG6vdF182yZckVpHuP1impJeFEHkatSNUZ06HvMtKcC67IWIjCU
 oAaTUYQUGMq4pHEro+Y4hGkVxleq/Kj/n8+X0wiwoTp4Ea0cetoVyVUGAl3yoih+M/nI
 BfSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:to:from:subject:mime-version;
 bh=zL4wSdIeIK87TV3Kx1x6+oDhuLAb6skVxZ/14AQAXPU=;
 b=goQIWvSdvOdQQxESah3FxSefgOWNMe09fom3A6guzEFvfcZ0uOe8FZvclKDuPaInYY
 sHHd6ETxjCxL1tQIvt6yhEcqcNjeO9UIpvuwc6sp889BHhuoB6ElYAVr/Ox2GHEVJmQW
 ls65k/65btWAlhAKceDn0SfgP3eIUOIPdXEaK5Q3vPfFdG3nfarUEG/wv+G4/vaeOL3i
 HNrnPRVPazTo2OfnqGHi/1rAaBQ216Ub7g/pQKEirS6QzGb69nxclrpZpjQcp7A+CVTr
 V/DuD703CcQ4R3kcc5AL+rt/+8xUF2P0zz+QnlpRZgGzfNSiqndbtWweOr6p/Du5uhX4
 dBXg==
X-Gm-Message-State: APjAAAUP92YH+4Qnc/ehsrnCwK0iS6IUV4tUuP7W2utPWgS7/eNXTgbC
 LvSMVc0LAifT5HtdD0Ru21uSnUEf
X-Google-Smtp-Source: APXvYqzgAlEXkQDhuWZ97vAlzh1lVuBTgnakGEGcERaLMoVMlRrZxicgg3qihGj1jd7qG6JdbqRtnw==
X-Received: by 2002:a50:f5f5:: with SMTP id x50mr104939033edm.89.1564580189830; 
 Wed, 31 Jul 2019 06:36:29 -0700 (PDT)
Received: from localhost ([188.252.197.229])
 by smtp.gmail.com with ESMTPSA id j7sm17502091eda.97.2019.07.31.06.36.28
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 31 Jul 2019 06:36:29 -0700 (PDT)
Message-ID: <5d41995d.1c69fb81.35aae.ce0c@mx.google.com>
Date: Wed, 31 Jul 2019 06:36:29 -0700 (PDT)
To: <wireguard@lists.zx2c4.com>
From: <nsajko@gmail.com>
Subject: [PATCH] device: in setZero, keep arr alive after being written to
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary=530fd78f2c674b7c43f9e84d0c5f04a774553677ef189bd6eeb37c73b140
X-Mailman-Approved-At: Wed, 21 Aug 2019 17:43:05 +0200
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
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--530fd78f2c674b7c43f9e84d0c5f04a774553677ef189bd6eeb37c73b140
Content-Type: multipart/alternative;
 boundary=8f9dfc53cbb54087cc4c3f7ef2e8044198f2a81ed740104c783477c2d258

--8f9dfc53cbb54087cc4c3f7ef2e8044198f2a81ed740104c783477c2d258
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=utf-8

This is to prevent dead store elimination.

See the discussion at
golang/go#33325 .

diff --git a/device/noise-helpers.go b/device/noise-helpers.go
index f5e4b4b..29430da 100644
--- a/device/noise-helpers.go
+++ b/device/noise-helpers.go
@@ -10,6 +10,7 @@ import (
 	"crypto/rand"
 	"crypto/subtle"
 	"hash"
+	"runtime"
 
 	"golang.org/x/crypto/blake2s"
 	"golang.org/x/crypto/curve25519"
@@ -69,11 +70,16 @@ func isZero(val []byte) bool {
 	return acc =3D=3D 1
 }
 
-/* This function is not used as pervasively as it should because this is m=
ostly impossible in Go at the moment */
+/* This function is not used as pervasively as it should */
 func setZero(arr []byte) {
 	for i :=3D range arr {
 		arr[i] =3D 0
 	}
+
+	// This should keep arr's backing array live and thus prevent dead store
+	// elimination, according to discussion at
+	// https://github.com/golang/go/issues/33325 .
+	runtime.KeepAlive(arr)
 }
 
 func (sk *NoisePrivateKey) clamp() {

--8f9dfc53cbb54087cc4c3f7ef2e8044198f2a81ed740104c783477c2d258--

--530fd78f2c674b7c43f9e84d0c5f04a774553677ef189bd6eeb37c73b140
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--530fd78f2c674b7c43f9e84d0c5f04a774553677ef189bd6eeb37c73b140--
