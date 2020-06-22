Return-Path: <SRS0=kilO=AD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FEC4C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 22 Jun 2020 10:56:51 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9CC720706
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 22 Jun 2020 10:56:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n9xUE+J/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9CC720706
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id da628cbf;
	Mon, 22 Jun 2020 10:37:53 +0000 (UTC)
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a3f91c3c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 22 Jun 2020 10:37:51 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id 9so18764292ljc.8
 for <wireguard@lists.zx2c4.com>; Mon, 22 Jun 2020 03:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JL+XV/BzqynQtvJjMI3V7r7YlotJKs4P3j08MF5bABk=;
 b=n9xUE+J/4I6tVfrAL6Mql/Y/98ubvtzUxbX/O7wtTmWFQ/ntZPe0facjjGoJGAOjlX
 2j4Mph+tz0C/sJjsuGdw/4agF2rteAuJLIraBOTfaQ1Mij9sb7Oyn2fJcXKhr/4MY3+U
 usOWH8sj54kWuKFUbAasHP54fBIVLTXqKSpSpnwareqam91TKUXH2gZ44OZbhwkp0pxq
 IyA1ewWCJAqfye9LXvoSy47ZDhYKVHdyUykqLW5uYvnaNuM0qT1yCBejZSLmAqsycgrR
 jBCMmPRlgrdwA6BXozK4OWexv7FrI8/a3w38XcmcqVoVVayLJsCueasuB++lpPglYDeR
 AN6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JL+XV/BzqynQtvJjMI3V7r7YlotJKs4P3j08MF5bABk=;
 b=k7Re7PCib4bDaLysbXmNl02PUU9Vxa31TLbqcBz1KcBgisThFx40xfC6CPhexDvBwt
 n7YL3SGEMUwMeS3GmqIZOM1bIV7O8Rekz7P93htjcKS9uW4Y8j8qJ/TuXi586BOCoVJX
 aDUYO0qcIq61LdqoLXbz27bhLkAEARS4pLlKs36iKRD/t4fIBdjFmZ8KiwR9EIspukMm
 onX6VmGkthO+Kl95NkLynZSbdOjo9umxxmgxCeJ7h7mHtQuSm+NA2eAYMO35HcpTW3Yi
 2O9uKR+tMZ50SCYyqkFliR5vWImQxrznl47B+QsfOm5ooNx2wzn6L2usdnTVPsQ2tmbQ
 hujg==
X-Gm-Message-State: AOAM533R+YM3HJ6hz6G3gcFwm6OSrTIRMj4yx0vkTDWp9J1bSVU8ngvq
 CIsbBgc9WN3ImzIb0qve+hZKVbAYl+hQxAL5GKM=
X-Google-Smtp-Source: ABdhPJyXvTXVzxuLI+cSJ9UGKF77Rrn0rXxjbPhotgG9UBR7E1NonbvNYZEyhVVCSPI5X2BOcaVr4/ngRvznX/PAIY0=
X-Received: by 2002:a2e:7313:: with SMTP id o19mr8387803ljc.27.1592823393609; 
 Mon, 22 Jun 2020 03:56:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAN5wt5r_qoLFrZM6T2CJ6UhQpcqFTqf5AHUugpe0rN5LuL3YLQ@mail.gmail.com>
 <CAHmME9pfyKr62RrAmV81NKs938CmQbqRtcab=yJzKw9V8iMc1A@mail.gmail.com>
In-Reply-To: <CAHmME9pfyKr62RrAmV81NKs938CmQbqRtcab=yJzKw9V8iMc1A@mail.gmail.com>
From: Christopher Ng <facboy@gmail.com>
Date: Mon, 22 Jun 2020 11:56:22 +0100
Message-ID: <CAN5wt5q4iW07HcJE2GGWuEAwtiPKOUarNTiDGWyHJ6kOCNWA1g@mail.gmail.com>
Subject: Re: Wireguard over VPN broken on windows
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

it worked for me on a local build, it never worked in any released version.

i've been playing around with a local build, if i comment out the
device.BindSocketToInterface calls in defaulltroutemonitor.go,
everything seems to work fine.  in a single config i have one peer on
an OpenVPN interface, and one on the default interface.  both are
connected, i can ping both peers over the wg interface.  why must the
socket be bound to a particular interface?  or perhaps i don't
understand what those calls do.



On Mon, 22 Jun 2020 at 09:23, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> > 59e556f on wireguard-go breaks
>
> 59e556f fixes a regression, which never shipped in any release. There
> is nothing here that "once worked and now doesn't." What you have in
> mind has never worked.
>
> We're currently using IP_UNICAST_IF on the wireguard socket, attaching
> it to the default route. I'd much rather have something like Linux's
> policy routing and suppress_prefixlen, but I don't know how to do that
> (yet?) on Windows. If you have any ideas or want to do some research,
> I'd certainly be very interested.
