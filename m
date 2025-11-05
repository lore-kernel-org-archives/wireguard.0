Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7532DCCF9E3
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  5 Nov 2025 03:10:30 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8d9dbe80;
	Wed, 5 Nov 2025 03:08:47 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 9740f46f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 5 Nov 2025 03:08:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 940B56020B;
 Wed,  5 Nov 2025 03:08:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A519BC4CEF7;
 Wed,  5 Nov 2025 03:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762312123;
 bh=NvQUlmMUDmhAWgdOKXsE+mpimU1iKO5RAOMSw6oUQrE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=P6jIHDjTeyX6ethNRRJMD5EovegiDTduo6YGzggos3a/DH7mxZ6y1XOVS+SM288nR
 b6ffktFLr2RjpZ+R5u7qtaHkQZpi2pGDrYQxCilhwAxJXXbdW+TKws+sesrBVisLUy
 meauF+6T+gDFizvVM6FrdvFCAU1sA3gzeh9CHjhWNzvTr5MRzRrif4vsOuLi60LOH6
 F0apF7oF+tJ8/8gZwJzw5ybZUS00LOm5FCNmVKTW/qJGXW5mqWrxu9ODysMRNXMALZ
 IY8DYag1RUtySxaBU7ieGvy9E6Io6ZIDLMtxG9dPj5087XqlbJ1NNVeNslEV5LJgvA
 JLDRCjVoFsWWA==
Date: Tue, 4 Nov 2025 19:08:41 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: =?UTF-8?B?QXNiasO4cm4=?= Sloth =?UTF-8?B?VMO4bm5lc2Vu?= <ast@fiberby.net>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Donald Hunter <donald.hunter@gmail.com>, Simon Horman
 <horms@kernel.org>, Jacob Keller <jacob.e.keller@intel.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 08/11] tools: ynl: add sample for wireguard
Message-ID: <20251104190841.4582e578@kernel.org>
In-Reply-To: <20251031160539.1701943-9-ast@fiberby.net>
References: <20251031160539.1701943-1-ast@fiberby.net>
 <20251031160539.1701943-9-ast@fiberby.net>
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

On Fri, 31 Oct 2025 16:05:34 +0000 Asbj=C3=B8rn Sloth T=C3=B8nnesen wrote:
> +F:	tools/include/uapi/linux/wireguard.h

Please don't copy the headers. Add an entry in Makefile.deps instead.
