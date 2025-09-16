Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D17CCAC597
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 16 Sep 2025 01:44:35 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 68f1922e;
	Tue, 16 Sep 2025 01:42:17 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6d388978
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 16 Sep 2025 01:42:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 993E84510F;
 Tue, 16 Sep 2025 01:42:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F04BAC4CEF1;
 Tue, 16 Sep 2025 01:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757986933;
 bh=cEbPcPh84M0mskAwQZCusts2IzzcqM/jBUtK/XGRNNQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Hvbr8TxA+7xfE2rx271ZLwyVy9+IGciTMEcZ7EM2y5RNx3VKJSpP9IlvoFyJLlNk9
 zIaz15Bn3SFA343yCVI/Z6bRYryXZ2F2NuypWVGVLqng/Nlbqyupa44DuxsxhlxPE2
 3iAK5CIuQ3xRMG6WNkixbzVbGX7L4us91jiWugVCOjgd0lQ02TEMiKweimbfZ0LoXp
 TEXcY9sTbVcRzlmz965sPWmbG8Lk60r/OA1sMVAkR10yqeem6sWHR6vrGHRjJowJxi
 AZJGRsc1Yf6qw840vLJW6vV8LGot39KZqxshgiPHpDY0cGRjxJJ3Q5xB9wwUtJo/sv
 h5GK+HHrmzyPg==
Date: Mon, 15 Sep 2025 18:42:12 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: =?UTF-8?B?QXNiasO4cm4=?= Sloth =?UTF-8?B?VMO4bm5lc2Vu?= <ast@fiberby.net>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Donald Hunter <donald.hunter@gmail.com>, Simon Horman
 <horms@kernel.org>, Jacob Keller <jacob.e.keller@intel.com>, Sabrina
 Dubroca <sd@queasysnail.net>, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v5 04/11] tools: ynl-gen: refactor local vars
 for .attr_put() callers
Message-ID: <20250915184212.1dc0abf2@kernel.org>
In-Reply-To: <20250915144301.725949-5-ast@fiberby.net>
References: <20250915144301.725949-1-ast@fiberby.net>
 <20250915144301.725949-5-ast@fiberby.net>
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

On Mon, 15 Sep 2025 14:42:49 +0000 Asbj=C3=B8rn Sloth T=C3=B8nnesen wrote:
> Refactor the generation of local variables needed when building
> requests, by moving the logic from put_req_nested() into a new
> helper put_local_vars(), and use the helper before .attr_put() is
> called, thus generating the local variables assumed by .attr_put().
>=20
> Previously only put_req_nested() generated the variables assumed
> by .attr_put(),  print_req() only generated the count iterator `i`,
> and print_dump() neither generated `i` nor `array`.

Reviewed-by: Jakub Kicinski <kuba@kernel.org>
