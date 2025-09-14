Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E940CA0EE8
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 14 Sep 2025 18:10:08 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cd1da220;
	Sun, 14 Sep 2025 18:08:10 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 993e3193
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 14 Sep 2025 18:08:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 72DED40445;
 Sun, 14 Sep 2025 18:08:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABDFCC4CEF0;
 Sun, 14 Sep 2025 18:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757873286;
 bh=el/KQ0lECVo3QJ94IHZinOuUbMqgM/g9vD8XwAkXXlM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ik3Dpj8TnNvG4lZjjJoB8uO63i/mrd/TDqkKdomd0E3aDazTImpl4EvAARYHyk6/2
 pANZZEPgeBBQ+rZO9O0l0B4BBaHIsmTKPjxRlwqh5owfuJkD60EayQF82QFnJ5dPFd
 5EEaDyb59mY9RZ9VBLOZhTc9YIfvx3nkNJJu9lb0QqZHdQrYGftO5T4JnwhssT7TlD
 FgMvkxEFDsjPhl2N6j+UzIQgkKYaxYgwH2OMBenKO/Rmbu2SV7CX9Sx/PqtNUDBhnU
 9Jg3WN3FCFimDXoz9tHT7xZAGRWIYwFCyB1G5l+Two+SYGRdCBAEymt8elJ6/9s5Rr
 FggK95FkThCAw==
Date: Sun, 14 Sep 2025 11:08:04 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: =?UTF-8?B?QXNiasO4cm4=?= Sloth =?UTF-8?B?VMO4bm5lc2Vu?= <ast@fiberby.net>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Donald Hunter <donald.hunter@gmail.com>, Simon Horman
 <horms@kernel.org>, Jacob Keller <jacob.e.keller@intel.com>, Sabrina
 Dubroca <sd@queasysnail.net>, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v4 04/11] tools: ynl-gen: refactor local vars
 for .attr_put() callers
Message-ID: <20250914110804.3549eb9d@kernel.org>
In-Reply-To: <20250913235847.358851-5-ast@fiberby.net>
References: <20250913235847.358851-1-ast@fiberby.net>
 <20250913235847.358851-5-ast@fiberby.net>
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

On Sat, 13 Sep 2025 23:58:25 +0000 Asbj=C3=B8rn Sloth T=C3=B8nnesen wrote:
> Refactor the generation of local variables needed when building
> requests, by moving the logic into the Type classes, and use the
> same helper in all places where .attr_put() is called.
>=20
> If any attributes requests identical local_vars, then they will
> be deduplicated, attributes are assumed to only use their local
> variables transiently.

Nope, this is not good enough. I prefer the obvious hack than a one-off
member mixed into the object model.
