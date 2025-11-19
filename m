Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7707ECF6489
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Nov 2025 23:07:48 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 50ae0c8f;
	Wed, 19 Nov 2025 00:50:37 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c0d64a6f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 19 Nov 2025 00:50:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 331D144028;
 Wed, 19 Nov 2025 00:50:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9576CC2BCB4;
 Wed, 19 Nov 2025 00:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763513431;
 bh=aDNZQ3grOmvLo0XdWNIfUDJpL88GIHWAlZqtP83f/5g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ERlSWBDPFOjY1XAU3/jkzN6ZvXBXZGEhxPAG0oyRHp0rraobLHZUcXNkOGEz3e/SJ
 h6R2bDfOjl5HVcAZsQfNXfNGmc/Husck/1uicI8qHFirFhJvacJQxOBJn0yuu3MM+5
 u9z7Rw07NFcfpfsAqPTc0apXo0lC8AJTYnbdKtOSaNKof3dtuJeQP0F5uE4GVPgx1h
 gSYewrnKv/zV8sP/iXVJjAVuM4DFb+Lew1hqEvw9xau+qw7FjLy8eroVWKvjtOFNJl
 PTA/XWSaYuInInpQOeicOnVzJRcCIwbN97NWhTe1hSeLD9Z+PW7t9lxmOdoOMqtZ9f
 FNlMsCzmP00eQ==
Date: Tue, 18 Nov 2025 16:50:28 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: =?UTF-8?B?QXNiasO4cm4=?= Sloth =?UTF-8?B?VMO4bm5lc2Vu?=
 <ast@fiberby.net>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Donald Hunter
 <donald.hunter@gmail.com>, Simon Horman <horms@kernel.org>, Jacob Keller
 <jacob.e.keller@intel.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jordan Rife <jordan@jrife.io>
Subject: Re: [PATCH net-next v3 04/11] netlink: specs: add specification for
 wireguard
Message-ID: <20251118165028.4e43ee01@kernel.org>
In-Reply-To: <aRz4rs1IpohQpgWf@zx2c4.com>
References: <20251105183223.89913-1-ast@fiberby.net>
 <20251105183223.89913-5-ast@fiberby.net>
 <aRvWzC8qz3iXDAb3@zx2c4.com>
 <f21458b6-f169-4cd3-bd1b-16255c78d6cd@fiberby.net>
 <aRyLoy2iqbkUipZW@zx2c4.com>
 <9871bdc7-774d-4e35-be5f-02d45063d317@fiberby.net>
 <aRz4rs1IpohQpgWf@zx2c4.com>
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

On Tue, 18 Nov 2025 23:52:30 +0100 Jason A. Donenfeld wrote:
> On Tue, Nov 18, 2025 at 09:59:45PM +0000, Asbj=C3=B8rn Sloth T=C3=B8nnese=
n wrote:
> > So "c-function-prefix" or something might work better. =20
>=20
> Also fine with me. I'd just like consistent function naming, one way or
> another.

IIUC we're talking about the prefix for the kernel C codegen?
Feels a bit like a one-off feature to me, but if we care deeply about
it let's add it as a CLI param to the codegen. I don't think it's
necessary to include this in the YAML spec.
