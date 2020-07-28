Return-Path: <SRS0=JBbb=BH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8BF8C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 28 Jul 2020 11:56:04 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 149A9206F5
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 28 Jul 2020 11:56:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="I5mLy0kj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 149A9206F5
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 55f4496e;
	Tue, 28 Jul 2020 11:32:25 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 741f1a00
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Jul 2020 11:32:22 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5f63098b
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Jul 2020 11:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type:content-transfer-encoding; s=mail; bh=1Vxe1OoLihkL
 xupN26QKfuozDSs=; b=I5mLy0kjRykcbs6pKqryX89taTU/oljs8Cd7n/hL4DSs
 3ouZ0xmnsLURHf7mQ1eFI74cy/toHrAb1xASGjWIqQYBb7UgfrELhkr0TXUYGnX1
 8kZynNdHzFQzzzfhS0S+NB2HuLL3lxbg0sxc+0Y1vmi8sOXAYyX7dDHOt6Gqx8lT
 HcZ14Ctz2y04mk2NXxzAhviz1YXu+LWAYTP9KHMgSVyup/tOPOU4GQ+v5qsTQtZW
 Uz3aMOigbOgd5BUkZH5McHC+p8G/7MxUTtN33CIdvPxKBlnqdu+hMOPL+KAKz7GF
 YASXviT5kYEh2MXnAr7KcYL3hHBZ/b99dgbOwGO2mA==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9a3a647c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Jul 2020 11:32:22 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id b18so10687251ilo.12
 for <wireguard@lists.zx2c4.com>; Tue, 28 Jul 2020 04:55:48 -0700 (PDT)
X-Gm-Message-State: AOAM532P/uLHJnUmm6oTihh05IgiuCrN6KleA2OnxFCeN7hRv8Xwu1ZX
 i++19dDK3S0xaKwdLnCQ8wUmZA/ESkBsg5U39/Q=
X-Google-Smtp-Source: ABdhPJyMFjCso4QzVa6oQu21hMHFVmX/CfhaBvkOiO75UUzkS9oGOpcQxxz8tS04XrZnXEG6rPBBFrvQ+aDGRgKCy+Y=
X-Received: by 2002:a92:d24a:: with SMTP id v10mr29176317ilg.224.1595937347854; 
 Tue, 28 Jul 2020 04:55:47 -0700 (PDT)
MIME-Version: 1.0
References: <VI1PR02MB52169D6F055314DCD03746EDE6760@VI1PR02MB5216.eurprd02.prod.outlook.com>
 <865B9BD5-A256-43F8-9922-A6DE7680C216@tomcsanyi.net>
 <CAHmME9qsfmK6_d4bDF1Oj4585_56Vtm+wCT+i-2PO=tXN3Jsfw@mail.gmail.com>
 <84986996953761e9d645b7ef583d3ffca689dfc5.camel@fud.no>
 <CAHmME9p+tVyEm_+ALbsCWhshrt5yR97enjBcuUdVhTAWTf-MwA@mail.gmail.com>
 <27652e0971672a8fab30f59ff053cf65feaa711f.camel@fud.no>
 <CAHmME9qGX58JXCiw=Mr9=4qw=+-91etz8not91oJek-8qGrQPw@mail.gmail.com>
 <48a85c212bffaf7004c4934b1da5c4b02674a54c.camel@fud.no>
In-Reply-To: <48a85c212bffaf7004c4934b1da5c4b02674a54c.camel@fud.no>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 28 Jul 2020 13:55:36 +0200
X-Gmail-Original-Message-ID: <CAHmME9q2NFc9QbKW068jHc=o79m4N5pj6Xvjfw51VSfnsKU=3Q@mail.gmail.com>
Message-ID: <CAHmME9q2NFc9QbKW068jHc=o79m4N5pj6Xvjfw51VSfnsKU=3Q@mail.gmail.com>
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

On Tue, Jul 28, 2020 at 11:54 AM Tore Anderson <tore@fud.no> wrote:
>
> * Jason A. Donenfeld
>
> > On Mon, Jul 27, 2020 at 10:04 PM Tore Anderson <tore@fud.no> wrote:
> > > Absolutely, a 'wg syncconf' wrapper is unable to fully implement ever=
y
> > > conceivable change to the wg-quick config file. That said, 99.9% of m=
y
> > > configuration changes are additions/removal of [Peer] sections that '=
wg
> > > syncconf' do handle perfectly. Being able to add and remove individua=
l
> > > VPN users without disrupting the traffic of other unrelated users is =
a
> > > really big win for me. I would imagine this to ability be highly
> > > desirable for most other VPN server operators as well =E2=80=93 even =
for those
> > > that do not use systemd.
> >
> > But for people shell scripting, can't they just use `wg syncconf
> > wgnet0 <(wg-quick strip wgnet0)`, so that it's explicit what's
> > happening?
>
> Of course they can, just as they can opt to not use wg-quick at all.
>
> However, it would be better, in my opinion, if every user do not have
> to re-invent the wheel in order to accomplish common tasks, which (I
> assume) is the reason why wg-quick =E2=80=93 =C2=ABan extremely simple sc=
ript for
> easily bringing up a WireGuard interface, suitable for a few common use
> cases=C2=BB, to quote its manual page =E2=80=93 exists in the first place=
.
>
> > I'm still pretty hesitant for the reasons I outlined in the previous
> > email. If anything, it'd probably have to be "syncpeers", but even
> > then, it wouldn't update the routing information that wg-quick(8)
> > sometimes does.
>
> Fair enough. If you do not want it in wg-quick, I won't insist.
>
> > The right thing to do for a `wg-quick reload` command
> > would be to take into account all of the various other changes, and
> > mutate them the minimal distance to reflect the updated config file.
> > But this sounds pretty hard to do in bash. And that makes me worry
> > about overall mission creep in wg-quick(8). syncconf in wg(8) is
> > fairly simple, though still a bit verbose, but that's in C:
> > https://git.zx2c4.com/wireguard-tools/tree/src/setconf.c#n30 . And
> > there's a very clear way of doing this, whereas there are lots of
> > weird edge cases when handling routing.
>
> Agreed, this sounds very complex and not worth the trouble.
>
> That said, I do believe that most admins would not be bothered by the
> fact that some changes would require a restart (i.e., an wg-quick
> up/down cycle). This limitation is common in other pieces of software
> too, e.g., one can normally not use 'apachectl graceful' to make Apache
> listen on a new port below 1024. However, in spite of it not being
> perfect, 'apachectl graceful' remains extremely useful.
>
> > Plus, how hard is it to add `wg syncconf wgnet0 <(wg-quick strip
> > wgnet0)` to scripts?
>
> Not hard - it is precisely what my patch did, after all.

By the way, I just made this change:
https://git.zx2c4.com/wireguard-tools/commit/?id=3D37ed947239f4b3ef161c8542=
8d9267eb23a69d69
I had assumed it was syncconf all along, until I checked. That makes
sense; Luis added `strip` before I added `syncconf`.

Jason
