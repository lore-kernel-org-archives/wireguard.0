Return-Path: <SRS0=mwgs=BA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A673CC433E2
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 21 Jul 2020 13:50:53 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E3C120702
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 21 Jul 2020 13:50:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=acpr.dev header.i=@acpr.dev header.b="O0PGbRR1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E3C120702
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=acpr.dev
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 58a4f763;
	Tue, 21 Jul 2020 13:28:08 +0000 (UTC)
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com
 [2607:f8b0:4864:20::e29])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 515df018
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Jul 2020 13:28:06 +0000 (UTC)
Received: by mail-vs1-xe29.google.com with SMTP id q15so10412341vso.9
 for <wireguard@lists.zx2c4.com>; Tue, 21 Jul 2020 06:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acpr.dev; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kEEnLIeKz58Zj3Whjm5xd5Ez/LrFgKuojCSAS0tp5g0=;
 b=O0PGbRR1LVV+BwNeFST4F48T0Q0JZRmINeKqbmtztqky3roRFmwc5FwjuZ7JGTn0hf
 RP3BpFIzIEORnHqArS+/1OiJlT71qBkI+76E3s44v/ycLBZOeBICFl5ihZFpJLFYcxRb
 rx5uNrbpsjBSlntzqvEQvChCK7di4ylYaajyFTqHAs0vzpoEvh5N0ZDJ/BDp+82tQtMA
 CVFov7UFz3HqrYWMSVBOHRvn8xEmENRxC2Q5rVDxVRUkYT2pzGXvSk+e/3WvIsy+MBWR
 p/hwry4cVaLec9t7MWoRGHJQrgl8mNX9vGA2jlQVUhuVmjyeLk24veTp9o1uEMnKBUWx
 9cRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kEEnLIeKz58Zj3Whjm5xd5Ez/LrFgKuojCSAS0tp5g0=;
 b=JOCVvMtAnmWsVjOydtyEPAFejqwvPYs82WpEU54zJTsFKKPOCe4ju14g6GlSz3k0aK
 eFhl8RnhKf7bLugTPHHkW5QENSbJtpczzrojv0J8c74fdWM19HtqNsjlYz04g/vEJk6z
 BC4Pm7dN8P5/g8o5Ga9zaowtABuzKz3w7jnMGGuDPPybL7qe3Z74A3zws7k3wmvbslNn
 Wd1OPocOL9ehYtDAWNScdxD2lqouxm+nVJl5kmG1cIC9A0WVO78QbyTyn+lVMcIcN4cN
 tCSwVEjG3EYg+mUQVscJjvytowbPRsHGYUcNxaQMDG2MhBrnWV34EWvwYQLWgpuVThA5
 Rr2w==
X-Gm-Message-State: AOAM533ID8ThXicx3hYqrPYG+dzRjpA+AZekbzQghxATFVifblUizhFu
 EUXVuiPYL88h3ZtuFEC4H1gbxaH3ri288qIYbCsr+g==
X-Google-Smtp-Source: ABdhPJzT4u0ih+yFY2Sz4VhTM+GyaPZHuq6c7FaT3h2TaIKF1U/WDhuLrlSNoW2x4c4cBZGCRFCuszwq7T7tAGJfqVs=
X-Received: by 2002:a67:f696:: with SMTP id n22mr20811481vso.169.1595339438016; 
 Tue, 21 Jul 2020 06:50:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAN00TTomuZoagZF2McBkDW1ZimSouN-jnDLm+Hq7OKeH-sF9zg@mail.gmail.com>
 <165a92238115e99b03740768d843a20f@cagir.me>
 <CAN00TTpNmGNuZcHc4aSRHaG26BmqbsdVLL4hYuArk+9RX3oVSQ@mail.gmail.com>
In-Reply-To: <CAN00TTpNmGNuZcHc4aSRHaG26BmqbsdVLL4hYuArk+9RX3oVSQ@mail.gmail.com>
From: Adam Cooper <adam@acpr.dev>
Date: Tue, 21 Jul 2020 14:50:27 +0100
Message-ID: <CAN00TTrd4qMEVJd0nhQKoGr8E4UQC74sxyUGbAkFQpFeHkga7A@mail.gmail.com>
Subject: Re: MacOS IPv6 not functioning without custom static route
To: =?UTF-8?B?SGFzYW4gQmVya2F5IMOHYcSfxLFy?= <berkay@cagir.me>
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

As an additional datapoint it looks like if I remove '::/0' at all
(either replaced with the ::/1 8000:/1 rules or just removed outright)
I appear to lose outbound traffic UNLESS I'm allowing 0.0.0.0/0. Which
doesn't make much sense as one is an IPv4 rule and the other isn't.
This is what it currently look like (pseudocode for brevity)

$IPV4_IPS =3D 0.0.0.0/5, 8.0.0.0/7, 11.0.0.0/8, 12.0.0.0/6, 16.0.0.0/4,
32.0.0.0/3, 64.0.0.0/2, 128.0.0.0/3, 160.0.0.0/5, 168.0.0.0/6,
172.0.0.0/12, 172.32.0.0/11, 172.64.0.0/10, 172.128.0.0/9,
173.0.0.0/8, 174.0.0.0/7, 176.0.0.0/4, 192.0.0.0/9, 192.128.0.0/11,
192.160.0.0/13, 192.169.0.0/16, 192.170.0.0/15, 192.172.0.0/14,
192.176.0.0/12, 192.192.0.0/10, 193.0.0.0/8, 194.0.0.0/7, 196.0.0.0/6,
200.0.0.0/5, 208.0.0.0/4

AllowedIPs =3D $IPV4_IPS, ::/0, fd82:88::1/128 -- IPv4 WORKS, IPv6 ONLY
ROUTES fd82:88::1
AllowedIPs =3D $IPV4_IPS, fd82:88::1/128 -- IPv4 AND IPv6 DO NOT WORK
AllowedIPs =3D $IPV4_IPS, ::/1, 8000::/1, fd82:88::1/128 --  IPv4 AND
IPv6 DO NOT WORK
AllowedIPs =3D 0.0.0.0/0, ::/1, 8000::/1 --  IPv4 AND IPv6 WORK

On Tue, 21 Jul 2020 at 14:29, Adam Cooper <adam@acpr.dev> wrote:
>
> Mmm. It looks like unticking "Exclude Private IPs" and entering
> "0.0.0.0/0, ::/1, 8000::/1" gives me a functional setup. Trouble is I
> don't want to route the private IPs and ticking the box (whilst
> retaining '::/1, 8000::/1') allows no traffic at all. There's
> something odd about the way the client is configuring routes but I've
> not got the expertise to figure it out :(
>
> On Tue, 21 Jul 2020 at 14:12, Hasan Berkay =C3=87a=C4=9F=C4=B1r <berkay@c=
agir.me> wrote:
> >
> > On 15/07/2020 14:14, Adam Cooper wrote:
> > > ...
> > > Probably worth mentioning that I tried to replace ::/0 with ::/1,
> > > 8000::/1 but that just results in completely broken connectivity in
> > > IPv6 and IPv4 - which may be another issue in and of itself.
> >
> > Did you try only having "::/1, 8000::/1" in the AllowedIPs option? I ha=
d
> > a default route creation issue myself where I'm only trying to tunnel
> > IPv6 through; and having this actually solved it.
> >
> > $ netstat -nr
> > Routing tables
> > Internet:
> > ...
> > Internet6:
> > Destination                             Gateway
> > Flags         Netif Expire
> > ::/1                                    link#14
> > UCS           utun2
> > default                                 fe80::%utun0
> > UGcI          utun0
> > default                                 fe80::%utun1
> > UGcI          utun1
> > default                                 fe80::%utun3
> > UGcI          utun3
> > default                                 [ public IPv6 ]
> > UGcI          utun2
> >
> > If just "::/1, 8000::/1" solves the IPv6 issue, I guess you can give it
> > a try with "0.0.0.0/0, ::/1, 8000::/1" to see if both routes are create=
d
> > properly?
> >
> > Best,
> > Berkay
