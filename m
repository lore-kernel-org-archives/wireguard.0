Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1E9FC6FD18
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 22 Apr 2023 11:27:45 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4ade55a7;
	Sat, 22 Apr 2023 11:24:58 +0000 (UTC)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 26f3f7e3
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 22 Apr 2023 11:24:56 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f173af665fso17180595e9.3
 for <wireguard@lists.zx2c4.com>; Sat, 22 Apr 2023 04:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682162696; x=1684754696;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RPOecxbJUngjileDJrgo1zUi48hxv4nfyHRo5rtE2BY=;
 b=Z/KgIZ7THyMg0/H2sLLC9HIszGf/bJEayxM7PJgPJMdz+E63927Hz7fT88GC8sE5Mg
 mrGu20rnBlhEUEpug2stJ53d+S0+5ExF+OQwdYqAH5OnNyUG1YU2VW05CickPEgQdu/f
 nvrLoXipPjdNRw8rQbhzMKpExyGosCOGALZt8o6SKrxmf1rlGyAl0wdMwExsIZBT2jTC
 dF0tOuJr1nnc879ca2AjVinHblTXEdKOp/6EK0wMexV3kYMf410HQWhmuDIUuTmo00ZH
 ZAiIlP11F/TD+Vp51xa9bwY5XsmD8JpceUvHPSH4J1pU0dBDzusYH4WIXEIHRJ59OfqF
 qsEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682162696; x=1684754696;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RPOecxbJUngjileDJrgo1zUi48hxv4nfyHRo5rtE2BY=;
 b=ScGc9hRvAjQ7gSxhyuPGMeukWNZI2qUZ8SkJ74hXsstgArcBH9Iobfc+quyfHafOgd
 TUwds+h8irZzLNWW9CFm6O19/EtGka8pdBApMqGlrpnlQINoc0m/eYtwgVNZDAyGz3Au
 lwHsgG1Y1VmWWnElHy33yThbWZs/TChmZrOMRru3NXPP3tgoUJIJLMfUQR3cO7xin6tY
 RQxE4xRMKxQdqTOsH4clcpZjTW4oMW6+JoUr/RjKYhDHKxC7goOwhR+cTE2PVJJgByDA
 ZxtnZOjAchsi3NOTLGVX3cgRErq+rHuSCG+nE09ZaMTIaqhQsapa4RS9wl+uBt5x61/U
 W0Ew==
X-Gm-Message-State: AAQBX9dTJ0P/4S6ICFKEawmKy1NwvSoDWXCuynhlNGhPrBRCP9D7PiOq
 1hXH4RLYtxz9Dxtcj1/Vto5KYXi4Q5q8U+QeBWMSnXTBC9w=
X-Google-Smtp-Source: AKy350azeFiE4vsQEQ9VS8PKTXQMicuyt3JLSM24R/JF/oTpFZkk+oM7tSQio6Nx9yT40xzfoibr1tRz9asoeNw+114=
X-Received: by 2002:a5d:4c4d:0:b0:2d7:a062:ec8 with SMTP id
 n13-20020a5d4c4d000000b002d7a0620ec8mr5775566wrt.41.1682162695749; Sat, 22
 Apr 2023 04:24:55 -0700 (PDT)
MIME-Version: 1.0
References: <da06afd5-82bf-56e7-aa27-394c750a44f8@johnnyutahh.com>
 <a67d212a-3aa5-36da-ce05-37370e22fccf@johnnyutahh.com>
In-Reply-To: <a67d212a-3aa5-36da-ce05-37370e22fccf@johnnyutahh.com>
From: Omkhar Arasaratnam <omkhar@gmail.com>
Date: Sat, 22 Apr 2023 07:24:44 -0400
Message-ID: <CAHx9mscq6+n6jPZMLk5jVza1UDVcoXHd3VEce2P+R79ywiyHUA@mail.gmail.com>
Subject: Re: How to optimize AllowedIPs "overlapping" routes?
To: mailman-wireguard.com@johnnyutahh.com
Cc: wireguard@lists.zx2c4.com
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

Rather than using the route setup logic in wg-quick, you could
manually set the default gateway for (1) and add a more specific route
for (2) in your route table. iirc (in Linux anyway...) the more
specific route would take higher precedence.

--oa


--oa


On Sat, Apr 22, 2023 at 7:18=E2=80=AFAM Johnny Utahh
<mailman-wireguard.com@johnnyutahh.com> wrote:
>
> More discussion here:
>
> https://www.reddit.com/r/WireGuard/comments/12oimvq/how_to_optimize_allow=
edips_overlapping_routes/
>
> Clearly this is FAQ-ish kind of thing. It was a little hard for me to
> easily find a reference for this kind of stuff. I realize the WireGuard
> project may not consider it to be their responsibility to address such
> things.
>
> ~J
>
> On 2023-04-16 10:06 AM, Johnny Utahh wrote:
> > 1. wg0.conf: AllowedIPs =3D 0.0.0.0/0, ::0/0 --> higher-latency network
> > 2. wg1.conf: AllowedIPs =3D 192.168.7.0/24   --> much-lower-latency net=
work
> >
> > When enabling both of the devices/.conf's (listed as 1. and 2. above)
> > concurrently, the #2 route travels over #1 (all starting up via
> > 'wg-quick'). In this scenario I'd prefer #2 routing "bypasses" #1 and
> > retain its (#2's) lower-latency path/network. Can this be done, somehow=
?
> >
> > I deduce the "route" for #2 changes when concurrently-enabling #1
> > because the #2-ping-latency immediately and dramatically increases to
> > match #1-network's latency (and immediately reverts to #2's lower
> > latency when #1 is disabled). This hurts my #2 network, badly.
> >
> > I'm running/testing the above on macOS v12.6.3 build 21G419,
> > wireguard-go v0.0.20230223. If not on macOS, might this be feasible on
> > Fedora or Ubuntu?
> >
> > I realize this might be a FAQ. I could not find any docs/resources to
> > help after a brief search, so I'm posting here.
> >
> > [I'm not a networking expert, so I may be butchering various
> > terminology, concepts. I apologize in advance for my ignorance.]
> >
> > ~J
