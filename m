Return-Path: <SRS0=Lcmb=XB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19F06C43331
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Sep 2019 21:19:02 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47EDB2070C
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Sep 2019 21:19:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="HkGkVSpG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47EDB2070C
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id af4a8fd7;
	Fri, 6 Sep 2019 21:18:42 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 86404c00
 for <wireguard@lists.zx2c4.com>; Fri, 6 Sep 2019 21:18:40 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c5bb0e9e
 for <wireguard@lists.zx2c4.com>; Fri, 6 Sep 2019 21:18:40 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 73101a6a
 for <wireguard@lists.zx2c4.com>; Fri, 6 Sep 2019 20:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=SRra8MHHgCFT2o38L8ORwXt7UUo=; b=HkGkVS
 pGzQdyDVtHqUUVynKDVCBRTUHjlGMHcVA/I6ZV/W/WQ71vSmLX7XDsW0T3CjVZ0G
 d70+5g0odoFcaCAPd7IpqvfzuPYYgc7VL8YGrw0JCdFo6yTAX2K+gqIzt15PJyHX
 U5RViiJSY9gJUUxJvM/rScsKwqlULsXBq5zZ7LMCsk59H3/s246VJTaT+KsAm/sP
 l/HuTEmRDL/NlageYZaVjwmScI7hbaQL7I7PX3uGexC9T3ahxnDetm1S/YR5TI8t
 WBzOuZvViy36qcdRPfHc5JKQan5LdjBT084nZ+YDoctLzZU/2PsaV6GO6LdSPjEo
 GcZK9JuI2CnQgf5A==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b214a6b1
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 6 Sep 2019 20:35:17 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id o101so7085544ota.8
 for <wireguard@lists.zx2c4.com>; Fri, 06 Sep 2019 14:18:39 -0700 (PDT)
X-Gm-Message-State: APjAAAWsrD8wlLgnNxxQc2DKImf2Ee0xv8pXKT54jhi+4+tpW+B15wrg
 OwIpR4YqYLqkGDn99H/mH3qBzdK3MTLh+WBYs5Y=
X-Google-Smtp-Source: APXvYqwb0G28Jqzo6141ZUvqyIgti7R7IyYi+Bl8ALr1tt3aWW0q6BTo7vldNGpXyttzWAnTLzOgnUopLQCQ1NfNaik=
X-Received: by 2002:a9d:3288:: with SMTP id u8mr2445715otb.120.1567804718469; 
 Fri, 06 Sep 2019 14:18:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAFdc9D9mbpJmu=3U3V5wCj-uOCsjMGa5KZS4Zk=aWQduwRjsgA@mail.gmail.com>
In-Reply-To: <CAFdc9D9mbpJmu=3U3V5wCj-uOCsjMGa5KZS4Zk=aWQduwRjsgA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 6 Sep 2019 15:18:26 -0600
X-Gmail-Original-Message-ID: <CAHmME9rqd8VqJiT3xJTba6N9ngaeM9MVqP98f54dU1CtGFfwHA@mail.gmail.com>
Message-ID: <CAHmME9rqd8VqJiT3xJTba6N9ngaeM9MVqP98f54dU1CtGFfwHA@mail.gmail.com>
Subject: Re: Problems on linux-image-4.15.0-1047-aws
To: Johnny Rose Carlsen <jrcarlsen@gmail.com>
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

Hi again,

It sounds like this has already been fixed:
https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1842447 And a
kernel is available in some "proposed" tree. However, it isn't yet
available to the general population because their kernel team doesn't
want to release on a Friday or something. Notably this also causes
Docker users to crash, so it's not just us.

I'm not sure what to recommend. There's not a super clear workaround
from a WireGuard perspective, but maybe some disgusting and totally
untested hack like this sort of maybe works?
https://xn--4db.cc/hh05UCL3

If not, then you might just consider using the last-working kernel
instead, and hope that next week Ubuntu gets their stuff settled.

Alternatively you could stop using Ubuntu.

Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
