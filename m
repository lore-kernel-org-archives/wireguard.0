Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C0F1CAC58E
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 11 Sep 2025 00:27:21 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0b7423ee;
	Thu, 11 Sep 2025 00:27:19 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id fcb8b6aa
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 11 Sep 2025 00:27:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2115740218;
 Thu, 11 Sep 2025 00:27:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90746C4CEEB;
 Thu, 11 Sep 2025 00:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757550436;
 bh=ekesoh0ujj8ocHBC1cUZS+xosIHxerCs0+Ur0dMvGi0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YIhN/Jjk8lbtMZhvPs99IMb6DdxMzOmkgeqMoNjFFvsSopF4C03eCmdaNXFunkFvO
 tJTq/3wP9RJO953v+ZcFNXousLQ89L9a9Fxk3q0QJ25jSpKj6Vew4cN7EguQCDPCH9
 sHsefFAn5irX2yQFIuJaVaETLuvCq3YTu1MDf5cvsIBU4jpUjxbA1tZkhtQ6M/Bnix
 vJMmJNlCa+W8d8TwNUWKgi9CfTtwsahcoRWE1QdLP5Qp6tEaHKpNR9ldc5NlidxcGY
 +RTt664nXbt5PDp6riNGqdNGB1s4nrkEihivlt0a8pFnjERj0lV1yrsVN+yGtEYY5L
 a0ezPeEfv34dg==
Date: Wed, 10 Sep 2025 17:27:14 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: =?UTF-8?B?QXNiasO4cm4=?= Sloth =?UTF-8?B?VMO4bm5lc2Vu?= <ast@fiberby.net>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Donald Hunter <donald.hunter@gmail.com>, Simon Horman
 <horms@kernel.org>, Jacob Keller <jacob.e.keller@intel.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 05/11] tools: ynl-gen: define nlattr *array in
 a block scope
Message-ID: <20250910172714.25274ad0@kernel.org>
In-Reply-To: <3b52386e-6127-4bdc-b7db-e3c885b03f72@fiberby.net>
References: <20250904-wg-ynl-prep@fiberby.net>
 <20250904220156.1006541-5-ast@fiberby.net>
 <20250905171809.694562c6@kernel.org>
 <4eda9c57-bde0-43c3-b8a0-3e45f2e672ac@fiberby.net>
 <20250906120754.7b90c718@kernel.org>
 <3b52386e-6127-4bdc-b7db-e3c885b03f72@fiberby.net>
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

On Thu, 11 Sep 2025 00:01:48 +0000 Asbj=C3=B8rn Sloth T=C3=B8nnesen wrote:
> I left this for you to submit, there is a trivial conflict with patch 8
> in my v2 posting.

Hah, no, please take this and submit as yours if you can. You can add
me as Suggested-by. I already dropped it form my tree.
Maintainers tend to throw random snippets of code at people, it's just
quicker than explaining but we have enough commits in our name..
