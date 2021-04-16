Return-Path: <SRS0=Vhpd=JN=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F223C433ED
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 16 Apr 2021 00:07:50 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0340B6113D
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 16 Apr 2021 00:07:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0340B6113D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 139b7738;
	Fri, 16 Apr 2021 00:05:21 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 28534dcc
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Apr 2021 00:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1618531516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HHvtn7kGiDzov7/XIfJmuNwrdw4lkeUcYSv7DIzghE0=;
 b=YIqf+iTqQ/8ktdq22z8KlTk2nwOM7jRDBUTeQd4O8hnG7/6GfO05lGrCN9IPEN6mObdT0Z
 Q9Xqa136fUXxnjUqfdsfArs+znA344tBqJquR1R2IlLysdm5hger/arfXuL4Y6UPQfai5U
 PGxisqPZLXO/QJsMDW9OXR5O7qeB7tU=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 00d77200
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Apr 2021 00:05:16 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id g38so28121274ybi.12
 for <wireguard@lists.zx2c4.com>; Thu, 15 Apr 2021 17:05:15 -0700 (PDT)
X-Gm-Message-State: AOAM532NYoKRXLHVTZjQHGACcILUhbbr4Uwahi0U20SzTboKWl+JZegn
 OASoMpXW2osF3EdN6b8tDLL69PWvXPXRpIdxkQk=
X-Google-Smtp-Source: ABdhPJxw9VLfF8wMoejledrGypSgHMIp2u9zhKPWBXkv6Xiat7KO+LgwifbkS8g3Mjoky4iF26Ai8wIVXZiGvz535GY=
X-Received: by 2002:a25:aa14:: with SMTP id s20mr8479355ybi.306.1618531515394; 
 Thu, 15 Apr 2021 17:05:15 -0700 (PDT)
MIME-Version: 1.0
References: <9afe6dc9-5c53-4c25-b09f-5b4cf6ff8046@stha.de>
 <CAHmME9rAzGauYJuq4Qpn561f1YrYTaSN1mj2HB2Kdhgd2QJs9A@mail.gmail.com>
 <87371254-15f1-494b-8740-38071d7f7d68@stha.de> <874kg8ldjn.fsf@toke.dk>
 <7be52421-db0d-4971-99b0-ce76307d1a33@stha.de>
 <CAHmME9pxnh6MFdQGQCWRX6aNJu=rM-SyVY1jLb6EurgNNhwJSg@mail.gmail.com>
 <87sg3rigdx.fsf@toke.dk>
In-Reply-To: <87sg3rigdx.fsf@toke.dk>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 15 Apr 2021 18:05:03 -0600
X-Gmail-Original-Message-ID: <CAHmME9qerb3LhuJfQ2L=J9gz=vGXV47qUAwC3-LYMTWVWnn62Q@mail.gmail.com>
Message-ID: <CAHmME9qerb3LhuJfQ2L=J9gz=vGXV47qUAwC3-LYMTWVWnn62Q@mail.gmail.com>
Subject: Re: FreeBSD if_wg POINTTOPOINT and MULTICAST behaviour
To: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@toke.dk>, 
 Stefan Haller <stefan.haller@stha.de>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Bernhard Froehlich <decke@freebsd.org>
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

Hey Stefan, Toke,

I spent the day playing around with bird and babel and sorted out
FreeBSD's v6 situation. Basically, ff00::/8 addresses are treated
differently, and they're blocked unless the interface sets
IFF_MULTICAST. So I've committed
https://git.zx2c4.com/wireguard-freebsd/commit/?id=a7a84a17faf784857f076e37aa4818f6b6c12a95
to do this. We _could_ also set IFF_BROADCAST, which would translate
to babel enabling IF_MULTICAST, but so far I can't see how this would
help anything real, and combined with Toke's patch --
https://bird.network.cz/pipermail/bird-users/2021-April/015415.html --
I think we're actually in a good situation. Seeing that this now
works, I've also dropped the link1 hack and put that in a branch in
case it becomes useful later.

Bernhard (decke@) is CC'd here in case he'd like to get some of this
into ports early for your use case. Specifically, this involves:

1) https://bird.network.cz/pipermail/bird-users/2021-April/015415.html
for the bird2 package.
2) https://git.zx2c4.com/wireguard-freebsd/patch/?id=a7a84a17faf784857f076e37aa4818f6b6c12a95
for the wireguard-kmod package.

Stefan - please let me know if those work for you. In my testing thus
far, things seem to work for me.

Long term, we'll certainly want to have Toke's planned support for
direct WireGuard peering inside of bird.

Regards,
Jason
