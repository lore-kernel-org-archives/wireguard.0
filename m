Return-Path: <SRS0=k94t=R4=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ACE6C43381
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 25 Mar 2019 10:37:36 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D873D2064A
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 25 Mar 2019 10:37:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="JW6NFX/w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D873D2064A
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d935508f;
	Mon, 25 Mar 2019 10:36:38 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3c182571
 for <wireguard@lists.zx2c4.com>;
 Mon, 25 Mar 2019 10:36:37 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id da6f81d4
 for <wireguard@lists.zx2c4.com>;
 Mon, 25 Mar 2019 10:36:37 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 97f0cf7b
 for <wireguard@lists.zx2c4.com>;
 Mon, 25 Mar 2019 10:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=x3lOMNFu4ir9NVF6Vlti3ZD4l3c=; b=JW6NFX
 /w6iq0vkjU9lgb6E/LM/VXo/cewhrmTnehfz1HCc2CKGxiw4e8NlCD6d3OtzKB/x
 oyE14M4DZs4Q6XEB3CgmI4PwjVoHdaQbXBmL1AtRwR0C8QL+Yr31fhLOLNjD/gjg
 n2U8SZaj1Zdbght9rQG9Rde70/vVYY/9ilBNjR6a2ZEcbrhCT5VByljp7ac8h5Vw
 lOb9vKVyjIpO0nwgZUO2wFI/Xl53NvbqoRCYTRaEBfYc0KDp7CFpwYmeEzOk6DOL
 0xDGFqReu7CM2HlOTiYoCOauI9Qz+Cjk3u7RZ0PlM9zTGfiwB6kcprI6QRJ8sadT
 lsdFXO4uYVuNcOnQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 8687b32c
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 25 Mar 2019 10:15:24 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id f10so7529978otb.6
 for <wireguard@lists.zx2c4.com>; Mon, 25 Mar 2019 03:37:31 -0700 (PDT)
X-Gm-Message-State: APjAAAU96PJY3FvlmFwkqu8Pfc6uEwacb0cjEVEMm3ERU1szzbij6I/l
 aTPAJLm9QhvFZvxLRekwhZp/YCBdvvS48bRK+fY=
X-Google-Smtp-Source: APXvYqzC97cy9HpyHty9/aROSYoZFlvwdD9nUodfu/Z6pL4J3nnv/1rR7pTP5nQUv//p7YTsJ63j5cKcV7FlkHPqTWk=
X-Received: by 2002:a9d:62c8:: with SMTP id z8mr16933802otk.144.1553510250874; 
 Mon, 25 Mar 2019 03:37:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAHmME9r1VmJLSqrb8vQN3HOqeVX2QLs1-9wPYQL-UwNU6EJNLA@mail.gmail.com>
 <0fe186bb-7df2-e3c4-cccd-b3b624fbc1bf@rfc2549.org>
In-Reply-To: <0fe186bb-7df2-e3c4-cccd-b3b624fbc1bf@rfc2549.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 25 Mar 2019 11:37:19 +0100
X-Gmail-Original-Message-ID: <CAHmME9rMuAXh97168Cdhh3NYPvX_On_rmn3+3+9hzMuYGv9s1g@mail.gmail.com>
Message-ID: <CAHmME9rMuAXh97168Cdhh3NYPvX_On_rmn3+3+9hzMuYGv9s1g@mail.gmail.com>
Subject: Re: [Openvpn-devel] [ANNOUNCE] Wintun: Layer 3 TUN Driver for Windows
To: Arne Schwabe <arne@rfc2549.org>
Cc: dev@nmap.org, openvpn-devel@lists.sourceforge.net,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Hey Arne,

On Mon, Mar 25, 2019 at 11:23 AM Arne Schwabe <arne@rfc2549.org> wrote:
> I wish you good luck in this endeavour and welcome the prospect of
> having a better tun driver for Windows. We know that our own TAP/TUN
> driver is a pain point for us as well and having a better alternative is
> something we would definitively like to have/support a more modern driver.
> The lack of tap is not a big deal for OpenVPN anymore. The world shifted
> quite a bit and tap support is not needed that much anymore. Android
> does not support it. MacOS client supports tun natively (utun) and tap
> requires extra kext. And so on...

That's good to know. I wasn't aware that that perspective was there
for OpenVPN as well. It certainly makes things simpler. In that case,
I'll certainly try to continue to keep OpenVPN in mind when developing
this. And depending on everybody's time availability, maybe at some
point we could work together in adding experimental support for Wintun
in OpenVPN.

> I am afraid our project members are currently busy and cannot really
> contribute much to your new shiny driver. We barely have enough time for
> OpenVPN itself. But if you have something that is good enough at least
> for testing and has a reasonable stable API just an extra mail and I
> think we can implement it as alternative to our own driver.

Great. I'll send a follow-up when we're at that point. At the moment
we're working out some details with IO_CSQ, and then we'll try to put
together some half-decent API documentation to make this easy. Then,
I'll poke you and we can get rolling with this.

> Frome the site: The source code is provided under the GPL 2.0 and is
> available via git:
>
> One detail here. If you have/add a file that defines the API for
> external programs, to license it under a freeer license for 3rd party to
> include that API file without license worries. Like our tap-windows.h
> (https://github.com/OpenVPN/tap-windows6/blob/master/src/tap-windows.h).
> This was primarily requested by the Freeswan developer iirc.

That's a good point. I'll certainly do something like that. Or,
possibly I'll just relicense the whole driver to MIT so nobody has to
worry. Will give it some thought.

Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
