Return-Path: <SRS0=S5mX=JM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD4E4C433ED
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 15 Apr 2021 04:31:04 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A191B61027
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 15 Apr 2021 04:31:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A191B61027
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 58be948b;
	Thu, 15 Apr 2021 04:31:01 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 1719bd14
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 15 Apr 2021 04:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1618461056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yYWoGtO2089+REBFQ8NHWwZIyuM3uz9Gr7x+ObEpHjA=;
 b=bAWndmncVm7GDgrika3cbVNVeGdjpMdhgERPOW8BLkDd4ojRed+Ji9d3o4GNjz1TQZQQzQ
 pbAopgM6oJoEccImD/VpwxIP9WfhnPyXWjtSN4C04xRhv1ttgIFhjjuRO3/MrjiR1b4jST
 wwp+vmGUQmKiDyyg2L9K6waiSay4628=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e3e2f2e7
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 15 Apr 2021 04:30:56 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id c195so24675429ybf.9
 for <wireguard@lists.zx2c4.com>; Wed, 14 Apr 2021 21:30:56 -0700 (PDT)
X-Gm-Message-State: AOAM532WdkfqyzXwdxhqg6WTkhnAwlCalWNM/VE1WccPoSFhKNhHA19t
 B+C3aqcQhxoubIZg0UVLO4owUxlxofN9RJKVKIc=
X-Google-Smtp-Source: ABdhPJy1N+2Amuz1GPDKwYVbChpWl94PL0FhxY/YAn/k5otjN6gjD4ODiMnaZiYqJeULIT3zm+B8vimnVINUwBf+2i8=
X-Received: by 2002:a25:aa14:: with SMTP id s20mr1944820ybi.306.1618461055867; 
 Wed, 14 Apr 2021 21:30:55 -0700 (PDT)
MIME-Version: 1.0
References: <9afe6dc9-5c53-4c25-b09f-5b4cf6ff8046@stha.de>
 <CAHmME9rAzGauYJuq4Qpn561f1YrYTaSN1mj2HB2Kdhgd2QJs9A@mail.gmail.com>
 <87371254-15f1-494b-8740-38071d7f7d68@stha.de> <874kg8ldjn.fsf@toke.dk>
In-Reply-To: <874kg8ldjn.fsf@toke.dk>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 14 Apr 2021 22:30:44 -0600
X-Gmail-Original-Message-ID: <CAHmME9p29dAjepPMJbESJm8ZCxS55rz6xCB1fG+YtmfULtm3cA@mail.gmail.com>
Message-ID: <CAHmME9p29dAjepPMJbESJm8ZCxS55rz6xCB1fG+YtmfULtm3cA@mail.gmail.com>
Subject: Re: FreeBSD if_wg POINTTOPOINT and MULTICAST behaviour
To: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@toke.dk>
Cc: Stefan Haller <stefan.haller@stha.de>, 
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

Hey Toke,

Regarding POINTTOPOINT flag in Linux vs FreeBSD -- apparently FreeBSD
routes everything differently simply by virtue of the interface having
that flag, whereas on Linux, PTP routing mode is only switched on if
you actually add an address with a dest peer. So for FreeBSD, the
different routing seemed somewhat disruptive, so I stopped setting
that flag in a recent snapshot release.

Hey Stefan,

Looking at bird's source code (iface.c), it looks like bird will only
look at IFF flags if you fail to specify the interface type in the
config file. Can you try *not changing to link1/ptp mode* and then
setting the type flag in your bird config? Specifically:

                interface <interface pattern> [instance <num>] {
                        ...
                        type [broadcast|bcast|pointopoint|ptp|
                                nonbroadcast|nbma|pointomultipoint|ptmp];

If you set `type ptmp` or `type nbma` or something, and see if that
will do the trick for you? I'd like to _not_ release this link1
hack/trick if possible.

Thanks,
Jason
