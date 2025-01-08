Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F998C54E92
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 20 May 2025 22:04:25 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6ae07140;
	Tue, 20 May 2025 19:38:29 +0000 (UTC)
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 916f865d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 8 Jan 2025 08:37:04 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-388cae9eb9fso8651510f8f.3
 for <wireguard@lists.zx2c4.com>; Wed, 08 Jan 2025 00:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736325424; x=1736930224; darn=lists.zx2c4.com;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vvettVxfJ9lYY3or3UxLpfyl/cdkwWLgR9kVNnFx6ho=;
 b=fT6lTDiTh/38UsBWNz/9zmMjD40veHGlXf+Au0TqEprHVdJCiYx8IOrPQwlUVUWMv3
 YRsSAFq3/+7GfSDWvwDWgF6BAYNXo7dDVTGw/je2Hgl97O9bRvpfhFsB1YA4E+53G1/K
 rbJgytcwTCISd+9K2kj6FNNyBMRrHcn5dwYRluhamGiLRrMb7t7eRjqRPyHN4pwzGGHH
 +V+Rc/YkDdPjf+GEzAgSHzp/bYz0OSsW0svdi08y6Y0LGQM1RlqqMR/eW72+AH73lQCN
 QRcZcZnpFxyX1Uk7tr1AFX4lL5XiqzRnYoqk6+M14S7hpFLmN0DQ8GB2d3v2BaoQhoxm
 3ENg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736325424; x=1736930224;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vvettVxfJ9lYY3or3UxLpfyl/cdkwWLgR9kVNnFx6ho=;
 b=gp9wgUegc2S2V3KFTip9gcO6kI7E2cfDradAf5PL97oRPHVOlixwW2snTTAtkf6ZPo
 eCauXDZOLomjMji5OtIORvJ3sDni6oocQ5iKBlCfjKe5FCTQxngZ4s3TljHknai2hm2f
 1WlPdcaCOUovydrTnWX3qGVeyb9zSQ9KOqH9ASFpU8SsLD9rbAuPw4nwn81LqvVD+uUF
 8vpS6ML0wrUKmDbw2KARmOoQVCck4hYzjzlIEpMlBSX/AaPOWshY4+dQKERe/377u55A
 xY2TkoC4HQLrdCKLSDwyf3fjb/rtLBG4CjoflaswWIymvz88Z+qPFZy3gj+tfT5MMfpa
 NTCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxqnOlytP7h1AJkzHxtWKmY1yBB8/Vz/5UhCGpcatOJ+vU63nA3aZE3nen+NIt0X/O1uT0+WWTW2M=@lists.zx2c4.com
X-Gm-Message-State: AOJu0Ywq6jArOCd6gqJ9pjR5NhqOOeB08PDwxuTeh5D+Z3EnvHgg6YkW
 I2CBiUdP4SgmAL5CA9PhdZ6qiqf69ljxl8Y72+SVqQjz8OWU0eZRCFh2HWA/Ss5g2mf2WvkWeLs
 fY72rcosmEyiJNWa9mtXvI/UuHrs=
X-Gm-Gg: ASbGncuomXqGNkYPNLKwGxhuSz3LcKDkV3ZXpjpAI8tdjOjvkD/hE7/wVyZvOS1R/Hu
 qwqhozi8e5db3vmltgDKNnuRu/avUoLE8Owy8
X-Google-Smtp-Source: AGHT+IFnmy3aEmpEtSYOMGcp/W5oHyWUG1cZe2OhDShkb+8U3jvy3oPHzekY3BLrSLnXQaOhfCodhl5ttnW21/EGgAw=
X-Received: by 2002:a05:6000:4712:b0:385:f38e:c0d3 with SMTP id
 ffacd0b85a97d-38a8731a4d3mr1171129f8f.58.1736325423889; Wed, 08 Jan 2025
 00:37:03 -0800 (PST)
MIME-Version: 1.0
References: <20250104125732.17335-1-shaw.leon@gmail.com>
 <20250104125732.17335-3-shaw.leon@gmail.com>
 <20250107123805.748080ab@kernel.org>
In-Reply-To: <20250107123805.748080ab@kernel.org>
From: Xiao Liang <shaw.leon@gmail.com>
Date: Wed, 8 Jan 2025 16:36:26 +0800
X-Gm-Features: AbW1kvZots7MSnDo6hVFO1pdLy0jTDp88J1frKk6l9Bo0g1-dsYfw260dsxsY30
Message-ID: <CABAhCORV_s9m-EJ8914zUXCXt6O_e1wsaOVdSKUtm0Rbvc4orQ@mail.gmail.com>
Subject: Re: [PATCH net-next v7 02/11] rtnetlink: Pack newlink() params into
 struct
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Kuniyuki Iwashima <kuniyu@amazon.com>, Donald Hunter <donald.hunter@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, 
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
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

On Wed, Jan 8, 2025 at 4:38=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wro=
te:
>
> On Sat,  4 Jan 2025 20:57:23 +0800 Xiao Liang wrote:
> > -static int amt_newlink(struct net *net, struct net_device *dev,
> > -                    struct nlattr *tb[], struct nlattr *data[],
> > -                    struct netlink_ext_ack *extack)
> > +static int amt_newlink(struct rtnl_newlink_params *params)
> >  {
> > -     struct amt_dev *amt =3D netdev_priv(dev);
> > +     struct netlink_ext_ack *extack =3D params->extack;
> > +     struct net_device *dev =3D params->dev;
> > +     struct nlattr **data =3D params->data;
> > +     struct nlattr **tb =3D params->tb;
> > +     struct net *net =3D params->net;
> > +     struct amt_dev *amt;
>
> IMHO you packed a little too much into the struct.
> Could you take the dev and the extack back out?

Sure. I thought you were suggesting packing them all
in review of v3...
