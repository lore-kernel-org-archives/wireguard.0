Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC20F606A31A
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 26 Oct 2026 19:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror header.d=gmail.com header.i=@gmail.com header.a=rsa-sha1 header.s=20251104 header.b=l39yolQ4
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id b24bda46;
	Mon, 26 Oct 2026 19:53:38 +0000 (UTC)
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [2607:f8b0:4864:20::32a])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 43940e1f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 10 Oct 2026 16:03:24 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 46e09a7af769-828f4eeba13so599642a34.1
 for <wireguard@lists.zx2c4.com>; Sat, 10 Oct 2026 09:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791648202; x=1792253002; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=eQ7ZlTSPdtjcPAvTioThuS2gwYjU6uD9eLoLqjZ1xVk=;
 b=l39yolQ4YNNTD4F+fB3nUsJ7t0YRFHwkzjnGA1kxX068kygxY7X/1N6FQ1lebKyXHe
 y76ZgQFxhz1QydKklxAN+UW+YPaPjqJjXJUR0JY2bF4eObwN8OHnw7xyE+TMfzwU9Sho
 m9aFQdaPS8O+bBey0Q2QhreJ27ZTpRG4fWlpkShCmUxomzn0HoRrwgziw8EbnxunhnSm
 AQ9VO9Q+c8EXbc8SpweMDIwLh3RvytAPshWjZKP1dO+I/4ZksI1Lyqg37S3YJ+3GJRE7
 DoblgK4XyXPxX9C1X8V1mqOypNGszexeA+otEyW2X7QCpuNQ58QDVdunMfKfeOj5DGOS
 zmcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791648202; x=1792253002;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=eQ7ZlTSPdtjcPAvTioThuS2gwYjU6uD9eLoLqjZ1xVk=;
 b=strCMWlNAsIdqLpPiwiKnjcrWMNnqkHGL7Wq7chc8eBr+Db/wOrPXx/QQB6sXNwKrL
 DtRgeFJnPlAcfg9soH69jttA6+qF4x0XrB0FpS2++vwcbqjxtVNREWxKMONpvdWihfUY
 5rHoU9oNScMe/fbzmdYj4KWlvdQ95VN0OxZLf+VcVoQTg4pepespbkeqnDvbUsUcldyH
 ehSjSaBlI+6ShURdStMDZUwotMoMWy4wNI2965K8g+jyq8Ro8+i/LxwZSPvaCPCUDUPU
 PJGsTpis5Uu0nT/w8xGu7JgZjF2YHDjYpHcwHiK2xHClUT8/aTKr5j2LTI3hCTuZhQqh
 fh6A==
X-Gm-Message-State: AFq9FYJ0JOnpYYZ+nBe81CdCnyyT2LA06JUf/lYuBSD0lL3mXrIYpLHI
 CIJNCfRpC5tTLioLOYUCsf7HqQsHM4k9qoEvanthIhxu5s0eMXtAaYc2sOWA6A==
X-Gm-Gg: AYBFou1aKjLVm4Ugm0tSLOiZlGw9BZ/aGQHZ9B1fe4/IqIrm74QuUXFWbcyqFpLkxWe
 09I0YeReb7p5W8LV4kIge0qYy9GeXKqaMuuZi44Ler2dXYtPfDrrjjwX2NRyXiN6i3QX5WUCwQ9
 7NXR2TrvuXfJMh8W9ox1vE2/McknJdsei3JYpL0QFkpqFmrDD9mJyetgEP+7f3fl1VoxcDwPTwv
 JOr+muZlle0szczfijYlF+DZw60ccXogYW8FQKSvZ+G6sFlipYqJUaTMrNH//9ktfbUp4eVq574
 iWKo/SJY/tpu9mdN/URcSxJNPswzLtkVXT8Nu2UJRSS3l88gn4viTCtkyreWdIvQQJ0WQRSsbd2
 hw4mkWhMSrAAbcGMDzG7Ym0JVMIRuYXxDCSQ9SIYL0dNB+jvysW136+fR5gcfRLVSExBMdrsM0W
 w202g4NWSKrodMEfmuLW42M2kdK3zI3tvzIcENsfIil0M8VTga+5qDECg4hdq+F4ZBz4uwSo3tZ
 /MovS22QzzdcmRwBmoJxT6WGtW+ixlUdEPaPqkE17sTaH6BCZYH91rfR/2WY9VCIo+o
X-Received: by 2002:a05:6830:6ae7:b0:823:38f9:ea5d with SMTP id
 46e09a7af769-83095e16bb2mr4750971a34.11.1791648202481; 
 Sat, 10 Oct 2026 09:03:22 -0700 (PDT)
Received: from fruitbat.pteropodidae.net
 ([2600:8802:7f60:800:f5af:3c13:a013:e022])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-83039076d67sm5184385a34.13.2026.10.10.09.03.19
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 10 Oct 2026 09:03:21 -0700 (PDT)
From: Loren McQuade <loren.mcquade@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH 0/2] iOS 27 build and launch fixes
Date: Sat, 10 Oct 2026 09:03:01 -0700
Message-ID: <20261010160303.2853-1-loren.mcquade@gmail.com>
X-Mailer: git-send-email 2.54.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 26 Oct 2026 19:53:36 +0000
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Two small fixes for building and running the iOS app with the iOS 27 SDK.

1/2 WireGuardKitC fails to build because u_int32_t, u_char and
u_int16_t are not visible to the module without including
<sys/types.h>.

2/2 An app built with the iOS 27 SDK that has no UIScene manifest is
killed at launch (EXC_BREAKPOINT in
UIApplicationEvaluateRuntimeIssueForNoSceneLifecycleAdoption). This moves
the window into a SceneDelegate. The app delegate's state restoration is
not called once scenes are in use, and a scene's restoration activity was
not handed back after a force-quit when I tried it (the scene saved one,
session.stateRestorationActivity was nil on the next launch), so the open
tunnel is remembered in UserDefaults instead. I'm happy to do that
differently if you'd prefer.

Tested on an iPhone 15 Pro running iOS 27.0: the app launches, importing a
.conf from Files works, quick actions work, and the last open tunnel comes
back after a force-quit and relaunch. The iOS app archives and the macOS
target builds with Xcode 27. Not tested: iPad, or any iOS before 27.0.
swiftlint reports nothing in the changed files.

I'll send a separate message about a tunnel stall I see on cellular.


Loren McQuade (2):
  WireGuardKitC: include sys/types.h
  iOS: adopt the UIScene lifecycle

 Sources/WireGuardApp/UI/iOS/AppDelegate.swift | 100 +++++++++---------
 Sources/WireGuardApp/UI/iOS/Info.plist        |  17 +++
 .../ViewController/MainViewController.swift   |  13 +++
 Sources/WireGuardKitC/WireGuardKitC.h         |   2 +
 4 files changed, 81 insertions(+), 51 deletions(-)

-- 
2.54.0 (Apple Git-157)

