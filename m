Return-Path: <SRS0=xb9C=EX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A49CAC2D0E4
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 17 Nov 2020 21:27:36 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A224324181
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 17 Nov 2020 21:27:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=scjalliance.com header.i=@scjalliance.com header.b="Ile/vFHr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A224324181
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=scjalliance.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 514c4b81;
	Tue, 17 Nov 2020 21:22:55 +0000 (UTC)
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [2607:f8b0:4864:20::530])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 62065ce9
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Nov 2020 21:22:52 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id 62so16872394pgg.12
 for <wireguard@lists.zx2c4.com>; Tue, 17 Nov 2020 13:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=scjalliance.com; s=g5;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1OtAsgGAcD20oDXmnHFjKmZX2SjlEQzZV2hongNRx74=;
 b=Ile/vFHrWNvJw+sOTWV7+Yfsm17WnSChGrDe+BjvuEdELMGoagmUDUIrhvuBocrrmN
 5Le/xcSl+aZTAv3WEMp/dPZ3A7Q/j8Jbfk7TiDzrWCXfvX/11YSp+HOmLgtm9YDO3mwB
 HBYxepWIwQmlZ2916sVRafizU6AVVPA/fxuKY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1OtAsgGAcD20oDXmnHFjKmZX2SjlEQzZV2hongNRx74=;
 b=Usp+2B3n+ThGNFDjTGxVjxO4c+0TfXHGYzNvMEiR7bz+ARumHnpG8AfCEyos6gyxxR
 j9Hf67GzqzSZ8fngZzUy1ZOFqGS6+RQ+CeCFcC0pCgdEWt0d3KavP3Ebbu+iaTItOBCx
 1ONNLDTMtz0IUWURLf7NZF4t6l8JIe6gQEiryCAH0jBvu+mfY5MF3efW1QeCycO1v7Nv
 ZdBacdIvMKmSn4Wfv8fU4YITITh8jB1s+vaZ0b078ZnRmlyOTsWIsYH84cuDw2OfKmb7
 B5HU1I3mgsAdUPYhIafJKAJvhmreyM+nRjwcudUZ80uIxGKWDb9bssPTq1DFV4p1SwDS
 gfMQ==
X-Gm-Message-State: AOAM5335UhL66CaOdjis4c2WbBG0clXmTcsQm480/obhIQn9P85zerlA
 cOr+CxVCMR88tKc14Egl8zC4o0Iee1qhbj5H9TvM8Q==
X-Google-Smtp-Source: ABdhPJxPzJPi5s3HBZ/OBBGOmumD3UpJ6NhvfCY6GWWKAnVyHczRUciTFkcyRXIUqyfQ/7E/NfRIPbYwcSR2LFgVHXw=
X-Received: by 2002:a63:6507:: with SMTP id z7mr5074911pgb.86.1605648450274;
 Tue, 17 Nov 2020 13:27:30 -0800 (PST)
MIME-Version: 1.0
References: <CALaUSuu+HvW+W=2--V1P9w4_4JoKpH12A=TNC5QsMsiaNZcrKQ@mail.gmail.com>
 <CAHmME9ridRrB+HsZ_SHDszjrrEvkU8Vp1+hmqjPjBdOO2x38GQ@mail.gmail.com>
 <CAHmME9rZsWXeGh__RpuZSC9ycgeK+jQ6OhRaksqX5P+LpcmnyQ@mail.gmail.com>
In-Reply-To: <CAHmME9rZsWXeGh__RpuZSC9ycgeK+jQ6OhRaksqX5P+LpcmnyQ@mail.gmail.com>
From: Joshua Sjoding <joshua.sjoding@scjalliance.com>
Date: Tue, 17 Nov 2020 13:27:19 -0800
Message-ID: <CALaUSutvXe-QSKa4V6+ZHR+r5aua6nUzh73LUygk2aDo1ffc1Q@mail.gmail.com>
Subject: Re: WireGuard for Windows fails to enable firewall rules after update
 to v0.2.1
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

My understanding is that in both cases the tunnels were left in a
deactivated state. Once activated the tunnels worked fine. Further
intervention wasn't needed.

On Tue, Nov 17, 2020 at 1:13 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> This part of your log:
>
> 2020-11-17 08:19:14.469253: [MGR] Migrated configuration from
> =E2=80=98C:\WINDOWS\system32\config\systemprofile\AppData\Local\WireGuard=
\Configurations\SCJ.conf.dpapi=E2=80=99
> to =E2=80=98C:\Program Files\WireGuard\Data\Configurations\SCJ.conf.dpapi=
=E2=80=99
> 2020-11-17 08:19:14.480225: [MGR] Migrated service command line
> arguments for =E2=80=98WireGuardTunnel$SCJ=E2=80=99
> 2020-11-17 08:19:14.485210: [MGR] Starting UI process for user
> =E2=80=98[REDACTED_PERSON_A]@SCJ=E2=80=99 for session 1
> 2020-11-17 08:19:14.509146: [TUN] Unable to load configuration from
> path: open C:\WINDOWS\system32\config\systemprofile\AppData\Local\WireGua=
rd\Configurations\SCJ.conf.dpapi:
> The system cannot find the path specified.
> 2020-11-17 08:19:14.509146: [TUN] Shutting down
>
> Seems like it's do to a race in the migration, which this commit should f=
ix:
> https://git.zx2c4.com/wireguard-windows/commit/?id=3D6e4e535e0c1108bbd5a3=
f15e273e13868f4ece20
>
> But this part of your log:
>
> 2020-11-17 08:19:29.582424: [TUN] [SCJ] Enabling firewall rules
> 2020-11-17 08:19:29.746988: [TUN] [SCJ] Unable to enable firewall
> rules: Firewall error at
> golang.zx2c4.com/wireguard/windows/tunnel/firewall/helpers.go:100: The
> specified group does not exist.
> 2020-11-17 08:19:29.767930: [TUN] [SCJ] Shutting down
>
> Is extremely puzzling. I'm wondering what led to this and how you
> eventually appeared to fix it. Did it go away on its own without user
> intervention? Did you have to manually start/stop the tunnel a few
> times?
>
> Jason
