Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C6C1C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 29 Dec 2021 08:48:40 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 8a92e77f;
	Wed, 29 Dec 2021 08:48:38 +0000 (UTC)
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id ddc4c31d
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Dec 2021 08:48:37 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id p13so10345339lfh.13
 for <wireguard@lists.zx2c4.com>; Wed, 29 Dec 2021 00:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=A2yo8YF6ATQX7Qq2MtEO2iWA6wtMRs+bPikWRA0GWsI=;
 b=Pc16/bOnG5KDup8yyFf5yOgCabPtleuOBylxSBaku9LF0wjzlhgHzj/O4CiRh505xf
 VIwpcysbIfBTG1efahWsQF8hIwD5Bo0l/ZZ044UcbVO+hT7eCELnBdFH2WbU8kXnr+ne
 hfqYg59SWmMPqH2WkUr9HRcdSyygXe9UWtL3FDn89BGlwCXwOF7TFIy5IzwfK75hW5uN
 rfBFhS1Rr4UPGMgTDt6Sf8vZyR/MCr7N2RFQ67KjteHY7Y5hNrO1ZZWh/f04Os8jfM0B
 K8VqeWjGZuCnN4PIiDLH16+1RiSQQT3QsNH7s97aldDXeei2GUyFKThIZarUcr6aeUI+
 WSlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=A2yo8YF6ATQX7Qq2MtEO2iWA6wtMRs+bPikWRA0GWsI=;
 b=Z8tnpBQhGFt26zhA1IT9f0kLlxjufIv362L5O6nz7vVWIr2j1wmVD0mmoT4RDgmMmh
 OG0q8FFrUPFxQRDVmOM206oIwxCHPioSSXkZr4TUHCYhXbI7GfQo8XGNM5mYqEgIGcPG
 dXvH/VHRvevzoa7cxmXQftsd/UJrXDtp59WVT1gl4gHjOFETxUukPKPpLD3/n4ZXmo9t
 E70/guwAqELzb+s2e49wu1Y9lkzu9OOTLbVVzA0HEa5SzWe3McgsbY29mVKON8u0pgB8
 ZKS+KX/RWqhGleBmNQJTGXMSeJwsWVSMTGkEwPjEuyTTPt92ZGUvttWDDGSEc/gum+fL
 mtwQ==
X-Gm-Message-State: AOAM530vUrRwFLPWakRBx8mDwTVjqI8zMvgncN66HXJ2kn5ERsaf2cMq
 59fUzN2/gEs1TrBBXgiuNWMi2qZt9lkbZoycceLV0ULFrmMeHQ==
X-Google-Smtp-Source: ABdhPJzkyf7PSXHyhrMqN57h+/pjUEpDsSwzzigQs1YRdVetzCkr222hi8bK2+R3cRnR2ChG8asTjaEAI6Q8HNkoFDc=
X-Received: by 2002:ac2:48ae:: with SMTP id u14mr22413077lfg.610.1640767716304; 
 Wed, 29 Dec 2021 00:48:36 -0800 (PST)
MIME-Version: 1.0
From: Phillip McMahon <phillip.mcmahon@gmail.com>
Date: Wed, 29 Dec 2021 09:48:20 +0100
Message-ID: <CABtXGiBDnVhKg-EcwSnSmkQkf=1k8_vnXADLmrUbgjFefkqOLw@mail.gmail.com>
Subject: Install Wireguard macos without having to use AppleID?
To: wireguard@lists.zx2c4.com
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

Background is that I have a new Macbook Pro for the M1 silicon and
video editing on the go. I have all my apps installed without having
to use an Apple ID (thanks to brew.sh) with the exception of
wireguard.

Is there any way outside of the app store to install?

-- 
Phillip McMahon

https://flowcrypt.com/attester/pub/phillip.mcmahon@gmail.com
OpenPGP: EA04 83D4 C864 AA7C 1099 4BE6 A11E 70AD FDA6 0CF9
