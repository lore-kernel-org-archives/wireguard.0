Return-Path: <SRS0=JaX8=BG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61E3AC433E3
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 27 Jul 2020 15:52:09 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AD0D20672
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 27 Jul 2020 15:52:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="hWnmC8bF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0AD0D20672
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1356e933;
	Mon, 27 Jul 2020 15:28:33 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 43f7dba0
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Jul 2020 15:28:29 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f688f726
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Jul 2020 15:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type:content-transfer-encoding; s=mail; bh=JZP6V/1kgO63
 oLR2KRwAjJA2Zm4=; b=hWnmC8bFtDZNXlMgIhrW3V1OgI7gqmh0lSjcVuj7g3PY
 kQq0tQP3epy2NgmebTcsCTVHSltuQxjBl4tKYG2+SRI6THC8OWj0K/FWAFvmTgI7
 vOosIyfP1Fndd0XuU8KWreAnAmTZRCcoZgX3FQZVlCZWZh7vOswlx3/1TMdNmAyy
 L4jFA71d0WmaixPN06KQmClbME7Ue1OKdzGT/NXS87hG4cs0KqwKaJFCyNCGcWHL
 zmfVkY9j5+dnn77WuweJ87cjfZTQBROzkIF59rSp1TyLgyyWMyF3FOtvOjdEFW1X
 SY1ZVNFPZWxD7M/hT3Cf+6EZVWrjtk0juSizF9icQg==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6924c150
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Jul 2020 15:28:29 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id d18so17491308ion.0
 for <wireguard@lists.zx2c4.com>; Mon, 27 Jul 2020 08:51:49 -0700 (PDT)
X-Gm-Message-State: AOAM530DcigRjALMbdFutOYmEWjNn6ILQqsDrr9+8bnxi6tnvlEbU80U
 IxeXfnnVD1f9z2LGDw5TXvrNyTOJ2KqsSQ2cgiQ=
X-Google-Smtp-Source: ABdhPJy17nVtJUO9IH8kL9vCvdOipEdJ54yv3fl3h7pNMUYy3/UGGbV5FJZOk94zG7kP8sdvW4CSs6RXWxrBgrE41ao=
X-Received: by 2002:a05:6638:250f:: with SMTP id
 v15mr4166447jat.75.1595865108618; 
 Mon, 27 Jul 2020 08:51:48 -0700 (PDT)
MIME-Version: 1.0
References: <VI1PR02MB52169D6F055314DCD03746EDE6760@VI1PR02MB5216.eurprd02.prod.outlook.com>
 <865B9BD5-A256-43F8-9922-A6DE7680C216@tomcsanyi.net>
 <CAHmME9qsfmK6_d4bDF1Oj4585_56Vtm+wCT+i-2PO=tXN3Jsfw@mail.gmail.com>
 <84986996953761e9d645b7ef583d3ffca689dfc5.camel@fud.no>
In-Reply-To: <84986996953761e9d645b7ef583d3ffca689dfc5.camel@fud.no>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 27 Jul 2020 17:51:37 +0200
X-Gmail-Original-Message-ID: <CAHmME9p+tVyEm_+ALbsCWhshrt5yR97enjBcuUdVhTAWTf-MwA@mail.gmail.com>
Message-ID: <CAHmME9p+tVyEm_+ALbsCWhshrt5yR97enjBcuUdVhTAWTf-MwA@mail.gmail.com>
Subject: Re: [PATCH] Adding support for reloading configuration via systemd
To: Tore Anderson <tore@fud.no>
Cc: "Tomcsanyi, Domonkos" <domi@tomcsanyi.net>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi Tore,

On Sat, Jul 25, 2020 at 2:16 PM Tore Anderson <tore@fud.no> wrote:
> I have no idea why my solution keeps being ignored (even after two
> gentle reminders), but perhaps third time's the charm?
>
> In any case, to quote myself from
> https://lists.zx2c4.com/pipermail/wireguard/2020-June/005585.html :
>
> =C2=ABFor what it is worth, I posted a patch that does exactly this back =
in
> March:
>
> https://lists.zx2c4.com/pipermail/wireguard/2020-March/005222.html
>
> Reviews or user tests would be greatly appreciated.
>
> You can also pull from https://github.com/toreanderson/wireguard-tools
> if you prefer. The commit in question is here:
>
> https://github.com/toreanderson/wireguard-tools/commit/8305a267ec4259206c=
0de7f1d3f9cfb8522a3223

But it doesn't sync Address=3D, DNS=3D, or any routing particulars. That
seems like a problem if it's to become a bona fide "reload" subcommand
of wg-quick, since it's not doing what it should be. On the other
hand, adding it to the systemd unit seems far enough away from core
code that we can kind of say, "eh, this sort of works," which might be
good enough. If even _that_ causes problems for users too, we'd have
to talk about removing it from the systemd unit. But hopefully it
stays under the radar and people don't have overly high expectations.

Jason
