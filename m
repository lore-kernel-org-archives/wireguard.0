Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8884C54E65
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 09:18:14 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dad31d60;
	Tue, 20 May 2025 19:41:06 +0000 (UTC)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c4583a70
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 14 Feb 2025 09:23:06 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43961c966a8so11032695e9.1
 for <wireguard@lists.zx2c4.com>; Fri, 14 Feb 2025 01:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739524986; x=1740129786; darn=lists.zx2c4.com;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k7BNqikEMUFZIk3bGCtvMWc4aGoto03Aq8Yw25jOfXg=;
 b=PNcCHfLfREk/vRkM4YRd3qDith98u4Yu/Z/bLF7dHNf/YuFNEhJ+FxzCxvJuOSpq3W
 FdqxeDIP/hn2IrFx5t9+R3b90P0rutvkertDhfEw7MIYG3HdPU5B3jflKCT4Sx7gkd2E
 v34vH79tbetCz65lsEpeon6brDME5/u9i6lEtYSPh7iK/v7ROdRpxNt08TFcrJFTQsDI
 tL+g+BI9rrg6ywkhZ6m5nqU7SHH1YAmGUQW3uSQ0lJ87BPllG7cXKwPLk2IQ3uafh3wr
 55qARE/kMVsnlLlb0NZVuRLR1tMbIiP+86PfSDXT0UYfCBUGjZpWhAfRYX2D7kNOnUp8
 guRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739524986; x=1740129786;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k7BNqikEMUFZIk3bGCtvMWc4aGoto03Aq8Yw25jOfXg=;
 b=LYkekYATN8z8MausMaAVQ08b1IR1ILk8I/U/uHvzwaLuFpc2HNx81KtpcZA362HwZZ
 YC6G6LSGjCIo7rLC2RBPJbsje8ZdVZPCwnrX0Am5H8Vch6n3wCcfPhIyVDt6UOa3/6PV
 16UZmzCSS8+jKc3pc2Pu0IWrtwb2BKeXR2T0wABftMkXQADqX8oJsEEdUWRaz6u02Der
 W8hokCtj0CNN3cmWK4wlNazyC/3UBWCxj710IeugLOlmMC1uhbWKlUQFWfG7uOOTYq+K
 AUj0MbUnG6k+oYmATGNLRXGQ03XqRY3VO0t77OqGhu7RJut9bC08pVbjv1cnih0Fs4d0
 tfEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjSgbrh2sQadtFHH1lYkLy5SOA7RJx8AbthvUqTN5UCjmLVavkVF9O+TxcbzS1aMEFTkrjfnKzyAg=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YxCwnOpaAeQvcivKufuKp1vm17CpBRrQifBanxEFh1IzAdHMIAV
 JWm3D6jCHlySr2ZM6mkVRizX0lpzLOlKglvSKR6sJZs64L9WabR7FYD2OUVco8eHBxpf0mbAff9
 y6GtSvZaqj2SrmzVpyTfa9ZyUQsQ=
X-Gm-Gg: ASbGncvUplTXXIsifKXfM+HQutIs8OHhiqpKhUCH8M0MA/59XnWM59xPIS4mILR6+dB
 glKZ74QOYQHFyu5U2cg0SaC8uXLZpbmjMhyMp1MW0m3EUF+8leQ/iNxKuiDIVyVcxZjYFytk=
X-Google-Smtp-Source: AGHT+IFc4q5LtCR4oH56B/JnsUWjOnr2P8qnhLaQaAQF/xsTMWgc84lPizP0lboCQWCd1BP4FsSRkQxEWx0I5MF+EcM=
X-Received: by 2002:a05:6000:18ae:b0:38f:23bc:c19e with SMTP id
 ffacd0b85a97d-38f23bcc233mr9719529f8f.29.1739524985787; Fri, 14 Feb 2025
 01:23:05 -0800 (PST)
MIME-Version: 1.0
References: <CABAhCORgi7Jqu=Aigs6Fc8ewG5OshFvcunye03R43C+Z0ojZyw@mail.gmail.com>
 <20250213110004.38415-1-kuniyu@amazon.com>
In-Reply-To: <20250213110004.38415-1-kuniyu@amazon.com>
From: Xiao Liang <shaw.leon@gmail.com>
Date: Fri, 14 Feb 2025 17:22:28 +0800
X-Gm-Features: AWEUYZmC-_4d4WbO4zj0CDnf9myDuv_5df2UqBnW8RiGwAq7tiZ7QonxxL4s5P4
Message-ID: <CABAhCOSsZqzrsqct+c613TVhGJdubv+_wTDxmjH8z6-PL1Mu2A@mail.gmail.com>
Subject: Re: [PATCH net-next v9 06/11] net: ipv6: Use link netns in newlink()
 of rtnl_link_ops
To: Kuniyuki Iwashima <kuniyu@amazon.com>
Cc: alex.aring@gmail.com, andrew+netdev@lunn.ch, 
 b.a.t.m.a.n@lists.open-mesh.org, bpf@vger.kernel.org, bridge@lists.linux.dev, 
 davem@davemloft.net, donald.hunter@gmail.com, dsahern@kernel.org, 
 edumazet@google.com, herbert@gondor.apana.org.au, horms@kernel.org, 
 kuba@kernel.org, linux-can@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-ppp@vger.kernel.org, 
 linux-rdma@vger.kernel.org, linux-wireless@vger.kernel.org, 
 linux-wpan@vger.kernel.org, miquel.raynal@bootlin.com, netdev@vger.kernel.org, 
 osmocom-net-gprs@lists.osmocom.org, pabeni@redhat.com, shuah@kernel.org, 
 stefan@datenfreihafen.org, steffen.klassert@secunet.com, 
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

On Thu, Feb 13, 2025 at 7:00=E2=80=AFPM Kuniyuki Iwashima <kuniyu@amazon.co=
m> wrote:
>
> From: Xiao Liang <shaw.leon@gmail.com>
> Date: Thu, 13 Feb 2025 17:55:32 +0800
> > On Thu, Feb 13, 2025 at 4:37=E2=80=AFPM Xiao Liang <shaw.leon@gmail.com=
> wrote:
> > >
> > > On Thu, Feb 13, 2025 at 3:05=E2=80=AFPM Kuniyuki Iwashima <kuniyu@ama=
zon.com> wrote:
> > > >
> > > [...]
> > > > > diff --git a/net/ipv6/ip6_gre.c b/net/ipv6/ip6_gre.c
> > > > > index 863852abe8ea..108600dc716f 100644
> > > > > --- a/net/ipv6/ip6_gre.c
> > > > > +++ b/net/ipv6/ip6_gre.c
> > > > > @@ -1498,7 +1498,8 @@ static int ip6gre_tunnel_init_common(struct=
 net_device *dev)
> > > > >       tunnel =3D netdev_priv(dev);
> > > > >
> > > > >       tunnel->dev =3D dev;
> > > > > -     tunnel->net =3D dev_net(dev);
> > > > > +     if (!tunnel->net)
> > > > > +             tunnel->net =3D dev_net(dev);
> > > >
> > > > Same question as patch 5 for here and other parts.
> > > > Do we need this check and assignment ?
> > > >
> > > > ip6gre_newlink_common
> > > > -> nt->net =3D dev_net(dev)
> > > > -> register_netdevice
> > > >   -> ndo_init / ip6gre_tunnel_init()
> > > >     -> ip6gre_tunnel_init_common
> > > >       -> tunnel->net =3D dev_net(dev)
> > >
> > > Will remove this line.
> >
> > However, fb tunnel of ip6_tunnel, ip6_vti and sit can have
> > tunnel->net =3D=3D NULL here. Take ip6_tunnel for example:
> >
> > ip6_tnl_init_net()
> >     -> ip6_fb_tnl_dev_init()
> >     -> register_netdev()
> >         -> register_netdevice()
> >             -> ip6_tnl_dev_init()
> >
> > This code path (including ip6_fb_tnl_dev_init()) doesn't set
> > tunnel->net. But for ip6_gre, ip6gre_fb_tunnel_init() does.
>
> Ah, okay.  Then, let's set net in a single place, which would
> be better than spreading net assignment and adding null check
> in ->ndo_init(), and maybe apply the same to IPv4 tunnels ?

Tunnels are created in three ways: a) rtnetlink newlink,
b) ioctl SIOCADDTUNNEL and c) during per netns init (fb).
The code paths don't have much in common, and refactoring
to set net in a single place is somewhat beyond the scope
of this series. But for now I think we could put a general rule:
net should be set prior to register_netdevice().

For IPv4 tunnels, tunnel->net of a) is set in ip_tunnel_newlink().
b) and c) are set in __ip_tunnel_create():
ip_tunnel_init_net() -> __ip_tunnel_create()
ip_tunnel_ctl() -> ip_tunnel_create() -> __ip_tunnel_create()
So net has already been initialized when register_netdevice()
is called.

But it varies for IPv6 tunnels. Some set net for a) or c) while
some don't. This patch has "fixed" for a). As for c) we can
adopt the way of ip6_gre - setting net in *_fb_tunnel_init(),
then remove the check in ndo_init().

Is it reasonable?

Thanks.
