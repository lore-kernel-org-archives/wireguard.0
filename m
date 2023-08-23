Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF82EC27C40
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 23 Aug 2023 19:55:39 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f555e9ea;
	Wed, 23 Aug 2023 19:55:37 +0000 (UTC)
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f5ae9332
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 23 Aug 2023 19:55:35 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2b9c907bc68so99901321fa.2
 for <wireguard@lists.zx2c4.com>; Wed, 23 Aug 2023 12:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692820535; x=1693425335;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Z/tSPnYBNFfk81u75//nhed3zQ+8AYuB6m/Afwv+azU=;
 b=CXtq4jJ9wT1qChNaSu/hqyTXK5J3npNtwzk7Do6zadAeyCM3G15KMESbAu6MwL0OTj
 RM4K1hpeRheqkoU+zTcFEHYGh+yH86Pvk4dIw0dYimMUGy+vVOM/EE+BwsPEYB2DUcMF
 se95AxdOofYMZa9P18sFg6wcI+rcpqMOSRJKQbmTTpmJh6Ogv7hmcsFXrqi+C1vNhjEF
 LwyLO2t2racl8fpR4+cXx6reofgMUbAjFgUU45qNOhQoLZzWgwINjpwGgfW6WgwMXMUm
 bAg60VpvReBJS/MrK/JenXoybBj+1a0PVNsjYBCFwLSvEAZPpmXGAl2DdW6bPOFP3LSY
 XUIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692820535; x=1693425335;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Z/tSPnYBNFfk81u75//nhed3zQ+8AYuB6m/Afwv+azU=;
 b=IMLHYAu0gm3AK3EUUbJjhzBwdovzDL9pmmxygq+KjU2kvAvC0Y8b+Oez3HB5QzTILt
 ILhLDj8O4pmR2t0ZnLaTCyLIr9I2VXk34LFRWIvlxQSoO3zkvhdtCa7e2Cp63Csi7Viv
 GIr222jdC33wZ7lXHrxLZ/P23ibIMZ8KZbFvAOknRmJfXpaxI5LAUVjOHs1KKJyIOlu8
 zEBeBRC+qIqUW8BxWB20c9249xmYaWnWPTY4iZiwc3Sx3HHVo8Kfmh07sduXmVBvzVqK
 cIPm1y1Sc2pricJibC0c6oLfD4j2wmzUZojfkaZ0YT3p4weyi5bnjVR/WfSe2MD+4xwG
 sCWQ==
X-Gm-Message-State: AOJu0YxZUIkxN7GF3SHStSphYt+alNz4/wKTqie6WSjdNX2yxDi2DzLE
 8gKuo020caxNZO83UCVDUCqZvIekVb/TZ9Qqr5poNWu6bXk=
X-Google-Smtp-Source: AGHT+IHBbd24ZeNHrBnYKg8GXeuDLi3hmTC0Cm9T7N1JTr8Oh7USKZQb8Kt2iAzGNzWJodF79GCrjPQQn8QA8gQjQAc=
X-Received: by 2002:a2e:9f4d:0:b0:2b9:7513:3596 with SMTP id
 v13-20020a2e9f4d000000b002b975133596mr10171672ljk.5.1692820534744; Wed, 23
 Aug 2023 12:55:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAJq09z6Dz3idziDgB-3-VOVa=YEWk6ZOrLOwLTBctRb5VkLMLA@mail.gmail.com>
 <20230823170740.ie5ro6eswgus3x2l@House.clients.dxld.at>
In-Reply-To: <20230823170740.ie5ro6eswgus3x2l@House.clients.dxld.at>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Wed, 23 Aug 2023 16:55:23 -0300
Message-ID: <CAJq09z5QPLF-WyQiWwCZymvLhG31jp5eNctze_mYmKixtn6nNg@mail.gmail.com>
Subject: Re: IPv6 and PPPoE with MSSFIX
To: =?UTF-8?Q?Daniel_Gr=C3=B6ber?= <dxld@darkboxed.org>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
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

> > I could dynamically add firewall rules to clamp MSS per authorized_ips
> > but, theoretically, the kernel has all the info to do that
> > automatically. I wonder if MSSFIX could detect the best MTU for a
> > specific address through the wireguard. It should consider the
> > peer-to-peer PMTU, the IP protocol wireguard is using and the normal
> > wireguard headers.
>
> Interesting idea Luiz, so if I understand correctly you have a wg device
> with multiple peers where only some of them need the reduced MTU and you'd
> like to use the maximum possible MTU for all peers.
>
> As things are this won't "just work" with MSSFIX because the wg device
> won't generate ICMP packet-too-big errors for packets sent to it for
> encapsulation regardless of the underlying PMTU, rather the wg device will
> always fragment when the resulting encapsulated packet doesn't fit as
> you've observed.
>
> AFAIK MSSFIX will only look at the actual outgoing route MTU and calculate
> the MSS from that. Since wg never causes (dynamic) PMTU entries to be
> created that won't work.
>
> However we can also just create "static" PMTU entries. As we've seen above
> linux uses the "mtu" route attribute to determine the actual PMTU behind a
> route, as opposed to the netdev MTU, which you should think of as the upper
> limit of what a link can support.
>
> So you can try adding a route specific for the peer that's behind PPPoE
> with the reduced PMTU. Assuming 2001:db8:1432::/64 is this peer's
> AllowedIPs:
>
>     $ ip route add 2001:db8:1432::/64 dev wg0 mtu 1432 proto static
>
> You should be able to add this in PostUp in your wg.conf. The "proto
> static" is optional, I just like to use that to mark administratively
> created routes.
>
> You're still going to want to set the peer's wg device MTU to 1432 or you
> can create "mtu" routes in a similar fashion there. Up to you.
>
> Also note MSSFIX or the nft equivalent mouthful `tcp flags syn tcp option
> maxseg size set rt mtu` is really only appropriate for IPv4 traffic since
> IPv4-PMTU is broken by too many networks. However over in always-sunny IPv6
> land PMTU does work and should be preferred to mangling TCP headers. The
> static PTMU route we created should cause the kernel to start sending the
> appropriate ICMPv6 packet-too-big errors when it's configured for IPv6
> forwarding.
>
> You can test the PTB behaviour with `ping 2001:db8:1432::1 -s3000 -M do`.
> The -s3000 sends large packets, careful with the size that's the ICMP
> _payload size_ so it's not equivalent to MTU, and `-M do` disables local
> fragmentation so you can see when PMTU is doing it's job. You'll get
> something like "ping: local error: message too long, mtu: XXXX" showing the
> PMTU value if ICMP-PTB error generation is working along the path.

I didn't think about adding the MTU directly to the route table. Now
it is more interesting. Wireguard adds a route to each allowed ips. If
we detect a pmtu change pmtu for a target, we could adjust those
routes to avoid fragmentation. I just don't know if we would break the
connection if we modify MTU up or down during a transfer. I believe
increasing it won't matter for existing connections as MSS is already
negotiated and bringing it down will just fragment the traffic.
Anyway, I believe it is better to fragment the plain packet than the
encrypted one. And for new TCP connections, the firewall can clamp TCP
MSS to the optimal value, even considering if it is using IPv4 or
IPv6.
