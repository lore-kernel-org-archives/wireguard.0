Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 536F0CA0FF0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  1 Sep 2025 18:52:13 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d82e8120;
	Mon, 1 Sep 2025 18:50:46 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7f15e446
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 1 Sep 2025 18:50:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 99A0E60008;
 Mon,  1 Sep 2025 18:50:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAE27C4CEF0;
 Mon,  1 Sep 2025 18:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756752643;
 bh=TaDxlRij1DMVVJ7SJ7L4VH6Il0973Q1GT0fLfbvUvgE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lgUHtMHOKguduGbiYVfwrbvQzEjJXroI2/q8xjw4mmexTV/ZpHVyZATn2n0XhV/qw
 pGwXqbpinmwU8Ilyb5/LjRNs2xIzRso0WEcodZQCCRhQlsKAENXwakcGfKIdpaF+mG
 M+Fr7SVpAacSSuQUboeSTewF9wrc8iuZ0BMr1ZB13/RpZjFR6swvc1vIofIm7hGpMF
 VjY0dkN8P8glmTLmvvOGEFtaRHk9XrnZR81QYAESaZ74QlZLh9QPc2pmc12GbEK/iF
 qbsagl9DejiJyf4gZIjUGxUnMJVVGbNq3kL4KtpMp+mufMEkXRoJuqm7fGA6m1MzPF
 qlnZH3iA88nIQ==
Date: Mon, 1 Sep 2025 11:50:41 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: =?UTF-8?B?QXNiasO4cm4=?= Sloth =?UTF-8?B?VMO4bm5lc2Vu?= <ast@fiberby.net>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Donald Hunter
 <donald.hunter@gmail.com>, Simon Horman <horms@kernel.org>, Jacob Keller
 <jacob.e.keller@intel.com>, Stanislav Fomichev <sdf@fomichev.me>, "Matthieu
 Baerts (NGI0)" <matttbe@kernel.org>, David Ahern <dsahern@kernel.org>,
 Chuck Lever <chuck.lever@oracle.com>, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net 1/4] netlink: specs: fou: change local-v6/peer-v6 check
Message-ID: <20250901115041.03d661fa@kernel.org>
In-Reply-To: <20250901145034.525518-2-ast@fiberby.net>
References: <20250901145034.525518-1-ast@fiberby.net>
 <20250901145034.525518-2-ast@fiberby.net>
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

On Mon,  1 Sep 2025 14:50:20 +0000 Asbj=C3=B8rn Sloth T=C3=B8nnesen wrote:
> While fixing the binary min-len implementaion, I noticed that
> the only user, should AFAICT be using exact-len instead.
>=20
> In net/ipv4/fou_core.c FOU_ATTR_LOCAL_V6 and FOU_ATTR_PEER_V6
> are only used for singular IPv6 addresses, a exact-len policy,
> therefore seams like a better fit.
>=20
> AFAICT this was caused by lacking support for the exact-len check
> at the time of the blamed commit, which was later remedied by
> c63ad379526 ("tools: ynl-gen: add support for exact-len validation").

No, take a look at 1d562c32e43. The intention was to keep the code
before and after the same. I agree that the check is not ideal but
it's not really a bug to ignore some input. So if you want to clean
this up -- net-next and no Fixes tag..

> This patch therefore changes the local-v6/peer-v6 attributes to
> use an exact-len check, instead of a min-len check.
