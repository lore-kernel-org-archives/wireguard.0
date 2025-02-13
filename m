Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D403C2D0CD
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 09:18:09 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 416dfd06;
	Tue, 20 May 2025 19:40:47 +0000 (UTC)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4a40d080
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 13 Feb 2025 08:36:41 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4395dddb07dso6278815e9.2
 for <wireguard@lists.zx2c4.com>; Thu, 13 Feb 2025 00:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739435800; x=1740040600; darn=lists.zx2c4.com;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lEMTU9K2wwIY9JpwBI5RzgY3pZNF2c520syU90CJZKI=;
 b=ZrvBXdD9DWlK3RHelpoyv/mcxp3hDqzbEJe3Cj9jPSuIutKtQdwpgG8DoH2uPwLs8R
 t/7X5FY6w7+Hpej6zTTz9CzBKWwVFToSHgln/isZIL6AqXp/TBIGmes2MUyM0E+f0QGJ
 47vfyjvfiumPsUi88wccGqCoCeAev1s/xdhy8YR1geYsgpoKpBFk5Y058Haq1+1ej9wB
 RTRbdSILFp0EDX9UYAblT+15/1IhFvHjnpM81haEtcSjPhLtP3UNsJ+e8BY4Hsqtj+yj
 Irr5sVECakZisRDiWPnWH9dDQFkgTmxh7F2uVysaysbqz20r7DPsQi/50e3GhFT+8ymi
 Vbqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739435800; x=1740040600;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lEMTU9K2wwIY9JpwBI5RzgY3pZNF2c520syU90CJZKI=;
 b=nNmIuFi6fsMXp12xhVumPAqwl0c/Jy/4TGbb6wTXBEpRWxiEAy43n12bGLN3IZ8Twr
 e5/RPFSJ65Zeg8SnH3fScstAPKjslaFbVljo3QqbPrda3vlEPcMOcvGxEAe1daNvcD1E
 1fYTu3CcHp8vPsuR5B79g9mD3ysHbileMwoVY4fLS/3ffjSDLY48y2M1rzkRWrgEr2Ec
 aQymFfFCiUB8Nbz0seJTPnJdOpBajYwW2f/O2R8Ng6fjEjh0sBpnWn2fZTLsyUAJQJmv
 xYDFpR8sldjRIQi23GuURbG9XVo5lTg2Ft4KAmPWnXvpP0O4UyZLCK2E9oTxQ/w3SOhZ
 7zfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdC9j8gttuNQvzEHxZmY5mYZWifWmZlrsLc+zEbeTZIcpa0WjFjIeaTjk6LE5ksK5BfOHVp1W4QOA=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YyWbmkm5kXxTEGpK3BIHIIH81mQ4YvKkdYXPRvxXtNuqc/UF1os
 q7N5NOn1gQS2EwaHq66uedge1J9Cl4FjcTUbcE41V1nZcYl3l205+KFNJWDIH6ZgwcjSW77xVGG
 ORfQgEBO+cXxQ3h1qJk0thav/5E4=
X-Gm-Gg: ASbGnct5Qe8LbA+ZBvT36V8LwlQm3aPmb8NLI9S+V/zUvasgMFBmftxjqGpvLfy9lW+
 i7pQ2mmiiBx1w7cgTK5KuqAPY7UWOp6DeXO0sgNcvuADY6JC+g84OVTXp87Ml68fRwSBv17k=
X-Google-Smtp-Source: AGHT+IEezeJ/RlI8/fvqsCpwdXF55uEWmtOYc3P4zBx3ojP1z2I7SGCdQ1/EUaOR3dd1EY2OITuGZF4nnmEaOHg8QZ0=
X-Received: by 2002:a05:600c:19c8:b0:439:55fc:81a9 with SMTP id
 5b1f17b1804b1-4395816f13dmr68016965e9.7.1739435800139; Thu, 13 Feb 2025
 00:36:40 -0800 (PST)
MIME-Version: 1.0
References: <20250210133002.883422-3-shaw.leon@gmail.com>
 <20250213065348.8507-1-kuniyu@amazon.com>
In-Reply-To: <20250213065348.8507-1-kuniyu@amazon.com>
From: Xiao Liang <shaw.leon@gmail.com>
Date: Thu, 13 Feb 2025 16:36:02 +0800
X-Gm-Features: AWEUYZncbGUNO7oNcYsuGlVcwlKbEKWZpPvVt5uCQTeloMATtiMLOZ95K2VoEX4
Message-ID: <CABAhCOTw+CpiwwRGNtDS3gntTQe7XESNzzi6RXd9ju1xO_a5Hw@mail.gmail.com>
Subject: Re: [PATCH net-next v9 02/11] rtnetlink: Pack newlink() params into
 struct
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

On Thu, Feb 13, 2025 at 2:54=E2=80=AFPM Kuniyuki Iwashima <kuniyu@amazon.co=
m> wrote:
>
[...]
> > diff --git a/include/linux/if_macvlan.h b/include/linux/if_macvlan.h
> > index 523025106a64..0f7281e3e448 100644
> > --- a/include/linux/if_macvlan.h
> > +++ b/include/linux/if_macvlan.h
> > @@ -59,8 +59,10 @@ static inline void macvlan_count_rx(const struct mac=
vlan_dev *vlan,
> >
> >  extern void macvlan_common_setup(struct net_device *dev);
> >
> > -extern int macvlan_common_newlink(struct net *src_net, struct net_devi=
ce *dev,
> > -                               struct nlattr *tb[], struct nlattr *dat=
a[],
> > +struct rtnl_newlink_params;
>
> You can just include <net/rtnetlink.h> and remove it from .c
> files, then this forward declaration will be unnecessary.

OK. Was not sure if it's desirable to include include/net files from
include/linux.

>
>
> > +
> > +extern int macvlan_common_newlink(struct net_device *dev,
> > +                               struct rtnl_newlink_params *params,
> >                                 struct netlink_ext_ack *extack);
> >
> >  extern void macvlan_dellink(struct net_device *dev, struct list_head *=
head);
>
>
> [...]
> > diff --git a/include/net/rtnetlink.h b/include/net/rtnetlink.h
> > index bc0069a8b6ea..00c086ca0c11 100644
> > --- a/include/net/rtnetlink.h
> > +++ b/include/net/rtnetlink.h
> > @@ -69,6 +69,42 @@ static inline int rtnl_msg_family(const struct nlmsg=
hdr *nlh)
> >               return AF_UNSPEC;
> >  }
> >
> > +/**
> > + *   struct rtnl_newlink_params - parameters of rtnl_link_ops::newlink=
()
>
> The '\t' after '*' should be single '\s'.
>
> Same for lines below.
>

This is copied from other structs in the same file. Should I change it?

>
> > + *
> > + *   @net: Netns of interest
> > + *   @src_net: Source netns of rtnetlink socket
> > + *   @link_net: Link netns by IFLA_LINK_NETNSID, NULL if not specified
> > + *   @peer_net: Peer netns
> > + *   @tb: IFLA_* attributes
> > + *   @data: IFLA_INFO_DATA attributes
> > + */
> > +struct rtnl_newlink_params {
>
> [...]
> > +/* Get effective link netns from newlink params. Generally, this is li=
nk_net
> > + * and falls back to src_net. But for compatibility, a driver may * ch=
oose to
> > + * use dev_net(dev) instead.
> > + */
> > +static inline struct net *rtnl_newlink_link_net(struct rtnl_newlink_pa=
rams *p)
> > +{
> > +     return p->link_net ? : p->src_net;
> > +}
> > +
> > +/* Get peer netns from newlink params. Fallback to link netns if peer =
netns is
> > + * not specified explicitly.
> > + */
> > +static inline struct net *rtnl_newlink_peer_net(struct rtnl_newlink_pa=
rams *p)
> > +{
> > +     return p->peer_net ? : rtnl_newlink_link_net(p);
> > +}
>
> These helpers should belong to patch 2 ?

I was trying to split API and driver changes. Can move this to
next patch if it's better.
