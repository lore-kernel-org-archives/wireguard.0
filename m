Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB6DAC54E65
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 09:18:30 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0e2862c4;
	Tue, 20 May 2025 19:40:57 +0000 (UTC)
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id aff4fa22
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 13 Feb 2025 09:56:10 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4395b367329so3972685e9.3
 for <wireguard@lists.zx2c4.com>; Thu, 13 Feb 2025 01:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739440570; x=1740045370; darn=lists.zx2c4.com;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6VgtMhO6+jJX1RjKLdoncmTjEAD+6FhglRm1uezg6DA=;
 b=dgSp2l40Wl/s2jRqQdi/Ro3QOQqN7YJOGdpGLTX9MaBxMIuL9J61Hx+lKf6z2iPbLc
 9GCI++dwMykSs2fLAV1NJVRxBDfeoM7xtsgt2wgk18PfUKcAuOJfKRqj4cd2JZH59+Gt
 CICRReJNGrcE4YadFwakVtTLlztJZ5re4R6qhqJlFDLlNII+n+CS+7iA3nok0YWgLIAF
 jEdXfe6ya0GtJvrmn8eUwUJMQk24b7eY67jm8jnWNlQMZ1Y0M+JCmEhnpzaTZ0rtCrni
 RuZ8pslkEJXPEFPxnMMJLgCVio7ehIZAUbTcN95j2O8LTXXm+hmiKOt7BfhTkKO2te6R
 MGTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739440570; x=1740045370;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6VgtMhO6+jJX1RjKLdoncmTjEAD+6FhglRm1uezg6DA=;
 b=e4liGIRUgpmKpkaxGZBrlb47rFClMEEoVePkO+Bb3zYZyssazkJ73LHrPCiYwX8Mv6
 SOb7NQK4iJ6WWNmL56P1RvQkh9b7OAvRG9ZdbDH5336zHy4qkzwyfM8nveJjm7dwiRqA
 yumqWODEzFl7IzW3d/Lmw+LYQ0uqGu/cixFj21lBH+AIluHjJ4NdeNzyL6j/w7GYoYt4
 mvsMwglnwc7keZPWZ+OViijzRUtgJDahlZTlOb9dIaXoCuBBJP7uy9b/2/SXLb2owsnA
 YM0lxgTHJWOJdCYmeZY5hUDKn2ZoDz2ej7mBFhPXg+ArsTkqkhtmcqbGi1QvLxItQA66
 MBtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkfKrp840v+flnwV1J2u/viB+n4DUeTkQIJADDDWK5TeNDn6TEtnhAe4Q03kZXxp19KikjaINFuIM=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YxbOcQqOvTVKjOAhPAvq3fkRcnm2W2lVPiI0CNLSPxe8nCqqphd
 mdQva1rXIf+KzFJLopvBhwHCfWfkqBolL2WRFD7tLFNOGoJZ8anrDIOFq67iOMkl+2fkr729Lez
 C4AMSp1eqF9aftGVz2ZEQYMz/09U=
X-Gm-Gg: ASbGncvf+rlIDj14X7K36Xfjv7ZYDmRIFSEdQH1zrGZuX/Rp5LvWKfPKk7txEyawNkf
 Cs5Ft08BNN3xlPwYtDHM8c/06MzaX8K78PMq12MOXPSma4DSGCVjZSWxHyNuwhdvtsosWdPg=
X-Google-Smtp-Source: AGHT+IF4vz9ZMNWiLlURtMBrw7f64+VQaaApf4FQsQ85yq8rGSoIhlhaKmw+1l1LVh0uOeuQn3pwG9KU0hl60Rc/heo=
X-Received: by 2002:a5d:5889:0:b0:38f:24f9:8bac with SMTP id
 ffacd0b85a97d-38f24f9912fmr1885857f8f.23.1739440569419; Thu, 13 Feb 2025
 01:56:09 -0800 (PST)
MIME-Version: 1.0
References: <20250210133002.883422-7-shaw.leon@gmail.com>
 <20250213070533.9926-1-kuniyu@amazon.com>
 <CABAhCOT8sCV4RgBWwfYjCw2xoZbdiYG8yuWReigx-u5DibTaiA@mail.gmail.com>
In-Reply-To: <CABAhCOT8sCV4RgBWwfYjCw2xoZbdiYG8yuWReigx-u5DibTaiA@mail.gmail.com>
From: Xiao Liang <shaw.leon@gmail.com>
Date: Thu, 13 Feb 2025 17:55:32 +0800
X-Gm-Features: AWEUYZkW9l6r7KSPGBGbQx_PCRCw6eQRHHUgG_KYRCauok2SpPFULcU0b728Vqw
Message-ID: <CABAhCORgi7Jqu=Aigs6Fc8ewG5OshFvcunye03R43C+Z0ojZyw@mail.gmail.com>
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

On Thu, Feb 13, 2025 at 4:37=E2=80=AFPM Xiao Liang <shaw.leon@gmail.com> wr=
ote:
>
> On Thu, Feb 13, 2025 at 3:05=E2=80=AFPM Kuniyuki Iwashima <kuniyu@amazon.=
com> wrote:
> >
> [...]
> > > diff --git a/net/ipv6/ip6_gre.c b/net/ipv6/ip6_gre.c
> > > index 863852abe8ea..108600dc716f 100644
> > > --- a/net/ipv6/ip6_gre.c
> > > +++ b/net/ipv6/ip6_gre.c
> > > @@ -1498,7 +1498,8 @@ static int ip6gre_tunnel_init_common(struct net=
_device *dev)
> > >       tunnel =3D netdev_priv(dev);
> > >
> > >       tunnel->dev =3D dev;
> > > -     tunnel->net =3D dev_net(dev);
> > > +     if (!tunnel->net)
> > > +             tunnel->net =3D dev_net(dev);
> >
> > Same question as patch 5 for here and other parts.
> > Do we need this check and assignment ?
> >
> > ip6gre_newlink_common
> > -> nt->net =3D dev_net(dev)
> > -> register_netdevice
> >   -> ndo_init / ip6gre_tunnel_init()
> >     -> ip6gre_tunnel_init_common
> >       -> tunnel->net =3D dev_net(dev)
>
> Will remove this line.

However, fb tunnel of ip6_tunnel, ip6_vti and sit can have
tunnel->net =3D=3D NULL here. Take ip6_tunnel for example:

ip6_tnl_init_net()
    -> ip6_fb_tnl_dev_init()
    -> register_netdev()
        -> register_netdevice()
            -> ip6_tnl_dev_init()

This code path (including ip6_fb_tnl_dev_init()) doesn't set
tunnel->net. But for ip6_gre, ip6gre_fb_tunnel_init() does.
