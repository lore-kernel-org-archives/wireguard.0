Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67EBBCA101F
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 13 Sep 2025 00:24:52 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id df63526b;
	Sat, 13 Sep 2025 00:24:23 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ffe48fea
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 13 Sep 2025 00:24:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 578A6601FC;
 Sat, 13 Sep 2025 00:24:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99B0CC4CEF1;
 Sat, 13 Sep 2025 00:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757723060;
 bh=sxUedUP+MYOFlJfnA//ovQa/iV1ta0xI8YrzfhybySs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RIBMiDKHAVVUuJHNTBDmqerPnclOmfi7GuLsEP09bz8J10RgAeUPNhjQslosxXHAu
 199aUWHzOW9CBiNw4Xy+gTZSpbgD2fVKfFRmvQQYvgNuUUEWiv1z4tpgL4JQ5bUYjG
 hQMqcSQ79TNXWbnmCDUmj6nfQH4JtSJ7NN5dfbnZNPTO+4jFgiSq0GRnMQYsSxUZxO
 bTOy+sMN1I+AHi1EzZOvMkDlMWurdJmFpyiq7gFXc3wOKdC325+Cii6nu1VPzVKPF6
 vi25oDG4KHp/diCBL7WtZ/vt1cegp+Aw0IvPPfA16OGBS058Uw0U87DGEhshW4HNCg
 cm4xItpq1JgZg==
Date: Fri, 12 Sep 2025 17:24:18 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: =?UTF-8?B?QXNiasO4cm4=?= Sloth =?UTF-8?B?VMO4bm5lc2Vu?= <ast@fiberby.net>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Donald Hunter <donald.hunter@gmail.com>, Simon Horman
 <horms@kernel.org>, Jacob Keller <jacob.e.keller@intel.com>, Sabrina
 Dubroca <sd@queasysnail.net>, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v3 06/13] tools: ynl-gen: deduplicate
 fixed_header handling
Message-ID: <20250912172418.1271771d@kernel.org>
In-Reply-To: <20250911200508.79341-7-ast@fiberby.net>
References: <20250911200508.79341-1-ast@fiberby.net>
 <20250911200508.79341-7-ast@fiberby.net>
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

On Thu, 11 Sep 2025 20:04:59 +0000 Asbj=C3=B8rn Sloth T=C3=B8nnesen wrote:
> Fixed headers are handled nearly identical in print_dump(),
> print_req() and put_req_nested(), generalize them and use a
> common function to generate them.
>=20
> This only causes cosmetic changes to tc_netem_attrs_put() in
> tc-user.c.
>=20
> Signed-off-by: Asbj=C3=B8rn Sloth T=C3=B8nnesen <ast@fiberby.net>
> ---
>  tools/net/ynl/pyynl/ynl_gen_c.py | 39 ++++++++++++++++----------------
>  1 file changed, 20 insertions(+), 19 deletions(-)

This only makes the code longer and harder to follow.
