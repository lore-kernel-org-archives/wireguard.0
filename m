Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56600CA1000
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  1 Sep 2025 18:52:15 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d2de6d3a;
	Mon, 1 Sep 2025 18:52:13 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c1d465b5
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 1 Sep 2025 18:52:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B325441AFF;
 Mon,  1 Sep 2025 18:52:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3736C4CEF0;
 Mon,  1 Sep 2025 18:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756752729;
 bh=o6U01W+fl0b/ojC90s2Y/ejJnVHB2bAeWNynsDt5eHA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Kb9QBB8ceUYErFJfBaj9F55TVZOcvFQZ9u3zFE+JJY9/rDwZ4bWPlQkXGEcwglcd3
 46fJCeeZg0V9Y6Ik7Ai5Gv2iE4yORx1+mArLAGaXq1w+DyeTjPqlwG6e2U1iDZqACz
 OjOUVCh6bN1FDFGiY49iy8c1D6T/CiizVj/qUED4LSz/ip3rVRrWAiqGgQTmylINWH
 RAQ4sYtEN+F7Y+qFO+gAD3hIzSs6Q9qPy9NeRms/SlfdGAqu2R11hp7Eb8yLHu8HUh
 6EBTcWfmu0wzv9N+h8lrj3jHx6ZVAebnvmmmCzHsA9r/z+kxOXBVpY/cEh32MUpBsf
 nqYLmQAqvKO2A==
Date: Mon, 1 Sep 2025 11:52:08 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: =?UTF-8?B?QXNiasO4cm4=?= Sloth =?UTF-8?B?VMO4bm5lc2Vu?= <ast@fiberby.net>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Donald Hunter
 <donald.hunter@gmail.com>, Simon Horman <horms@kernel.org>, Jacob Keller
 <jacob.e.keller@intel.com>, Stanislav Fomichev <sdf@fomichev.me>, "Matthieu
 Baerts (NGI0)" <matttbe@kernel.org>, David Ahern <dsahern@kernel.org>,
 Chuck Lever <chuck.lever@oracle.com>, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net 2/4] tools: ynl-gen: use macro for binary min-len check
Message-ID: <20250901115208.0cc7e9a6@kernel.org>
In-Reply-To: <20250901145034.525518-3-ast@fiberby.net>
References: <20250901145034.525518-1-ast@fiberby.net>
 <20250901145034.525518-3-ast@fiberby.net>
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

On Mon,  1 Sep 2025 14:50:21 +0000 Asbj=C3=B8rn Sloth T=C3=B8nnesen wrote:
> This patch changes the generated min-len check for binary
> attributes to use the NLA_POLICY_MIN_LEN() macro, and thereby
> ensures that .validation_type is not left at NLA_VALIDATE_NONE.

Please test this well and include the results in the commit message.
I'm pretty sure it's fine as is.
