Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BDB4EE49A3
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 19 Aug 2023 16:34:40 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 23f109d8;
	Sat, 19 Aug 2023 16:34:39 +0000 (UTC)
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e3340c5f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 19 Aug 2023 16:34:37 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-99bcfe28909so237917566b.3
 for <wireguard@lists.zx2c4.com>; Sat, 19 Aug 2023 09:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692462877; x=1693067677;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f4lUELHBz8BiV/0AWADGFIdHnjgFgNTLWWf9J5jaksE=;
 b=BB8G5XUC5XHyW0K6pIjspmOuKqy+gs5PtLm08Ni5a9esbMTenICb6sHAbX3kLGaPGX
 d3fUbeTgI0ullbtKmP1zMqtzBVQwBS4WqJEKtP4ufa/6mPMGlyCJeOOo0PzD35kWdICe
 hIhFQ/LvDKKkcQSS8VpsA+glTZhY/kVPx2ebMc7ScFct68UPrYTSF06byp0jsiIrfi3Q
 Ys+AhVsxSXM4kHkPgXdRY7L4cHSf1+oAgDyAmx+Gdz/ovlQUrs58ediramERw+rNzYV/
 kTzH8iNwpViY10vhTCPzynJySiIc53HFAA8R71X0jGlwIHSYUyLLgRPuCsf6F3yslHGy
 C0FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692462877; x=1693067677;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f4lUELHBz8BiV/0AWADGFIdHnjgFgNTLWWf9J5jaksE=;
 b=TyDEKJtGEj9aEFOHtdUwFo24C75B8PkNFJsN/2zEMWJYK9sKpHN07l9pNQfd02NJ+F
 0TyrKnO1SM9loU9GLaQHTSdqxxMYm1Uhrmft5T+8zpMD2jZCi9mc8YNPx1QAllblGXlP
 z4CDhNFqzY26Quw3N8Knbnkwx9WHrBxSUT1CTNeiMOjU1nFshZCZNjK82tC0Qv4ZfBQZ
 vweURKKH8/zTRpkOKNP5MEzslHfXIUHr6nvAq17GpTwS8w2GaIj0u83Cf/f6LZGFEi5u
 qtYBny7tggbPzktnQjYluF8pL3Zt6SKtNforUtoLeHI54hyWbnNdEfAbP3YY51kmTJHz
 fRAw==
X-Gm-Message-State: AOJu0Ywqmb5J1B2LrdckiBIDdV2DZj+fwm9bTtRCH0CDe5zxiLbD3bry
 m6DBwLyopXQcGeXr2NCdXwQJFEMxO58TMMdjSKrOl/Pitx5zgg==
X-Google-Smtp-Source: AGHT+IEW94Ot9SpHzlptEeoOVjLdF1+MBL2fVCpVI8H8qknNg6823cwQyLfPiLXHOiIpwOpx85FzcF0qQ8YXgwgNMcc=
X-Received: by 2002:a17:906:2929:b0:99e:bb:e1b5 with SMTP id
 v9-20020a170906292900b0099e00bbe1b5mr1711087ejd.24.1692462876273; Sat, 19 Aug
 2023 09:34:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAKsvP2ZcqUvFD5g6vMxZrv7Z5+YAmoGBAh7zf8iZPPRE6LNEDg@mail.gmail.com>
 <20230819072245.bj7giu7lk4zqib2h@House.clients.dxld.at>
In-Reply-To: <20230819072245.bj7giu7lk4zqib2h@House.clients.dxld.at>
From: Nathaniel Filardo <nwfilardo@gmail.com>
Date: Sat, 19 Aug 2023 17:34:00 +0100
Message-ID: <CAKsvP2Zo-P1Z3VeF9KC+cwgE99Y0as9C--0a+vKyPRCb95Bp4Q@mail.gmail.com>
Subject: Re: IPv6-only flag set on v6 sockets prevents the use of v4-mapped
 addresses
To: =?UTF-8?Q?Daniel_Gr=C3=B6ber?= <dxld@darkboxed.org>
Cc: wireguard@lists.zx2c4.com
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

Hi Daniel,

DNS absolutely can and does store and return those addresses; look at
mapped46.test.ietfng.org for an example (AAAA ::ffff:1.2.3.4).
In my use case they arise because I have scripts that take wireguard
peer addresses and register them with my DNS service provider, and
it's simpler to update a single AAAA record per peer regardless of
address family than it is to switch between having an AAAA and A
record for the name.

At the very least, the radio silence after the kernel accepts a
v4-mapped v6 address is unexpected behavior.
More generally, I don't see what good setting the v6only flag here is
doing (in fact, that's true in general; there are very few
circumstances, and most of those are for *listening* sockets, where
v6only seems remotely sensible; the v4 to v6 migration is such a
mess), so "the established wg behavior" makes no sense to me.
(It's also plausibly true that I'm the first to *notice* this aspect
of the established behavior!)

In any case, in decreasing order of preference, I'd suggest:
1. Drop the v6only flag on peer sockets and allow the kernel speak to
v4-mapped v6 addresses.
2. I missed something and v6only does serve a purpose; add special
handling for v4-mapped v6 addresses to the wg kernel interface,
bending them into v4 sockaddrs internally.
3. For some reason 2 isn't acceptable either, so add special handling
to the wg userspace tools and do the transmogrification there.
4. For some reason none of that is tolerable, so have the kernel
reject v4-mapped v6 addresses rather than silently accept them and
fail to speak.

Cheers,
--nwf;

On Sat, Aug 19, 2023 at 8:22=E2=80=AFAM Daniel Gr=C3=B6ber <dxld@darkboxed.=
org> wrote:
>
> Hi Nathaniel,
>
> On Mon, May 22, 2023 at 07:48:04AM +0100, Nathaniel Filardo wrote:
> > This means that v4-mapped v6 addresses (::ffff:a.b.c.d) can be
> > registered as peer endpoints, but the kernel very silently won't try
> > to reach out.  Is that deliberate for some reason that eludes me?  If
> > it is, could the userspace tooling be educated about v4-mapped
> > addresses and translate them accordingly before handing them up to the
> > kernel; if it isn't, could we drop the v6-only flag on the kernel
> > socket?
>
> Since I recently sent some patches touching the socket binding code I'm
> worndering what the exact use case is here? DNS will never return these
> addressess, I've only ever seen them used (internally to programs) when t=
he
> kernel returns them in non-v6only sockets. Is there some other context
> these get returned in I'm missing?
>
> I considered dropping the v6only flag for the new bind-to-address code pa=
th
> I introduced but couldn't convince myself that there really is a good
> reason to deviate from established wg behaviour here.
>
> --Daniel
