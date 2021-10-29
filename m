Return-Path: <SRS0=4XTf=PR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02DE8C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 29 Oct 2021 14:30:06 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D44560FC0
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 29 Oct 2021 14:30:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2D44560FC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c0438bd0;
	Fri, 29 Oct 2021 14:28:31 +0000 (UTC)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 10ad142d
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 29 Oct 2021 13:59:26 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 c71-20020a1c9a4a000000b0032cdcc8cbafso4803415wme.3
 for <wireguard@lists.zx2c4.com>; Fri, 29 Oct 2021 06:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=aki9e9FOtPJidP6Yp2biilfx59Ioidn+p9u14WTVXtc=;
 b=SmUxG6lJRHrCfgfx8ZTVOtQhQvHazEPbpzcCe3y/DN9eYLzAZLp/doixcdg/lwWT5w
 u/nBXEXJytbhf08f0NzsPOiCaZNDuesXyLSl4kttVepguxcyiI3+jFjol8PvmSlzOXAg
 En3oKsbStywMIZpFkSlx/Y82KlkYDxT9Sv3+pj6u0g/vLoJxrRRXtibDaisiF5CHlytR
 O/9lTR9obM9qHgbmoEG5EfU59iPIsabDVOI1V6fJR8KeObEih6Ps7jlGJlt6SvQYJULB
 JUuubRvlh/EZw7kjjq+97AC/DnuGUhObxMSXWMks81/ACQaOlTFyWJZAMwAoslaMOFYw
 uMBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=aki9e9FOtPJidP6Yp2biilfx59Ioidn+p9u14WTVXtc=;
 b=6MW68/bPadb3GNIFY2mu8HyAAWBXz8fpc59z9a5JXKn7GXlsO/1W22bE2dlwk47DQn
 XcBihU8FKhF1QpZ2YCrsbijj1M9/5uqs3hE1X3YJjXFP0bDZaXDFZ/jzSBgD/Qc8Yxms
 agGHb0EX9rp5xT4/Wr8tDMXGT/i51JdwZ2Gh7WGSGoWGKFTRjkBwR7OFl8mP2W1rWnkX
 d4c8oOiOsVn6Rikzec2wfz6xTUEwaGpFqWrCqKwAfQKmWSjhV4tPsbyOwremd4D3NLXS
 sWCXQrUoq4xe9BswVFRNSOiLdib9e/SfZZTV8eDYLA/DfoOt+3SEtwV/IVemazJ/m6Js
 xsKg==
X-Gm-Message-State: AOAM531nPuzX+iGjeDNomTN/KIWasSknRD8eB0NxmQF5jOmB6ZAJ6f4C
 9oaSMCaYnh80RtGPNoNrdH+4sc/KdpVzDQ==
X-Google-Smtp-Source: ABdhPJz+Hi05PJ6reYKRpMTNiEor35sDMXtqL8jFfanlzV49GfR1f0D+GWHe780d0NrhqvZh7mEQMA==
X-Received: by 2002:a05:600c:17d4:: with SMTP id
 y20mr16492405wmo.113.1635515965732; 
 Fri, 29 Oct 2021 06:59:25 -0700 (PDT)
Received: from smtpclient.apple ([94.198.41.218])
 by smtp.gmail.com with ESMTPSA id s3sm8694048wmh.30.2021.10.29.06.59.25
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 29 Oct 2021 06:59:25 -0700 (PDT)
From: Igor Bozin <igorbzin@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Support for M1 MacBook Simulators
Message-Id: <18206D0A-EA19-4230-AAEC-8D52BE66A1C7@gmail.com>
Date: Fri, 29 Oct 2021 15:59:23 +0200
To: wireguard@lists.zx2c4.com
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-Mailman-Approved-At: Fri, 29 Oct 2021 14:28:28 +0000
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

Hello,

I am trying to build a project which contains a dependency on WireGuard =
through a Swift package.
The laptop I am running on (M1 MacBook) can't build the project, because =
libwg-go can't be compiled for the arm64 architecture for iPhone =
simulators.=20
I am aware that Network Extensions functionality doesn't work on =
simulators, but not making the binaries available for simulators makes =
it impossible to test other features of the App in any project that =
WireGuard is part of.
Are there any plans to support simulator architectures as well, or any =
other workarounds for this?

Best regards,

Igor=
