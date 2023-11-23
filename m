Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E154C61D85
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 23 Nov 2023 03:33:55 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7627f34c;
	Thu, 23 Nov 2023 03:33:54 +0000 (UTC)
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2a8e6420
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 23 Nov 2023 03:33:51 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2c887d1fb8fso5788981fa.0
 for <wireguard@lists.zx2c4.com>; Wed, 22 Nov 2023 19:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700710431; x=1701315231; darn=lists.zx2c4.com;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n2FqSJVvoMNsla7RHHhw4t0Q60HssDGH4yvmGUBFNb8=;
 b=JmaZDQz8axNeD+gJoFHuhMdsyo0EB0V8VoYQWTiuoQqu9ZOvWEJyfK+wTYiiQkJTcP
 twt1W6ZvDFPTUaVKKInHgR+KMxXStPKpc1kjodpsFGTo+XyaF9K4nOsj5vWKdmFqwrfU
 Pr66oLddC9ZxLQRDTed9/ALz20c6zY70sOX7/0Jts5TFdvF7pJZz0d4TrGftgZEj2kLT
 ++UonSBAMtCwOmvLrsOjQFhJOsArdTctJmFECXxBPlycFYr2fWKUhuRhEGieJ8ZnVpXm
 QZb5qA7lwlv8QMfQV4mMxv3jzzerwvtwsuZGTbiFa8FlVJEzloAwoxwc/I920RnqmVXr
 BvjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700710431; x=1701315231;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n2FqSJVvoMNsla7RHHhw4t0Q60HssDGH4yvmGUBFNb8=;
 b=es2Sgd0FoqRWkgufugz9WWyWQR5WI/OGHhDh3NTSrQWXWHoN8Do+SMgIUzFwbu7RNw
 zLmf73CwQPSX9lRfbANuSKKs+wvZVmw2fSwghazaL0hEhqlVbsVB6DMS0k7geltzq6Sq
 BAoFNfzkggwnPJc6tRnNKmk4MChYzx2hiky9/RonqOr+9w7B/oAc2/FwkHDw1oJtSdC4
 H6tug3kPbqjlROrcr6KhxaTBeQAgdoMl1Mr2gcMgdBKP6D7OvE1F9L1C70lJnn5Se18p
 dH93+ZQtbLAG0A0uoFP7++I/N/UKl6FmmKzGKLHGWiUjojxYNHH+oqamc2JMCT1hQu6K
 rM0Q==
X-Gm-Message-State: AOJu0Yy66D5eXGGyYCGA2s/sVNmJw5gGMouBXVpDmOX95zMKcegYWd5M
 2RIfoOmPrrf5xnqebnYo7KIup50fdv0JP6arOTwBFF6lup0=
X-Google-Smtp-Source: AGHT+IH9E4O3GqKCjZiCVso3T8M/TX5x6THHNzwDhbWZJWrlDAhBJwX8QM0H8F/huud0+XISYVwjaMqls+uVKR35fy8=
X-Received: by 2002:a2e:b990:0:b0:2c7:fa5:6db9 with SMTP id
 p16-20020a2eb990000000b002c70fa56db9mr2722284ljp.48.1700710430874; Wed, 22
 Nov 2023 19:33:50 -0800 (PST)
MIME-Version: 1.0
References: <20231029192210.120316-1-tomxor@gmail.com>
 <20231120011701.asllvpzuffih34wz@House.clients.dxld.at>
In-Reply-To: <20231120011701.asllvpzuffih34wz@House.clients.dxld.at>
From: Thomas Brierley <tomxor@gmail.com>
Date: Thu, 23 Nov 2023 03:33:39 +0000
Message-ID: <CAHTdPdd0o-w27DuaRk9C4chP=nCNEE=J3oJDUaB0+zsv91yGNQ@mail.gmail.com>
Subject: Re: [PATCH] wg-quick: linux: fix MTU calculation (use PMTUD)
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

Hi Daniel

Thanks for having a look at this.

On Mon, 20 Nov 2023 at 01:17, Daniel Gr=C3=B6ber <dxld@darkboxed.org> wrote=
:

> > because this only queries the routing cache.  To
> > trigger PMTUD on the endpoint and fill this cache, it is necessary to
> > send an ICMP with the DF bit set.
>
> I don't think this is useful. Path MTU may change, doing this only once
> when the interface comes up just makes wg-quick less predictable IMO.

Yes, I understand PMTU may change, usually when changing internet
connection. There is also the issue of bringing up an interface without
a connection, such as when using the wg-quick startup service.
Accommodating dynamic PMTU is probably out of scope of the wg-quick
script, but is something I would like to look into separately.

I still think it would be beneficial to set the MTU optimally if only
upon bringing an interface up, because PMTU is usually stable for a
particular gateway and having this built in makes it far easier for
users to automatically obtain the appropriate MTU. I think it also more
accurately reflects the man page which suggests automatic discovery.

> > 2. Consider IPv6/4 Header Size
> >
> > Currently an 80 byte header size is assumed i.e. IPv6=3D40 + WireGuard=
=3D40.
> > However this is not optimal in the case of IPv4. Since determining the
> > IP header size is required for PMTUD anyway, this is now optimised as a
> > side effect of endpoint MTU calculation.
>
> This is not a good idea. Consider what happens when a peer roams from an
> IPv4 to a IPv6 endpoint address. It's better to be conservative and assum=
e
> IPv6 sized overhead, besides IPv4 is legacy anyway ;)

MTU calculation is performed independently for each endpoint, with
separate header size calculation accommodating both IPv4 and IPv6
addresses along side each other. The smallest MTU of all endpoints is
used, so switching from an IPv4 to an IPv6 endpoint should not result in
an MTU which is too large due to IP header size differences.

In my case the current behaviour is not conservative enough, but due to
absence of PMTUD rather than assumed IP header sizes.

> > 3. Use Smallest Endpoint MTU
> >
> > Currently in the case of multiple endpoints the largest endpoint path
> > MTU is used. However WireGuard will dynamically switch between endpoint=
s
> > when e.g. one fails, so the smallest MTU is now used to ensure all
> > endpoints will function correctly.
>
> "function correctly". Do note that WireGuard lets it's UDP packets be
> fragmented. So connectivity will still work even when the wg device MTU
> doesn't match the (current) PMTU. The only downsides to this mismatch bei=
ng
> performance:
>
>  - additional header overhead for fragments,
>  - less than half max packets-per-second performance and
>  - additional lateny for tunnel packets hit by IPv6 PMTU discovery
>
>    I was surprised to learn that this would happen periodically, every ti=
me
>    the PMTU cache expires. Seems inherent in the IPv6 design as there's n=
o
>    way (AFAICT) for the kernel to validate the PMTU before the cache
>    expires (like is done for NDP for example).

So, the reason I ended up tinkering with WireGuard MTU is due to real
world reliability issues. Although the risk in setting it optimally
based on PMTU remains unclear to me, marginal performance gains are not
what brought me here. Networking is not my area of expertise, so the
best I can do is lay out my experience and see if you think it adds any
weight in favour of this change in behaviour, because I haven't done a
full root cause analysis:

I found that browsing the web over WireGuard with an MTU set larger than
the PMTU resulted in randomly stalled HTTP requests. This is noticeable
even with a single stalled HTTP request due to the HTTP 1.1 head of line
blocking issue. I tested this manually with individual HTTP requests
with a large enough payload, verifying that it only occurs over
WireGuard connections.

With naked HTTP/TCP the network seems happy, I assume it is fragmenting
packets; but over WireGuard, somehow, some packets just seem to get
dropped. Maybe UDP is getting treated differently, or maybe what's
actually happening is the network is blackholing in both cases but PMTUD
is figuring this out in the case of TCP (RFC 2923), and maybe that stops
working when encapsulated in UDP?...  But this is pure speculation, I'm
out of my depth here, and haven't dug any deeper.

This behaviour is probably network operator dependent, or specific to
LTE networks, which I use for permanent internet access, and which
commonly use a lower than average MTU. For example my current ISP uses
1380, and the current wg-quick behaviour is to set the MTU to the
default route interface MTU less 80 bytes (1420 for regular interfaces),
which results in the above behaviour.

I've used all four of the major mobile network operators in my country
and experienced this on two of them (separate physical networks, not
virtual operators). The other two used an MTU of 1500 anyway.

Just to prove I'm not entirely on my own, this issue also appears to be
known to WireGuard VPN providers, .e.g from Mullvad's FAQ:

> The default MTU (maximum transmission unit) for WireGuard in the Mullvad
> app is 1380. You can set it to 1280 if the WireGuard connection stops
> working. This may be necessary in some mobile networks.

I suppose it could be argued this is not a WireGuard concern, mobile
networks are behaving weirdly. Also IME it's not entirely unreliable
above the optimal MTU, it's just *less* reliable.

I had not anticipated such a patch would have any down sides, I saw this
as a general deficiency - Although I appreciate, as you pointed out, it
is not a 100% complete solution.

I'm interested more in what your concerns are and what you think of the
above, but will move along if you still think it's not suitable.

Cheers

Tom
