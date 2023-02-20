Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C132DC6379F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 20 Feb 2023 00:29:05 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 16657508;
	Mon, 20 Feb 2023 00:29:03 +0000 (UTC)
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8f7d5dc8
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Feb 2023 00:29:00 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id i31so3913385eda.12
 for <wireguard@lists.zx2c4.com>; Sun, 19 Feb 2023 16:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u/n0FvTXufl+vJLs/8QZ9OKtJKaPK6PEGqyKCZb3xa0=;
 b=LMStowEvRBTv5JFBYkI69Ueg0xgmglHMqI5Si7rTYzLcmfgODQXuWGbLSHh90tMMqq
 PNO0/Ad5bbctJUSmgLeD9jQBlZA9+HYRdOyGk9ix/Yqg9t5OFPcJF913kqclvCLlNyh3
 Nx5fKC0nEN6H03KeN85gTn0ER2tjTsfN3cIFuNYgmujs2SMD39BdPVbVTgu/f7FqKE16
 /MLdJTb7lKv0FG1F468HbNNvT2S+mjD/cqoz7xsRa4Ov9zprUoB/ip0GLjlNVmuAabwh
 kUoawsMk0az6gO40DKXjx66TVJdtTa7d4vgNsklNDqU2D2ftIrIQCwzERjuOnvt0RRkE
 oX1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u/n0FvTXufl+vJLs/8QZ9OKtJKaPK6PEGqyKCZb3xa0=;
 b=0r87gnq9ihe/0/c2e4vJFEe/y04scPmAUT9nzzRIxuoDspd0ivs2Grzha9nAOlSNZB
 /0k0wbQEa3z2ri1mYD0RkW/S1NcKrJ2KQQD2BdlgeX8YDloXKBz5bVnZLV5Es/QtvG9X
 xb7NMSUuDE1L43V4WD3L+66edMH+5UuvyFZDoBJZK8p01zW2rQfL8+I5HK3Cb0rriCQF
 3uZPIMDqcvB3kOrjUVEjEm7ryxeC8zZb52CM4QxwcDRdBESSgIc/S1vARyuV2FsH8Svs
 NxtKww01SV3wBUBkT65IePn+oHDwKXc56SeSLvyzRwmnHOEcBphLsR4mXEYvOA6mz4NW
 l7jw==
X-Gm-Message-State: AO0yUKVU6rNCYuDtpIlTSyKTDmyUdnrqIB0h7WLQzkFz433365AD5M1d
 syx60Tt3D4CxqSn6CsODvUU2TP15KJIm45DVwss=
X-Google-Smtp-Source: AK7set+Uv7oimQ+DuVjq8dSey957ioyGSpJIUe4VZchGsQSR0bhJYC8KnXIf1HAOCuh/c4YA6Ih/QEJ1VkLy7YdzVto=
X-Received: by 2002:a17:906:ae54:b0:8b8:aef3:f2a9 with SMTP id
 lf20-20020a170906ae5400b008b8aef3f2a9mr2832794ejb.0.1676852939681; Sun, 19
 Feb 2023 16:28:59 -0800 (PST)
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
In-Reply-To: <20230219224200.g5mwcaybee4hujov@House.clients.dxld.at>
From: =?UTF-8?B?5pu554Wc?= <cao88yu@gmail.com>
Date: Mon, 20 Feb 2023 08:28:48 +0800
Message-ID: <CACu-5+0+7h5XjM1xVjK+frwF=dOteoa+wuw_vhesJ7_ek1vfjQ@mail.gmail.com>
Subject: Re: Src addr code review (Was: Source IP incorrect on multi homed
 systems)
To: =?UTF-8?Q?Daniel_Gr=C3=B6ber?= <dxld@darkboxed.org>
Cc: Nico Schottelius <nico.schottelius@ungleich.ch>,
 Roman Mamedov <rm@romanrm.net>, 
 tlhackque <tlhackque@yahoo.com>, wireguard@lists.zx2c4.com
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

Hi all,
I've hacked that source code myself months ago, and it works well on
my use case (I have 4 dual stack pppoe wan set on my openwrt router,
and seted a wireguard sever on it), my hack will pickup the dst_addr
from incoming handshake packet in kernel sk_buff, and then use that
addr as src_addr to reply.
I'm not good at source code, and I know that my hack may be ugly, but
it works, hope this patch can help:
https://github.com/openwrt/packages/issues/9538#issuecomment-1150592803

Daniel Gr=C3=B6ber <dxld@darkboxed.org> =E4=BA=8E2023=E5=B9=B42=E6=9C=8820=
=E6=97=A5=E5=91=A8=E4=B8=80 06:42=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi,
>
> I though it might be useful to do some quick and dirty code review instea=
d
> of speculating wildly to figure out where these source IP selection
> problems could be coming from ;)
>
> From previous code deep dives I know the udp_tunnel_xmit_skb function is
> where tunnel packets get handed off to the kernel. So in
> net/wireguard/socket.c:send4 we have:
>
>         udp_tunnel_xmit_skb(rt, sock, skb, fl.saddr, fl.daddr, ds,
>                             ip4_dst_hoplimit(&rt->dst), 0, fl.fl4_sport,
>                             fl.fl4_dport, false, false);
>
> Where fl.saddr is the source address that's supposedly wrong (sometimes? =
I
> guess?) Where does that come from?
>
> Let's look at the code (heavily culled):
>
>         struct flowi4 fl =3D {
>                 .saddr =3D endpoint->src4.s_addr,
>         };
>         if (cache)
>                 rt =3D dst_cache_get_ip4(cache, &fl.saddr);
>         if (!rt) {
>                 if (unlikely(!inet_confirm_addr(sock_net(sock), NULL, 0,
>                                                 fl.saddr, RT_SCOPE_HOST))=
)
>                         fl.saddr =3D 0;
>                 if (unlikely(endpoint->src_if4 && ((IS_ERR(rt) &&
>                              PTR_ERR(rt) =3D=3D -EINVAL) || (!IS_ERR(rt) =
&&
>                              rt->dst.dev->ifindex !=3D endpoint->src_if4)=
)))
>                         fl.saddr =3D 0;
>
> Well it's initialized from endpoint->src4.s_addr, overwritten with zero i=
n
> some cases, which I believe lets the kernel do it's regular source addr
> selection, and populated from something called dst_cache at some callsite=
s.
>
> @Nico could it perhaps simply be that you're hitting one of these zero'in=
g
> cases and that's why it's using regular kernel src addr selection instead
> of the cached endpoint src4 address?
>
> The first case !inet_confirm_addr(..., RT_SCOPE_HOST) ought to confirm th=
at
> the saddr is actually still a local address. Makes sens if the address we
> remembered was removed from the interface we can't use it anymore.
>
> The second case looks like it's checking if the (sometimes cached) src_if=
4
> interface index is still what the route we're about to use points to.
>
> If neither of those seem likely we can keep reading :)
>
> --Daniel
>
>
>
