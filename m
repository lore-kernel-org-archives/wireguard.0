Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF11DC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 18 Feb 2022 10:08:43 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id e2b79e33;
	Fri, 18 Feb 2022 10:08:41 +0000 (UTC)
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [2607:f8b0:4864:20::230])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id abb6a659
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 18 Feb 2022 10:08:39 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id 13so2468990oiz.12
 for <wireguard@lists.zx2c4.com>; Fri, 18 Feb 2022 02:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wandera.com; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=LKKgOnvs++cCqs3rjR9Zfecj/ddRGeuaq0LSJuEnEAY=;
 b=bj10vHaxbaGDVcVV4WCRmHWKS1uwmxuMG1vrzZDCNQf3PhlMrna1J5iINZc9OBoZXD
 5KuEvnT6PaIeBRQMiQ0Zl8tiFv11g9KXUorAhqobiMkj+ID1orx4UVPB4Qxpr3CREhY/
 VPdCZ1/jsc0RArYuIhusm7eMdeNS0ohmfsJliOrr+LDMdd9iLaD9TdRBusKXCOVuAcYs
 1QPS6Z9r4W3MZKkambvKiOTS7OQAGWmCa1/KXO7Y3hoo+8Anfxqq9fNDGvE8+r5ZyYBp
 lPY6dt39gMYY/oSXn8SIQmoUQVAKFeQx8zRXmJREbqaFuh5FGm4o2bUmBS9uJRbCNXMC
 VtTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=LKKgOnvs++cCqs3rjR9Zfecj/ddRGeuaq0LSJuEnEAY=;
 b=giPTER1Mv+Qn6QO0zMQeTTatT71DToyNS54gVSPbKKGcft1GUhdm6Snj/gvAaIIjdr
 pMowKSHg1pMXXsroPWhU3A7Z5ve+qZ+PcgaNDst1kUZDNJ0drrPsV01BqpqndPCSz+Sk
 m4w0/R4hCzr06RToUqcxLqxvUDK0k0Vmrl2/iSPcy2xaQSqhmE0ltZ8c+o0XCR320QWg
 IutOo3eKHrhkOIw1I4dk1Y/t5uocWD2i5CpYVo/CpBG6/Eid+YGf3M8EDrgJflzKr94g
 Uy/fXykpgLj1+I0hoA739JXjwUCEhqC7TfddG2KvPfB7haSKVpTK3jfDwpDx3DvMYO2W
 Yq3Q==
X-Gm-Message-State: AOAM5325xGbitBTugD5PNOXR13hmk50C073VjF1R2ghL4QMngpJjGdL5
 AhLlRRiLl55rsVkrORAaNTnlP7iBsb6mdlNmXdW9SoAYhMwKaSQe5QZf0dvn4/S3V5ry2YtkkwK
 2SJit6HXQO37RmGm6AxXB/rIFqtkMjlQ3kreEy6cY
X-Google-Smtp-Source: ABdhPJzijfYj/bSWUiU9AiP+XD5MoNXYDPhfKzCCL7YaCwCsUr7ZgoWkwY777Lx1c3/cmHm/mfjN68NuUNN2rtZ5K2Q=
X-Received: by 2002:a05:6808:11cc:b0:2d4:9b7c:6d76 with SMTP id
 p12-20020a05680811cc00b002d49b7c6d76mr1364069oiv.193.1645178917865; Fri, 18
 Feb 2022 02:08:37 -0800 (PST)
MIME-Version: 1.0
From: Laura Zelenku <laura.zelenku@wandera.com>
Date: Fri, 18 Feb 2022 11:08:27 +0100
Message-ID: <CAA-4Yo3orPJME2kAreKn7U7yC5=u9ca3jbTZStMam8F=Qt2tOg@mail.gmail.com>
Subject: [PATCH] Lower log level on handshake race condition
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

This issue is caused by "handshake initiation must be consumed first"
error. It is quite weird
because this is happening during responding on received Handshake
initiation message but probably
status of handshake is not set correctly in single thread for single peer.

Signed-off-by: Laura Zelenku <laura.zelenku@wandera.com>
---
 device/send.go | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/device/send.go b/device/send.go
index 0a7135f..0f0905a 100644
--- a/device/send.go
+++ b/device/send.go
@@ -144,7 +144,7 @@ func (peer *Peer) SendHandshakeResponse() error {

        response, err := peer.device.CreateMessageResponse(peer)
        if err != nil {
-               peer.device.log.Errorf("%v - Failed to create response
message: %v", peer, err)
+               peer.device.log.Verbosef("%v - Failed to create
response message: %v", peer, err)
                return err
        }

-- 
2.32.0 (Apple Git-132)

-- 
*IMPORTANT NOTICE*: This email, its attachments and any rights attaching 
hereto are confidential and intended exclusively for the person to whom the 
email is addressed. If you are not the intended recipient, do not read, 
copy, disclose or use the contents in any way. Wandera accepts no liability 
for any loss, damage or consequence resulting directly or indirectly from 
the use of this email and attachments.
