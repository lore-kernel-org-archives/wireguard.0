Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D34CA1000
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  1 Sep 2025 19:02:22 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1d06d43d;
	Mon, 1 Sep 2025 18:56:55 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7d67ba6a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 1 Sep 2025 18:56:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0307E60008;
 Mon,  1 Sep 2025 18:56:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FCA0C4CEF0;
 Mon,  1 Sep 2025 18:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756753011;
 bh=WMeBQ5LaQhNBOxQYP4YDZIlEjORXejgbydjuanvpe5c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=q7Rq/QKB5e/77qPGwxGk1p6BzygRX5C61NxXehq2AmHRxsjKRQxcolFzp6syuHS5P
 hN98tge7DuoNLlmHDeb0HOqS7FwZ9VAQ4cZGKQpPXHBg52avfYmx196O0gsWVSW1xF
 b0kEJHSSPtUn0GPHbWZnN2DyospER+QKUwJYOMTo99OAI5LvAUJDUoJyiFPFC1PlNZ
 a3SQWiWaLR2YflzVbe2SGDbTVSjRYbLdVrwGN0HHlsvFQe7sMbjvTBOIB+5o+qHODl
 qoblnIYsMBKMnnQlkVQyXEz8GxenTjbnjX0BUUQdOIbHZ+Jhh08jDPt6UuY3w+X5ZL
 84g7ulCXhmeuQ==
Date: Mon, 1 Sep 2025 11:56:50 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: =?UTF-8?B?QXNiasO4cm4=?= Sloth =?UTF-8?B?VMO4bm5lc2Vu?= <ast@fiberby.net>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Donald Hunter
 <donald.hunter@gmail.com>, Simon Horman <horms@kernel.org>, Jacob Keller
 <jacob.e.keller@intel.com>, Stanislav Fomichev <sdf@fomichev.me>, "Matthieu
 Baerts (NGI0)" <matttbe@kernel.org>, David Ahern <dsahern@kernel.org>,
 Chuck Lever <chuck.lever@oracle.com>, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net 3/4] tools: ynl-gen: fix nested array counting
Message-ID: <20250901115650.107e078e@kernel.org>
In-Reply-To: <20250901145034.525518-4-ast@fiberby.net>
References: <20250901145034.525518-1-ast@fiberby.net>
 <20250901145034.525518-4-ast@fiberby.net>
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

On Mon,  1 Sep 2025 14:50:22 +0000 Asbj=C3=B8rn Sloth T=C3=B8nnesen wrote:
> The blamed commit introduced the concept of split attribute
> counting, and later allocating an array to hold them, however
> TypeArrayNest wasn't updated to use the new counting variable.
>=20
> Abbreviated example from tools/net/ynl/generated/nl80211-user.c:
> nl80211_if_combination_attributes_parse(...):
>   unsigned int n_limits =3D 0;
>   [...]
>   ynl_attr_for_each(attr, nlh, yarg->ys->family->hdr_len)
> 	if (type =3D=3D NL80211_IFACE_COMB_LIMITS)
> 		ynl_attr_for_each_nested(attr2, attr)
> 			dst->_count.limits++;
>   if (n_limits) {
> 	dst->_count.limits =3D n_limits;
> 	/* allocate and parse attributes */
>   }
>=20
> In the above example n_limits is guaranteed to always be 0,
> hence the conditional is unsatisfiable and is optimized out.
>=20
> This patch changes the attribute counting to use n_limits++ in the
> attribute counting loop in the above example.

Looks good, thanks!

Reviewed-by: Jakub Kicinski <kuba@kernel.org>
