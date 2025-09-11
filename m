Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29908CA101F
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 11 Sep 2025 01:30:00 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ecd8a464;
	Thu, 11 Sep 2025 01:29:59 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 881d8d09
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 11 Sep 2025 01:29:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C30086013D;
 Thu, 11 Sep 2025 01:29:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E11C5C4CEEB;
 Thu, 11 Sep 2025 01:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757554196;
 bh=vqtwsbfCxiSwrtPhdMyCQgn1rx2fHdnoowDHVEMTgAk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=AoKl+ySNYgdiYkzJ7ned6aSDSsz/NnTFoYi33bb105CeUgoPp4SZaxBgqlFZhuO/B
 YPsje5Gxw4QnH2gzDhfLhChe/WTuLUgIro+PlnAI19q8PBnRshacdNhy2gO+OLuXG6
 K0eaFIeaieXgkm6nlEWFAkD5cAPc+nLEuVo3MWIoUetQF7Vzv9b9JORiaXVCTbSBHm
 9WntbPisN8ih6TsW2NGLLfaZUXDN6IK3MCgw/l9vEaYoeNDrVNhaHGcpbS5jFFkQgx
 aA+yZ8R3z5BTlYu7GSB48ilTPJAtQfSnYKFY0o5zu/PgxN9jaQPShwfMXwL98mrU6t
 QRDy8ucF3pD6A==
Date: Wed, 10 Sep 2025 18:29:55 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: =?UTF-8?B?QXNiasO4cm4=?= Sloth =?UTF-8?B?VMO4bm5lc2Vu?= <ast@fiberby.net>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Donald Hunter <donald.hunter@gmail.com>, Simon Horman
 <horms@kernel.org>, Jacob Keller <jacob.e.keller@intel.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, Sabrina Dubroca <sd@queasysnail.net>,
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 00/12] tools: ynl: prepare for wireguard
Message-ID: <20250910182955.5d220149@kernel.org>
In-Reply-To: <20250910230841.384545-1-ast@fiberby.net>
References: <20250910230841.384545-1-ast@fiberby.net>
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

On Wed, 10 Sep 2025 23:08:22 +0000 Asbj=C3=B8rn Sloth T=C3=B8nnesen wrote:
> This series contains the last batch of YNL changes to support
> the wireguard YNL conversion.

please rebase
