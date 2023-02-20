Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A264CC05027
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 20 Feb 2023 11:21:16 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 745cc9d2;
	Mon, 20 Feb 2023 11:21:14 +0000 (UTC)
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ddfc9e7a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Feb 2023 11:21:12 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id h32so3469226eda.2
 for <wireguard@lists.zx2c4.com>; Mon, 20 Feb 2023 03:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pg4TW+9K98UvR/mFnPpocCzv2/yMBuKAP/7WBvgbIhI=;
 b=HBh/NKLg34FghiUgn+6IqydxHCE/Q1h+PeAkkYZxYSKehnY1D9oWeyP4BAVJGdqc3F
 bDw0hKO0SElKAUY8kKMuXOG2nBokUJmpkcPMba4bjo18qIn11rQLORCLO5m/PHnjOdE2
 kVoaYZGiAbQ5XjglhHihYbEludEJVzqDfkGNj5oJUi5iplx+VYUf4krNO19XuIpkJI8D
 LFAGXXcDLyVYTdOEQI9dsqTPaVA42BBgU5XEIb51LhnuFD8tLRj58zJuxOrVOysYO/oP
 U3nYNyzAP7eAXzeReSCt2+E2KgJ76nZBmwO/vsEv2hnShyKyaIo0BGXSCLRxW57h9SdF
 BHEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pg4TW+9K98UvR/mFnPpocCzv2/yMBuKAP/7WBvgbIhI=;
 b=sIAGH8ypRTzjzFDwFutE071As3N52dqkRX+PcR9s5srrc0BNIl3/MmGRo0snR+9K7W
 tEwHjIQ6++c1nsEHJo2sTVdZ2IWbCn5WRM3SKbFqGo8qTUA2VFo07Ry1sDw0pDMFjV7L
 cPhGo8rhmthZkg01L4oiMbMlDSm27LS4wUzCRW066+LPscuQPA79PKZcPjKjVgBeECQ7
 O+aJOthQZPpo62gwSmkj//9TQtVjLTqAxXlxymLgHF44hhsB26T9Su0cKq1XKCqFm3rb
 2ar/ouVzVWoX0B72eoPvQSCOM3Cp7IsKhgv2QpzucWKm6zXH6l5dO4jAz8xwHlXQFInx
 Mu6w==
X-Gm-Message-State: AO0yUKXeLQ1yBrKoVoU+YpSWwinWqebH1w6xVBOJSrXtUWWlBV5M/Q5U
 KIGH2Lan2AXb+AuWU9qWbMPEtwh6ftKgRTJxW57poJnnDFg=
X-Google-Smtp-Source: AK7set9IVLuj1saFVV3uRJ6Yg+A6IzMU2NlyMsP2s/sfsw0HmmQNzkEb4BynrXmqjHYeB82ru6zTr3bovf/luophQqk=
X-Received: by 2002:a50:bb09:0:b0:4ab:49b9:686d with SMTP id
 y9-20020a50bb09000000b004ab49b9686dmr2963ede.1.1676892072147; Mon, 20 Feb
 2023 03:21:12 -0800 (PST)
MIME-Version: 1.0
References: <875yby83n2.fsf@ungleich.ch>
 <2ed829aaed9fec59ac2a9b32c4ce0a9005b8d8b850be81c81a226791855fe4eb@mu.id>
 <87ttzhc0jt.fsf@ungleich.ch> <7d7bc930-65d9-f13e-cedc-e0451407be85@chil.at>
 <CAJJxGdGSYR_mofRVpZDQsifjZJXXSNNsPqUV-RfWDMO0N2P2dQ@mail.gmail.com>
 <bdeefdd3-d821-591f-b5fc-701be0e345fb@yahoo.com>
 <c2bc4ed2-e8c5-ff68-9fe8-c59c8be2804c@yahoo.com>
 <87o7pp76a2.fsf@ungleich.ch> <20230220014252.21178988@nvm>
 <87h6vh72d4.fsf@ungleich.ch>
 <20230219224200.g5mwcaybee4hujov@House.clients.dxld.at>
 <CACu-5+0+7h5XjM1xVjK+frwF=dOteoa+wuw_vhesJ7_ek1vfjQ@mail.gmail.com>
 <87sff0oc06.fsf@ungleich.ch>
In-Reply-To: <87sff0oc06.fsf@ungleich.ch>
From: =?UTF-8?B?5pu554Wc?= <cao88yu@gmail.com>
Date: Mon, 20 Feb 2023 19:21:07 +0800
Message-ID: <CACu-5+1sJV9wLN_unK_C4GK32sOjmqaB0MK1vbw__GaNFLZgPQ@mail.gmail.com>
Subject: Re: Src addr code review (Was: Source IP incorrect on multi homed
 systems)
To: Nico Schottelius <nico.schottelius@ungleich.ch>
Cc: =?UTF-8?Q?Daniel_Gr=C3=B6ber?= <dxld@darkboxed.org>, 
 Roman Mamedov <rm@romanrm.net>, tlhackque <tlhackque@yahoo.com>,
 wireguard@lists.zx2c4.com
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

Hi Nico,
That issue was closed by myself, but the patch didn't get applied
cause the issue was came from wireguard itself, and the maintener told
me that I should send my patch to wireguard upstream (but I just gave
up for sending it to wireguard team).

Nico Schottelius <nico.schottelius@ungleich.ch> =E4=BA=8E2023=E5=B9=B42=E6=
=9C=8820=E6=97=A5=E5=91=A8=E4=B8=80 18:41=E5=86=99=E9=81=93=EF=BC=9A
>
>
> Hello =E6=9B=B9=E7=85=9C,
>
> on github it seems your patch was applied / the issue was closed - is
> that the correct current status?
>
> Best regards,
>
> Nico
>
> =E6=9B=B9=E7=85=9C <cao88yu@gmail.com> writes:
>
> > Hi all,
> > I've hacked that source code myself months ago, and it works well on
> > my use case (I have 4 dual stack pppoe wan set on my openwrt router,
> > and seted a wireguard sever on it), my hack will pickup the dst_addr
> > from incoming handshake packet in kernel sk_buff, and then use that
> > addr as src_addr to reply.
> > I'm not good at source code, and I know that my hack may be ugly, but
> > it works, hope this patch can help:
> > https://github.com/openwrt/packages/issues/9538#issuecomment-1150592803
> >
> > Daniel Gr=C3=B6ber <dxld@darkboxed.org> =E4=BA=8E2023=E5=B9=B42=E6=9C=
=8820=E6=97=A5=E5=91=A8=E4=B8=80 06:42=E5=86=99=E9=81=93=EF=BC=9A
> >>
> >> Hi,
> >>
> >> I though it might be useful to do some quick and dirty code review ins=
tead
> >> of speculating wildly to figure out where these source IP selection
> >> problems could be coming from ;)
> >>
> >> From previous code deep dives I know the udp_tunnel_xmit_skb function =
is
> >> where tunnel packets get handed off to the kernel. So in
> >> net/wireguard/socket.c:send4 we have:
> >>
> >>         udp_tunnel_xmit_skb(rt, sock, skb, fl.saddr, fl.daddr, ds,
> >>                             ip4_dst_hoplimit(&rt->dst), 0, fl.fl4_spor=
t,
> >>                             fl.fl4_dport, false, false);
> >>
> >> Where fl.saddr is the source address that's supposedly wrong (sometime=
s? I
> >> guess?) Where does that come from?
> >>
> >> Let's look at the code (heavily culled):
> >>
> >>         struct flowi4 fl =3D {
> >>                 .saddr =3D endpoint->src4.s_addr,
> >>         };
> >>         if (cache)
> >>                 rt =3D dst_cache_get_ip4(cache, &fl.saddr);
> >>         if (!rt) {
> >>                 if (unlikely(!inet_confirm_addr(sock_net(sock), NULL, =
0,
> >>                                                 fl.saddr, RT_SCOPE_HOS=
T)))
> >>                         fl.saddr =3D 0;
> >>                 if (unlikely(endpoint->src_if4 && ((IS_ERR(rt) &&
> >>                              PTR_ERR(rt) =3D=3D -EINVAL) || (!IS_ERR(r=
t) &&
> >>                              rt->dst.dev->ifindex !=3D endpoint->src_i=
f4))))
> >>                         fl.saddr =3D 0;
> >>
> >> Well it's initialized from endpoint->src4.s_addr, overwritten with zer=
o in
> >> some cases, which I believe lets the kernel do it's regular source add=
r
> >> selection, and populated from something called dst_cache at some calls=
ites.
> >>
> >> @Nico could it perhaps simply be that you're hitting one of these zero=
'ing
> >> cases and that's why it's using regular kernel src addr selection inst=
ead
> >> of the cached endpoint src4 address?
> >>
> >> The first case !inet_confirm_addr(..., RT_SCOPE_HOST) ought to confirm=
 that
> >> the saddr is actually still a local address. Makes sens if the address=
 we
> >> remembered was removed from the interface we can't use it anymore.
> >>
> >> The second case looks like it's checking if the (sometimes cached) src=
_if4
> >> interface index is still what the route we're about to use points to.
> >>
> >> If neither of those seem likely we can keep reading :)
> >>
> >> --Daniel
> >>
> >>
> >>
>
>
> --
> Sustainable and modern Infrastructures by ungleich.ch
