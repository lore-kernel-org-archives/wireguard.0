Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFFEFCCF9E3
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 11 Nov 2025 02:07:53 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eba9352f;
	Tue, 11 Nov 2025 02:07:51 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ffd7ee8b
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Nov 2025 02:07:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7C14243661;
 Tue, 11 Nov 2025 02:07:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7441C16AAE;
 Tue, 11 Nov 2025 02:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762826868;
 bh=K4WT5DI/LVHmAVyUF3Hc6XM6+Zcclzbiou6WsDsETpQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fpZCHUiNdE0INp+y8GKME3KEFMZP7wbF+SRaAFqCm9r0dO9nv8bKtxUTbh5vgtnkS
 r8xmLUbrOjhq3B9dOHBqVk1hwDEinn21GU4jhPJj7mxInE6FAabmZYxM38FAltWNha
 4HAdZdIa4Rhx7kXxpRRwdCm7UmolwEQgxr2AXVElO54EBYKUgTilEok/fEbcH30niW
 h98IVyANHih0auZWQD3Gsn0Amt0T3c4CFkKDWhItb8msGb72/NPq4Awb8DCxtnuW2G
 sKxWTvOMpN4RLf7Cu0VLRwfMra+Sf5Vm7bgBzsZD2tus10HQRXiix2T8Gk16mbs0zl
 7EmR5PHMgEfLw==
Date: Mon, 10 Nov 2025 18:07:46 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: =?UTF-8?B?QXNiasO4cm4=?= Sloth =?UTF-8?B?VMO4bm5lc2Vu?=
 <ast@fiberby.net>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Donald Hunter
 <donald.hunter@gmail.com>, Simon Horman <horms@kernel.org>, Jacob Keller
 <jacob.e.keller@intel.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jordan Rife <jordan@jrife.io>
Subject: Re: [PATCH net-next v3 00/11] wireguard: netlink: ynl conversion
Message-ID: <20251110180746.4074a9ca@kernel.org>
In-Reply-To: <20251105183223.89913-1-ast@fiberby.net>
References: <20251105183223.89913-1-ast@fiberby.net>
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

On Wed,  5 Nov 2025 18:32:09 +0000 Asbj=C3=B8rn Sloth T=C3=B8nnesen wrote:
> This series completes the implementation of YNL for wireguard,
> as previously announced[1].
>=20
> This series consist of 5 parts:
> 1) Patch 01-03 - Misc. changes
> 2) Patch    04 - Add YNL specification for wireguard
> 3) Patch 05-07 - Transition to a generated UAPI header
> 4) Patch    08 - Adds a sample program for the generated C library
> 5) Patch 09-11 - Transition to generated netlink policy code
>=20
> The main benefit of having a YNL specification is unlocked after the
> first 2 parts, the RFC version seems to already have spawned a new
> Rust netlink binding[2] using wireguard as it's main example.
>=20
> Part 3 and 5 validates that the specification is complete and aligned,
> the generated code might have a few warts, but they don't matter too
> much, and are mostly a transitional problem[3].
>=20
> Part 4 is possible after part 2, but is ordered after part 3,
> as it needs to duplicate the UAPI header in tools/include.

These LGTM, now.

Jason what's your feeling here? AFAICT the changes to the wg code
are quite minor now.=20
