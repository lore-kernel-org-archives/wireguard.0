Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B735CC636CC
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 20 Feb 2023 10:41:49 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1ee80f53;
	Mon, 20 Feb 2023 10:41:47 +0000 (UTC)
Received: from smtp.ungleich.ch (smtp.ungleich.ch [185.203.114.86])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4d11583d
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Feb 2023 10:41:42 +0000 (UTC)
Received: from bridge.localdomain (localhost [IPv6:::1])
 by smtp.ungleich.ch (Postfix) with ESMTP id 28EFF20F31;
 Mon, 20 Feb 2023 11:41:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ungleich.ch;
 s=202201; t=1676889682;
 bh=oLn0fCJ9c3RJfHbOEnjZADf6fD6eMpRM4wULa5kGZqY=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=j+BbtWR8C92ix2YALzzhEKibvby+SJWDOfTqt8v/p1fbjMDUyxDFQgv76fM9HFw2u
 WtG0RZYdtqfXb+Bp0HPbJWvBie+DiSi6UYG7SUwJHLi7gGqaT6CCgck6zkNdIJavlI
 xX/BuwYUrgcsJNXapXj03uAG7+xlXq21zO3NAquTTAXBL2i0l9wxTaKBzYlF8c3u2r
 bPcTIi2TvayHN7osBKFWFDJDfA7QIn1oHzyZ/fYrvR+Ydho3+qNvfp6TKBX0rytu68
 eb1el2o60Q6qiiwXeEvOVOLOxBnPD2loiRcZiYX7Qui3RNtWcrU18PJXx5+r2Hugzm
 9sa364bJzCMgw==
Received: by bridge.localdomain (Postfix, from userid 1000)
 id D48061A60049; Mon, 20 Feb 2023 11:40:57 +0100 (CET)
References: <875yby83n2.fsf@ungleich.ch>
 <2ed829aaed9fec59ac2a9b32c4ce0a9005b8d8b850be81c81a226791855fe4eb@mu.id>
 <87ttzhc0jt.fsf@ungleich.ch>
 <7d7bc930-65d9-f13e-cedc-e0451407be85@chil.at>
 <CAJJxGdGSYR_mofRVpZDQsifjZJXXSNNsPqUV-RfWDMO0N2P2dQ@mail.gmail.com>
 <bdeefdd3-d821-591f-b5fc-701be0e345fb@yahoo.com>
 <c2bc4ed2-e8c5-ff68-9fe8-c59c8be2804c@yahoo.com>
 <87o7pp76a2.fsf@ungleich.ch> <20230220014252.21178988@nvm>
 <87h6vh72d4.fsf@ungleich.ch>
 <20230219224200.g5mwcaybee4hujov@House.clients.dxld.at>
 <CACu-5+0+7h5XjM1xVjK+frwF=dOteoa+wuw_vhesJ7_ek1vfjQ@mail.gmail.com>
User-agent: mu4e 1.8.13; emacs 28.2
From: Nico Schottelius <nico.schottelius@ungleich.ch>
To: =?utf-8?B?5pu554Wc?= <cao88yu@gmail.com>
Cc: Daniel =?utf-8?Q?Gr=C3=B6ber?= <dxld@darkboxed.org>, Nico Schottelius
 <nico.schottelius@ungleich.ch>, Roman Mamedov <rm@romanrm.net>, tlhackque
 <tlhackque@yahoo.com>, wireguard@lists.zx2c4.com
Subject: Re: Src addr code review (Was: Source IP incorrect on multi homed
 systems)
Date: Mon, 20 Feb 2023 11:40:28 +0100
In-reply-to: <CACu-5+0+7h5XjM1xVjK+frwF=dOteoa+wuw_vhesJ7_ek1vfjQ@mail.gmail.com>
Message-ID: <87sff0oc06.fsf@ungleich.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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


Hello =E6=9B=B9=E7=85=9C,

on github it seems your patch was applied / the issue was closed - is
that the correct current status?

Best regards,

Nico

=E6=9B=B9=E7=85=9C <cao88yu@gmail.com> writes:

> Hi all,
> I've hacked that source code myself months ago, and it works well on
> my use case (I have 4 dual stack pppoe wan set on my openwrt router,
> and seted a wireguard sever on it), my hack will pickup the dst_addr
> from incoming handshake packet in kernel sk_buff, and then use that
> addr as src_addr to reply.
> I'm not good at source code, and I know that my hack may be ugly, but
> it works, hope this patch can help:
> https://github.com/openwrt/packages/issues/9538#issuecomment-1150592803
>
> Daniel Gr=C3=B6ber <dxld@darkboxed.org> =E4=BA=8E2023=E5=B9=B42=E6=9C=882=
0=E6=97=A5=E5=91=A8=E4=B8=80 06:42=E5=86=99=E9=81=93=EF=BC=9A
>>
>> Hi,
>>
>> I though it might be useful to do some quick and dirty code review inste=
ad
>> of speculating wildly to figure out where these source IP selection
>> problems could be coming from ;)
>>
>> From previous code deep dives I know the udp_tunnel_xmit_skb function is
>> where tunnel packets get handed off to the kernel. So in
>> net/wireguard/socket.c:send4 we have:
>>
>>         udp_tunnel_xmit_skb(rt, sock, skb, fl.saddr, fl.daddr, ds,
>>                             ip4_dst_hoplimit(&rt->dst), 0, fl.fl4_sport,
>>                             fl.fl4_dport, false, false);
>>
>> Where fl.saddr is the source address that's supposedly wrong (sometimes?=
 I
>> guess?) Where does that come from?
>>
>> Let's look at the code (heavily culled):
>>
>>         struct flowi4 fl =3D {
>>                 .saddr =3D endpoint->src4.s_addr,
>>         };
>>         if (cache)
>>                 rt =3D dst_cache_get_ip4(cache, &fl.saddr);
>>         if (!rt) {
>>                 if (unlikely(!inet_confirm_addr(sock_net(sock), NULL, 0,
>>                                                 fl.saddr, RT_SCOPE_HOST)=
))
>>                         fl.saddr =3D 0;
>>                 if (unlikely(endpoint->src_if4 && ((IS_ERR(rt) &&
>>                              PTR_ERR(rt) =3D=3D -EINVAL) || (!IS_ERR(rt)=
 &&
>>                              rt->dst.dev->ifindex !=3D endpoint->src_if4=
))))
>>                         fl.saddr =3D 0;
>>
>> Well it's initialized from endpoint->src4.s_addr, overwritten with zero =
in
>> some cases, which I believe lets the kernel do it's regular source addr
>> selection, and populated from something called dst_cache at some callsit=
es.
>>
>> @Nico could it perhaps simply be that you're hitting one of these zero'i=
ng
>> cases and that's why it's using regular kernel src addr selection instead
>> of the cached endpoint src4 address?
>>
>> The first case !inet_confirm_addr(..., RT_SCOPE_HOST) ought to confirm t=
hat
>> the saddr is actually still a local address. Makes sens if the address we
>> remembered was removed from the interface we can't use it anymore.
>>
>> The second case looks like it's checking if the (sometimes cached) src_i=
f4
>> interface index is still what the route we're about to use points to.
>>
>> If neither of those seem likely we can keep reading :)
>>
>> --Daniel
>>
>>
>>


--
Sustainable and modern Infrastructures by ungleich.ch
