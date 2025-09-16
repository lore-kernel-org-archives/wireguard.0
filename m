Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42D89CAC59B
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 16 Sep 2025 01:44:37 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 29e3fff2;
	Tue, 16 Sep 2025 01:43:03 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 5f891045
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 16 Sep 2025 01:43:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5EA62600B0;
 Tue, 16 Sep 2025 01:43:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AB62C4CEF1;
 Tue, 16 Sep 2025 01:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757986980;
 bh=uICLBO8F09RNi9f9lCi24w0PN+7wUc8Y6ggmXOrN3oc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=q+P7br1AMn+bKWLu6FGc9GlDDD87Yi9VxmtyMlyMnSjE1bmUf8Xq0ebdXkeBYeDB2
 d3h3xNL4ACntoxjmU2i3Bia6Ld3PK+wVKhM+En11Colpvf53XFWrCboxSXn/vkn17a
 /1xadkI1ZX9+1F2IVCaYeiQNwNSeeMSFRcnNjwCOAi3Uv6cl1mi23a1H1n5pLVvB7V
 E/m+3xpsSG16DeBwW63LfPxZB4GrHyXROrNYMNMadBgqP174MRXES0JCz2j5aslgiZ
 /bv5C+C8LbS+kHACk5h2OXblAYxbB7+0hmaWgvLPHTr77Doat7Ugk34X7y4rYhfF7B
 5oJiUjtl1idMw==
Date: Mon, 15 Sep 2025 18:42:58 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: =?UTF-8?B?QXNiasO4cm4=?= Sloth =?UTF-8?B?VMO4bm5lc2Vu?= <ast@fiberby.net>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Donald Hunter <donald.hunter@gmail.com>, Simon Horman
 <horms@kernel.org>, Jacob Keller <jacob.e.keller@intel.com>, Sabrina
 Dubroca <sd@queasysnail.net>, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v5 06/11] tools: ynl-gen: validate nested arrays
Message-ID: <20250915184258.14e04716@kernel.org>
In-Reply-To: <20250915144301.725949-7-ast@fiberby.net>
References: <20250915144301.725949-1-ast@fiberby.net>
 <20250915144301.725949-7-ast@fiberby.net>
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

On Mon, 15 Sep 2025 14:42:51 +0000 Asbj=C3=B8rn Sloth T=C3=B8nnesen wrote:
> This patch renames the old nl_attr_validate() to
> __nl_attr_validate(), and creates a new inline function
> nl_attr_validate() to mimic the old one.

Reviewed-by: Jakub Kicinski <kuba@kernel.org>
