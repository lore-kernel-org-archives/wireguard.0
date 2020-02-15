Return-Path: <SRS0=3Rrq=4D=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7D47C352A3
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 15 Feb 2020 19:53:41 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DA19206D6
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 15 Feb 2020 19:53:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="mvRQ6n3E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DA19206D6
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4c3befb5;
	Sat, 15 Feb 2020 19:51:23 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 76194f52
 for <wireguard@lists.zx2c4.com>;
 Sat, 15 Feb 2020 19:51:22 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 24981cce
 for <wireguard@lists.zx2c4.com>;
 Sat, 15 Feb 2020 19:51:22 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b6156f6c
 for <wireguard@lists.zx2c4.com>;
 Sat, 15 Feb 2020 19:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=ZiHTxDP8LGEWJLfHCQGYjlshjuw=; b=mvRQ6n
 3EpzQgbmHCrJ1R/G3SIVrTL82UbHXo3T1rLUr3/Wfinza4qg17ZxfmWwjmWUtOAl
 izBc1LXqMe8Ie8UVlDxYZzJFvkunK4f6s3m3Yker9UbIBVWZg5uzjLC+e7vllajm
 wjmmd/AycRN6g3TAWVm3swCGjLiu/11WugigXcCvCf4na98JWQ25k3HoKA0aP1zv
 m7RMq/0Wo5kwyGTxDgX9WnUa9Z9olYMEoYDRsPmwlsNy6kUOOv5wYLlmlTEgsdDu
 UVGYyoLHULqKclMYRxQDN7X0+7oObExkB5J/5YLAD2wM5/KemaA+ILGL4xbuOTOR
 h3M4sBp8XKfrWQ8w==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 45e8dacf
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 15 Feb 2020 19:51:20 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id z9so12439196oth.5
 for <wireguard@lists.zx2c4.com>; Sat, 15 Feb 2020 11:53:37 -0800 (PST)
X-Gm-Message-State: APjAAAUP14GCsHGNw9LhOkJVDWiwVX0BNaS+3+jqz5Ww6AkOuMAwu7qP
 BqjPeGAqbPzY4LHFUCquPV69ms65DaBHzRdU0r0=
X-Google-Smtp-Source: APXvYqw/Qux0DFiCMNN/bAvik6V3FFVLnX5fc95FTBRQw8rrwslh0to8+UTRLqjKXMBx7ystQf4DW7RH3X/G03GtHE8=
X-Received: by 2002:a9d:811:: with SMTP id 17mr7107837oty.369.1581796416459;
 Sat, 15 Feb 2020 11:53:36 -0800 (PST)
MIME-Version: 1.0
References: <20200213044921.8115-1-dev@sgregoratto.me>
 <20200215004556.11766-1-dev@sgregoratto.me>
In-Reply-To: <20200215004556.11766-1-dev@sgregoratto.me>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 15 Feb 2020 20:53:25 +0100
X-Gmail-Original-Message-ID: <CAHmME9pF8QvnOLzRkF0YeATj_AmXALc-eNtyjnrz3yQUvrxV0w@mail.gmail.com>
Message-ID: <CAHmME9pF8QvnOLzRkF0YeATj_AmXALc-eNtyjnrz3yQUvrxV0w@mail.gmail.com>
Subject: Re: [PATCH v2] Rewrite wg-quick.8 in mdoc
To: Stephen Gregoratto <dev@sgregoratto.me>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>, discuss@mandoc.bsd.lv
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

Hi Stephen,

Thanks for doing this. I appreciate it. I can manually diff the text
to the old one if you insist, but I'd really prefer to see either a
list of what text you changed or having the type setting and the text
change done in separate commits. Alternatively, if you refuse to do
that, I'll manually diff, but I'd rather not if you can remember what
you changed.

>  I'm working on simplifying the structure of wg.8 in addition to
> rewriting it, which will take some time.

If there are any changes to content, rather than just the typesetting,
please make this separate commits.

Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
