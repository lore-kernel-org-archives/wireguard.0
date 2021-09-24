Return-Path: <SRS0=2DBL=OO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C073C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Sep 2021 02:25:56 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 704BB61108
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Sep 2021 02:25:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 704BB61108
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c79a64f4;
	Fri, 24 Sep 2021 02:24:29 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 694889f3
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Sep 2021 02:24:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C78D1610F7
 for <wireguard@lists.zx2c4.com>; Fri, 24 Sep 2021 02:24:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="LQxJtfUY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1632450243;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=U1Z/jE8frpgs7iGlcbpfobGDjkK/wn5sqPyj0vXEH10=;
 b=LQxJtfUYPfw4bJRfEwCFUX6hA1D+BTtIwUhMAL2pPAiuA4KAjpYK28l1IiA3KpPKWd5J86
 UDzldEiVvxLQet93g+tAmvGjv3cwQ8BcFIYwMRZfA1b3y6ujPTi8E/ALHK0oPZP+cJ85dr
 3xI2sSlSn1AvboGMwbdW6sQxi9ZJkxA=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 217a0d94
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Sep 2021 02:24:03 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id b82so1733229ybg.1
 for <wireguard@lists.zx2c4.com>; Thu, 23 Sep 2021 19:24:03 -0700 (PDT)
X-Gm-Message-State: AOAM533y4mdF6YunbIj4Dlb+MqRccuNnAqfWfQVMOM0sdyp6MwkYzbKK
 oKnpERfusr/Ecv1jU9TyBGCSPLV0wSFb0lO9aPQ=
X-Google-Smtp-Source: ABdhPJxvYxMw3to8j8gVLVCL4+jrFEhY1dfY6bJIEUL/7DGVzLbEGp4fImp/FhXw7FuaPiB7MkP57b78I9XmeakQvRU=
X-Received: by 2002:a5b:d48:: with SMTP id f8mr9194411ybr.449.1632450242688;
 Thu, 23 Sep 2021 19:24:02 -0700 (PDT)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 23 Sep 2021 20:23:51 -0600
X-Gmail-Original-Message-ID: <CAHmME9p9XxAhh4WgZgRiMRFxahp2wabPr-KuW=AdVQyRsHaD+A@mail.gmail.com>
Message-ID: <CAHmME9p9XxAhh4WgZgRiMRFxahp2wabPr-KuW=AdVQyRsHaD+A@mail.gmail.com>
Subject: [WARNING - iOS 15] Update WireGuard to >=1.0.15-26 *before* updating
 to iOS 15
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hello list,

Due to buggy changes Apple has made to the Keychain on iOS 15, older
versions of WireGuard on iOS will *eat your VPN configurations* when
upgrading to iOS 15. This has been fixed by [1], which is now
available as of version =E2=89=A51.0.15-26. If you are still on iOS 14, bef=
ore
updating to iOS 15, please remember to update the WireGuard app to
this latest version in the App Store.

Sorry for the hassle.

Jason

[1] https://git.zx2c4.com/wireguard-apple/commit/?id=3D03a59ff38e96fb3bb5dd=
e2f15fe42198d1dfb995
