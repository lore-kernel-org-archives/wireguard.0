Return-Path: <SRS0=bERg=IP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7A96C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Mar 2021 05:33:46 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B36F764EF6
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Mar 2021 05:33:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B36F764EF6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0bad342e;
	Wed, 17 Mar 2021 05:31:28 +0000 (UTC)
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [2607:f8b0:4864:20::430])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8a9040bf
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Mar 2021 05:31:26 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id y200so325599pfb.5
 for <wireguard@lists.zx2c4.com>; Tue, 16 Mar 2021 22:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=uEZnPqYW7qnR8ThHrxGW44Y5jGTvcbka1xWwc5P+Cac=;
 b=aZ+dX0k2MOpWA7GcjRfDovPAENGurMpx1mgvPdeixf5tPlRrUFDq6Pe5EEiS7pkSSy
 cbLU4Ltc1XEC6L1BmjtbqScUQtPAb0wOadtAp2gDVNGLRuogyrM/G6mMM/nm00wrHPgA
 eshx7UBm7FDWT1JgRwb+Sf6JSxfdWv3tdY/TxEVXZ7h11uahApJUA3mQFseMhyyrcDxQ
 /7lPYvgKDiMZHvJhNO2t0Hg/emhNVxfhB0dB7IaIXMwnQw9MihqwOESlE3s25SAV5WE+
 /eDMWH16iwVhFO/+QUrYa4oNkteqGCZG0+e4PINWWEszojXak3ojk2ARiMNvxryX9f4M
 1MJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uEZnPqYW7qnR8ThHrxGW44Y5jGTvcbka1xWwc5P+Cac=;
 b=KnFzMKyYUrmoXtUWacjooAEQG9/8mp9d+z4186wFE+7B5yWAtoeYttJqp+RIpuGDTM
 SCXquxWTXdbqgCdH0vzq5FYjTBfhxPbof9I+JqjmtjOQsyGB95EvEce+0apWIjlbMItz
 KTdz/sJFnZBPZ/qKKBZAiTyj3WnB3jFkslpb7qN9aPTH8iqGaxHH4YxW1yl9+oOK559z
 gvD3C9+3HydNmknsQFMWLCu4Ha88/V3CJh8lbff3faC82/ODYHlP7GrZQzr/4HiIgGzY
 4P6PAhrfxNsqwVHgOM5GiqO3C/HmsEQPxFGdqrtqkRjYzf2hx3ksRzmZttGTt1//MU7K
 oWuQ==
X-Gm-Message-State: AOAM53011ggRlWus+UJlwguXpPwaewyIJ8bHbC4y8x8jYSTYh4j0F+1c
 98H1L4BmPj+eZNaUm3sURg8QOz3rjwES9w5sdwLcDwLYvMC7LHgp
X-Google-Smtp-Source: ABdhPJz9vAA7YwSwgCEODUqn9tdnuuP0P9ggrVBhIbHrqciIhM4C93S0qqVVTmzWjEGuTLSt779O6wQWPPGbrJxGynI=
X-Received: by 2002:aa7:8d0d:0:b029:1d7:3c52:e1f6 with SMTP id
 j13-20020aa78d0d0000b02901d73c52e1f6mr2684968pfe.39.1615959084258; Tue, 16
 Mar 2021 22:31:24 -0700 (PDT)
MIME-Version: 1.0
References: <CAEK8JBC6Y7utcom7YCz5AX=bHPOkc6cOdMoMKTC=QhqBQwDp_A@mail.gmail.com>
 <b7fb35f2-5d82-b4d6-5add-e18f5d032010@spam-free.eu>
In-Reply-To: <b7fb35f2-5d82-b4d6-5add-e18f5d032010@spam-free.eu>
From: Feng Li <lifeng1519@gmail.com>
Date: Wed, 17 Mar 2021 13:30:58 +0800
Message-ID: <CAEK8JBBpJRo1ShMGJfSRU8OASEDd+LRFWLp0GFRkR7=ruPz1yQ@mail.gmail.com>
Subject: Re: Enhance the "AllowedIPs"
To: Chris <wireguard@spam-free.eu>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Thanks.

Add a route is simple on Linux, But it's not simple for other
platforms, like Windows.
So changes the AllowedIPs is the best option.

On Tue, Mar 16, 2021 at 7:40 PM Chris <wireguard@spam-free.eu> wrote:
>
> Just in case:
> I guess you have already thought about using the post script to add a sep=
arate
> route to 192.160.0.0/16 using the original path with a lower metric.
>
> On 15/03/2021 08:57, Feng Li wrote:
> > Hi,
> >
> > As we know, the AllowedIPs will set the route table. However, if we
> > want to set the CIDR, but except for some CIDR range, it's not so easy
> > and out of the box. For example, if I want to route my all traffic,
> > except the 192.168.0.0/16. I have to calculate the two CIDR
> > difference:
> >
> > AllowedIPs =3D
> > 0.0.0.0/1 + 128.0.0.0/1 - 192.168.0.0/16
> > =3D
> > 0.0.0.0/5,8.0.0.0/7,11.0.0.0/8,12.0.0.0/6,16.0.0.0/4,32.0.0.0/3,64.0.0.=
0/2,128.0.0.0/2,192.0.0.0/9,192.128.0.0/11,192.160.0.0/13,192.169.0.0/16,19=
2.170.0.0/15,192.172.0.0/14,192.176.0.0/12,192.192.0.0/10,193.0.0.0/8,194.0=
.0.0/7,196.0.0.0/6,200.0.0.0/5,208.0.0.0/4,224.0.0.0/3,10.99.0.0/24
> >
> > Is it possible to be built in Wireguard in the future? I think it's ver=
y useful.
> >
> > The discussion link is here:
> > https://www.reddit.com/r/WireGuard/comments/m44fi5/enhance_the_allowedi=
ps/
> >
> > Thanks.
>
