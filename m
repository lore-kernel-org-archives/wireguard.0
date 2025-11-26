Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 549FBD10F28
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 26 Nov 2025 16:28:43 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 12c7dcac;
	Wed, 26 Nov 2025 16:26:30 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 885a2bea
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 26 Nov 2025 16:26:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0CA4D4420B
 for <wireguard@lists.zx2c4.com>; Wed, 26 Nov 2025 16:26:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1495C113D0
 for <wireguard@lists.zx2c4.com>; Wed, 26 Nov 2025 16:26:25 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="PgIbDxLx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1764174381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0qgrp8ZiZmWwsVN3KOkzcx4XHl7+XVN+AKrWgb6Xt0U=;
 b=PgIbDxLxjZXMCcafDa4KB1LEZEzc5CBaryGcWylBb8m1YiZ4HZNptnEjpGKnkUGLZ+x7lZ
 CxV9HWsIi6qrWxZuII811mVb77/7vyGEe9AZCSy9s8WWExPcxEvZT1H1a9qLlz+CviNxIl
 1ZvRFP0UXQVfN1cD1NMYsq5NIRHSPGM=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7d1dca5f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 26 Nov 2025 16:26:20 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id
 46e09a7af769-7c77fc7c11bso824360a34.1
 for <wireguard@lists.zx2c4.com>; Wed, 26 Nov 2025 08:26:20 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWEtJwKolgjSAnVAYm21LBRKgInbKAFJ+yEHkQoFtku03vkwCRXVC+FFYvnUy39YlpfHQz4BJxJBDo=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YxJUaI/NLl/HgynJYXDNGD4BKBtoWTcv/Z0faLkrB/roPVd0Kb6
 BhmG6id4zlrb/bp+XB45/e58EUsa8GKE2fKqujg/7JRQfR060VgC1CbWcw61JDcJNAqrDnczBd9
 UjQ22ozhZFv50eZ9eveC1ljbG49qaZoI=
X-Google-Smtp-Source: AGHT+IG1x6fZtqxKvZTtAuueGJIXHh6boeEFjB536/oD1ZvnaG1RS42xrXQwomgnDlloFJSGha0dxhrca9MI+NZ5Nl0=
X-Received: by 2002:a05:6830:6d85:b0:7c7:6a56:cfb5 with SMTP id
 46e09a7af769-7c798b6cc17mr9283452a34.11.1764174378875; Wed, 26 Nov 2025
 08:26:18 -0800 (PST)
MIME-Version: 1.0
References: <20251105183223.89913-1-ast@fiberby.net>
 <20251105183223.89913-4-ast@fiberby.net>
 <CAHmME9pYvUZ8b9dzWi-XBk9N6A04MzSLELgnBezHUF7FHz-maA@mail.gmail.com>
 <66b74e25-dfbf-4542-9067-cc38b56dbf6e@fiberby.net>
In-Reply-To: <66b74e25-dfbf-4542-9067-cc38b56dbf6e@fiberby.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 26 Nov 2025 17:26:08 +0100
X-Gmail-Original-Message-ID: <CAHmME9qeutDAYXVCgP5fh5gyOimX4iWvDjUszdm_Gny+Yk9H4w@mail.gmail.com>
X-Gm-Features: AWmQ_bl35qjZo2Wa1FfaZ448Mcfkf-D_fX7DT2US7bopJNJWmspW90thmSQ7Lwg
Message-ID: <CAHmME9qeutDAYXVCgP5fh5gyOimX4iWvDjUszdm_Gny+Yk9H4w@mail.gmail.com>
Subject: Re: [PATCH net-next v3 03/11] wireguard: netlink: enable strict
 genetlink validation
To: =?UTF-8?B?QXNiasO4cm4gU2xvdGggVMO4bm5lc2Vu?= <ast@fiberby.net>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Donald Hunter <donald.hunter@gmail.com>, Simon Horman <horms@kernel.org>, 
 Jacob Keller <jacob.e.keller@intel.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jordan Rife <jordan@jrife.io>
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

On Wed, Nov 26, 2025 at 5:25=E2=80=AFPM Asbj=C3=B8rn Sloth T=C3=B8nnesen <a=
st@fiberby.net> wrote:
>
> On 11/18/25 5:10 PM, Jason A. Donenfeld wrote:
> > On Wed, Nov 5, 2025 at 7:32=E2=80=AFPM Asbj=C3=B8rn Sloth T=C3=B8nnesen=
 <ast@fiberby.net> wrote:
> >>   static struct genl_family genl_family __ro_after_init =3D {
> >>          .ops =3D genl_ops,
> >>          .n_ops =3D ARRAY_SIZE(genl_ops),
> >> -       .resv_start_op =3D WG_CMD_SET_DEVICE + 1,
> >>          .name =3D WG_GENL_NAME,
> >>          .version =3D WG_GENL_VERSION,
> >>          .maxattr =3D WGDEVICE_A_MAX,
> >
> > This patch is fine and standalone enough, that I merged it into my
> > wireguard.git devel branch:
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/zx2c4/wireguard-linux.g=
it/commit/?h=3Ddevel&id=3Dfbd8c752a8e3d00341fa7754d6e45e60d6b45490
> >
> > If you wind up rerolling the rest of these, you can do it against that =
branch.
>
> If you update it, so it includes the 2 new net-next commits, then
> I can send v4 based on your tree.

Done.
