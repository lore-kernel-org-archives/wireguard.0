Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E053DC55822
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  4 Aug 2026 20:25:50 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 6da04ddd;
	Tue, 4 Aug 2026 20:25:48 +0000 (UTC)
Received: from mail-pl1-x648.google.com (mail-pl1-x648.google.com
 [2607:f8b0:4864:20::648])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 84912c41
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 4 Aug 2026 20:25:46 +0000 (UTC)
Received: by mail-pl1-x648.google.com with SMTP id
 d9443c01a7336-2cca5e0a0c9so4125685ad.1
 for <wireguard@lists.zx2c4.com>; Tue, 04 Aug 2026 13:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1785875144; x=1786479944; darn=lists.zx2c4.com;
 h=content-type:to:from:subject:date:message-id:mime-version:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=SgsItllBGKiNAcaARs96DHfshb5flEAqOXCXQ83IDIQ=;
 b=RQyjCclniHimtmGSZGTEiRUnvqoycsd0lJPd7ya+5EGnzYR6VuJWf318skuVACQxrR
 dRJNAxwWDTwSOSGy+BYNpjy7Ef+TLHjk/F8muoGeDqSjyxK8x4HAyXgStuD+R4VIpLKy
 6vTHPsUhnj8xN6jECPCJu30uDsM9RFUFqsFXdUvu3gBd6yQa0+XY+WODuuHudr+eKplX
 eLsN2WTRVt4QgU4PJynFEco/zEnxBvCg/z00892j9dixJP3nKoDOM8QcX2bYGEtsG2Qy
 BC6OVzElEJYkjEIB/UOUngm1pXBbscfW63zVyrQgAlOc0Q/bY3q2ETqrsNmwu6KyfH4l
 vwgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785875144; x=1786479944;
 h=content-type:to:from:subject:date:message-id:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=SgsItllBGKiNAcaARs96DHfshb5flEAqOXCXQ83IDIQ=;
 b=OpVndog9GtnhhSF3XFlGc5DMGTuisEWplNd7vi3xkNeBOMEmUd8RUGo2SHgL+SHWlG
 VMcSu62JZpY/cp21g+XgOaoFbLX504eLZQPhb/YDC+/UqY13JJFbcnydnE7MwW6Tc8oI
 hwRg1a+eWSks4kCJMvipPyNNamC3zxN6HJN/gpCffg5eIL1m6S0QIWmoqoYesWdC6XgK
 R30re2mwthSJ8r4cGJh9y1H2DGhTs3WgxW3/gl8Wk3LMcxNsHSFUL7saJQqLkMnC2BIA
 IzSZK41tZYgSS6ZH4xvSsV+kCoyaA+4P4QvIybuG43meK/l1yPnJQu3r+4KTWVzAPEyB
 IbLQ==
X-Gm-Message-State: AOJu0Yy1Y+GoYcQWhOQEztsEs8IiI8WebE9shOmyb43J9Jx56Zpnm5U0
 i+lgAT7BmPJ2LTu2xCMA68xenofrzIpcsDCzEWvtYEP2Rtn9wwQWxp5dzXTenYc9qMnaJh2bjNA
 moJIERVu/vN77poEzJmx4M+qPIsAjC/Hdeov6lTDg+22j9X6YGRi+CEpnr5f0d7xKoWnXZdbwoO
 bOsB0RlpquavenrSf/Gmnn0pOzJy+LDuM61uU=
MIME-Version: 1.0
X-Received: from dldz12-n1.prod.google.com
 ([2002:a05:701b:418c:10b0:13c:e6ee:25aa])
 (user=dkess job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90a:da83:b0:38d:e0c4:c955
 with SMTP id 98e67ed59e1d1-3903c5d84b2mr1206999a91.15.1785875144135; Tue, 04
 Aug 2026 13:25:44 -0700 (PDT)
Message-ID: <18c8b3fb4a12af86.3130302e3131342e35302e3736.4ad1.0000sendgmr@google.com>
Date: Tue, 04 Aug 2026 20:25:44 +0000
Subject: wireguard-windows library version number
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

I noticed that wireguard-windows is on version 1.1. But Godoc doesn't  
recognize this version because it's not semver:  
https://pkg.go.dev/golang.zx2c4.com/wireguard/windows?tab=versions

Would it be possible to get the version bumped to 1.1.0?

-Daniel
