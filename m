Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B0E4CEE33D
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Nov 2025 16:57:57 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 52d2be68;
	Tue, 18 Nov 2025 16:57:55 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 03ed5a72
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 18 Nov 2025 16:57:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1A21F43F99;
 Tue, 18 Nov 2025 16:57:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F664C4AF0D;
 Tue, 18 Nov 2025 16:57:49 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="hTMa+WRI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1763485066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iCqeKRErpiskaDWQgypPBD6vSuFTsdUlVUEfCgLg8Mo=;
 b=hTMa+WRIqJn+KqsV9hq0rMuRNCkEFOC6MeFEj4ufcRXPcrDrMrQG+QmYLDiNcAr/duaSKl
 7PxmvcngaHQ7gESt59AdM04add+IRDxafgsfu0vDYrP5rwTREkgRvpjaPT9P2oo/LW5OU2
 k7dBtaphmHtiVcA8mfvWd+ssMZOCAgE=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 81180c79
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Tue, 18 Nov 2025 16:57:46 +0000 (UTC)
Date: Tue, 18 Nov 2025 17:57:41 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: =?utf-8?Q?Asbj=C3=B8rn_Sloth_T=C3=B8nnesen?= <ast@fiberby.net>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Donald Hunter <donald.hunter@gmail.com>, Simon Horman <horms@kernel.org>,
 Jacob Keller <jacob.e.keller@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jordan Rife <jordan@jrife.io>
Subject: Re: [PATCH net-next v3 11/11] wireguard: netlink: generate netlink
 code
Message-ID: <aRylhXuvGb2s5KHi@zx2c4.com>
References: <20251105183223.89913-1-ast@fiberby.net>
 <20251105183223.89913-12-ast@fiberby.net>
 <aRyNiLGTbUfjNWCa@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aRyNiLGTbUfjNWCa@zx2c4.com>
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

On Tue, Nov 18, 2025 at 04:15:20PM +0100, Jason A. Donenfeld wrote:
> On Wed, Nov 05, 2025 at 06:32:20PM +0000, Asbjørn Sloth Tønnesen wrote:
> >  drivers/net/wireguard/netlink_gen.c | 77 +++++++++++++++++++++++++++++
> >  drivers/net/wireguard/netlink_gen.h | 29 +++++++++++
> >  create mode 100644 drivers/net/wireguard/netlink_gen.c
> >  create mode 100644 drivers/net/wireguard/netlink_gen.h
> > +#include "netlink_gen.h"
> > +// SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause)
> > +/* Do not edit directly, auto-generated from: */
> > +/*	Documentation/netlink/specs/wireguard.yaml */
> > +/* YNL-GEN kernel source */
> 
> Similar to what's happening in the tools/ynl/samples build system,
> instead of statically generating this, can you have this be generated at
> build time, and placed into a generated/ folder that doesn't get checked
> into git? I don't see the purpose of having to manually keep this in
> check?

Grep, for example, for PERLASM in the lib/crypto code. There's certainly
precedent for doing this.
