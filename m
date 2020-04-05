Return-Path: <SRS0=5+V/=5V=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1055C2BA19
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  5 Apr 2020 21:54:03 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 602A420659
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  5 Apr 2020 21:54:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="3LQQgiP5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 602A420659
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a9321f72;
	Sun, 5 Apr 2020 21:45:19 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4f90c78f
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 5 Apr 2020 21:45:17 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id da2ecfeb
 for <wireguard@lists.zx2c4.com>; Sun, 5 Apr 2020 21:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=5lfE69eSAztL3dM9UeUD2L+HvWY=; b=3LQQgi
 P5PufmVjxi9KbsVJGMCS/wUtKBcATh0ZobhcyPR+cMvYZEbdCnv0EY92JGcerVxH
 GEr8y05+1Y+gZZO97LucGxMtl0IufQ8ukZtKZyNCPdVSd9AT1OaGe2b5E5WNBg4M
 rsQkhRh7OHrlHYJiVWujFCW/SdXbPhskgxrnmZ7i3mVZJlyrkAcs1EOA+q+xXJao
 plLuILcX4Gjf+N8QBfXP9bjjLgs1rNxbBOsKsJ8+Flj92jCSz2a3A+/OvoA5CrcR
 zJ8uwK52Nw9XsLiACR5NIyGo3mnMg78qgJ6/cJCC7dp9/F25GOEcImy80a5P1o0r
 3G3+D3p9KMTUi90w==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 435454db
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 5 Apr 2020 21:45:17 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id o3so13732132ioh.2
 for <wireguard@lists.zx2c4.com>; Sun, 05 Apr 2020 14:54:00 -0700 (PDT)
X-Gm-Message-State: AGi0PuZ2g7XmVQo+f7m8rKbmGEBL5ippGqpI+HPllYnYDGbv13Va7AK6
 7OrboM3FCZtWR8XP3g7i1Ja0hmjX1lN8Kjw+Cb0=
X-Google-Smtp-Source: APiQypIUbmTw338LOo7bjTzMRDLO18QHpy8NAJEIjPGpDfc4n+rHSKHM8aX17exooAZ+Xtyt8RjgimSdVbXM4PycKJM=
X-Received: by 2002:a02:2a4a:: with SMTP id w71mr18193473jaw.75.1586123639671; 
 Sun, 05 Apr 2020 14:53:59 -0700 (PDT)
MIME-Version: 1.0
References: <MWHPR17MB1648A7DB1266E86F16DC44F8D0C50@MWHPR17MB1648.namprd17.prod.outlook.com>
In-Reply-To: <MWHPR17MB1648A7DB1266E86F16DC44F8D0C50@MWHPR17MB1648.namprd17.prod.outlook.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 5 Apr 2020 15:53:48 -0600
X-Gmail-Original-Message-ID: <CAHmME9q0sbmNpYB5-ZWaT2MUQq_SPdsF9jJ9frkbffwN+RvP7w@mail.gmail.com>
Message-ID: <CAHmME9q0sbmNpYB5-ZWaT2MUQq_SPdsF9jJ9frkbffwN+RvP7w@mail.gmail.com>
Subject: Re: Potential bug in Android app - Create from scratch flow
To: Dana White <danabw@hotmail.com>
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

> Finally (thanks to someone on #wireguard irc) I tried imported the exact same config into the app, and it worked immediately.

Don't use the same config from two devices. One device :: one private key.

> It looks like there may be a problem w/the manual entry process. At least that was my experience, repeatedly. App is current version, just installed for the first time two days ago.

Create it manually, and then export it to a zip. Look in the zip and
see if there's any difference between that file and the one you
imported from the windows app.
