Return-Path: <SRS0=CBQl=5I=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9CDFC10F26
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 23 Mar 2020 05:12:16 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BF502070A
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 23 Mar 2020 05:12:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dp1GgP1t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BF502070A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 980f9c14;
	Mon, 23 Mar 2020 05:04:51 +0000 (UTC)
Received: from mail-ua1-x934.google.com (mail-ua1-x934.google.com
 [2607:f8b0:4864:20::934])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id da5b9be4
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Mar 2020 05:04:49 +0000 (UTC)
Received: by mail-ua1-x934.google.com with SMTP id 9so4526990uav.12
 for <wireguard@lists.zx2c4.com>; Sun, 22 Mar 2020 22:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YEVPsurABM55zKpYj8oeZRIjf12cr+Ecl9MSruH/w0g=;
 b=Dp1GgP1tUlD4Al+bj03+dz9DNeKINGyD1kj0iyxAZONMySiZXfgAnXsOlwxhEigvAS
 2jaAjqntb3Y4eZz6Rnzg7PrWKANAR+i6a3lFMVHHd5hQFufojz9GoZb5zr560mzEae7i
 5Wt/+tDfBD9FSMo0zPifTT4G5jdQ+l7ZLr8ayEXzG0Ca1j0Fk8MbcEPnp1duaQhWUaEX
 F+NaySeVWSPJi/uKYz9nRCYK9o7H6hjm9TS+O+t0h+vkOl1hBVM+IzI4GlsPryyGLcck
 Jp6KTCxqD8I42PSxxjKmRh0pwdgGCnA9gBTJ95pk5yMGvQ/iMAjTuaz7wY+xGhlVnbHO
 H+2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YEVPsurABM55zKpYj8oeZRIjf12cr+Ecl9MSruH/w0g=;
 b=J6hrt1pn09SPZe5uFIBIWDc/xWMv4CJl3oOrxD+dmL3cb/k+fpl1O/cK64BKbGtDfc
 hnXnp4eyjJC8sqHr1S2wpGEadSlmNfvZ9PxJnn3iAOuD49wukGsGInvV+IcMlhIAOQCf
 CwcLgGFazCZ2IulcYvJfXzR42nWcDP909vaK9qneTNjzTZ+1rVxtMJ6TRrRxWW+iP50d
 8rm7O6J3oo+nMHGoMAe1FPXbW+p+3N6M7hEAYmXOR6w/339mI75NpPjvsDB7aWrl59CE
 Gx3FRzbht7+O0RdsP5iNdqqtSrtlpkFdooVhHttT9yLcDZ8ITfVHFV55jVdU/hcUaBcX
 3mMA==
X-Gm-Message-State: ANhLgQ2zm9Ng9juFHuJbCvC7VLGLKwnqCESRHYtFRec8aTLCSgzIk4P4
 kZ9xZbzZ6tBZASyLdFTFOhfEODlg7AXGQJxJCeU=
X-Google-Smtp-Source: ADFU+vs9PrbnODumvU/APRf2R4i0U2f2HRhQH+gT0+ids7LIkrq5S9BtFp4mExlLs/1KR38ihmQW1Wd5ve9J54KGQSc=
X-Received: by 2002:ab0:648b:: with SMTP id p11mr4336975uam.35.1584940306274; 
 Sun, 22 Mar 2020 22:11:46 -0700 (PDT)
MIME-Version: 1.0
References: <7273dde5-290a-7657-1c4e-3397db01038b@electromail.org>
 <CAHmME9qd6-Q+XNPeC0xNg+1Dgrc71dwimJ2m5ES5YP_qDRmG=Q@mail.gmail.com>
 <CAHmME9r_DdK36d+Eh8_JwntDnVn_axHNPf93XcXikroPPoBjcw@mail.gmail.com>
In-Reply-To: <CAHmME9r_DdK36d+Eh8_JwntDnVn_axHNPf93XcXikroPPoBjcw@mail.gmail.com>
From: Eiji Tanioka <tanioka404@gmail.com>
Date: Mon, 23 Mar 2020 14:11:32 +0900
Message-ID: <CAA2ss9GtgnqXYC9ew6_RtA-VtyvVa2Bi3UUb1nUPH8gd7J-F4A@mail.gmail.com>
Subject: Re: using wireguard intents from tasker?
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Franz Schwartau <franz@electromail.org>, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>
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

This is very good news.

I've never used it, but I've found that Tasker allows for an on-demand
connection, just like the mac/ios version.

Which is more appropriate to provide translation for this feature,
Crowdin or Patch?

Thanks!

2020=E5=B9=B43=E6=9C=8823=E6=97=A5(=E6=9C=88) 5:27 Jason A. Donenfeld <Jaso=
n@zx2c4.com>:
>
> WireGuard for Android >=3D 0.0.20200322 supports Tasker integration now:
> https://data.zx2c4.com/wireguard-supports-tasker.png . Simply select
> the remote control option.
>
> This may require some small tweaks in your Tasker. I've informed the
> generally responsive developer about this, and things should be moving
> along. Email their support, support@joaoapps.com , if you'd like to
> have a more up to date picture of what's up.
>
> Regards,
> Jason
