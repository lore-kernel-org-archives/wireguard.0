Return-Path: <SRS0=2DBL=OO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E2AEC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Sep 2021 19:59:36 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 422306103D
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Sep 2021 19:59:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 422306103D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a84996fd;
	Fri, 24 Sep 2021 19:59:33 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 9d55b0e3
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Sep 2021 19:59:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AF6576103D
 for <wireguard@lists.zx2c4.com>; Fri, 24 Sep 2021 19:59:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="ctdpNOIC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1632513567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SwiPiIdZ01hxRLMI3zXGIu8RgzHNQ+itb6T2XsyDvxY=;
 b=ctdpNOICFIUPeYXJR+YK6+26JvM65Z5pp1+GthN0P8t1CQ9TXa52BFVHg607kVasQDW0uy
 KwW9kCHRF8+rc4M51VrNjEV5nxkoWx9gdPEg4aGUVopNna6Dx6hsVvYowYDa1KsDwPVVhh
 3Rnvf58Og/JEtqv4xSbneRv/zW2LGOs=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e837cbae
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Sep 2021 19:59:27 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id b82so7351303ybg.1
 for <wireguard@lists.zx2c4.com>; Fri, 24 Sep 2021 12:59:26 -0700 (PDT)
X-Gm-Message-State: AOAM532uYW4swEqRAvJBHMgClHFGZacKuoL7yXfW/pWIahKYQst9H+Zf
 oeVJnNm7pb/K2+Lvb64U/IK90Z7PdT8RR2RdH+s=
X-Google-Smtp-Source: ABdhPJxkqiiEMscnd18G1sZHuipcx3lhYRkoCqbw1BTivHSUWAA4KbiCqEy8jKHliUCQYh4oS23Qlw6TG6T9PoRyDSs=
X-Received: by 2002:a25:3214:: with SMTP id y20mr14513823yby.416.1632513565931; 
 Fri, 24 Sep 2021 12:59:25 -0700 (PDT)
MIME-Version: 1.0
References: <e0d4dcbb-b0c8-1214-ff0c-c856d168d67f@physik.uni-bonn.de>
 <CAHmME9oSSzJU4H8jc__HiFsexpB6jJUKM84kN+_9WesoTSMMsQ@mail.gmail.com>
In-Reply-To: <CAHmME9oSSzJU4H8jc__HiFsexpB6jJUKM84kN+_9WesoTSMMsQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 24 Sep 2021 13:59:15 -0600
X-Gmail-Original-Message-ID: <CAHmME9rknanKEdk8L5PJxbg1OZejN59z5xuh5y54O7y+zWb1nw@mail.gmail.com>
Message-ID: <CAHmME9rknanKEdk8L5PJxbg1OZejN59z5xuh5y54O7y+zWb1nw@mail.gmail.com>
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

On Fri, Sep 24, 2021 at 11:48 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> I'm going to cut a new release in the next few hours here. When that's
> released

v0.4.10 is now released.
