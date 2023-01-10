Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6831EC5479D
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Jan 2023 00:40:31 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2e854c32;
	Thu, 12 Jan 2023 00:36:42 +0000 (UTC)
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id fa151c82
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Jan 2023 10:55:12 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id cf18so21193189ejb.5
 for <wireguard@lists.zx2c4.com>; Tue, 10 Jan 2023 02:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oldum-net.20210112.gappssmtp.com; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=P5LPWylJ+WrSLGZ+M3Jf7pU1XPtT+ti9ddH8Xo3ZYPo=;
 b=WfOuznx4xScNlWvq+8J1F1qN9a9gRAbUaSsXWCspF7JL98k94t6uEZ5ym6PQDjC1Q7
 c/gtPZ0iiWI7QpRbMT3JmuMvnoy14RsT/4qD+xCCoy+MV7RR941daJ+g6sEPQfaUxbFw
 95Y/Db8tNqQdZKRqiXgHd3WxVenpSa2BSwo9biKo1HoUBd3az9hEeo8t4WMlO3Jyrd7M
 hg+3iPX5mxFtpDSB+QJgMgv0rycfcku3U79J2qH/TfvhIEfN22RmSHFWrJ2WNRV4wqZu
 zrabwkyXp240dNF47tfu34H0VztrRtKv90jXdoK4sgWbnc/kN/3DbzYiigYLYEgf2Hv6
 fqeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=P5LPWylJ+WrSLGZ+M3Jf7pU1XPtT+ti9ddH8Xo3ZYPo=;
 b=ngr7BYdv1/WdPqWCOAiNg15lgmhwbUzdvXUzxSjz48RuDSu1A0h/S85e0GS/K75ipe
 Bky2lt+aa1T7OE5iVjl+610SjE2J4PRYz/4TeUiw4A1e0FfJrje0e5gU+fb7eDINqNee
 3LBpkcdA22pkwOOcfT6KesqhC2NknJWeoe6HHH9XO2cgYW592/Z+BRQ2xIdUgp4JfKzG
 AfDWmjTihpAvRRnuz2ymCA+zLVB0ogopOq9u1augyPXglFhKcyp8lUYM5bao6s+yAoJh
 vhzpieZ6xENUR9hS/Dmq05SnrqlxM7rOSbu9Tiwz3GYA7mXd1pUy7xJKFkGCLaHW7/rp
 hSrQ==
X-Gm-Message-State: AFqh2kqcNTRf4yJd//FFD6FjQ0C4WCTT5zikrM/gT37GDl3jGgOHHpgr
 jVDZPj54vnYyDk+xmWSL3CJdH+2aMmYh7Ur2ye863Q==
X-Google-Smtp-Source: AMrXdXtgagM6IeZUHBtouw+B3CDSP7FGNbp9jCcfSZ73yibcVOtCqD+NKgMDCBQKyxn3XYuGJtmbOw==
X-Received: by 2002:a17:906:9c96:b0:7c1:6344:843 with SMTP id
 fj22-20020a1709069c9600b007c163440843mr61348204ejc.6.1673348112125; 
 Tue, 10 Jan 2023 02:55:12 -0800 (PST)
Received: from [10.1.0.200] (178-169-191-169.parvomai.ddns.bulsat.com.
 [178.169.191.169]) by smtp.googlemail.com with ESMTPSA id
 ku12-20020a170907788c00b0084d4564c65fsm2650876ejc.42.2023.01.10.02.55.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 02:55:11 -0800 (PST)
Message-ID: <49a4dbc328213540a1406683b4dd37cf2e45910e.camel@oldum.net>
Subject: Re: Connection hangs over CGNAT (Starlink)
From: Nikolay Kichukov <nikolay@oldum.net>
To: Nikolay Martynov <mar.kolya@gmail.com>, Dean Davis
 <dean_davis@withtel.com.au>
Cc: wireguard@lists.zx2c4.com
Date: Tue, 10 Jan 2023 12:55:10 +0200
In-Reply-To: <CALGY4ftUHpgANxbCo=i9GdTB1Tvodd-j0zzu897HPA3__JXw-g@mail.gmail.com>
References: <CALGY4fuH9oXpa34nzyj+jc94sS+ZQ5MaJUktFJF2A2-p213vEQ@mail.gmail.com>
 <2c5180c0a406fb9a68f367213940d06b2d4340ec.camel@withtel.com.au>
 <CALGY4ftUHpgANxbCo=i9GdTB1Tvodd-j0zzu897HPA3__JXw-g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.2 
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 12 Jan 2023 00:36:34 +0000
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

Hi folks,

I am getting similar experience (though it looks like different
underlying problem) on iOS 12 device running latest wireguard
application using cellular (LTE) network for the VPN tunnel.

Very randomly, it may be from a couple of days up to at most 4 days with
the VPN being active the server peer stops receiving the keepalive
packets because the tunnel has become inactive in wireguard client. It
then requires manual interaction to enable it which then connects
instantly.

tcpdump on the server peer does not indicate any incoming traffic when
it happens, so it is most likely a iOS client component crash.

Cheers,
-N

On Fri, 2022-12-30 at 20:08 -0500, Nikolay Martynov wrote:
> Hi!
>=20
> FWIW, reducing MTU doesn't seem to help. Also it looks like I almost
> never experience this on a cell network and experience this sometimes
> multiple times in an hour on startlink.
> At any rate the problem can easily be simulated by just using
> iptables. If for whatever reason packets are cut on the return path
> for an established connection a new connection (with new source port)
> is not reestablished resulting in connection effectively hanging
> forever. I do not want to sound too presumptuous, but this seems like
> a clear bug to me.
>=20
> On Sun, Dec 18, 2022 at 10:41 PM Dean Davis
> <dean_davis@withtel.com.au> wrote:
> >=20
> > hi
> >=20
> >=20
> > same issue
> >=20
> >=20
> > I do kind of a automated ping test and if fails on the server side
> > to
> > many times bring down interface and then back up in a bash script
> >=20
> > with
> >=20
> > nmcli connection down wg0 && nmcli connection up wg0
> >=20
> >=20
> > to me it looks to be connection state issue difference between new
> > and
> > established/related=C2=A0 ( can not confirm )
> >=20
> >=20
> > ugly but works for me
> >=20
> >=20
> >=20
> > regards
> > dean
> >=20
> >=20
> > On Thu, 2022-12-15 at 21:12 -0500, Nikolay Martynov wrote:
> > > Hi!
> > >=20
> > > I'm experiencing strange behaviour with wireguard: from time to
> > > time
> > > connection 'freezes'.
> > > Most often I'm observing this on an Android phone when connected
> > > from
> > > my home over Starlink.
> > > Server: latest Openwrt, Client: latest Android app.
> > > The connection establishes and works fine for some time. After
> > > some
> > > time the client still shows connection is established, but no
> > > incoming
> > > data is coming.
> > > On a server side 'latest handshake' goes into hours/days.
> > > The freeze happens randomly, for no apparent reason and I think
> > > only
> > > over starlink. I do not think I have ever observed this problem on
> > > cell networks.
> > >=20
> > > Reconnection solves the problem immediately.
> > > I did some tcpdumping when the problem was present and found the
> > > following:
> > > * Server side sees incoming traffic from the client and sends
> > > responses.
> > > * On my own router connected to Starlink (i.e. interface between
> > > my
> > > router and Starlink router) I see data going from the client to
> > > the
> > > server - but no packets coming back.
> > >=20
> > > So my 'hypothesis' is that somehow Starlink's CGNAT 'forgets' one
> > > side
> > > of the connection - and so data continues to go in one direction,
> > > but
> > > it doesn't come back. The thing with the wireguard is that it
> > > looks
> > > like it doesn't change the outgoing port when it attempts to do
> > > another handshake. This means that it continues using the same
> > > 'half
> > > broken' connection forever.
> > >=20
> > > I think the same happens to me at least once on a Linux client -
> > > but
> > > the difference with the phone is that the phone is always on and
> > > therefore the duration of the connection is much longer.
> > >=20
> > > I tried experimenting with keepalive messages - but it looks like
> > > they
> > > make no difference. Once connection freezes I see keepalived
> > > arriving
> > > onto the server, server sending reply - but that reply never
> > > arrives
> > > to the client.
> > >=20
> > > It looks like the solution to this problem would be for the client
> > > to
> > > use a different outgoing port when sending a handshake but I was
> > > not
> > > able to find an option for that.
> > >=20
> > > Is this something that is possible to do?
> > > Thanks!
> > >=20
> > >=20
> >=20
>=20
>=20


