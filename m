Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A742DC55ABA
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  4 Aug 2026 20:37:27 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id e7535256;
	Tue, 4 Aug 2026 20:34:35 +0000 (UTC)
Received: from mail-pl1-x646.google.com (mail-pl1-x646.google.com
 [2607:f8b0:4864:20::646])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id fb30da82
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 4 Aug 2026 20:34:33 +0000 (UTC)
Received: by mail-pl1-x646.google.com with SMTP id
 d9443c01a7336-2cc86a9ef97so4076085ad.3
 for <wireguard@lists.zx2c4.com>; Tue, 04 Aug 2026 13:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1785875671; x=1786480471; darn=lists.zx2c4.com;
 h=content-type:to:from:subject:date:message-id:mime-version:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=kk2yEW5G+8aV19IML+0mVH8D0JBhKMpRAqcxcbwJciM=;
 b=qEIeNehVXFPDEOuVhkKc5gm6pum4/DS+aMMCaHS/oqIVMgUIkapQLD4s3HbYtRhVuy
 2K2/xzIJ+77qcKfkRRpqXtwhHQSNIA/KKVUyJLmYPKqh4YtERq2WICs5Cb4c55gcOJ5A
 /6etKfkVVll7EP4wBR2MnsPQf/EqYiH4Wc3g32LNGtIjy69RsZWwPXCq2EnH9zt0CzHF
 JmRFpW4uCKDerxe74H9TEf/VZ+h6KN6/VwRQ9vsMnyerG7J3Ou+VrbpcXl7pl9sp2SUL
 EQKh2iygQ2A9bew/1Ts9iWxRXhOEFAAfFfybby/iH1CRO8gEFF46cV0OZMGhVHfCUAsz
 2Zfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785875671; x=1786480471;
 h=content-type:to:from:subject:date:message-id:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=kk2yEW5G+8aV19IML+0mVH8D0JBhKMpRAqcxcbwJciM=;
 b=UDMi5ClUP6AWU1a8KGfYsHjob8Q9nUBHh4nVJEtSbO77S9akHffSWC126BLMZ7WXnj
 4PoFWWQJPPf/p1uyMcFugG+lLX776QgWIGeX4L4VfLwsxXlIEIllJKHq22UgmcpW1sBr
 +r3SF/36ozZYClqGKLTuGl3sUFc9WUHmXkSG8bFtd0HSDyfkGr9w5lVSN0fjEv/jxoYB
 xDZSp854bjD5hCNJtuZlBgKO881QedFgQ6Zwc4ChheTqnrHePrPxZeXxc3mHdzrSEen1
 3Z5UPVcaw9gqTz0/9h1iJphjNOGAMzF+F7tFxn+lEdH8YhZMeFY6Znb8BMvARrVqqTHV
 JFvw==
X-Gm-Message-State: AOJu0YyvMhZsKewkaFqIg6MvlZqTuthT0XGlukcSo4TTiIfXUuWFEu/3
 qwWMw2ZD99V4dxo/Z2uHDUIsD+saMuQ5yTEfPN17AXK8JgsSwQy5qPGqr/04aB1E0Q2NV/m6ctz
 xyE4W+vivGwOU7rc57UC1eno3657aLPwiaknsuUoP0ONAtcplBelUtWKrvfeORW4UKf6HN//Iyv
 GCDuOimLYUUheUOyiERFEZxub2ypDIlnnX7FE=
MIME-Version: 1.0
X-Received: from plma15.prod.google.com ([2002:a17:902:7d8f:b0:2ce:72a1:4ac4])
 (user=dkess job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:e94c:b0:2c8:4c29:afeb
 with SMTP id d9443c01a7336-2d0ca7b5520mr16357155ad.8.1785875671014; Tue, 04
 Aug 2026 13:34:31 -0700 (PDT)
Message-ID: <18c8b475f686cd5e.3130302e3131342e35302e3736.9a15.0000sendgmr@google.com>
Date: Tue, 04 Aug 2026 20:34:31 +0000
Subject: wireguard-windows and wireguard-nt version compatibility?
From: <dkess@google.com>
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
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

Hi,

I'm curious about version compatibility between the wireguard-windows Go  
library and the associated wireguard-nt DLL.

Can we expect semver to hold? Can version 1.3 of the library load version  
1.2 of the DLL, and vice-versa? Or should the version numbers always match?

-Daniel
