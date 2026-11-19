Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D700606A33A
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 19 Nov 2026 16:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IurGkgoq
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id ce8bd80a;
	Thu, 19 Nov 2026 16:31:06 +0000 (UTC)
Received: from mail-dl1-x122c.google.com (mail-dl1-x122c.google.com
 [2607:f8b0:4864:20::122c])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id df779682
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 19 Nov 2026 16:31:02 +0000 (UTC)
Received: by mail-dl1-x122c.google.com with SMTP id
 a92af1059eb24-14394530ec6so3746821c88.1
 for <wireguard@lists.zx2c4.com>; Thu, 19 Nov 2026 08:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795105860; x=1795710660; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=vCYJ0fH2n/KP3i8pDmKkJR4eFbCTpu42Qpe7NHI+Lws=;
 b=IurGkgoqMJXsGd2hnSEjeDebopCjjSndzFLyZ9WbwOADMGaIsy/O/ExWO5WSLgJwW7
 M52mhDNsGNRN7neB0RqwYE47rTPw+E4+7GdFyx8JtbiwulWRIcJSn9pmLY67HjOR5/4w
 Bh2dTYxsP/f10j7OF7uAmi9MZnAQD4cWq9m7QylZ7jgIu3dxnmcwKvn2rvv9Q9fzj6bc
 KdEHVXXlsUkuB6v6XiCh4eib11fIduGPEfd5SfrIJGNUTz+iHixy1OanxSNhbVtlVXm6
 /G1b5h1m7D3y95/yrNFVMVTxODZYePVWMH6GpjtYkmrQLKo5Y9XbzFZKoqQ7R6UcvGWg
 fXxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795105860; x=1795710660;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=vCYJ0fH2n/KP3i8pDmKkJR4eFbCTpu42Qpe7NHI+Lws=;
 b=CHQp3Fp1y+RGV55pXMjcN/9LZqvBqpyDud7RNqkjPdQ2kRG5t+qgwi7tfMKBCoFE5O
 vKv4IcQZz6O6Z4d0xgK+WGyqS5ezZwxfb18lzKtD7/Nd+9XL4GFzyZI9S4lfdds9HY7k
 7eMnBtTrIzYnRyy8NtRxbGeR2VkFtBal7M2oeCYZKJHFJREqLtR1lYmFfdQfpap7bjla
 Vump1bZUxubsZ6Udu/32LdRnC33bTZEC8IoGR/s11TSVOGtvJBBZxagn1Cnoe/ivzwux
 CWwRd+8odF36GuWnqebY53pOc+db0eKGXinfhTiaNCoQdN2zKxJeKgOYUYvwsVfYP2CY
 YXyQ==
X-Gm-Message-State: APuU4Z+JygjrIjfXmjJlzcAHRbdcc6DkO2wzSofroHv+rva6AyC4Knci
 u75/bEjz/qmS+m1N1CogwPYfIHfKGSNRYS3CLKpMToBKOZpk/B1HyP9Ko7rdwDT9
X-Gm-Gg: AYBFou2IVl7Z167lJtmI29/M2H9eoEUROqIfnt4/rGThPaGwxjq4OLgnct7SZSOfaXp
 0ivoRPiq6/xUL9CcZ0SjTZMNcFuz4IvCeJUOVPG/ifH7MQn6saWmu6EKiPJtj2y4p5X/GTffnrj
 aV116XPg0O52xl1gOtRKKXZAIUhlynDAZP0fStj3xkwVhJzUPeE9BD7n467QFhwIvc+cEsksD8U
 pa8e+Xj3Q2Vokq2rXe4cr1+9UP3tI0iwiayM5zu13AsoZf6bUmO5776zN/JMO+KVwyLzEIymL1I
 SIalolycqbG8ZXwZHhuNQCRxv8pF+r6N/p5Wge2jE9696BbgAO5LK87ggbSmEGNZ2Aquvo/du0W
 bLmSipgXUEWQzcK+764PnugSO7NImYmO5mYNnK0XBbTxF+VMbNmYGL5J7y5WVUR86x76YdQzRbG
 DVjzG3VspS1x13qd+HKO50HvubNGXtCbPLUoFTkubSsYX8jpr/wlpe5jYln13ieFOiDKr5zf00p
 7ZN21GAb778TPGc7m6k/G4L3vIgvk+CfCyvmjSgpw5iY9YdZZi5W3JT0NyobByhnQ5dCFXfBH5h
 uXOu5y544NXy5PVvdkCf6S6xMeq33wm4phoM6ymncilbl0Co+EIw+qc4s9rmmPFWp9ZBTX+SLvO
 7EC6S+81zTekV9tuAzi+V5PR7XhMF+ORyGUzmFOyT
X-Received: by 2002:a05:701b:240b:b0:1b2:40be:a929 with SMTP id
 a92af1059eb24-1b5568b38b3mr164343c88.14.1795105859865; 
 Thu, 19 Nov 2026 08:30:59 -0800 (PST)
Received: from fruitbat.pteropodidae.net (ip70-191-36-30.oc.oc.cox.net.
 [70.191.36.30]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1b556847fdasm350643c88.13.2026.11.19.08.30.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Nov 2026 08:30:58 -0800 (PST)
From: Loren McQuade <loren.mcquade@gmail.com>
To: wireguard@lists.zx2c4.com
Cc: therealgraysky@proton.me,
	razvan.cremenescu@gmail.com
Subject: Re: [PATCH 0/2] iOS 27 build and launch fixes
Date: Thu, 19 Nov 2026 08:30:50 -0800
Message-ID: <20261119163050.98697-1-loren.mcquade@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261010160303.2853-1-loren.mcquade@gmail.com>
References: <20261010160303.2853-1-loren.mcquade@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

A note for whoever picks this up: patch 1/2 (WireGuardKitC: include
sys/types.h) is the same change as 01/10 of Razvan Cremenescu's
macOS series, which was posted first:

https://lists.zx2c4.com/pipermail/wireguard/2026-August/009690.html

The diffs are identical, so whichever series is applied first, the
other copy can be dropped. Patch 2/2 (adopting the UIScene lifecycle so
the iOS app isn't killed at launch on iOS 27) doesn't overlap with his
series or with Yoandy Isse's macOS series, and stands on its own.

Thanks,
Loren
