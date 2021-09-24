Return-Path: <SRS0=2DBL=OO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BDF1C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Sep 2021 17:49:18 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29A876125F
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Sep 2021 17:49:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 29A876125F
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 03c04b49;
	Fri, 24 Sep 2021 17:49:15 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 9f394efa
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Sep 2021 17:49:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 23C4D6125F
 for <wireguard@lists.zx2c4.com>; Fri, 24 Sep 2021 17:49:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="LjfC7yKl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1632505748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=e1H9x4TmmjXwF48JrvoknkRFJ3+9Bb+KpatyOdjxOXY=;
 b=LjfC7yKleY+AW7HRjkkXHNjkj0vw+OPIHR8/No5kdX4ouwPdu33mAQ9dCa8bmh1u1Q+q0w
 B3e/o/d3XAOq7+DOJKNlZOaNME5MeJ5QrtLi1X2PIoUC2924wuBm7BRODoaYIyX4sqJMFg
 SUaJyxuEotDSZLMErl2tcd8SgFGjUqo=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 972b4d85
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Sep 2021 17:49:08 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id h2so7448262ybi.13
 for <wireguard@lists.zx2c4.com>; Fri, 24 Sep 2021 10:49:08 -0700 (PDT)
X-Gm-Message-State: AOAM533AhSdStTh+jlV2V1IYFZ5HwKZ68unZtJbY7V4FaK9RMt/I67O1
 aLMaeiOvg5ZcoZL4A1qKVNe//d1Ts3HX3QgMm08=
X-Google-Smtp-Source: ABdhPJxlH5EmHWlNRaV/lNAI8dpNrM1BvWHkOBUY9iyrdQ/qzqZer/NtwHNoecOtJALXK72vY7QRBQrp3qbpZe3kRgA=
X-Received: by 2002:a25:3214:: with SMTP id y20mr13890585yby.416.1632505747811; 
 Fri, 24 Sep 2021 10:49:07 -0700 (PDT)
MIME-Version: 1.0
References: <e0d4dcbb-b0c8-1214-ff0c-c856d168d67f@physik.uni-bonn.de>
In-Reply-To: <e0d4dcbb-b0c8-1214-ff0c-c856d168d67f@physik.uni-bonn.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 24 Sep 2021 11:48:57 -0600
X-Gmail-Original-Message-ID: <CAHmME9oSSzJU4H8jc__HiFsexpB6jJUKM84kN+_9WesoTSMMsQ@mail.gmail.com>
Message-ID: <CAHmME9oSSzJU4H8jc__HiFsexpB6jJUKM84kN+_9WesoTSMMsQ@mail.gmail.com>
Subject: Re: Windows stuck in boot after WireGuard update (switch to
 WireGuardNT?)
To: Oliver Freyermuth <freyermuth@physik.uni-bonn.de>, 
 Joshua Sjoding <joshua.sjoding@scjalliance.com>,
 Arlo Clauser <Arlo@starcubedesign.com>, 
 John-Paul Andreini <jandreini@geonerco.com>
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

Hey guys,

I think we might be onto something with https://w-g.pw/l/ZO5Z ...

I'm going to cut a new release in the next few hours here. When that's
released, would you try updating to 0.4.10, going back to using the
kernel implementation, and letting me know whether the problem
resurfaces? In the absence of being able to locally produce this on a
debuggable machine, I think this kind of trial and error is all we've
got. Hopefully the theory behind https://w-g.pw/l/ZO5Z is correct.

Jason
