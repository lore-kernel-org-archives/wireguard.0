Return-Path: <SRS0=PPOQ=IV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5396C433E1
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 23 Mar 2021 14:44:24 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDE0461974
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 23 Mar 2021 14:44:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDE0461974
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2eb3e161;
	Tue, 23 Mar 2021 14:44:22 +0000 (UTC)
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a392d03f
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 23 Mar 2021 11:01:47 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id y1so24988909ljm.10
 for <wireguard@lists.zx2c4.com>; Tue, 23 Mar 2021 04:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DA7LtyV57kJOFW6jQJ6G+6pYs95LBzTZDnQ9syvsECE=;
 b=ESLInbglbSkojJGsVqoRJmIc2Vpp+KZER1K9fk6MZKhqQpB0ApQ6degvWoTvSguzJl
 P1gyJR72rVmNGX8Vefp5dmsSKJmV0gjQcnLvtKNiUtuvvahQIEQjllnXEpe8IxLOh4l3
 L0KAfZh0Wnj9CzUXRnD7zBUIe5kz+o4t8ep2Wjo/R1ed+mHi2tYzeb1C/HrEmHkQZxpa
 pr9DQodHKN05gskHeIJHI28Hz1SxXxSZBP2U+sxCT3Ts/v54hx+sHGAZr0TJaRx6/ohB
 M9Jzc/DSc3VLVY1tmQocO7bJbDVS6GamCxYO2zrUQclsVAKZLD8AAU04PVviD9lQxloI
 +fTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DA7LtyV57kJOFW6jQJ6G+6pYs95LBzTZDnQ9syvsECE=;
 b=CChCsETYWJZIyLeBkXq1e2MBYbHnFYg8wv8JZ3LHwUKpnkOY0Q9LnhRYcCdQYlUxzQ
 MpFcUqsr4tjHwuvPZ/WmPglhko/49WmA1ZF6ZL2XmZh/14BvZMXZTGLN87kj9Kzu1KDk
 ZoQJiPh94wk17P2rR+D6jEqEy9en0nIM52oWOpXNnwVGqDf/+Spqb9aKnj4XcLC7JwTn
 DP/NKkMS7yRdFPC4VvFb/AmxpmU7Rkuj0neXocZNA3YuUYwjnV+QTWDgjlmBLSnfW51u
 shJUwlqRHu30OCZRWYU3kFZfhkqPfDMZp1DheQL8bYhpOVvTJ/c/wGLg/RSUiAQ36UpS
 TtZg==
X-Gm-Message-State: AOAM533XSrBhD0J8cQZtWOcxf88j6bGoxB97lUE9NMwUcKYsrcLaOuA+
 MftQ53pScnr/LjJCsIqi2rE0WPLwZ9ER7z0Dsh9jde9TUFc=
X-Google-Smtp-Source: ABdhPJxpNddfYdtCoUDFznQANsdXYQB9S4l6Ncnp8PmqvAVHJRIOAVvyLDytEFSfwO6HM6jbMx9LnIjdmIp5GSqeP94=
X-Received: by 2002:a2e:994e:: with SMTP id r14mr2785095ljj.115.1616497306586; 
 Tue, 23 Mar 2021 04:01:46 -0700 (PDT)
MIME-Version: 1.0
References: <9f621ce6-ec3d-0641-c359-756d0ad36f65@gmail.com>
 <6a01b182-a98f-1736-676f-d0811f6de086@gmail.com>
 <CAHmME9qtPLOTaY3UzyCY1C6guVZXvJjXHeFwT8=94d=Zpjj=Tw@mail.gmail.com>
In-Reply-To: <CAHmME9qtPLOTaY3UzyCY1C6guVZXvJjXHeFwT8=94d=Zpjj=Tw@mail.gmail.com>
From: Christopher Ng <facboy@gmail.com>
Date: Tue, 23 Mar 2021 11:01:32 +0000
Message-ID: <CAN5wt5poiJbOAfe+_VQpu=+6V8dLDiFDVyhUFNbad5NEd9YFfA@mail.gmail.com>
Subject: Re: Problems with Windows client over PulseSecure VPN
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 23 Mar 2021 14:44:17 +0000
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

this sort of works for me too, the only problem is 'wg set' never
returns (even on the CLI) so the tunnel activation hangs in
'activating' waiting for it to return, which it never does.  this is
on 0.3.9 in windows

On Wed, 3 Mar 2021 at 10:56, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Hey Peter,
>
> I had a strange idea for how to fix this without requiring
> recompilation or removal of that code.
>
> 1) Enable DangerousScriptExecution:
> https://git.zx2c4.com/wireguard-windows/about/docs/adminregistry.md#hklmsoftwarewireguarddangerousscriptexecution
>
> 2) Add a PostUp line to your [Interface] section:
>
> PostUp = wg set %WIREGUARD_TUNNEL_NAME% listen-port 0
>
> 3) Try it and tell me if it works?
>
> Regards,
> Jason
