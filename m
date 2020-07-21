Return-Path: <SRS0=mwgs=BA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A3F6C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 21 Jul 2020 13:58:18 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35753204EA
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 21 Jul 2020 13:58:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=acpr.dev header.i=@acpr.dev header.b="UVRW6Hy7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35753204EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=acpr.dev
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7284fa44;
	Tue, 21 Jul 2020 13:35:45 +0000 (UTC)
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com
 [2607:f8b0:4864:20::92e])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 419f5f3f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Jul 2020 13:35:43 +0000 (UTC)
Received: by mail-ua1-x92e.google.com with SMTP id j21so6230395ual.11
 for <wireguard@lists.zx2c4.com>; Tue, 21 Jul 2020 06:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acpr.dev; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=w1s2QSr7bMODTN+zGBLQLbO/nFCn3ZWAJOpu+A8XtA0=;
 b=UVRW6Hy7WWxlQCj06RXXeJinkGEJ5MtC+fN65Tq332odX1gOPughabwxqcbsMB0g5C
 TW0nIvAZiAhgDGQh8cZgWlXiEVdpwHUFH7z7KdPzmJRnUPVXRRlVHpdR6AhsT41a5Eed
 gHp2z2wHSeHnzKPcrnAXjMNR7QjK7v33048UzXwSyJ8hD40IITWQRFD0oB4Hf+DoDtOn
 hwxnXkAEZkNMjhCokUjFP4P4sLYvkZtR6BM0+0ylX9s5VhP5fhQwOn/79tsp9hieVHTL
 5iPrsgxgBWS7ZSKz9C8SZpa7U7FwJ9ZuHYv4LxiKI7rY/7Fw4l/jCVgwjjiZ1HGQ7R7W
 z/5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=w1s2QSr7bMODTN+zGBLQLbO/nFCn3ZWAJOpu+A8XtA0=;
 b=TKmxtBIUlKXM1Bp2Sw8wfcT/lTHGrYhJHRaEjPXDjnDnwTr2SZhSNWJEKhlQZzgeDG
 vvukb2Rl+bFLyvoPU6UcywkLT4BkYs8e3QKJ7ubsZncmEh6m3L/T2Hj5+1l9ZNqt+VHx
 UieXAi1RnkL/ih5kpWdMoqITXHmI2DyJkcXHYNxEg2aYsCf/b4odbll/HzxzuGNppTTu
 v4uFYwXafd8Fte3CkE7r7A7RCBvMRkovywjZ6ajtcmuMslnXki3pa25K17pUwSWee4iF
 Z/7OQbWfiQD9cHIRbb2xmHZQUOGIFEiOPCbWhfGaf/V0b5CRS0oGYpb/utUHbk15Y/0g
 JEnQ==
X-Gm-Message-State: AOAM533Yiubbnz6RTXIYYnaZXsiEtf67dvR/roEces1YJzhfAZrqeL1u
 2UlV+zUt80qNmCrvoldtauGT3x0C4y9o59ZFAwqtjg==
X-Google-Smtp-Source: ABdhPJxknwDrrvAl6BP1vwtmmrHiiZyiS98ktJZtnT57UrQOVobMCu1DDr08+nAPKkUUufBiBnNLztYbX73zIMlCRZE=
X-Received: by 2002:ab0:7811:: with SMTP id x17mr19564026uaq.140.1595339894776; 
 Tue, 21 Jul 2020 06:58:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAN00TTomuZoagZF2McBkDW1ZimSouN-jnDLm+Hq7OKeH-sF9zg@mail.gmail.com>
 <165a92238115e99b03740768d843a20f@cagir.me>
 <CAN00TTpNmGNuZcHc4aSRHaG26BmqbsdVLL4hYuArk+9RX3oVSQ@mail.gmail.com>
 <51bfa8c5-d433-d7db-ad42-026b9ced0478@cagir.me>
In-Reply-To: <51bfa8c5-d433-d7db-ad42-026b9ced0478@cagir.me>
From: Adam Cooper <adam@acpr.dev>
Date: Tue, 21 Jul 2020 14:58:03 +0100
Message-ID: <CAN00TTrDhy89dvyiOMPbvQe65uZ=hqzxHCH7nHdR=S0HkyeCFA@mail.gmail.com>
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

Wow. So I'd made the assumption that this is just what I needed to do
to access lan resources.

Turns out "0.0.0.0/0, ::/1, 8000::/1" will allow that just fine on
OSX. I still get a broken system if I specify ::/0 as the default
route doesn't appear to get created but with using ::/1 8000::/1 it
seems to work around that.

Problem solved! Thank you.

Though it's not at all intuitive or expected. Is there some issue
queue or something this can be added to for the OSX client
application?

Thanks
Adam

On Tue, 21 Jul 2020 at 14:49, Hasan Berkay =C3=87a=C4=9F=C4=B1r <berkay@cag=
ir.me> wrote:
>
> Are you sure that private IPs get routed through WG while AllowedIPs is
> "0.0.0.0/0, ::/1, 8000::/1"? I have just tried to ping my local router
> whilst connected to a tunnel with "0.0.0.0/0, ::/1, 8000::/1" and didn't
> have a problem.
>
> I mean, the way which makes sense is that AllowedIPs should work with
> your configuration and we wouldn't even have this conversation, however
> there are some things awkwardly different on the MacOS version from the
> GNU/Linux versions of WG client(s), so I think it might help to try
> every variation.
>
> Best,
> Berkay
>
> On 21.07.20 15:29, Adam Cooper wrote:
> > Mmm. It looks like unticking "Exclude Private IPs" and entering
> > "0.0.0.0/0, ::/1, 8000::/1" gives me a functional setup. Trouble is I
> > don't want to route the private IPs and ticking the box (whilst
> > retaining '::/1, 8000::/1') allows no traffic at all. There's
> > something odd about the way the client is configuring routes but I've
> > not got the expertise to figure it out :(
> >
> > On Tue, 21 Jul 2020 at 14:12, Hasan Berkay =C3=87a=C4=9F=C4=B1r <berkay=
@cagir.me> wrote:
> >>
> >> On 15/07/2020 14:14, Adam Cooper wrote:
> >>> ...
> >>> Probably worth mentioning that I tried to replace ::/0 with ::/1,
> >>> 8000::/1 but that just results in completely broken connectivity in
> >>> IPv6 and IPv4 - which may be another issue in and of itself.
> >>
> >> Did you try only having "::/1, 8000::/1" in the AllowedIPs option? I h=
ad
> >> a default route creation issue myself where I'm only trying to tunnel
> >> IPv6 through; and having this actually solved it.
> >>
> >> $ netstat -nr
> >> Routing tables
> >> Internet:
> >> ...
> >> Internet6:
> >> Destination                             Gateway
> >> Flags         Netif Expire
> >> ::/1                                    link#14
> >> UCS           utun2
> >> default                                 fe80::%utun0
> >> UGcI          utun0
> >> default                                 fe80::%utun1
> >> UGcI          utun1
> >> default                                 fe80::%utun3
> >> UGcI          utun3
> >> default                                 [ public IPv6 ]
> >> UGcI          utun2
> >>
> >> If just "::/1, 8000::/1" solves the IPv6 issue, I guess you can give i=
t
> >> a try with "0.0.0.0/0, ::/1, 8000::/1" to see if both routes are creat=
ed
> >> properly?
> >>
> >> Best,
> >> Berkay
