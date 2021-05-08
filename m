Return-Path: <SRS0=Lifx=KD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_40,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98276C433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  8 May 2021 14:24:26 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5B3161152
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  8 May 2021 14:24:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B5B3161152
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glosol.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3c3ae79d;
	Sat, 8 May 2021 14:22:08 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 62b6a00d
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 8 May 2021 10:32:56 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id a36so14735056ljq.8
 for <wireguard@lists.zx2c4.com>; Sat, 08 May 2021 03:32:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding:thread-index:content-language;
 bh=lXIoCKcPFiKD1ojeahDM5uVlRKfCHxwSCF+borUiWeA=;
 b=hZjvQ/kNW8093fGub30UQWvCnA7CGTGIWgbgjvCDXB7/HWhqCeqnOlWMz53L/cLKbH
 Vw8/FAVMOXkdW4IwHmkqId1WPWrQl4ANvtEbneYshWY5/ZEP2ga2wrjCNkvcCD2HgMau
 Lqkt4fAwAYcJc9x+zXCgdikLnxIZvvgAcGqj2tpXYM+/qqiCysa/hMKQWzjz3qdZBh1x
 euGQx8MQs6C3NPHZFGo5zfj5gVeklv8hA5TNP/fJWtqFWJOb+pg0Chtmh58Aj5BztDuc
 mxkhgOtqKaZ85BPPnFU475unP+ci2ltLUAwaTuBB/atDiuYqhqDVwWetsMdFg/kJmrkt
 uGIA==
X-Gm-Message-State: AOAM530MI88WyI85+i3zXRy+61DungxViO6wLMvSfAmMoRIgV5LcubmT
 4eg8Ml2C65Y1d/oc1GwBONj4EfDvC3tQbDqV
X-Google-Smtp-Source: ABdhPJz+PaNTy9iAeyHk8Ok5FVRkB3OAp6NfLYJ1fOoQCfMoCZEoSizeys67XawNOLm/NJPVk/4WlA==
X-Received: by 2002:a2e:a492:: with SMTP id h18mr11918752lji.161.1620469975576; 
 Sat, 08 May 2021 03:32:55 -0700 (PDT)
Received: from ShuttlePC (user-5-173-11-242.play-internet.pl. [5.173.11.242])
 by smtp.gmail.com with ESMTPSA id
 p11sm1609263lfu.41.2021.05.08.03.32.54
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 08 May 2021 03:32:55 -0700 (PDT)
From: "Piotr Sobczak" <piotrs@glosol.com>
To: <wireguard@lists.zx2c4.com>
Subject: Wintun - Requested GUID is already in use error on Windows 10
Date: Sat, 8 May 2021 12:32:53 +0200
Message-ID: <000b01d743f5$815d8fc0$8418af40$@glosol.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AddD9W61TdJA6JIATHyzOFG7YJap4Q==
Content-Language: en-us
X-Mailman-Approved-At: Sat, 08 May 2021 14:22:07 +0000
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

I am getting the following error message when trying to activate WireGuard
tunnel on Windows 10 (app version 0.3.13): 

[Wintun] CreateAdapter: Requested GUID is already in use:
{919CB63D-15C8-55F0-816A-801AF9AAE1AB}: Cannot create a file when that file
already exists. (Code 0x000000B7)

This seems to have started after upgrade to version 0.3.13. I tried
uninstall and re-install of WireGuard but the issue persists. Any
suggestions on how to fix it?

Thanks,

Piotr

