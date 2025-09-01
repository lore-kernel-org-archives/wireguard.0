Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2FAFCA0FF0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  1 Sep 2025 19:02:23 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f39588ad;
	Mon, 1 Sep 2025 18:57:45 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6f6f4fa8
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 1 Sep 2025 18:57:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 31B76438E0;
 Mon,  1 Sep 2025 18:57:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 682CAC4CEF0;
 Mon,  1 Sep 2025 18:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756753062;
 bh=PckdC7F68wIdYoJvngu5KIjJjy9IEm5ftefjYkXfX3I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ImQQgPl/zAxX53chICGr2t8almNcpNLB1ePSo3phCzDJxkLtGDoNCG2MbLDuy1ZTt
 cwliDehEbD0AQ/sMKlhX1+4xgSTEgvtsvDwPjQAcCq2DIoua9WLLnL0uu4ctCoOhC6
 M/CoPbr7tYkUJCpHqQI+w4xSDk5nPPflKpo/uqwMvYbYF2w7JqpNHFP8bYUkjrhaH5
 Ee8LUbNHeeiLF4QJ0BNIntXqxRxtp6BjcCF7CqLT3duzWqiLXEQ1+lWCMf0gVZaVC0
 nlYcf/1hAnHY2oHUJp4TQ87X/aVJ+899MPDDRahuoki7LHLWWiNXgugIxRq6oZO3wG
 QCQFLJUyHQU1g==
Date: Mon, 1 Sep 2025 11:57:40 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: =?UTF-8?B?QXNiasO4cm4=?= Sloth =?UTF-8?B?VMO4bm5lc2Vu?= <ast@fiberby.net>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Donald Hunter
 <donald.hunter@gmail.com>, Simon Horman <horms@kernel.org>, Jacob Keller
 <jacob.e.keller@intel.com>, Stanislav Fomichev <sdf@fomichev.me>, "Matthieu
 Baerts (NGI0)" <matttbe@kernel.org>, David Ahern <dsahern@kernel.org>,
 Chuck Lever <chuck.lever@oracle.com>, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net 4/4] genetlink: fix typo in comment
Message-ID: <20250901115740.686152b9@kernel.org>
In-Reply-To: <20250901145034.525518-5-ast@fiberby.net>
References: <20250901145034.525518-1-ast@fiberby.net>
 <20250901145034.525518-5-ast@fiberby.net>
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

On Mon,  1 Sep 2025 14:50:23 +0000 Asbj=C3=B8rn Sloth T=C3=B8nnesen wrote:
> In this context "not that ..." should properly be "note that ...".
>=20
> Fixes: b8fd60c36a44 ("genetlink: allow families to use split ops directly=
")

Looks good, but this is not a fix, please repost without the Fixes tag
and for net-next.
