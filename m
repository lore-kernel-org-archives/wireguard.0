Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AFF0C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 16 Feb 2022 15:30:24 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id bc3e286b;
	Wed, 16 Feb 2022 15:30:22 +0000 (UTC)
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [2607:f8b0:4864:20::22b])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 01e6110b
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Feb 2022 15:30:20 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id ay7so2766744oib.8
 for <wireguard@lists.zx2c4.com>; Wed, 16 Feb 2022 07:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wandera.com; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=ui5F4YlGRLcNBN+Aixtz+IJtUbMAzVTT3sfUM+rdnbU=;
 b=MunHfuPMzcSZWh/H6uoOl/38UUcRrTpe8FBLXhZo435QCOe/sPdWBNNDfr5vKXrSHC
 OK6g6rL+e8XfpMqNHL3g3aEFHm5w5ZWUYsx9MA8yJxOetKcVhrldj8USUJEUlwgqP7tC
 hbyznk4WsZbdwMw6Z0K/eTisa9uCE5673XWsp/OHL2RGX/01Of9/kzEPS77CboMgN2j9
 /f/4u4Ci93l5IL20Wl3X027Fr6xmpJnfv6KKuuRbCPmzm25pFteuGmdyXDzAT2fPOf3k
 2hMr3BvwrKfOWfDMJ7ZYWkfSalcLPAQv021ynT8P1KPLEGih7DZOXjwoumcBQqjTCnfr
 LnwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=ui5F4YlGRLcNBN+Aixtz+IJtUbMAzVTT3sfUM+rdnbU=;
 b=V9FjuulkXgo99PfcnqmIJw4p0ImpFx03qNyMUjmhJRKfzOwzeksOrJjWVLi3fP0q88
 PJ7Z/SBNeLCeJWAl4vyREdwBiO9mROPlgUNMTUuucPDH5TK5n7WLZiCchAVsvUhPrPAe
 Zu98uFslmNjFrjE8L5SkRqpJmrV1bko4yRiVhd4lmtFY0LGDcuC1wQmMKHJMEelpMwMa
 0BDsVVrFtoT/ASAMGKNcOAd3yaZX9rMHPO3ptNukCOIEdzUuamk1N75Mgl7dGaeBAkj6
 J8Bm8xoAXqtzRIQ+JeT5U8am4q1/YWK3cJrh4cpzpCKpzYjOqEOsc+6c8PFHw98VAfG/
 J8oQ==
X-Gm-Message-State: AOAM533r6duO3YjQlNuuFmeZ2Zill8qVOwxVewefvprAtlbqE1DZGlEd
 gLEHI9jwEjFKurtY2G3ZpqManTRUAJfod90a7KCPj5SSVBKASrrJu6UyF7vm4HHp3bbmKWYxgwr
 os8ESkiZ3ocfdbzxJR0yjKYSjjZrZ6GYUfqdZJPUv
X-Google-Smtp-Source: ABdhPJwob5Z97Giov1ENXn3SvPmwt2WIzRcszfSHQw9FGyIfyOTtKHbiwS//hsF3M7K+c7SmUOEyhDUmKJr9W6UwTOQ=
X-Received: by 2002:a05:6808:11c9:b0:2ce:6ee7:2cf3 with SMTP id
 p9-20020a05680811c900b002ce6ee72cf3mr916203oiv.289.1645025419308; Wed, 16 Feb
 2022 07:30:19 -0800 (PST)
MIME-Version: 1.0
From: Laura Zelenku <laura.zelenku@wandera.com>
Date: Wed, 16 Feb 2022 16:30:08 +0100
Message-ID: <CAA-4Yo1nM98swVeFoJKZYAymq2B7qnvTLrEAqjOqQ=iHvyDgww@mail.gmail.com>
Subject: [PATCH] Lower log level of 'invalid state for keypair derivation'
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
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

Error is caused by multiple handshakes processing in the same time for
the same peer.
Invalid state is not harmful for a peer and the other/faster handshake wins.

Signed-off-by: Laura Zelenku <laura.zelenku@wandera.com>
---
 device/receive.go | 3 +--
 device/send.go    | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/device/receive.go b/device/receive.go
index cc34498..25fb7d9 100644
--- a/device/receive.go
+++ b/device/receive.go
@@ -379,9 +379,8 @@ func (device *Device) RoutineHandshake(id int) {
                        // derive keypair

                        err = peer.BeginSymmetricSession()
-
                        if err != nil {
-                               device.log.Errorf("%v - Failed to
derive keypair: %v", peer, err)
+                               device.log.Verbosef("%v - Failed to
derive keypair: %v", peer, err)
                                goto skip
                        }

diff --git a/device/send.go b/device/send.go
index 0a7135f..9598bee 100644
--- a/device/send.go
+++ b/device/send.go
@@ -156,7 +156,7 @@ func (peer *Peer) SendHandshakeResponse() error {

        err = peer.BeginSymmetricSession()
        if err != nil {
-               peer.device.log.Errorf("%v - Failed to derive keypair:
%v", peer, err)
+               peer.device.log.Verbosef("%v - Failed to derive
keypair: %v", peer, err)
                return err
        }

-- 
2.30.1 (Apple Git-130)

-- 
*IMPORTANT NOTICE*: This email, its attachments and any rights attaching 
hereto are confidential and intended exclusively for the person to whom the 
email is addressed. If you are not the intended recipient, do not read, 
copy, disclose or use the contents in any way. Wandera accepts no liability 
for any loss, damage or consequence resulting directly or indirectly from 
the use of this email and attachments.
