Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 019EFCA0EED
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 28 Aug 2025 07:24:42 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4dd4ec59;
	Thu, 28 Aug 2025 07:22:55 +0000 (UTC)
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2a3ecc1c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Aug 2025 07:22:53 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-55f3e4dfcf6so717638e87.2
 for <wireguard@lists.zx2c4.com>; Thu, 28 Aug 2025 00:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756365773; x=1756970573; darn=lists.zx2c4.com;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=03dMPErkJRLGig22iq2T6Enh1mJfgfr+6J1nO3dvbig=;
 b=mCpyE/z9UvKQJjdTTCR6Uc8lLa/bexS96WzYDCkl6HN/J+zMJhSxPSbpxnEBirNmws
 53PnvGIUlOIC0vdRKdXN7DvcbWbimKmZWEQHIZpcf7AQsi0Ytwg2+KejbAQuu2dV7239
 rgaJO8oztAxmcSWJ8wEUKjWmMksg5uxlOzG1MJn5J88jf0BedB934wtEu8686WGEls7v
 e7cK0V2pFhLUOb3RbuGT0k9wBSfemh74K+DR2tt1aILEw0ieRmYPry7oMtwEBPh80yQw
 7IwWD5MSob42cL2yWmxm0wxFryI85vGE0Htlps9j41FIR6oIMokb7NbM2RWdt+0NgRTY
 mclw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756365773; x=1756970573;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=03dMPErkJRLGig22iq2T6Enh1mJfgfr+6J1nO3dvbig=;
 b=lD7nrXvHzHyVjYOqzdYFFjngzAR/7DC6jMvnqfAb6qJCfXjlNtJJUb3OcD+/EBPFi+
 cFtRBn14d3NUP1WAv3fdyPBybXsg85qjfsnRtjxj/QiBPCi9OLDj+JwxGgxv9Tn4kzMW
 fmOkCCwpy25sgl3mDBoaQfT2fGL433G+XIW57n77XAXOWaNFteodxn7IVZkTv0aqG6aJ
 RA/9lgzweB4zV5zAttSCtdLcvsIth1LOm1/3qyYlm7qBtFDjMSYP2aaZnwa4539DZ8Vg
 vUN0QD3189XhfnTcRt8YZIwBbMEoPKUP8JlO2KS27cC/D8ZLWUA/NEllhQvTSsL2vaQQ
 2khw==
X-Gm-Message-State: AOJu0Yzk0PduGuGZVGdMRfdRixgzEdjkBdzocMJGvy+lcez2eFIatmJk
 lYbxVnvjvjVeK2hRs6MY7jsDbNebZTMeqm0Vfy4VvGlRX/fNr8zZkYmYTGoZmXaH/Q4YFGHB8SH
 THzCbyvUMIH/gWiyr3RTHtlrvPKLQy/EE/MPU
X-Gm-Gg: ASbGnct+coUaiYPVmcUL9uHY8ATxJ+QkXSd5cU2dNf+hggG3b5jK27YwSEmMy+QA38M
 iFvXLDeGkN3FvInKvHBce+VLAT30msKqyUjORv1/NhM6IOYEIdwIhzr/o0QBiOlPSOBbuzxLX1n
 81Dw9wveMXYsmwJEXF4O3HNVwYXbuT2tCMvMqj3VRa7A/tz+EXZGgnoCrkbYxlXC2ElmRgL38iK
 Pf79m/JXYf/76rb6eNOzEVIEWzngDeoxzr/qvwHjDO1MBdqtsFReiohv2sVX9h1WHt9Fo69VF8N
 iitQ9lyH
X-Google-Smtp-Source: AGHT+IEmRKQ6WJgjfSO2NZkT+nL3i4xPW2V6Dsj+TVxTKD3tVDucFEPA8aa/XbH3W8h2cFmQUd2gxIsX+lcxf7q/i9I=
X-Received: by 2002:a05:6512:6601:b0:55f:43ba:93f8 with SMTP id
 2adb3069b0e04-55f43ba9673mr3940534e87.17.1756365772484; Thu, 28 Aug 2025
 00:22:52 -0700 (PDT)
MIME-Version: 1.0
From: Houman <houmie@gmail.com>
Date: Thu, 28 Aug 2025 08:22:18 +0100
X-Gm-Features: Ac12FXxZsgCNlS4BGgie0O9LmnnO1ERntJNkmZ41FlmeiEbj4KFVf1G0IPu8xgs
Message-ID: <CABBZOsmKJYs9HeaMeNx60om81V2mCagWWhCgbxeppr_2FD_xfw@mail.gmail.com>
Subject: Google Play 16KB alignment issue with WireGuard library - fix needed
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

Google PlayStore is no longer accepting apps affected by Google Play's
16 KB page size requirements.

The native library `arm64-v8a/libwg-go.so` (from
`com.wireguard.android:tunnel:1.0.20230706`) is not 16 KB aligned

implementation 'com.wireguard.android:tunnel:1.0.20230706'


Can this be fixed?

Thanks,
Houman
