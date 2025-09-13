Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B27CAC582
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 13 Sep 2025 00:24:51 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d86324f7;
	Sat, 13 Sep 2025 00:21:29 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c18ff779
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 13 Sep 2025 00:21:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1D81B416E1;
 Sat, 13 Sep 2025 00:21:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D9C0C4CEF1;
 Sat, 13 Sep 2025 00:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757722886;
 bh=44+bvxQZB0frdS1awUgublYIg+3EChaFU/AwKeK70vY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HKSJFn0oU67oIYXzTkyQx4+GQnv74K0Rk7ReW4CONh6TXoQKtp35uN8k6dDjkqwL6
 aDf4dTyfTQgAehSdPYktGLwVxN/xatGGSqzhBiJls5oCRlzQXaY41mW/7zqQf4If0E
 uq2TuScdvwBZGZ02RGEeIvKRpPSRBi+VEPgqLlPNYdABeVNBROp3jMVtMvfyrV+hJM
 HGZZYSOE1uijuYMXFH+eVPJv2heaydHNuj79gNkcSdKrSXZLH4hRuL0+XRKf6rbvVA
 QsQe88zf8gg5cfa+kuY8tXdfGPh7cQ3gnxjgAJTtIMXWheIruzYL7LB0YqlAwaG2yz
 8ObCtZAlG3mRg==
Date: Fri, 12 Sep 2025 17:21:24 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: =?UTF-8?B?QXNiasO4cm4=?= Sloth =?UTF-8?B?VMO4bm5lc2Vu?= <ast@fiberby.net>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Donald Hunter <donald.hunter@gmail.com>, Simon Horman
 <horms@kernel.org>, Jacob Keller <jacob.e.keller@intel.com>, Sabrina
 Dubroca <sd@queasysnail.net>, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v3 05/13] tools: ynl-gen: add
 CodeWriter.p_lines() helper
Message-ID: <20250912172124.57f96054@kernel.org>
In-Reply-To: <20250911200508.79341-6-ast@fiberby.net>
References: <20250911200508.79341-1-ast@fiberby.net>
 <20250911200508.79341-6-ast@fiberby.net>
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

On Thu, 11 Sep 2025 20:04:58 +0000 Asbj=C3=B8rn Sloth T=C3=B8nnesen wrote:
> Add a helper for writing an array of lines, and convert
> all the existing loops doing that, to use the new helper.
>=20
> This is a trivial patch with no behavioural changes intended,
> there are no changes to the generated code.

I don't see the need for this.
