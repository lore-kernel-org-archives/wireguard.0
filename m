Return-Path: <SRS0=xb9C=EX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBEF5C63697
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 17 Nov 2020 20:41:42 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0C88222E9
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 17 Nov 2020 20:41:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=scjalliance.com header.i=@scjalliance.com header.b="S64VkkLO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0C88222E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=scjalliance.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0f929566;
	Tue, 17 Nov 2020 20:36:31 +0000 (UTC)
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [2607:f8b0:4864:20::435])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ae2713c2
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Nov 2020 17:42:10 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id w14so17755877pfd.7
 for <wireguard@lists.zx2c4.com>; Tue, 17 Nov 2020 09:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=scjalliance.com; s=g5;
 h=mime-version:from:date:message-id:subject:to;
 bh=hOINoJAfj8ZxnYNCIyCak3+MxZL38usyeSAeHn+9+M0=;
 b=S64VkkLOSIDQuGOxd1AWHEHT8jSRHPsgGJS68BojvLa7ratzUqUOxp2YGqNsGVwjlP
 lywUPnkq4izInGxWot9we2uDLb9PxyugwLhasYbLS6WhRvb++8aKLU3+IhRb1CuZF3/B
 h4/UtB5p9y6Ss0ve1xR/54o5LCzCL5t7eEn2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=hOINoJAfj8ZxnYNCIyCak3+MxZL38usyeSAeHn+9+M0=;
 b=WEnEwoN4j4hFkJcEuVDH9HjT8ZA6YxNDVu2+MYuCj1wqmgoIMrDRJfu4PktE0IMpGv
 5t9aPYUPGtraYe96isCngtVGa7qs/Z2VIz9Q6prHckF4fb/vBU+0641KNdOshAmQjcyW
 S2X5xwvS4JLLYrs1XpbIsUEkpwYIQK54x2oVlrFTfZHLAq5g26IKsOzC5mtADo4S+OoM
 qtZnuOIGqwaWIm4OI+ClZIOopicOebNw8lS5qqjK9fvCY9yJUfWZ7rKFNBW7GDJXpaJH
 ODPC+9pqkZfokegenFWXD/85QLQmL+sMQX7SY4UJ9VyrScsS4cj04qWniBCpWcHUL39S
 G1yg==
X-Gm-Message-State: AOAM530rxbH0cWj8uGQfCBEZlzRGKLsFY6XJHkqyLPA2B00Qn8f7z3Os
 F5j56dB76ap5igvQ7s+6NBLiXmja1Y68lGaW7x/Ai5ZpCmq0YVFC
X-Google-Smtp-Source: ABdhPJy7ed+jnhQXCUcyp4Fb9eoRYXxfT+9PRvnf8fJPKIPZ836Lm94B/2qrPJvx9lF4RP5M2gJhJ/GeezPm0CHKqDU=
X-Received: by 2002:a63:6507:: with SMTP id z7mr4374634pgb.86.1605635206248;
 Tue, 17 Nov 2020 09:46:46 -0800 (PST)
MIME-Version: 1.0
From: Joshua Sjoding <joshua.sjoding@scjalliance.com>
Date: Tue, 17 Nov 2020 09:46:35 -0800
Message-ID: <CALaUSuvDgxsr99R2qiOrXM20btnvnaiyAx7197jfcTauOt5CTA@mail.gmail.com>
Subject: WireGuard for Windows failed to start after update to v0.2.1
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 17 Nov 2020 21:36:28 +0100
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

I attempted to update my WireGuard for Windows installation from 0.1.1
to 0.2.1 today. Unfortunately the service failed to restart after the
install and left me without a functional WireGuard tunnel. I'm on a
laptop running Windows 10 2004 (OS Build 19041.630).

From the Windows event logs it looks like it couldn't remove the old
wintun driver. I believe I saw some patches on the list from Marc
Becker recently that may or may not be related.

These events are from the Windows Application event log on my
computer, in order of occurrence:

----

Error, Event 1013, MsiInstaller, 11/17/2020 8:41:49 AM

Product: WireGuard -- Wintun error: Unable to remove existing driver:
The system cannot find the file specified. (Code 0x00000002)

----

Error, Event 1013, MsiInstaller, 11/17/2020 8:41:49 AM

Product: WireGuard -- Wintun error: Failed to uninstall driver: The
operation completed successfully. (Code 0x00000000)

----

Info, Event 11708, MsiInstaller, 11/17/2020 8:41:49 AM

Product: WireGuard -- Installation failed.

----

Info, Event 1033, MsiInstaller, 11/17/2020 8:41:49 AM

Windows Installer installed the product. Product Name: WireGuard.
Product Version: 0.2.1. Product Language: 1033. Manufacturer:
WireGuard LLC. Installation success or error status: 1603.

----

Joshua Sjoding
SCJ Alliance
IT Specialist
www.scjalliance.com
