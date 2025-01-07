Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBA4CC54E90
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 09:18:13 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dadd1367;
	Tue, 20 May 2025 19:38:17 +0000 (UTC)
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 08363873
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 7 Jan 2025 10:47:16 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-385e3621518so7176027f8f.1
 for <wireguard@lists.zx2c4.com>; Tue, 07 Jan 2025 02:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736246836; x=1736851636; darn=lists.zx2c4.com;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fh0AFKuAKxAUWXpt7kGI1qVooHVbo7SNiy/9flSEnaA=;
 b=lyhPMLjDYAJILkl7jco8uUaa4XevqmdffJ7vOVGdb2dnc5AD3VubSPwHzEuN/lMV0f
 0Op3eCS9RmLLKLbMn4gi2y0+LSJhLXSWH7DgQ6GzFFbY6FT/FFVOvFdxsXiuZtdnLsCr
 c/uyzGRvRruKM1DRiXnh8MhqAtOkShnH+SAYJCsW3PbmlooDUe39NqubNcQB1+G4reVW
 +dGlAQYt0asoYmryVnXK34D6qciBUljaCD4gPf9SybUTKcNcZpR7sFfTSddahtJI9CT+
 k+NC3ixf7KNzOPig1y3Z3HVb1xuCz6yZejkouzUGkrU+t/HGqnmt77LWrKIrN3xBBELh
 VkFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736246836; x=1736851636;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fh0AFKuAKxAUWXpt7kGI1qVooHVbo7SNiy/9flSEnaA=;
 b=cchvUYnDacZi11PVpHNUky35dGRBPHQiRfDdp0hc7r1csC0MV+ZMaWOmEO01EFznvj
 XkoDswXatoVBxpZDnIltLzIhMzNBj46geC6KBoX3t2ePGIyXiH7vGNLxyiA22ErOCyN7
 JnJPsDUBE3duJgCYiEoFo8vqtdKv+4NTfHKv9UzggK9RXR9QrKds0anVHb0IVeemqMgE
 bfzssJ1EdIf6+sCHG8x+BcBVEOivd/7azrnufjzavaAk9wXNJnQ3STsCJ89z90aOzCxS
 cFAadHIu/kh1anE7MGBxr6Wfxk+UMV3xkjFIV/rGaIzEOwgb9oaHUYlD5KOJTr9Z53/Z
 Rd0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXK/dqv9ABgDE40zLEzwnR2nXhu0WmsKz3cdIwirqlMfhSkUKCKSz5FnXYBDwCKH2661qnzdO6XbCk=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YwCn8KGzjT4MlyVSmzqfBsRtYOwwe4+PSns9ltb/2pY83Q+dOFO
 VlgvMxih50Sapz1Ve0jahe22yMBbFcvhWWD/D2yoIr37gzrfHTE4jxmIqxj0HmPalGWajrZSQvM
 fA2IzxPvLmetyLDqEUgu5QGwC3NA=
X-Gm-Gg: ASbGnctMY0NmecSsz37ONYG06dzS3RQsVNh0BKMCq+fGtPprWI/tCkUVon/khOPpICC
 uROSBqQbu8cwfALQg1i4eBcAgHbMK8kJIWN0M
X-Google-Smtp-Source: AGHT+IHp1K2L48YKiIQv0pwnQlZPYX8cMCBbRBU/fwg+IEmnnlA8QF5/odQWLMrNcSpCZK0F/LO3cHqTWVNEZ39orXM=
X-Received: by 2002:a05:6000:480a:b0:386:1cd3:89fa with SMTP id
 ffacd0b85a97d-38a221fa8c6mr57843141f8f.33.1736246835555; Tue, 07 Jan 2025
 02:47:15 -0800 (PST)
MIME-Version: 1.0
References: <20250104125732.17335-1-shaw.leon@gmail.com>
 <20250107085646.42302-1-kuniyu@amazon.com>
In-Reply-To: <20250107085646.42302-1-kuniyu@amazon.com>
From: Xiao Liang <shaw.leon@gmail.com>
Date: Tue, 7 Jan 2025 18:46:38 +0800
Message-ID: <CABAhCOQAqspiaFO-486UtZpEWsua51f+1f6-LocNhHVfAqW=NQ@mail.gmail.com>
Subject: Re: [PATCH net-next v7 00/11] net: Improve netns handling in rtnetlink
To: Kuniyuki Iwashima <kuniyu@amazon.com>
Cc: andrew+netdev@lunn.ch, b.a.t.m.a.n@lists.open-mesh.org, 
 bpf@vger.kernel.org, bridge@lists.linux.dev, davem@davemloft.net, 
 donald.hunter@gmail.com, dsahern@kernel.org, edumazet@google.com, 
 horms@kernel.org, idosch@nvidia.com, jiri@resnulli.us, kuba@kernel.org, 
 linux-can@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-ppp@vger.kernel.org, 
 linux-rdma@vger.kernel.org, linux-wireless@vger.kernel.org, 
 linux-wpan@vger.kernel.org, liuhangbin@gmail.com, netdev@vger.kernel.org, 
 osmocom-net-gprs@lists.osmocom.org, pabeni@redhat.com, shuah@kernel.org, 
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

On Tue, Jan 7, 2025 at 4:57=E2=80=AFPM Kuniyuki Iwashima <kuniyu@amazon.com=
> wrote:
>
> From: Xiao Liang <shaw.leon@gmail.com>
> Date: Sat,  4 Jan 2025 20:57:21 +0800
[...]
> > - In amt_newlink() drivers/net/amt.c:
> >
> >     amt->net =3D net;
> >     ...
> >     amt->stream_dev =3D dev_get_by_index(net, ...
> >
> >   Uses net, but amt_lookup_upper_dev() only searches in dev_net.
> >   So the AMT device may not be properly deleted if it's in a different
> >   netns from lower dev.
>
> I think you are right, and the upper device will be leaked
> and UAF will happen.
>
> amt must manage a list linked to a lower dev.
>
> Given no one has reported the issue, another option would be
> drop cross netns support in a short period.

Yes. I also noticed AMT sets dev->netns_local to prevent netns
change. Probably it also assumes the same netns during creation.

[...]
> >
> > - In gtp_newlink() in drivers/net/gtp.c:
> >
> >     gtp->net =3D src_net;
> >     ...
> >     gn =3D net_generic(dev_net(dev), gtp_net_id);
> >     list_add_rcu(&gtp->list, &gn->gtp_dev_list);
> >
> >   Uses src_net, but priv is linked to list in dev_net. So it may not be
> >   properly deleted on removal of link netns.
>
> The device is linked to a list in the same netns, so the
> device will not be leaked.  See gtp_net_exit_batch_rtnl().
>
> Rather, the problem is the udp tunnel socket netns could be
> freed earlier than the dev netns.

Yes, you're right. Actually I mean the netns of the socket by "link netns"
(there's some clarification about this in patch 02).

[...]
> >
> > - In pfcp_newlink() in drivers/net/pfcp.c:
> >
> >     pfcp->net =3D net;
> >     ...
> >     pn =3D net_generic(dev_net(dev), pfcp_net_id);
> >     list_add_rcu(&pfcp->list, &pn->pfcp_dev_list);
> >
> >   Same as above.
>
> I haven't tested pfcp but it seems to have the same problem.
>
> I'll post patches for gtp and pfcp.
>

It would be nice.

>
> >
> > - In lowpan_newlink() in net/ieee802154/6lowpan/core.c:
> >
> >     wdev =3D dev_get_by_index(dev_net(ldev), nla_get_u32(tb[IFLA_LINK])=
);
> >
> >   Looks for IFLA_LINK in dev_net, but in theory the ifindex is defined
> >   in link netns.
>
> I guess you mean the ifindex is defined in src_net instead.
> Not sure if it's too late to change the behaviour.

Yes, it's source net for lowpan. I think it depends on whether
the interpretation of IFLA_LINK should be considered as part API
provided by rtnetlink core, or something customizable by driver.
In the former case, this can be considered as a bug.

Thanks.
