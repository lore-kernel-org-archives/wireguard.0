Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 716B4CF648B
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Nov 2025 23:07:49 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id de272f33;
	Wed, 19 Nov 2025 00:53:23 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8436e6fb
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 19 Nov 2025 00:53:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3D5E3435E3;
 Wed, 19 Nov 2025 00:53:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63956C4AF12;
 Wed, 19 Nov 2025 00:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763513598;
 bh=kdl2WMZWDlCFrdcyuc2+LdLt928k5GOWuRvxrCpd7Qs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=h1I0qSAlaTPipkby0PxQ0loeTlahBMxd7/rnsKdgRuk+VHiS7HXvaEHVhyHVca+6Q
 gK5ocBk5/HjBSAgycwE4HoCUGQPe1YMU/43LPrHdUXMiNwPwq9hNf0pqtm39yLF995
 yVEzh/l86WZSDGC3gBQw35bu6inN4T+tdlqQze6fWKPybXDtZm6rxaULRDoGBvBEid
 mCw5b+tNJXGe9809w+o1jSCjEmuouudo0woEH0t+d370DTjKikeu9g/ESD0WT6VLm1
 //RSrJ2fcJXROmBje6cuMVZQ85/y+uAjr9RyFO6foluu8DJ2OnWhA3/suepo7yDaoy
 wQIsKgSmTVMzQ==
Date: Tue, 18 Nov 2025 16:53:15 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: =?UTF-8?B?QXNiasO4cm4=?= Sloth =?UTF-8?B?VMO4bm5lc2Vu?=
 <ast@fiberby.net>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Donald Hunter
 <donald.hunter@gmail.com>, Simon Horman <horms@kernel.org>, Jacob Keller
 <jacob.e.keller@intel.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jordan Rife <jordan@jrife.io>
Subject: Re: [PATCH net-next v3 07/11] uapi: wireguard: generate header with
 ynl-gen
Message-ID: <20251118165315.281a21ca@kernel.org>
In-Reply-To: <aRyOAYuWZE440WQ4@zx2c4.com>
References: <20251105183223.89913-1-ast@fiberby.net>
 <20251105183223.89913-8-ast@fiberby.net>
 <aRyOAYuWZE440WQ4@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

On Tue, 18 Nov 2025 16:17:21 +0100 Jason A. Donenfeld wrote:
> On Wed, Nov 05, 2025 at 06:32:16PM +0000, Asbj=C3=B8rn Sloth T=C3=B8nnese=
n wrote:
> > Use ynl-gen to generate the UAPI header for wireguard.
> > diff --git a/include/uapi/linux/wireguard.h b/include/uapi/linux/wiregu=
ard.h
> > index a2815f4f2910..dc3924d0c552 100644
> > --- a/include/uapi/linux/wireguard.h
> > +++ b/include/uapi/linux/wireguard.h
> > @@ -1,32 +1,28 @@
> > -/* SPDX-License-Identifier: (GPL-2.0 WITH Linux-syscall-note) OR MIT */
> > -/*
> > - * Copyright (C) 2015-2019 Jason A. Donenfeld <Jason@zx2c4.com>. All R=
ights Reserved.
> > - */
> > +/* SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-=
3-Clause) */
> > +/* Do not edit directly, auto-generated from: */
> > +/*	Documentation/netlink/specs/wireguard.yaml */
> > +/* YNL-GEN uapi header */ =20
>=20
> Same desire here -- can this get auto generated at compile time (or in
> headers_install time).

IMHO generating uAPI on the fly has more downsides than benefits.
For one thing people grepping the code and looking and lxr will
never find the definition. All the user space code in tools/ is
generated at build time, but the amount of kernel code we generate
is not significant at this stage. Not significant enough to complicate
everyone's life..
