Return-Path: <SRS0=sRyP=OU=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46D8CC6783B
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 11 Dec 2018 22:34:09 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80CD92084C
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 11 Dec 2018 22:34:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=archlinux-us.20150623.gappssmtp.com header.i=@archlinux-us.20150623.gappssmtp.com header.b="OJmOJvMj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 80CD92084C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=archlinux.us
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 60c30040;
	Tue, 11 Dec 2018 22:25:15 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 484a9ec4
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Dec 2018 22:25:14 +0000 (UTC)
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 13e1bcf8
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Dec 2018 22:25:13 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id t5so15782544otk.1
 for <wireguard@lists.zx2c4.com>; Tue, 11 Dec 2018 14:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=archlinux-us.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZsEFGpwYbRk9fE7qtYSXeSFW04YVqwPiyFusK7wQJ+M=;
 b=OJmOJvMj/fBcCWI5GUJp9jnP0BWx969G5wnXiQQvmWrQeP1SWBa45fe5Az8HkT8k8v
 u/IjGchCzMIqGvnukYyOmI0RjY0NmitzcSchvnSYHg/WjHriyXeSSpb3pUAuVEAejq3G
 R0sgpK7Cgt/f/uXkk4F17kNF5qVXqqc/W2McH5kFugqo1Q/rvGzcbxsdsYsRpoC/po4l
 7uFVWKBvchR4qJoMwQ2mUiXpwFcZYBXElT1FXt/D+nqTZs8fz4od9qPYTqKXShtYPBmI
 K2ZGBsTvJSUudwP83uX7uekat1FqlLPIaH4U/xttW8NYSdH0KqyBTb2/9+CBbDRL0Nat
 cs7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZsEFGpwYbRk9fE7qtYSXeSFW04YVqwPiyFusK7wQJ+M=;
 b=M1MblHUfr3b7TbLmENlWAvSqwPsG1hNXrLYLdp7lZyE2MRS4AH9XZdndZPsAcwPu9p
 Tau1y4wcU162Av3K/AeDF6Fw8YGmu0weGTqJ48GmBRnVgpHebCLVM/q4VtC8WmbT69n0
 aZrFqaeYP1DGanlSBeCsNBmgIZXi/T8dGD3VOAmpIaP3mAAEQkWe7heTzgClFdVRElvQ
 lVQ9tUQ1vNRC4Mv1gbUO5gbgTwh9QwzaAUtg+7I+ER2I6DNxaTlnaRjQOj2gxYAo8gDb
 C/K17YX2qIgxWKKn/E9LYHXPFQfh07d/FlIYuP40cALp2B5A3X/UQoQBjCMwpFs+YJNr
 ARvQ==
X-Gm-Message-State: AA+aEWaMbBWBVh8oCZt4GtN5j1aScSa/NjCrzuPj1JrT1jelGVx9YkCk
 QXgYJF8MjwnuyVuyVBNfsJUIIKt05wExoSahZSQUY8kFx1Q=
X-Google-Smtp-Source: AFSGD/UJCwhOgalCxXD9Zm9hpwSrn8N0Skns6eYyo5CzIoxWyNmILDZ6BmIIz9cBx3fK/K+a2hPk1p4LealQ/xLH+5E=
X-Received: by 2002:a9d:2666:: with SMTP id a93mr12120253otb.235.1544567643526; 
 Tue, 11 Dec 2018 14:34:03 -0800 (PST)
MIME-Version: 1.0
References: <CAO_nJAYGman8=av2iLjnxaEMVLaH=H+392iZ6YrcxLNxTK+hkg@mail.gmail.com>
 <CAHmME9qXh9nmcscVwpiPD7+_yYMGdb-DE7W8Z1DGRHzxA--o5Q@mail.gmail.com>
In-Reply-To: <CAHmME9qXh9nmcscVwpiPD7+_yYMGdb-DE7W8Z1DGRHzxA--o5Q@mail.gmail.com>
From: John <graysky@archlinux.us>
Date: Tue, 11 Dec 2018 17:33:52 -0500
Message-ID: <CAO_nJAZz_1Ldp7KYA4T3Fa9BPvnmSKvOVS2NXZONZaDAW7RYTw@mail.gmail.com>
Subject: Re: [BUG] iOS client (0.0.20181104) sometimes kills WiFi
 connections/switches to LTE
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

I spoke too soon.  After several days without the bug appearing, it
did this afternoon.  The only fix was a reboot.  I have 2 profiles in
the app.  What I found was that as soon as I connected to the first
profile, the wifi icon would immediately disappear with a concurrent
appearance of the LTE icon.  If I connect to the 2nd profile, both the
Wifi and VPN icons would co-exist.  This was very reproducible: I
could bounce back and forth between the two profiles and get kicked
off the Wifi upon doing it.

Is there anything I can provide you to help debug further or do you
have some thoughts based on my description alone?  Please let me know.

On Thu, Dec 6, 2018 at 11:22 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Should be fixed for the next version.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
