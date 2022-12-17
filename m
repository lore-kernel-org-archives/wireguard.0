Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB413C4332F
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 17 Dec 2022 22:18:25 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eadaf21c;
	Sat, 17 Dec 2022 22:16:03 +0000 (UTC)
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [2607:f8b0:4864:20::52f])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 1ddf3102
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 17 Dec 2022 22:16:00 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id h33so3924768pgm.9
 for <wireguard@lists.zx2c4.com>; Sat, 17 Dec 2022 14:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KDMbsmrxyL4z3eKKOEe5oYszwlRW1cAXzCV/u1qeL2k=;
 b=jvT8s6Ftkkgj48DFiiwoGBkPR+osDJiwm1r20Br93HR6VHRibGiNnxEmSt3bplBxNX
 susRccKCZoTvtU6MSoeWKygXZ4/Tpp1qaPujXJmHz74zS1djK2HkiGeUimey1rPUu+cy
 V+8pUcAMlgtquy3UDWO/wTPi/bZ2HbH/FGnHMPRvAETyHZBlkxBddGEaYoNPqDr5Wz+I
 0pj/mNUijBoajcxCPS1Gb6AdV0VBgBg0a0+b7vONjjqaHlL+Vx+rmvXX+TJiNxufyiRM
 5kYQop4p1mYjy5Je54ATyOGn1nPYxxMl+Yu/EIKpf/6G3sN9aivi41ratY41zXM20BKI
 HP+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KDMbsmrxyL4z3eKKOEe5oYszwlRW1cAXzCV/u1qeL2k=;
 b=fZoM6n/0xy3jHDqCSHNVWVSJeNV0Cpgzitw2hXTyZfODx/GIdjymbWP6J7YmaE3W/r
 3MUGiPKRSSE2fp3eS6AX5gglEd4qfTwzQtvBQkvQ8MF/NUY/3TtouArKv+Ghra5QP6sK
 Rhb6CfVb0Sl37cl0yJRWTA584zM717KHLCPwBMUs0RpWq7HQoMGL2QlhWpnQS5jDXGAT
 x/EgaOGAml29776jxhtvKn3L1K93Oj1r6SbI7m3pDFSq7V8DIb+Ckm7goFatSqCLXYwH
 ++BIY9XSekaNn/0C/f1tMsgt9D98sgy9+tb61KlV2pQKGJPQtH7P+doNNb3joAGh+Lp/
 1wBg==
X-Gm-Message-State: ANoB5pmnalgfkd/wNnCZrG3bQjlY2oq0XLCGFIzJslb6o3TnkSxkQKrc
 PsLP/IMo9jGu5/ZvvOusS+mdzub2fAls2sKZCYGmZ139FTY=
X-Google-Smtp-Source: AA0mqf6nN6L3RSgASs6wtbTTC0tm9cwKxsCjStrQiW9R4Q/MpNYWDu/HVd0kkcPWxll93GGKZfFXJAC3EJ7hxRNCXA4=
X-Received: by 2002:aa7:958c:0:b0:578:202d:a33a with SMTP id
 z12-20020aa7958c000000b00578202da33amr1436924pfj.23.1671315358936; Sat, 17
 Dec 2022 14:15:58 -0800 (PST)
MIME-Version: 1.0
References: <CALGY4fuH9oXpa34nzyj+jc94sS+ZQ5MaJUktFJF2A2-p213vEQ@mail.gmail.com>
In-Reply-To: <CALGY4fuH9oXpa34nzyj+jc94sS+ZQ5MaJUktFJF2A2-p213vEQ@mail.gmail.com>
From: Szymon Nowak <szymonn841@gmail.com>
Date: Sat, 17 Dec 2022 23:15:49 +0100
Message-ID: <CA+hy6dtEXTG9wQJ0Cb=2iEgZd6bOpCghBinawgS5UPCQ+95sGA@mail.gmail.com>
Subject: Re: Connection hangs over CGNAT (Starlink)
To: Nikolay Martynov <mar.kolya@gmail.com>
Cc: wireguard@lists.zx2c4.com
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

I've noticed the same thing on a WIndows client, it happens when you
provide internet from two sources, e.g. Wifi and mobile network or
Wifi and LAN in case of computer, When one of these sources has a
problem and internet is not available on it. Then Wireguard stops
working even though it doesn't break the tunnel. Completely
disconnecting the faulty connection and reconnecting the tunleu solves
this problem. I don't know why they don't work even though the tunnel
is connected

On Sat, Dec 17, 2022 at 11:05 PM Nikolay Martynov <mar.kolya@gmail.com> wrote:
>
> Hi!
>
> I'm experiencing strange behaviour with wireguard: from time to time
> connection 'freezes'.
> Most often I'm observing this on an Android phone when connected from
> my home over Starlink.
> Server: latest Openwrt, Client: latest Android app.
> The connection establishes and works fine for some time. After some
> time the client still shows connection is established, but no incoming
> data is coming.
> On a server side 'latest handshake' goes into hours/days.
> The freeze happens randomly, for no apparent reason and I think only
> over starlink. I do not think I have ever observed this problem on
> cell networks.
>
> Reconnection solves the problem immediately.
> I did some tcpdumping when the problem was present and found the following:
> * Server side sees incoming traffic from the client and sends responses.
> * On my own router connected to Starlink (i.e. interface between my
> router and Starlink router) I see data going from the client to the
> server - but no packets coming back.
>
> So my 'hypothesis' is that somehow Starlink's CGNAT 'forgets' one side
> of the connection - and so data continues to go in one direction, but
> it doesn't come back. The thing with the wireguard is that it looks
> like it doesn't change the outgoing port when it attempts to do
> another handshake. This means that it continues using the same 'half
> broken' connection forever.
>
> I think the same happens to me at least once on a Linux client - but
> the difference with the phone is that the phone is always on and
> therefore the duration of the connection is much longer.
>
> I tried experimenting with keepalive messages - but it looks like they
> make no difference. Once connection freezes I see keepalived arriving
> onto the server, server sending reply - but that reply never arrives
> to the client.
>
> It looks like the solution to this problem would be for the client to
> use a different outgoing port when sending a handshake but I was not
> able to find an option for that.
>
> Is this something that is possible to do?
> Thanks!
>
>
> --
> Martynov Nikolay.
> Email: mar.kolya@gmail.com
