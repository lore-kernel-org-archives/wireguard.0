Return-Path: <SRS0=PVz2=BK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AE1BC433E1
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 31 Jul 2020 14:15:22 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05D18206D4
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 31 Jul 2020 14:15:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J45fjwoL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05D18206D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b8e8a0ee;
	Fri, 31 Jul 2020 13:51:31 +0000 (UTC)
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com
 [2607:f8b0:4864:20::143])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 567aaeb0
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Jul 2020 13:38:38 +0000 (UTC)
Received: by mail-il1-x143.google.com with SMTP id f68so653067ilh.12
 for <wireguard@lists.zx2c4.com>; Thu, 30 Jul 2020 07:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DIpr0QaJo5ypRiVIpSJAPEWQch+S/l64ZhoGyRtAOOQ=;
 b=J45fjwoLvEAm3eIcaDQu8uJ797xkHEfRjCWUtZ9MXDkYFhBlQgvDFXCWz6vHGCKMe1
 JBrsSFofUfKr2DokALnVsaZhSOA4YUOLCNk3W1x2X2cO41g6efd5IlcY09AkOL2sHZmI
 MyTZJqxPnN910BgIzPskL3fpLfHxrYBFccjMqcetb2tjevXUyv1f/WbXcjguAeUKm8iq
 7o+mfjYiKuELaWzBIfOW3M53ZTd+lMGpgJq0Iw+g3GLVZEpXk4uQgSmn2DW3ks52GcWz
 fmcO1i/eJeOyKmwIRvtoYyE6pbMdPp7agflqyI9QGJ3cZQ2oD0YnTWyXjcxZ4UiXSJ0Z
 tQcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DIpr0QaJo5ypRiVIpSJAPEWQch+S/l64ZhoGyRtAOOQ=;
 b=ln1j8qqwNP+LCTIb1YMi+7YtFqLiMNvbGYJAIY0gic0wQkSDjt5tq5LdyQ2QSFTttN
 vf5aYMo35KqlwPSsWlW87V1Y+H3SCMzdhKkhc7NOC4SpOVS6BENV/RQ1V6Of0mZxSf4E
 KJ7yXG9jnjLy0iQoU1CfR+2QtXntfYyBlSQJOuVFnDAOi29SJUvIHeZastsQyxvDr9qQ
 fNGx2QNuSsxPzzFqtJN614T7vChq0SDesa2C0P4wO8ej//+4Cvx17R2h45r28rr0xs3v
 2jKqGxSgqbJasHepfnJ6WWhyaMojucdCBwmzDNwtHwWHto4VOgXoVVbZgMEQoUF3nWO2
 xOTw==
X-Gm-Message-State: AOAM532ZiaBBjHloegMCsV2Wrr0Y0gdXQy2nAhu8G4usUJGaNYM8Xh4Q
 Y0EmmoyR4cyMnwlWrA+G8i2u2P2ZvboPHcg23OI=
X-Google-Smtp-Source: ABdhPJwJglpAZjfo9zTsPUWrfjX1pWyWLXm9wPSuW8m2Jj90xa9ownUfXx7iyOkTfwfFG+a6L3Q5tMAboRjCpu/7CRU=
X-Received: by 2002:a92:6805:: with SMTP id d5mr2384159ilc.29.1596117740284;
 Thu, 30 Jul 2020 07:02:20 -0700 (PDT)
MIME-Version: 1.0
References: <02830f08-9e6f-a9f1-54c3-43758e95758f@gmail.com>
 <26A86FD2-5A2D-49DC-A140-2E4B43213936@tomcsanyi.net>
 <ECF44AE9-A461-4252-8A33-B2A813280493@gmail.com>
 <20200729221814.GA32170@matrix-dream.net>
 <AF335FF5-251F-409A-9B9A-5D65D2EDA3DD@gmail.com>
In-Reply-To: <AF335FF5-251F-409A-9B9A-5D65D2EDA3DD@gmail.com>
From: M Rubon <rubonmtz@gmail.com>
Date: Thu, 30 Jul 2020 10:02:10 -0400
Message-ID: <CAJ24mqD0GWcguHwVifutRsmK7hn=qncwbVWCJqNAP7UgOUm-Qw@mail.gmail.com>
Subject: Re: Confused about AllowedIPs meaning?
To: Rich Brown <richb.hanover@gmail.com>
Cc: =?UTF-8?B?SXZhbiBMYWLDoXRo?= <labawi-wg@matrix-dream.net>, 
 "Tomcsanyi, Domonkos" <domi@tomcsanyi.net>,
 Gunnar Niels <gunnar.s.niels@gmail.com>, wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 31 Jul 2020 15:51:20 +0200
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

>  - Should the definition of AllowedIPs mention the "Address" of the peer?=
 That is, must the peer's Address be listed in AllowedIPs? [*]
> - Some guides state that the Address specified for this peer and the othe=
r peer should be chosen from a subnet different from any on the networks. I=
s this a recommendation? A requirement? [**]

The address of the peer does *not* need to be included in AllowedIPs.
If it is not there, the wg tunnel will still be created, but as
discussed the wg tunnel will only accept packets with a destination
address listed in AllowedIPs.

Following is the wg output when I have commented out the AllowedIPs
entry in the config file.  You will see the handshake is still
happening, though in this case the tunnel itself will accept no
packets.  It is an existing but sad tunnel :-(

peer: tndyLlE+lVFz/HIGs9BpjH....
  endpoint: 192.168.82.234:57331
  allowed ips: (none)
  latest handshake: 35 seconds ago
  transfer: 280 B received, 456 B sent
  persistent keepalive: every 25 seconds


On Wed, 29 Jul 2020 at 20:58, Rich Brown <richb.hanover@gmail.com> wrote:
>
> These are helpful comments.
>
> > On Jul 29, 2020, at 6:18 PM, Ivan Lab=C3=A1th <labawi-wg@matrix-dream.n=
et> wrote:
> >
> > On Tue, Jul 28, 2020 at 05:33:43PM -0400, Rich Brown wrote:
> >> AllowedIPs is the set of addresses that your WireGuard peer will send =
across the tunnel to its peer.
> >
> > The definition is close, but not precise. Assuming things haven't
> > changed much:
> >
> >  AllowedIPs specifies the set of addresses that your WireGuard
> > host will send across the tunnel to its peer, and accept from
> > the peer.
>
> I think you and M. Rubon from earlier this afternoon are saying much the =
same thing. I like those definitions because they make it explicit that the=
 AllowedIPs are used both for transmission (only packets with those destina=
tions will be sent through the tunnel) and receipt (only those source addre=
sses will be allowed back through the tunnel).
>
> But I believe these definitions still leave uncertainty:
>
> - Should the definition of AllowedIPs mention the "Address" of the peer? =
That is, must the peer's Address be listed in AllowedIPs? [*]
> - Some guides state that the Address specified for this peer and the othe=
r peer should be chosen from a subnet different from any on the networks. I=
s this a recommendation? A requirement? [**]
>
> My goal is to produce a straightforward "can't fail" guide for people who=
 simply want to set up a VPN from their laptop to their office or home netw=
ork. (Of course, the definitions must be correct, but I want to leave out a=
ll the details and options that aren't essential for that simple case.) Is =
the following a "good enough" definition to include in a "Just Do This" gui=
de?
>
> > AllowedIPs  =E2=80=94 a comma-separated list of IP (v4 or v6) addresses=
 with CIDR masks which are allowed:
> > - as destination addresses when sending via this peer and
> > - as source addresses when receiving via this peer.
>
> Thanks.
>
> Rich
>
> [*] I think it is not necessary to specify the peer's Address in AllowedI=
Ps. If it's not included, it won't be possible to interact with the peer us=
ing that address (since it's not in AllowedIPs). However, the peer will lik=
ely have an address that *is* in AllowedIPs, and that's how it will be acce=
ssible. True?
>
> [**] I suspect it would be possible to assign each peer's Address from an=
 existing subnet. But for simplicity, the I believe the guide should recomm=
end a completely different subnet for the peers to avoid any confusion. Tru=
e?
>
> PS The remainder of the note is good/correct, but it muddies the water by=
 bringing up lots options and special cases that don't apply to the simples=
t use cases.
>
> > AllowedIPs is not a set of addresses, but of networks, wherein
> > the peer with most specific match wins - as in a routing table.
> > Also, beware negations might not do what you expect.
> >
> >
> > Routing should work like so:
> >
> > When a linux system is sending a packet, it first consults
> > the system routing table to choose the appropriate device.
> > Then, if the outgoing device is a wireguard tunnel, it
> > consults the routing table of the WG device to choose a peer.
> > WG device's routing table is constructed from peers' AllowedIPs.
> > When a peer is selected, the packet is encapsulated and sent
> > to the peer's latest enpoint. Then the system routing table
> > is again consulted, and hopefully a different outgoing device
> > is selected.
> >
> > Note that the routing table is in fact a tree where the most
> > specific match wins - both the system one and wireguard's.
> > Also note that overlapping networks are allowed (e.g. 0.0.0.0/0,
> > and 10.0.0.0/8), but identical networks in a single WG device
> > are not allowed as neither would be more specific. The system
> > routing table would throw an error on such attempts, but wireguard
> > silently discards the old route keeping only the last one,
> > so you need to be careful here.
> >
> >
> > Such is basic routing. In more complicated scenarios:
> > - routing rules select the routing table
> > - iptables/nftables can change addresses, select devices, even clone pa=
ckets
> > - namespaces can nearly create an isolated network host/partition
> > and you can also have xfrm encapsulation, maybe vdevs do something..
> > All of this is either before the packet enters wireguard device
> > (where wireguard routing is done), and/or after the packet is
> > encapsulated/decapsulated (encrypted/decrypted) and processed again.
> >
> >
> > When a packet is received, the system may also check the routing
> > table for the source/peer address, and if the source device
> > doesn't match the routing table entry, the packet would be discarded
> > - so called reverse path filtering.
> > Initial lookup of the encapsulated packet source in the system
> > routing table is governed by the rp_filter setting.
> > When a packet is processed by wireguard, the inner, decapsulated
> > source is unconditionally checked for in the device routing table
> > and packet discarded if peer doesn't match - i.e. the peer's allowed
> > IPs must match, and also be the single most specific match.
> > After wireguard decapsulation, the inner packet is again processes
> > by the system, possibly checking the ips.
> >
> >
> > Regards,
> > Ivan
>
