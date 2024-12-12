Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 783FFC54E65
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 09:18:39 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cefd9f44;
	Tue, 20 May 2025 19:35:22 +0000 (UTC)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b4c0c563
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Dec 2024 12:41:44 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-434b3e32e9dso6020225e9.2
 for <wireguard@lists.zx2c4.com>; Thu, 12 Dec 2024 04:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734007303; x=1734612103; darn=lists.zx2c4.com;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UdqXBrFz+MhhB28jjWBHlFWKaOr9dT3/Vp6X30ps4DU=;
 b=FMM3Ab3Hr8Ggf8vNy/MzckR2B2wKObymT5C/GNSpQrMPLkPI2YxZWJxNHxk1R6Z188
 mV0GAEA0PMhjjccMxpvtzdUwmnQRvvTUHFQf3wH0rzHRpxDaeOSsStUjvXUS1F1g85f0
 bjF/NLOly65o5M8AMtnVCyTfbd86hwbKLQLNHQVPp1BcMBXZVvbohxmQyUGQZBOyE0MQ
 L9qQ5Hs9yNkLSiY/DFgYtQqgVDzSfyQkANVd3E5QPg4mVeiSLSNgFkyfbj7wDfEyD/jP
 SPYfejYxmtI0qAKW5nQCz7YdZ55QH9zMkqBHe3srsoMrArYaWv/gDtc5njQ4ZGfocEH7
 YXOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734007303; x=1734612103;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UdqXBrFz+MhhB28jjWBHlFWKaOr9dT3/Vp6X30ps4DU=;
 b=mC6KSGXV0ZTqNRri3NsTKPtCAsVjgvXOy/rXumtNh3SxIVjthT5Dx40wirbTdTUU/D
 0F2DiSLGj5RZqSoM6bt94sFoBjAGCTHMXYxM7jQ6rPmutvfUZSnC55il/GfdcnoetiUS
 0tBq5s0oBM45bqOsaxYBJnIWAGvtXWUVNwbHaO8SYpVdv8m3xd5pFXcicXwsBsf8LdP2
 N/Y/ep87yUAaTAZRposKzF/L4F6zwKjf8DmnpUfie01qi2Lp+pZsV0fYgx8mStdsJ3PP
 3C5/HoM3I8TJxpHq5IhIG+3ne/EtUkSNWxSe9psru15abyBaGu/0oH33vLuzweHoopJx
 aPug==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQ4Npb3DB+Yvyxw784L5MDIb+h3n1U5xVKgs37QxQjPaFgs9Cn5FNHm1NdoomppZGmZURGSoSPEBk=@lists.zx2c4.com
X-Gm-Message-State: AOJu0Ywy6k9jTTlkU9y3CX3fSJSqJw5/NLRVEdmm4Nn8cgyug+WYO83t
 NnCq1wI6BjzxFt+aJELJkr2wAZlM5bfjOJvJkrEtc0k2P5dWKmqWkf3SHfpIs6883CUZw5biXJV
 w7I7e87Ca8V4eCg91aP0GT3ae0wI=
X-Gm-Gg: ASbGncstepDhzN/DdEtUA676eZq/hH++7Ra7e8iDmVPF6ydRyAX7XYXIfgnA/yDmMfT
 DcaZiTJDwkouYoUiILb9svfoEsP7N9Pgn3SwI
X-Google-Smtp-Source: AGHT+IFqFk9dpKGWg1iKfKEea53yF0KmGIqYqHw17PI/mHu0HdGMd6qhUvlxmt/ZCzWy1qtAEPF2qQKT7Apiv7Ssc/8=
X-Received: by 2002:a05:6000:a0b:b0:385:f44a:a68 with SMTP id
 ffacd0b85a97d-3878769805bmr3014357f8f.35.1734007303234; Thu, 12 Dec 2024
 04:41:43 -0800 (PST)
MIME-Version: 1.0
References: <20241209140151.231257-1-shaw.leon@gmail.com>
 <20241209140151.231257-4-shaw.leon@gmail.com>
 <2b89667d-ccd6-40b7-b355-1c71e159d14f@redhat.com>
In-Reply-To: <2b89667d-ccd6-40b7-b355-1c71e159d14f@redhat.com>
From: Xiao Liang <shaw.leon@gmail.com>
Date: Thu, 12 Dec 2024 20:41:06 +0800
Message-ID: <CABAhCOTv1tDOXBEE56CL1-S_J6ADZTcvso5GHtkarzJMqOC4xQ@mail.gmail.com>
Subject: Re: [PATCH net-next v5 3/5] rtnetlink: Decouple net namespaces in
 rtnl_newlink_create()
To: Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Kuniyuki Iwashima <kuniyu@amazon.com>, Jakub Kicinski <kuba@kernel.org>, 
 Donald Hunter <donald.hunter@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, 
 David Ahern <dsahern@kernel.org>, Eric Dumazet <edumazet@google.com>, 
 Ido Schimmel <idosch@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
 Jiri Pirko <jiri@resnulli.us>, 
 Hangbin Liu <liuhangbin@gmail.com>, linux-rdma@vger.kernel.org, 
 linux-can@vger.kernel.org, osmocom-net-gprs@lists.osmocom.org, 
 bpf@vger.kernel.org, linux-ppp@vger.kernel.org, wireguard@lists.zx2c4.com, 
 linux-wireless@vger.kernel.org, b.a.t.m.a.n@lists.open-mesh.org, 
 bridge@lists.linux.dev, linux-wpan@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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

On Thu, Dec 12, 2024 at 5:27=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> On 12/9/24 15:01, Xiao Liang wrote:
> > There are 4 net namespaces involved when creating links:
> >
> >  - source netns - where the netlink socket resides,
> >  - target netns - where to put the device being created,
> >  - link netns - netns associated with the device (backend),
> >  - peer netns - netns of peer device.
> >
> > Currently, two nets are passed to newlink() callback - "src_net"
> > parameter and "dev_net" (implicitly in net_device). They are set as
> > follows, depending on netlink attributes.
> >
> >  +------------+-------------------+---------+---------+
> >  | peer netns | IFLA_LINK_NETNSID | src_net | dev_net |
> >  +------------+-------------------+---------+---------+
> >  |            | absent            | source  | target  |
> >  | absent     +-------------------+---------+---------+
> >  |            | present           | link    | link    |
> >  +------------+-------------------+---------+---------+
> >  |            | absent            | peer    | target  |
> >  | present    +-------------------+---------+---------+
> >  |            | present           | peer    | link    |
> >  +------------+-------------------+---------+---------+
> >
> > When IFLA_LINK_NETNSID is present, the device is created in link netns
> > first. This has some side effects, including extra ifindex allocation,
> > ifname validation and link notifications. There's also an extra step to
> > move the device to target netns. These could be avoided if we create it
> > in target netns at the beginning.
> >
> > On the other hand, the meaning of src_net is ambiguous. It varies
> > depending on how parameters are passed. It is the effective link or pee=
r
> > netns by design, but some drivers ignore it and use dev_net instead.
> >
> > This patch refactors netns handling by packing newlink() parameters int=
o
> > a struct, and passing source, link and peer netns as is through this
> > struct. Fallback logic is implemented in helper functions -
> > rtnl_newlink_link_net() and rtnl_newlink_peer_net(). If is not set, pee=
r
> > netns falls back to link netns, and link netns falls back to source net=
ns.
> > rtnl_newlink_create() now creates devices in target netns directly,
> > so dev_net is always target netns.
> >
> > For drivers that use dev_net as fallback of link_netns, current behavio=
r
> > is kept for compatibility.
> >
> > Signed-off-by: Xiao Liang <shaw.leon@gmail.com>
>
> I must admit this patch is way too huge for me to allow any reasonable
> review except that this has the potential of breaking a lot of things.
>
> I think you should be splitted to make it more palatable; i.e.
> - a patch just add the params struct with no semantic changes.
> - a patch making the dev_change_net_namespace() conditional on net !=3D
> tge_net[1]
> - many per-device patches creating directly the device in the target
> namespace.
> - a patch reverting [1]
>
> Other may have different opinions, I'd love to hear them.

Thanks. I understand your concern. Since the device is created in common
code, how about splitting the patch this way:

 1) make the params struct contain both current src_net and other netns:
        struct rtnl_newlink_params {
                struct net *net;        // renamed from current src_net
                struct net *src_net;    // real src_net
                struct net *link_net;
                ...
        };
 2) convert each driver to use the accurate netns,
 3) remove "net", which is not used now, from params struct,
 4) change rtnl_newlink_create() to create device in target netns
    directly.

So 1) will be a big one but has no semantic changes.
And I will send Patch 1 in this series to the net tree instead.

>
> > diff --git a/drivers/net/amt.c b/drivers/net/amt.c
> > index 98c6205ed19f..2f7bf50e05d2 100644
> > --- a/drivers/net/amt.c
> > +++ b/drivers/net/amt.c
> > @@ -3161,14 +3161,17 @@ static int amt_validate(struct nlattr *tb[], st=
ruct nlattr *data[],
> >       return 0;
> >  }
> >
> > -static int amt_newlink(struct net *net, struct net_device *dev,
> > -                    struct nlattr *tb[], struct nlattr *data[],
> > -                    struct netlink_ext_ack *extack)
> > +static int amt_newlink(struct rtnl_newlink_params *params)
> >  {
> > +     struct net_device *dev =3D params->dev;
> > +     struct nlattr **tb =3D params->tb;
> > +     struct nlattr **data =3D params->data;
> > +     struct netlink_ext_ack *extack =3D params->extack;
> > +     struct net *link_net =3D rtnl_newlink_link_net(params);
> >       struct amt_dev *amt =3D netdev_priv(dev);
> >       int err =3D -EINVAL;
>
> Minor nit: here and and many other places, please respect the reverse
> xmas tree order.

Will fix this.
