Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1E27C32771
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 Sep 2022 07:29:04 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 33db391e;
	Wed, 21 Sep 2022 07:29:02 +0000 (UTC)
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 3bda2c28
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 21 Sep 2022 07:29:00 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id sb3so11553595ejb.9
 for <wireguard@lists.zx2c4.com>; Wed, 21 Sep 2022 00:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agillic.com; s=google;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date; bh=ua/Bf1QJSxkNV7XY6edCgJgDJYr2+s/W/AWOvzUh+ZE=;
 b=RdB/sJdfgt9nnbA3GvSd+KI+iNP+2z1ot6ygd/DZMybybmxwTFSEpHUB/CIsfRLkGh
 6Z9477TUtvr0JKxNFBPiE3YoA6szCxjT8oOsrcsePiBduI7mdkA+nmg/EWgDSsNmcwMx
 apxePaZgoza54IFd7fLjJc5coB6PEfibfQJSN6E9FYHwpHvpA1aBrQZE7fLhAmTJt+rr
 kViGse9U00ZoHS+r3XD7z6XwENo4xSPyBZi5IZhCIyOWuOqk4Ojm71SdWxVEJ1vbH4uo
 sn0s5B7QRlnFCs2R2MIq8Ytt9/GMZa3u0pLqddU7Olbh4uidaHRULdYFUFJQwuDRYubf
 OGaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date;
 bh=ua/Bf1QJSxkNV7XY6edCgJgDJYr2+s/W/AWOvzUh+ZE=;
 b=2wtX+f+bGpiJGFfwnDPWL75Ki5QibfIqE9isIIeK1xUOvW0Uu1XW4f0LHEUMYIsmUK
 5zn+lLSgwQb98MGzNmSBW6rmpO9yjqd1mz8SrxgzNTDIYC21bAR5EzsXHpokN+J9O9eF
 EDE0KyJHZyHDWuKun2Oh0schfsEgNID2kSyXuGqGRSuXAbdEwl/+MRkNoZPwGcObMk0Q
 0SjXXQ9cBXKQAFx+CHHwDmp0dpqayDzDPSKzxWOJftm48wYLGZBIiN3Cxm3R0nFSpQ+D
 amzSs6mK8UUGHlsnloBuDsvkI7XWo0lXenOadG4YL5APINYFf4e0D3OJZ2TN0z5tRMDD
 v37Q==
X-Gm-Message-State: ACrzQf1bp696GnO8+F+UMA0Nit0Pwtl6pooTU7jFUfzjMYM9+lTLjluQ
 KJcOeb/IEHB9uFO39xf/HrThYUBEFrYLYgN/k9QOZX4LOpU=
X-Google-Smtp-Source: AMsMyM5Nl7M8RMPyN+tODoZlloSGnnN1rZirGePQ5CVIH8Me9mFP0b88UCTrBmLFSjCSaYCJiFOGS1V+rvLmmvxLWAk=
X-Received: by 2002:a17:906:3a15:b0:73d:80bf:542c with SMTP id
 z21-20020a1709063a1500b0073d80bf542cmr19871220eje.633.1663745340021; Wed, 21
 Sep 2022 00:29:00 -0700 (PDT)
MIME-Version: 1.0
From: Simon Karberg <simon.karberg@agillic.com>
Date: Wed, 21 Sep 2022 09:28:49 +0200
Message-ID: <CALDyVtsgMjH1YqrTrosDVU2khC9iEgMgUYDd8D65+h-K54y2fA@mail.gmail.com>
Subject: MacOS app update needed
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

Hi,

I've been testing the Domain Search functionality on all 3 OS'
(Windows, Mac & Linux) and the setting:

DNS=<dns server>, <search domains>
Is only being applied on Windows & Linux.

Further testing on MacOS I've found that the homebrew installation works.
wiregurd-go is version 0.0.20220316 and wireguard-tools is version 1.0.20210914

The App Store app is version:
App: 1.0.15 (26)
Go backend: 2ef39d47

The app in the App Store hasn't been updated in 11 months, maybe it's
time to get it on the newest backend?
