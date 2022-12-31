Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFE73C4332F
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 31 Dec 2022 01:08:43 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6bac7e53;
	Sat, 31 Dec 2022 01:08:40 +0000 (UTC)
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [2607:f8b0:4864:20::836])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b5582b0d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 31 Dec 2022 01:08:38 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id j16so18314551qtv.4
 for <wireguard@lists.zx2c4.com>; Fri, 30 Dec 2022 17:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Of3YyQegVvT5uEtS2SqFxuLxMkJive8rX4Dzy79KudM=;
 b=PFfphf5OlSlxEpFiEEP33T8ok6fugcZZeFqL8FOe3mJoAvFIt+MWELa520kp4NeUNI
 vZlDvAgXtB28odWmY7o2wt38QsKR8g9ZQpcQptGsrB62ojvui3VaJ4uK05yI4NDFC2P7
 6us/sgh58tEr26APTzurgnXlxCoi6gfI068R03f/etlgl+wDljQSRNPKHUxQqcgaGGu2
 k7I66cUnfAF0wITaBZ7vsz46yQDBX5bLNraQ8rCExKM6NUW6fVtFYMHIUKUGdxGlsgN9
 C1MB/k3NutnmO/gpvQIV/d2cSAC0CdF9vN4a5GxM1wCvrMoag7WQoGU1I746Opk8csWg
 06jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Of3YyQegVvT5uEtS2SqFxuLxMkJive8rX4Dzy79KudM=;
 b=34dgYn1eQtlDA8OuCNfzvaRgomjmvm4N61Cx81ICWeOGt0PV88uwUoMjelRFoh1a0j
 U63yW3YSvUAQ6KK6C0/dqQ0O2Gd8IYPBcWSzhrhO5++8olnjOLLVkjD4ttbw8934p7Ne
 jFp2GNbhaIWbv28lIKUxDvy8R1dto2gT/QRuTlagKgozeJdSJ0yZRUKkRgdd3BrDrA6M
 Pa4UMNzoThumd5wybid4GJi/GrmcP4sNFUEkrBtUxP14oiIci2KZsdFMVVw4LrurU0C4
 l8iOcKUF4saBNHafRAX91wE1OslQG36cfTquYnXfGsLau6vx/AEsCf+mjbTb1ebkGwLe
 B0Gg==
X-Gm-Message-State: AFqh2kocP1N2H5VMyqhXD7SP1ZJwBlvExr+5i7fCwtIPVhxsFM0CMN4t
 A+Ik47cvvC5aD8eUe/BSRfYJvvx58oY5MKTFeZvT3lDK
X-Google-Smtp-Source: AMrXdXsyqPkuqjbE5YvHu3C5M61ud6EG1IFGqPEtTJBgOlfxE2c/X/SuFfpHvmYaLkXTiONwRmcEg/wN4IExvdG9ML4=
X-Received: by 2002:a05:622a:4292:b0:3a9:8331:97f7 with SMTP id
 cr18-20020a05622a429200b003a9833197f7mr1401170qtb.68.1672448916761; Fri, 30
 Dec 2022 17:08:36 -0800 (PST)
MIME-Version: 1.0
References: <CALGY4fuH9oXpa34nzyj+jc94sS+ZQ5MaJUktFJF2A2-p213vEQ@mail.gmail.com>
 <2c5180c0a406fb9a68f367213940d06b2d4340ec.camel@withtel.com.au>
In-Reply-To: <2c5180c0a406fb9a68f367213940d06b2d4340ec.camel@withtel.com.au>
From: Nikolay Martynov <mar.kolya@gmail.com>
Date: Fri, 30 Dec 2022 20:08:25 -0500
Message-ID: <CALGY4ftUHpgANxbCo=i9GdTB1Tvodd-j0zzu897HPA3__JXw-g@mail.gmail.com>
Subject: Re: Connection hangs over CGNAT (Starlink)
To: Dean Davis <dean_davis@withtel.com.au>
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

Hi!

FWIW, reducing MTU doesn't seem to help. Also it looks like I almost
never experience this on a cell network and experience this sometimes
multiple times in an hour on startlink.
At any rate the problem can easily be simulated by just using
iptables. If for whatever reason packets are cut on the return path
for an established connection a new connection (with new source port)
is not reestablished resulting in connection effectively hanging
forever. I do not want to sound too presumptuous, but this seems like
a clear bug to me.

On Sun, Dec 18, 2022 at 10:41 PM Dean Davis <dean_davis@withtel.com.au> wrote:
>
> hi
>
>
> same issue
>
>
> I do kind of a automated ping test and if fails on the server side to
> many times bring down interface and then back up in a bash script
>
> with
>
> nmcli connection down wg0 && nmcli connection up wg0
>
>
> to me it looks to be connection state issue difference between new and
> established/related  ( can not confirm )
>
>
> ugly but works for me
>
>
>
> regards
> dean
>
>
> On Thu, 2022-12-15 at 21:12 -0500, Nikolay Martynov wrote:
> > Hi!
> >
> > I'm experiencing strange behaviour with wireguard: from time to time
> > connection 'freezes'.
> > Most often I'm observing this on an Android phone when connected from
> > my home over Starlink.
> > Server: latest Openwrt, Client: latest Android app.
> > The connection establishes and works fine for some time. After some
> > time the client still shows connection is established, but no
> > incoming
> > data is coming.
> > On a server side 'latest handshake' goes into hours/days.
> > The freeze happens randomly, for no apparent reason and I think only
> > over starlink. I do not think I have ever observed this problem on
> > cell networks.
> >
> > Reconnection solves the problem immediately.
> > I did some tcpdumping when the problem was present and found the
> > following:
> > * Server side sees incoming traffic from the client and sends
> > responses.
> > * On my own router connected to Starlink (i.e. interface between my
> > router and Starlink router) I see data going from the client to the
> > server - but no packets coming back.
> >
> > So my 'hypothesis' is that somehow Starlink's CGNAT 'forgets' one
> > side
> > of the connection - and so data continues to go in one direction, but
> > it doesn't come back. The thing with the wireguard is that it looks
> > like it doesn't change the outgoing port when it attempts to do
> > another handshake. This means that it continues using the same 'half
> > broken' connection forever.
> >
> > I think the same happens to me at least once on a Linux client - but
> > the difference with the phone is that the phone is always on and
> > therefore the duration of the connection is much longer.
> >
> > I tried experimenting with keepalive messages - but it looks like
> > they
> > make no difference. Once connection freezes I see keepalived arriving
> > onto the server, server sending reply - but that reply never arrives
> > to the client.
> >
> > It looks like the solution to this problem would be for the client to
> > use a different outgoing port when sending a handshake but I was not
> > able to find an option for that.
> >
> > Is this something that is possible to do?
> > Thanks!
> >
> >
>


-- 
Martynov Nikolay.
Email: mar.kolya@gmail.com
