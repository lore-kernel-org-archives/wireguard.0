Return-Path: <SRS0=S5mX=JM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A58DC433ED
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 15 Apr 2021 17:23:17 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C1E961074
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 15 Apr 2021 17:23:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C1E961074
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 974c9508;
	Thu, 15 Apr 2021 17:23:14 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id de75143d
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 15 Apr 2021 17:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1618507389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WNX2l0HZBURP6GpuwZqIQ44t21J5kLEpl6C4NVl8F1c=;
 b=PNdoqHRAUal59NC6qlF6L+sNdAjxt7cxjRDJcUcdunDWh5fl3quqpiITc65zsQAVOkDUgY
 PH/OFoO+DZjkz+NM+fTtqmYOh//RbVJ6i8ISpf3TiVY7HjiC9C1x6Zq/+me9goLX91IPeJ
 POwIK0nk8KVrDupUVdAWyuwsOoJCrco=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f999b809
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 15 Apr 2021 17:23:08 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id g38so26986603ybi.12
 for <wireguard@lists.zx2c4.com>; Thu, 15 Apr 2021 10:23:08 -0700 (PDT)
X-Gm-Message-State: AOAM530o42Smg706bAtdEpcaAzpWQo9uwkgDdu15BspDrMrubGuA1wCu
 W9xnEka5yjg3bsVonFwDBfhVQEKU0/nGhwy4rkE=
X-Google-Smtp-Source: ABdhPJwF4k6BCYlY1Yb+L+xLHRpiRT9jqG+vtm8QnvTRX2SYekHX4+1mKGNL2+fC5RPHXU1U2dDyyzUvNJsGU2fXOp8=
X-Received: by 2002:a25:aa14:: with SMTP id s20mr6165718ybi.306.1618507388264; 
 Thu, 15 Apr 2021 10:23:08 -0700 (PDT)
MIME-Version: 1.0
References: <9afe6dc9-5c53-4c25-b09f-5b4cf6ff8046@stha.de>
 <CAHmME9rAzGauYJuq4Qpn561f1YrYTaSN1mj2HB2Kdhgd2QJs9A@mail.gmail.com>
 <87371254-15f1-494b-8740-38071d7f7d68@stha.de> <874kg8ldjn.fsf@toke.dk>
 <7be52421-db0d-4971-99b0-ce76307d1a33@stha.de>
In-Reply-To: <7be52421-db0d-4971-99b0-ce76307d1a33@stha.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 15 Apr 2021 11:22:57 -0600
X-Gmail-Original-Message-ID: <CAHmME9pxnh6MFdQGQCWRX6aNJu=rM-SyVY1jLb6EurgNNhwJSg@mail.gmail.com>
Message-ID: <CAHmME9pxnh6MFdQGQCWRX6aNJu=rM-SyVY1jLb6EurgNNhwJSg@mail.gmail.com>
Subject: Re: FreeBSD if_wg POINTTOPOINT and MULTICAST behaviour
To: Stefan Haller <stefan.haller@stha.de>
Cc: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@toke.dk>, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Hi Stefan,

Sounds like Toke has come up with the optimal solution, so I think
I'll drop the "link1" patch/hack.

One thing I was wondering though, mostly for my own curiosity, is what
config you're using that shows the problem, and how does the problem
manifest?

I just put this in bird.conf:

router id 192.168.88.2;
protocol babel {
       interface "wg0" {
               type wired;
               port 1234;
       };
};

And then I ran:

# pkg install bird2
# bird -d -c bird.conf

And I didn't see any troubling error messages. But maybe it's more
subtle than that?

Jason
