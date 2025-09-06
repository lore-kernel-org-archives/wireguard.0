Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A78E8CAC582
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  6 Sep 2025 01:05:52 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dee87aa9;
	Sat, 6 Sep 2025 00:23:42 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c95d44e1
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 6 Sep 2025 00:23:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A00FD434AF;
 Sat,  6 Sep 2025 00:23:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0985FC4CEF1;
 Sat,  6 Sep 2025 00:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757118215;
 bh=L8nEyxH2OcNHjbrIDBll/zbPI+80XGl4Dz7SH0zFTyo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=B0gNFZSR3XJPLWuaVo28q+wVcijzhaCLZHZccf0DBwYO1070BBHZa4fJw0QwYMAYX
 ngr3FLqEH/+cHxqKZxLgqRNkqs11hsx5YHSI5j3XbfWomKhG+02Ag6UlTKw1d6wxFI
 brDhZXuhEIYW1oQVfr3MfavaH6sulC0w/ltogDS3NNuOGPooRBSkXmTAVeeot/KmCD
 UscqXKUrkoFuj5Pj3aPRD97RI8m0axVHklXwTxjrxJ2pB9D4sJI3wqfsGCmzhtOunU
 bvL9irJ/uFzQgpnKH0LJbYNAmRB2E+2zZqSAEOGXb8YDMUS9zxL7mAEQQAp+f8N/yX
 6/Zxe12D5K5nw==
Date: Fri, 5 Sep 2025 17:23:34 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: =?UTF-8?B?QXNiasO4cm4=?= Sloth =?UTF-8?B?VMO4bm5lc2Vu?= <ast@fiberby.net>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Donald Hunter <donald.hunter@gmail.com>, Simon Horman
 <horms@kernel.org>, Jacob Keller <jacob.e.keller@intel.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 06/11] tools: ynl-gen: don't validate nested
 array attribute types
Message-ID: <20250905172334.0411e05e@kernel.org>
In-Reply-To: <20250904220156.1006541-6-ast@fiberby.net>
References: <20250904-wg-ynl-prep@fiberby.net>
 <20250904220156.1006541-6-ast@fiberby.net>
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

On Thu,  4 Sep 2025 22:01:29 +0000 Asbj=C3=B8rn Sloth T=C3=B8nnesen wrote:
> In nested arrays don't require that the intermediate
> attribute type should be a valid attribute type, it
> might just be an index or simple 0, it is often not
> even used.
>=20
> See include/net/netlink.h about NLA_NESTED_ARRAY:
> > The difference to NLA_NESTED is the structure:
> > NLA_NESTED has the nested attributes directly inside
> > while an array has the nested attributes at another
> > level down and the attribute types directly in the
> > nesting don't matter. =20

I don't understand, please provide more details.
This is an ArrayNest, right?

[ARRAY-ATTR]
  [ENTRY]
    [MEMBER1]
    [MEMBER2]
  [ENTRY]
    [MEMBER1]
    [MEMBER2]

Which level are you saying doesn't matter?
If entry is a nest it must be a valid nest.
What the comment you're quoting is saying is that the nla_type of ENTRY
doesn't matter.
