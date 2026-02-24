Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79599F55425
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 24 Feb 2026 23:42:59 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 5d1a660b;
	Tue, 24 Feb 2026 23:42:58 +0000 (UTC)
Received: from mail-dl1-x122c.google.com (mail-dl1-x122c.google.com
 [2607:f8b0:4864:20::122c])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 4d93f736
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 24 Feb 2026 23:42:55 +0000 (UTC)
Received: by mail-dl1-x122c.google.com with SMTP id
 a92af1059eb24-1275750cfc7so1527796c88.0
 for <wireguard@lists.zx2c4.com>; Tue, 24 Feb 2026 15:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771976573; x=1772581373; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/EyDnmdrynS5criMy9WhvBOJwfjb2d2/OIAaPmk1XEc=;
 b=idHRTD4h2i6fW4637Qug7hJ3PWxRh/va9C9VAGWyWriEnYDBO+c4oyItClAI/XrwAy
 +MuS0e2glXBZdBko1BtT1QBnEbuGMri7mwe8MEnBM5t+o1tni0K0/pXFMhfVtGs+AF+P
 mGY2CzbMMdeTsUqRMwLwqFlg0gcEIa8gYYveisCNdSVVE5S5rbSqXmKfj/9HrGBFapgD
 tJZOdqjvsSuJxUonBEB/wlV7asNaIWAnrnTyHO6YT8wf6/NcWtfs8TLkR/Gf9SAdx4K/
 mF58x9yb9oeoUyEFEYRShewAJ2Xns3SbCxKMVkh1/LoT8g0bP0IweF2Paa2fhj0UHZ0T
 X2yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771976573; x=1772581373;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/EyDnmdrynS5criMy9WhvBOJwfjb2d2/OIAaPmk1XEc=;
 b=lp9vtpAN8e+5uHnFQNHgzrwLNzktnkvNxSksDHBOyiuTADcJIr9C7l+ZbJnYbzQTjA
 bXsUYvos88GRBVc9b+B+JFCO2z8aXqcq6L3o+lJjhvcWpmfcLjeP8hxew3dMvyPts4v/
 KoN2VLAeWZlVIiPQbONU9jYd/cuDiBVL0tvYhFaSARPSDaAB9NT9PgfiuzQV6R2iJavj
 U+wapKnwuVkriSyLfZG3qnO7Qsbq72AffL/scxjuTmrSJ/3FP6FYaYv40jjBiQ0micGc
 KNlc11nUTAEQUI0AGCGEjQtN6Yddv6sKthj3IUxHmwsQTxNJTl6YMqdRtP1GDuboVM4u
 +WJw==
X-Gm-Message-State: AOJu0YxMLo5coaWEk7kmOs6pvkSDN9rNPRohtCeuygv67YDH3S24hb0Y
 QLSdr5SLdEkqjoOBWvMX4wv8tfhsbAro+SAZpcawMW4GrDgzdXCUNv47b11Igakf
X-Gm-Gg: ATEYQzyqfdpwWoFjums32BEn1m5Gz+y7RPDIBJ8bf4PV9/W4ZrqqbJKY9Jt9J7OjB6V
 kXFfVL6GS2sP49kNIj0IA3uFomGlOfVXX4470g9sBki3Vccj/3VppcCs4CcoS1Dp4LDEhuZoLlH
 k2WLMCflZtfk7mgZ7Ylihj/MyRyRQB+UfIieAsg45pufRErXVr/Ji+uDv2Uj77scr67Ij70ALjB
 L7Hp9e2kGw65b7/6UFTdv2hpi4k6KaPdJru+Vl4ihi3rEkQNmq5WLSWOhXgA10Z1IwcbQkfiOzi
 kiwL8C7R4F9vm/6/ejmu590By5oR28J9TAwqEjAfHPzZx0wSoGKdro8z8X/hdR0KzE4k52r8wud
 2BHO8Unz68oC9vMW95Y3oII4R6cYtxaiONiPnUv0BznSxUuPCy1PmzSCGJeuKId6QcQr1Bn0d4K
 2LW3eChXnGePmetpP5BUYD4hgZGxhT4E+ywkuG5EPHL4vYoXk4+p4=
X-Received: by 2002:a05:7022:4584:b0:122:2f4:b24b with SMTP id
 a92af1059eb24-1276ad1a72bmr6047478c88.25.1771976573316; 
 Tue, 24 Feb 2026 15:42:53 -0800 (PST)
Received: from localhost.localdomain ([2601:645:0:cdeb:3db4:7690:94b4:8ccb])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1276af2ea06sm14038099c88.7.2026.02.24.15.42.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 24 Feb 2026 15:42:52 -0800 (PST)
From: odedkatz <katz.oded@gmail.com>
To: wireguard@lists.zx2c4.com
Cc: odedk@twingate.com,
	alexey@twingate.com,
	odedkatz <katz.oded@gmail.com>
Subject: [PATCH 1/1] remove the condition on possibly stale variable
 (Session->Descriptor.Receive.Ring->Alertable) for Setting TailMoved event
Date: Tue, 24 Feb 2026 15:42:46 -0800
Message-ID: <20260224234246.16021-2-katz.oded@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260224234246.16021-1-katz.oded@gmail.com>
References: <20260224234246.16021-1-katz.oded@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

otherwise wintun driver just holds on the event until something wakes it up (see here)[https://github.com/Twingate/wintun/blob/6bfc34a60aa944149fdc7e9cddb191e9a8b6ec1a/driver/twintun.c#L487-L488]
---
 api/session.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/api/session.c b/api/session.c
index ab96c64..dcaeb25 100644
--- a/api/session.c
+++ b/api/session.c
@@ -302,8 +302,7 @@ WintunSendPacket(TUN_SESSION *Session, const BYTE *Packet)
     if (Session->Descriptor.Receive.Ring->Tail != Session->Receive.TailRelease)
     {
         WriteULongRelease(&Session->Descriptor.Receive.Ring->Tail, Session->Receive.TailRelease);
-        if (ReadAcquire(&Session->Descriptor.Receive.Ring->Alertable))
-            SetEvent(Session->Descriptor.Receive.TailMoved);
+        SetEvent(Session->Descriptor.Receive.TailMoved);
     }
     LeaveCriticalSection(&Session->Receive.Lock);
 }
-- 
2.43.0

