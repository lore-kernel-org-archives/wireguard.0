Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2457CA0FED
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  6 Sep 2025 01:05:46 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8dcc082a;
	Sat, 6 Sep 2025 00:12:10 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e8f1351d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 6 Sep 2025 00:12:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 871CA44BBC;
 Sat,  6 Sep 2025 00:12:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1109C4CEF1;
 Sat,  6 Sep 2025 00:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757117526;
 bh=FPIcx5ZD9itca0Z0lBkQaxYvEdw750jRqVZ4wjT495k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=h62Efr5qLZgARqjyjaFXl2uvoWkqdjnsZQ2lCHbkpg7YscQ91b7sSZ0Nma9RWLQ+8
 +7IoCLnrUtJxdbbAGPIPvrrk9xPw7w73OUpUxZIaw0QnuQdXZy8YBGEMR0NSPv4c2h
 RWU4XYyFdXCiudxShp4qneMrIdYsWfp6U7gEwwbJy2gycV2U9WpKdaRogO3QYfnYJd
 eDzJfStQWOutWPwMB3xxjmXo4Xx+5sELLxjYWFxsFLuzU1N/A8NfQTRoryacWEzlL2
 HcoryIlK+LDpNy2lcDPQTRTvxPraiGue+l+2kez9HC3yhAHLb/ODeyAQQEKNTkjTTs
 YKemlqy5FEovQ==
Date: Fri, 5 Sep 2025 17:12:04 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: =?UTF-8?B?QXNiasO4cm4=?= Sloth =?UTF-8?B?VMO4bm5lc2Vu?= <ast@fiberby.net>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Donald Hunter <donald.hunter@gmail.com>, Simon Horman
 <horms@kernel.org>, Jacob Keller <jacob.e.keller@intel.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 03/11] tools: ynl-gen: add sub-type check
Message-ID: <20250905171204.483b5f4f@kernel.org>
In-Reply-To: <20250904220156.1006541-3-ast@fiberby.net>
References: <20250904-wg-ynl-prep@fiberby.net>
 <20250904220156.1006541-3-ast@fiberby.net>
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

On Thu,  4 Sep 2025 22:01:26 +0000 Asbj=C3=B8rn Sloth T=C3=B8nnesen wrote:
> Add a check to verify that the sub-type is "nest", and throw an
> exception if no policy could be generated, as a guard to prevent
> against generating a bad policy.
>=20
> This is a trivial patch with no behavioural changes intended.

I _think_ the expectation was that one of the other methods which
validate the types more thoroughly has to be called if this one is.
But either way:

Reviewed-by: Jakub Kicinski <kuba@kernel.org>
