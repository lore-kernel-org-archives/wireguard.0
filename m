Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65F42C636CC
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 20 Feb 2023 11:09:44 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4cab1bd5;
	Mon, 20 Feb 2023 11:09:41 +0000 (UTC)
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [2607:f8b0:4864:20::102e])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 12cddf03
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Feb 2023 11:09:38 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 na9-20020a17090b4c0900b0023058bbd7b2so945837pjb.0
 for <wireguard@lists.zx2c4.com>; Mon, 20 Feb 2023 03:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tWVTt3yfVCq77ETaQgG/PBduDQvU7FJD0ps7Evgbeug=;
 b=frbeeVChfKveMGhxg2fEYuupgjDDQSIPfcTpXEmjxouGftgJ5H6k5n6B4zb/YE71Dm
 tTgm+KtUhLmZxa7iq6564SoWJzTpl597y1P73FUFXEp5QO03wxEbn/v2RfNlWTIaobF/
 6VngzkwXSC1/ZLqM8+tN76wuRnKtikXh/GC+/z6obSQd7Ie9VobfdIFUlexwu47KimrI
 6Ya4d4hp7QNpQva+UkYrXsqPAxZkrlNrdVzqJPNlFwongMLXwDhU3hfOmZFo67LUr2xj
 puLs8t3YAoxDijtNnOWmZuEZqtZK7ABjcCDTqzdj3OIIG+5RBUSs7az/ZDORnOMAUubp
 MeQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tWVTt3yfVCq77ETaQgG/PBduDQvU7FJD0ps7Evgbeug=;
 b=AYxA61xKuFuw4H6F3FPGwQMBPCoW9LQoGYJOLqyUQkfIfjqG4GHPKF42s5agVennR5
 xLH9KyIoNN8XTOGbou9v26YnfovEtQSPJdlYPj/ltuIMkipo5FA0qXHIPhAp/mG8nOVg
 gEHWl7MiGQ6hxXJhUeCr19yatffIc5ZezlZu59Kbh/mPNv125XxiZMhKJd9BLdnp/rLO
 R/2DjTASfINxP7j+fKiB3hAhyxnXLUxKM42gcFlHUjVpGzTfIrwpCiYRf2BAxAYJE/mf
 +hl639OlXF577Xl50dQiJuzH7OXcBJFyCIY12il1YUjp2LT6HE1BKLFqJCljN6voeOLW
 JW7g==
X-Gm-Message-State: AO0yUKWZzPcCKT3kaNQIwcKsPWpNaIuzfmYU/QjuKeMHjFQKz2Si6sfx
 4fvhApIsG/Kj04gl2djhZWrXdxYG4UE2ZxPJjQhp1CUG
X-Google-Smtp-Source: AK7set8Sb0LXTN5PTkkcim89G6I/lPgN67GAYkbTeYQZR0lbOebvdVBrjXUmSpzOmwAs4CZJMBTutITQYvJgieYGudU=
X-Received: by 2002:a17:90b:1a8d:b0:234:1670:e678 with SMTP id
 ng13-20020a17090b1a8d00b002341670e678mr1237201pjb.117.1676891376269; Mon, 20
 Feb 2023 03:09:36 -0800 (PST)
MIME-Version: 1.0
From: Janne Johansson <icepic.dz@gmail.com>
Date: Mon, 20 Feb 2023 12:09:25 +0100
Message-ID: <CAA6-MF8wNMCDkfWiB96W5pwL+YwMgPCCOn1s1B2YQ_zy_V6U-A@mail.gmail.com>
Subject: Re: Source IP incorrect on multi homed systems
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

rewriting for the lists, managed to bold some pasted text and hence
get blocked due to html-mails not allowed on list.

Den s=C3=B6n 19 feb. 2023 kl 21:17 skrev Nico Schottelius
<nico.schottelius@ungleich.ch>:
> Janne Johansson <icepic.dz@gmail.com> writes:
> > *) https://en.wiktionary.org/wiki/Chesterton%27s_fence
>
> I am happy to have learned a new principle today, thanks for that.
>
> And to be sure that everyone is on the same page:
>
>     Wireguard should reply by default with the source address that
>     used to be the destination address, but at the moment wireguard is no=
t
>     doing that at the moment.
>
> If anyone disagrees with above statement, please let me know.

I disagree, but perhaps only because that statement is slightly too short.

Let's assume I have two ISPs and hence a multihomed wg peer, with ip
A.x.x.x from isp A, and ip B.x.x.x from isp B. For some reason, this
box has a routing table that says "prefer link A to reach the
internet", but I set up client C to set up wireguard to B.1.2.3 and
client C sends it udp packet with src ip C and dest IP B.x.x.x. Since
UDP is stateless, the "response" from the multihomed server is created
"out of thin air" as a random UDP packet destined for C. We don't feel
it is unrelated to the previous received packet, but from the tcp
stack perspective it is.

The routing table now decides that interface A will be the awesomest
for sending UDP to C, and therefore creates a packet with source ip
A.x.x.x and dest ip C.x.x.x and sends it off. This surprise seems to
be the main issue in this thread. Perhaps we see this multihomed box
as slightly misconfigured as far as wireguard goes, perhaps it should
have posted A.x.x.x instead of B.x.x.x as the wg endpoint to the
client or whatever, but the facts remain.

Now, in your above statement you hope to get everyone to agree on,
this would need to also include "sending it back on interface B, to
the gw used by interface B to ISP B if there is one" or else isp A
might drop the packet as being sent from a "forged" address since it
looks like a fake source ip from isp As perspective. The routing
lookups - before any applied tricks - will look at destination IPs
only and make the decision based on that.

I think the proposed solution, while attractive at first glance, may
be trading one kind of "surprise" behaviour to another where the
interface B might be less useful than A which would explain why the
default route is set to use A. If you look at the many posts on the
internet over many years about "why udp source ip got chosen wrong on
multihomed boxes" you see answers like:
"You either bind(2) to each interface address and manage multiple
sockets, or let the kernel do the implicit source IP assignment with
INADDR_ANY. There is no other way."
( https://stackoverflow.com/questions/3062205/setting-the-source-ip-for-a-u=
dp-socket
, not about vpns and lots older than wireguard)

What this means is that if you have a box where links and interfaces
come and go (usb wifi dongles, tethered cell phones..) then wireguard
now has to make a lot of extra work, trying to keep tabs on what
interfaces exist or not, instead of just binding to port 0 and letting
the kernel handle this by itself in the normal but to some, surprising
way for udp packets.

My gut feeling is that if you have a setup like this example
multihomed peer, you get to do some extra steps, which may include the
aforementioned firewall mark "tricks", use VRFs/Namespaced
interfaces/routing domains, add a specific route to client C ip over
link B, bind wg to a loopback interface or source-nat on outgoing wg
traffic or something along those lines in order to have a wg endpoint
on a less-preferred interface and not cause issues with
stateful-nat-gws at client C.

--
May the most significant bit of your life be positive.
