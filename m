Return-Path: <SRS0=I1qK=KF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_05,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_NONE
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19411C433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 10 May 2021 11:23:47 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F034360D07
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 10 May 2021 11:23:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F034360D07
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=openziti.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e715e23f;
	Mon, 10 May 2021 11:21:33 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 58d8dc35
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 May 2021 11:21:31 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 gq14-20020a17090b104eb029015be008ab0fso9863253pjb.1
 for <wireguard@lists.zx2c4.com>; Mon, 10 May 2021 04:21:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:mime-version:thread-index:date:message-id
 :subject:to;
 bh=J4ZnVg4ttpapVwgc1qMxIKCRztTlNVlnFYi8xQiuz2I=;
 b=Mta8UJosL13/cI90HLzwyVwaX03nhEEF9VJ1HwCM07GB3NFQVGBsmX4WnOuvfl9Qo7
 MojFDmDTgGuiCWGh42ymRXLbtnJ6pQUyZkHT4yd88Mr9yFkuwBiD8E6kMChYOsbnOsPD
 bsob0FVwZts8NZRDCeapOvg+SmTUPOXQrkQ5hJuFS7EHjcP2Cb9mLW04gpppZ3XjTnSJ
 YVTCXEb/iA0RTVic9u6JjWOX+VAPTGELrd5sGxUNtVoidAdnVeMnmJwk93Q+FLdPRUom
 ypkm+E+95MnVAp9b44iOiwXPGMbPDNPO6H0qD+gKHVS+gC/0hQJduWJ81LNg6/yp0kb1
 r0TQ==
X-Gm-Message-State: AOAM532trsI0PTKErkPUmVtZGfZS3etox8AUqz+K0DWMsMXyQ4oFTR3U
 klTEAkF1Knqy7i/o4UVwDIck9NaESh8+Jg==
X-Google-Smtp-Source: ABdhPJxWkfrQfi0uC1b2ldvYD/CE+w/2txLcR53kwatAmnb/cWrDyWqCeTS/t9tBSwScpFj8CCvv1A==
X-Received: by 2002:a17:90a:e643:: with SMTP id
 ep3mr40059035pjb.194.1620645689947; 
 Mon, 10 May 2021 04:21:29 -0700 (PDT)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com.
 [209.85.214.180])
 by smtp.gmail.com with ESMTPSA id ge4sm11155640pjb.4.2021.05.10.04.21.29
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 May 2021 04:21:29 -0700 (PDT)
Received: by mail-pl1-f180.google.com with SMTP id t21so8979472plo.2
 for <wireguard@lists.zx2c4.com>; Mon, 10 May 2021 04:21:29 -0700 (PDT)
X-Received: by 2002:a17:90a:a892:: with SMTP id
 h18mr27158840pjq.195.1620645689466; 
 Mon, 10 May 2021 04:21:29 -0700 (PDT)
From: Clint Dovholuk <clint@openziti.org>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AddFjfvk2gla4apQRnmm8Bszx4qDIw==
Date: Mon, 10 May 2021 07:21:27 -0400
X-Gmail-Original-Message-ID: <2b73e539c3f0ae11bb68e2a7410a52b4@mail.gmail.com>
Message-ID: <2b73e539c3f0ae11bb68e2a7410a52b4@mail.gmail.com>
Subject: mechanism for wintun updates
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

Hi,

I keep looking at the website for the latest wintun release - I see it's
up to 0.10.5 now (last time I had checked was 0.10.3). Is there some way
to provide some meta data/link to 'the latest' so that we can monitor
wintun for updates, try them out and take 'the latest'?

I don't care what the mechanism is, ideally it is something I could
automate but even an email to this list that a release was put out would
be better.

If something like this exists already I'd love to be educated about it -
if it's out there I've just not found it yet.

Thanks
-Clint
