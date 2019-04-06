Return-Path: <SRS0=Yiz6=SI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA8AEC10F06
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  6 Apr 2019 12:05:18 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82EB12087F
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  6 Apr 2019 12:05:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="U2D/Iqhz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82EB12087F
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 46b21b06;
	Sat, 6 Apr 2019 12:02:49 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2dbb4956
 for <wireguard@lists.zx2c4.com>; Sat, 6 Apr 2019 12:02:48 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b7685f7e
 for <wireguard@lists.zx2c4.com>; Sat, 6 Apr 2019 12:02:48 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d3ead9ef
 for <wireguard@lists.zx2c4.com>; Sat, 6 Apr 2019 11:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=aiUiaBf3YsOxVpmeSRtp0jrRXEA=; b=U2D/Iq
 hz5MbTRn5kq7L+AytHeyQKro/aBZmE2gF6QvZXCxJgyUIyCmJN/Cz1jJPFMXiyhZ
 npFUDm5nDv5cR9IGNqQRsPCWiHAILP7uojT16xScgHJEyNNKKiajy9QjF+d56oOD
 xrIfdwvvuSZ6OImIwM68PVtxZ8XfrNQz/n+U+GafT2JK5VvtJxafq7JWDwgkR8gE
 RMyYgv6eSwpth7bHQdXbo3nslmzG+V/krEP2i5y/7RkEefUG4lK7wz4CHcJ4Ugim
 9ry+j7QKZkGi4hIxgGkmEfZ72zLtQSul0xuKAt70qxrVoLKK7cliCna5BHumSKXk
 xZNcZXy1U1Uu3Wrw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 44e9030f
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 6 Apr 2019 11:41:36 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id t81so6991153oig.10
 for <wireguard@lists.zx2c4.com>; Sat, 06 Apr 2019 05:05:16 -0700 (PDT)
X-Gm-Message-State: APjAAAXm/hRIAX6FU5MIgUvWb07q04s+Jz7SKQ5Li1DMCrJHTlR084lE
 kOtIiciafPwt+/CkthaKqZ7Be5aCwa9vrgjfaQs=
X-Google-Smtp-Source: APXvYqzAl5GN5JGSdEgjuVjPhIAKiFBUIrNSOhG35PMScnJkfBfm1KSAM/Q4l817Unfd9kgqGcsr21QMAD/Akpt/EyA=
X-Received: by 2002:aca:ea54:: with SMTP id i81mr10207392oih.115.1554552315709; 
 Sat, 06 Apr 2019 05:05:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAGGGmFFSDwPGrfdvBOR_toubEpZG6nrtUk4oMO+FjRWpWSX-aA@mail.gmail.com>
 <CAGGGmFFC7cZ6kQ2e+WwuDkKeSorbP5_zLYNxOszzSK2QoPVL1w@mail.gmail.com>
In-Reply-To: <CAGGGmFFC7cZ6kQ2e+WwuDkKeSorbP5_zLYNxOszzSK2QoPVL1w@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 6 Apr 2019 14:05:04 +0200
X-Gmail-Original-Message-ID: <CAHmME9p-ttayzbRue0F7bi1TyYgeEoQwdmxeG4NTg8XFoRxoJA@mail.gmail.com>
Message-ID: <CAHmME9p-ttayzbRue0F7bi1TyYgeEoQwdmxeG4NTg8XFoRxoJA@mail.gmail.com>
Subject: Re: Wireguard on PiZeroW
To: Robert Ross <rpross3@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

I backported that 8 days ago here:
https://git.zx2c4.com/WireGuard/commit/?id=65e1f2838401bf033f3c8a8cdd718589574d9d2d

See if the latest snapshot (0.0.20190409) works for you.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
