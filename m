Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9429C77B7F
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 18 May 2023 02:04:46 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id db02f2bb;
	Thu, 18 May 2023 02:04:44 +0000 (UTC)
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [2607:f8b0:4864:20::833])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 01208b0f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 May 2023 02:04:37 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id
 d75a77b69052e-3f389c519e5so8438031cf.2
 for <wireguard@lists.zx2c4.com>; Wed, 17 May 2023 19:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684375476; x=1686967476;
 h=content-transfer-encoding:mime-version:user-agent:message-id
 :in-reply-to:date:references:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=o/EyLRisC92E+XONE+wKJLZmEA0d3vfIdje/fQBstKc=;
 b=Lbnf+pgqzGL1GX3B0pI7lUa3IKEXe0WMRQyEe1G5v2Mg1lxcWfHyylFZArpL2yOHb+
 hRRQ1GYhNytU0PTRL8E+m0GDb73kGKUxxSncA719Xyyr/JEX8jL97axaF49KZ1DEAmhn
 28MmSJ6ZYC73kYqTHOOHb3BFiwKkmVF2b1Yrx6Ght5ISd6BdI7xfot1YCpIwqo816ysX
 qn9qkqiFoKNgXY5uhCoDH+uxD/rExyxKHm0pp6pOPebrufJqHn0m3opx0WGpzMa8cu34
 v4KLcYkvsMxSwOlSxpjj3t6WNnE4ZiV87TvxGvLdSA7h5iDfQWwxWOefPwKQm662pkPT
 qT1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684375476; x=1686967476;
 h=content-transfer-encoding:mime-version:user-agent:message-id
 :in-reply-to:date:references:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=o/EyLRisC92E+XONE+wKJLZmEA0d3vfIdje/fQBstKc=;
 b=k9TvleRzdEVgtukNTlVMcd3uPk6EjdPdquWPKJIUxtZ85Lw2xWarAWSLyGk3qOBykn
 ZWiXEneqdGhkdEfBQd9RYD5fGaIzHIaES7hElI8JX/HEEJsziYaJnMUbStiR+XpoKei6
 UHc6b63pWIkEiMwmkrG4uriIFupNlYxpS+8g9dWzSdd42cEkbGusHuGRzxZQIp+qy4UB
 sE6/egk0Lw95cHyqAoEfdBr9nHNOSyDWf84sGHgaOYCVmSbg+1mt0ReIXnvUXiQkoq8m
 sKz49XmV3bm73WNXMQR8rFEvd6rWY0hFLpcGt3jI/zfnkxAPdFnjssXF03A2QtNkCvvF
 GgWA==
X-Gm-Message-State: AC+VfDzKr207hIgLHtyHbbmI8SKdQ3T8NhPK/Poz977WXkX7ivb9mLhc
 HG/RSfEHPLQpfq1H3er+xiRCyjl5LHybAw==
X-Google-Smtp-Source: ACHHUZ6q7Wb2mzhsWUamzgfDjRTwk3jC46dKiXg7KbV5BCyxOcFS7pmIyCTPASASHRDR0wpTx13img==
X-Received: by 2002:ac8:5c83:0:b0:3f4:f1f8:9383 with SMTP id
 r3-20020ac85c83000000b003f4f1f89383mr3358183qta.52.1684375475807; 
 Wed, 17 May 2023 19:04:35 -0700 (PDT)
Received: from hurd (dsl-150-33.b2b2c.ca. [66.158.150.33])
 by smtp.gmail.com with ESMTPSA id
 n7-20020a05620a152700b0075784a8f13csm77516qkk.96.2023.05.17.19.04.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 May 2023 19:04:35 -0700 (PDT)
From: Maxim Cournoyer <maxim.cournoyer@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [bug] No keep-alives sent when private is set via PostUp
References: <87fs7xtqrv.fsf@gmail.com>
 <CAHmME9rEKX_8s=WxoeBg5xf-5FLVxTm6q8Wo=-FrwRCuT7FX6Q@mail.gmail.com>
 <CAHmME9oh6toB+a=uWS8tYFiW6OyOJMYoSRoadwcxfpVrXfhAiw@mail.gmail.com>
Date: Wed, 17 May 2023 22:04:34 -0400
In-Reply-To: <CAHmME9oh6toB+a=uWS8tYFiW6OyOJMYoSRoadwcxfpVrXfhAiw@mail.gmail.com>
 (Jason A. Donenfeld's message of "Thu, 18 May 2023 03:22:36 +0200")
Message-ID: <87ttwamm31.fsf@gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Hi,

"Jason A. Donenfeld" <Jason@zx2c4.com> writes:

> On Thu, May 18, 2023 at 3:17=E2=80=AFAM Jason A. Donenfeld <Jason@zx2c4.c=
om> wrote:
>> Until this patch hits stable kernels, you can probably work around
>> this by changing your PostUp into a PreUp. I adjusted the man page
>> here:
>>
>> https://git.zx2c4.com/wireguard-tools/commit/?id=3D9d42bd1ab9d707f7a7216=
2d36c9b37cc9bdf480e
>
> Er, nevermind about this part. PreUp executes before the interface is add=
ed.

Does that mean that the example bit changed in the man page needs to be
reverted?

--=20
Thanks,
Maxim
