Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A99FAC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 28 Apr 2022 05:56:05 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 59d31f0a;
	Thu, 28 Apr 2022 05:56:03 +0000 (UTC)
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id e287b7fe
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Apr 2022 05:56:02 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id w1so6725589lfa.4
 for <wireguard@lists.zx2c4.com>; Wed, 27 Apr 2022 22:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=eraD9E3KCTbsbmEWT2iLg3x251PjILBXIqHIiVlpvsA=;
 b=p9ZnHzUArH8W4Ynaxi+JHxgMVNMKxPLKxMXi9I08t4bdWz5b8zYC2mHeYe1KUTNT0U
 75aZSJP79gnVIOoaqcF1HH8ZO8U3bB+qnwhQR4yjfRRpT1/acBCSDorqY5vYYpTs9ps8
 Ae2GaPYHDvIRjZRErqmWOtDIlUG6UkCyTZc3bbVHiN3PgyaPR1M+xcJMJIldZJIbRwhL
 mXK6+/GKT/Mbo6nU4qFPI98U1lH2HrUsDCMajggI24mXpyasGc0KKDqTvCFaCiiGoLg/
 mWUb9I2eNKJwHV3HHlZ4Q8GeK9Uk0E+7lrQ7zp8XeKz25+2rGaaRTHOJ+bOMdoQemdvX
 86gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=eraD9E3KCTbsbmEWT2iLg3x251PjILBXIqHIiVlpvsA=;
 b=eGrxd6I0rG5ubUXVBQrzh0U1q3qGHo6SX81jy7qYG8l0hoB18lHuxq53eyhri5Z/Zc
 gDjM6HdoNcyJaGDgEEVlEBtvfxFva2a/s3lA4ec/7HLJixkJzPFWl6fy7R5JG9UFWD6M
 wTL9OpdVmvyjNEK+aH5f0Lg73HqgMihFP5YQmxxXQEO14QE801DbjIZp1XC394+PbCDj
 t6Kv9seycK6UZpiY8KJAKt/x1YyneLa7tJWWMiAtOHchZL7KOI7ov8HqtpP0pIt51/Ju
 sNc3c/E1HuvKz4xB7VCCTUpYwD5KLGTS1YWWWBwep2IuWInSTrLgiPmWfbwxRzX+NHCg
 PHjQ==
X-Gm-Message-State: AOAM530LPSdDAkP16bRQn6+lb9F/d0E4DkbLxw074Bzqks6Q6x1uZT3K
 fAeSh33nhD1M5RKNmGNtnSZmWbPkqP793TtGX2hpTvlBvEc=
X-Google-Smtp-Source: ABdhPJxzdRVlkrGTGJeDmQ/yZRMEP6Rm4U43TJ4efv502Rc6c5hxz44H+tBzyuEARymGXCBHCnXDyjS4vNMuogB1Ljg=
X-Received: by 2002:a05:6512:1194:b0:471:b0dd:8755 with SMTP id
 g20-20020a056512119400b00471b0dd8755mr22021700lfr.212.1651125361602; Wed, 27
 Apr 2022 22:56:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAHjGJ4PPALxp8x5kCVFb3a2_0CydJF2CzP0LdFmnZ7YfCh4MRA@mail.gmail.com>
 <CAHx9mscwNEn9Ao3Br_x6tEFJg4uBrf1K8wXaJoM2jZf_5=C52Q@mail.gmail.com>
In-Reply-To: <CAHx9mscwNEn9Ao3Br_x6tEFJg4uBrf1K8wXaJoM2jZf_5=C52Q@mail.gmail.com>
From: Pierre Grimme <gamedev.pierre.grimme@gmail.com>
Date: Thu, 28 Apr 2022 07:55:48 +0200
Message-ID: <CAHjGJ4OS281R_6i=5Kf8JMtqo4UsLR6Fs4_whPHuuO=GRpgZmg@mail.gmail.com>
Subject: Re: Feature Request: Configurable Re-Resolving of DNS Endpoints
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

Am Mi., 27. Apr. 2022 um 22:55 Uhr schrieb Omkhar Arasaratnam
<omkhar@gmail.com>:
>
> Like this?
>
> https://github.com/WireGuard/wireguard-tools/blob/master/contrib/reresolve-dns/reresolve-dns.sh

This script may be a good option for Linux Clients, but for Android
devices or Chromebook not. The main point
of this feature request is to provide an additional configurable
parameter which implements nicely into
wg.conf files.
