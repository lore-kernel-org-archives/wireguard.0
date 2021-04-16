Return-Path: <SRS0=Vhpd=JN=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 445F8C433ED
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 16 Apr 2021 15:20:07 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D780961222
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 16 Apr 2021 15:20:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D780961222
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2803c00f;
	Fri, 16 Apr 2021 15:17:37 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b0b24dd3
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Apr 2021 15:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1618586248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DS5M1I33lqHMUPOn4NXMkO8mSQIixKboLVHSmOszJ1I=;
 b=gVfnwsxL08b5wIjogaysLB7wMZR4PDI8c/GY0hQOUfA3PIWvZBvUkssGOoiqhmPNF9dZz+
 Xf6dqRgb/eNquca9BG1XK/yh/eB3xTq7NUTjwui/g2TN8gtcIOfIJP/G+B4pUVvV/vaMYU
 rmTxmhiTXGjt4uF/xsR3PndK0jvxoSg=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 879c9bfd
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Apr 2021 15:17:28 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id o10so30474094ybb.10
 for <wireguard@lists.zx2c4.com>; Fri, 16 Apr 2021 08:17:27 -0700 (PDT)
X-Gm-Message-State: AOAM530X5h00JNXqIjirIkhczDZDYrz7IZvvS8E6fAWRORWaxEzqcENK
 /WXglAJffHmDK8PaEtEJQF7sOFku1B2C9n/WHZQ=
X-Google-Smtp-Source: ABdhPJxUNKg+x71Rf6Xcc4HIZQ4FpPJzUHhkVIIek08GpWFsMIjgl6Apr+hWqpVHs1O5jwkHqjKhHxo3q1IjaMqPhdY=
X-Received: by 2002:a25:cc3:: with SMTP id 186mr12419147ybm.178.1618586247530; 
 Fri, 16 Apr 2021 08:17:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7110:91a3:b029:5b:6127:3eb5 with HTTP; Fri, 16 Apr 2021
 08:17:26 -0700 (PDT)
In-Reply-To: <8e80a3e4-4118-6273-a5e3-0ec7692fcb17@spam-fetish.org>
References: <9afe6dc9-5c53-4c25-b09f-5b4cf6ff8046@stha.de>
 <CAHmME9rAzGauYJuq4Qpn561f1YrYTaSN1mj2HB2Kdhgd2QJs9A@mail.gmail.com>
 <87371254-15f1-494b-8740-38071d7f7d68@stha.de> <874kg8ldjn.fsf@toke.dk>
 <7be52421-db0d-4971-99b0-ce76307d1a33@stha.de>
 <CAHmME9pxnh6MFdQGQCWRX6aNJu=rM-SyVY1jLb6EurgNNhwJSg@mail.gmail.com>
 <87sg3rigdx.fsf@toke.dk>
 <CAHmME9qerb3LhuJfQ2L=J9gz=vGXV47qUAwC3-LYMTWVWnn62Q@mail.gmail.com>
 <15c3483d-546b-4c86-aca7-9ab37945791e@stha.de>
 <8e80a3e4-4118-6273-a5e3-0ec7692fcb17@spam-fetish.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 16 Apr 2021 09:17:26 -0600
X-Gmail-Original-Message-ID: <CAHmME9p3MOtJKw7LK4WraPjB20cGGrmGgMNZOSf4YT=jTzH-ww@mail.gmail.com>
Message-ID: <CAHmME9p3MOtJKw7LK4WraPjB20cGGrmGgMNZOSf4YT=jTzH-ww@mail.gmail.com>
Subject: Re: FreeBSD if_wg POINTTOPOINT and MULTICAST behaviour
To: "Muenz, Michael" <m.muenz@spam-fetish.org>
Cc: wireguard@lists.zx2c4.com
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

Hi Michael,

On 4/16/21, Muenz, Michael <m.muenz@spam-fetish.org> wrote:
> Am 16.04.2021 um 10:57 schrieb Stefan Haller:
>> After applying Toke's patch for bird and your Wireguard patch in
>> a7a84a17faf784 everything is working as before (with minor config
>> changes).
>>
>> Just for the record, my previous configuration looked like this (using
>> POINTTOPOINT interfaces, I use ifconfig to set the peer address):
>
>
> Hi,
>
> Just following the conversation and also had a quick chat with Jason via
> IRC (mimugmail).
> We had a couple of reports that with latest change of removing PTP which
> breaks OSPF.
> In our case (OPNsense) we rely on FRR so it would be nice to have a
> generic solution without toucingh routing software itself.
>
>
>> So for me everything works as expected again. A big thanks to all of you
>> for
>> figuring out what was going wrong and getting it fixed so quickly.
>>
>>
>
> I set up a lab and will do some testing with version before and after
> the change, maybe for FRR it's enough to set NBMA or similar.

Could you send a minimal bird config that's broken so that I can
reproduce the problem and debug?

Jason
