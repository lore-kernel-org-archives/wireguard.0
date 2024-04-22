Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79255D49212
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Nov 2024 12:36:04 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2590916e;
	Mon, 18 Nov 2024 12:36:03 +0000 (UTC)
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7bed7b9f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 22 Apr 2024 09:24:27 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-345b857d7adso3238637f8f.1
 for <wireguard@lists.zx2c4.com>; Mon, 22 Apr 2024 02:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1713777866; x=1714382666; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:subject:message-id:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=VmagK9dZEyNoXL/780AtHiu2a6ROIPhkSm2Jj6Wx0Ik=;
 b=hzcgic1V9XBOSjby4cw7BM1EWGbx36gh3MIaViZw5kXLwd3Yd4wT1gxTlHf10bDtc+
 2aw70o/Fmwgh8adsYGphtMp0JLwtQwRyNuzgHfAQSPKTi9CQoAH3DB7r6Tx6rqqFz9T1
 vUGnHCg7IvRf9oI8IiLQ2douGjDG89Smqi+ZhB5xeovqviym9AwiI1+njEhx0i+jSDKD
 fytnc37vUmwkuFT8HWQzRwG4CxJCuINCKBsWt1cWtReUS9W85yhovFLeeq3SPrzrBXcj
 sDBSqK1EbCPIXksnzFVSaVHDIK9h2px7xj/0NtoN9KF9s2CB0YPm2oTWUVvqJ1bHhxcS
 vOcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713777866; x=1714382666;
 h=content-transfer-encoding:mime-version:subject:message-id:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VmagK9dZEyNoXL/780AtHiu2a6ROIPhkSm2Jj6Wx0Ik=;
 b=DiyRn8exU6gp/B+tQWXmpDSMkt3Bg0rboqI9Cd2xW4DX/izGljniOCZJUAdcUyyFt7
 S9z46ItJotUM8k/tQ7CGRS0NbAfoQAi4ITs6k9JRVKJtnay9cMpQL4c2Efv1oRwbs2iB
 7VVox5c42/NWVri1c8wwS4rPritsX04pSpAfG5e6UgwFoSOYMgKW9lHPzv4ZDYNCbChs
 QcytGw+Wg9AY5dF9LJTJ2uwj6KA1DAV6wBGzZs9Oo8DdRqcFYMoeuyacAc/DcTTfgRrf
 lI+dmSGsvdGUDOttFP9mMOUhAd95/eFtHbU8NZCT7Ai1TqPMb55WKqCcxfWch6PT3W7n
 LyVA==
X-Gm-Message-State: AOJu0Ywi/DYOx6oBuaBUqeHsSWg1hKn61WJff1r0//HrARvPSfaD3z4I
 k7lvRv3umgmEjXSP6Z2iBuDE0lBFJ6EQS/ACdKIOud3Jz8PzsnAOBpOA8w==
X-Google-Smtp-Source: AGHT+IF64SfVgt/DcZ+O8eDc2fbKMtX5/Y7iIgYGIltSELVTov1SdcnlczbhHkMhOxIuz3wrcfQlgg==
X-Received: by 2002:a05:6000:1291:b0:34b:4afc:5d52 with SMTP id
 f17-20020a056000129100b0034b4afc5d52mr191699wrx.9.1713777866138; 
 Mon, 22 Apr 2024 02:24:26 -0700 (PDT)
Received: from [127.0.0.1] ([88.133.67.48]) by smtp.gmail.com with ESMTPSA id
 g18-20020adfa492000000b0033e9d9f891csm11635358wrb.58.2024.04.22.02.24.25
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Apr 2024 02:24:25 -0700 (PDT)
Date: Mon, 22 Apr 2024 11:24:25 +0200 (GMT+02:00)
From: Thomas Butz <btom1990@googlemail.com>
To: wireguard@lists.zx2c4.com
Message-ID: <a1e54eb6-ed75-46c2-9482-93f082635eb3@googlemail.com>
Subject: wireguard-go: potentially faulty GSO detection
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Correlation-ID: <a1e54eb6-ed75-46c2-9482-93f082635eb3@googlemail.com>
X-Mailman-Approved-At: Mon, 18 Nov 2024 12:35:39 +0000
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

Both wireguard-go and quic-go currently use the same syscall logic to 
check if GSO is available. According to a recent quic-go issue, it's not 
enough to check for an error, you also need to check the return value:

https://github.com/quic-go/quic-go/issues/4446
