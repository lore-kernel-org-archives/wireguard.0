Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89171CEDDB0
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Nov 2025 15:18:51 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 753dea24;
	Tue, 18 Nov 2025 15:15:29 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 347d393a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 18 Nov 2025 15:15:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id EB96B60194;
 Tue, 18 Nov 2025 15:15:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49147C116D0;
 Tue, 18 Nov 2025 15:15:24 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="mLBaKvMV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1763478922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hbAhqR2bQcN8n5/ymmN0Zw/Y0Cr2VE9MOF8Vh0XJR8s=;
 b=mLBaKvMV0zTlJFwnVA6NU/3C5pCDAL2JtXc2ZP9LW7KPMTBEYo7FD1NBba/siCs/5YJ82k
 l5NJXjeYf5Y1Jy/XqA7ycUBulOcYcJ52/bD6ucm78+fbRsj48McqfSp4bpCof8z1Wor+WH
 TJsOqTsi451kM2VOeIh7W1U2zFWgtJs=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 901a31c9
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Tue, 18 Nov 2025 15:15:22 +0000 (UTC)
Date: Tue, 18 Nov 2025 16:15:20 +0100
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
Message-ID: <aRyNiLGTbUfjNWCa@zx2c4.com>
References: <20251105183223.89913-1-ast@fiberby.net>
 <20251105183223.89913-12-ast@fiberby.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251105183223.89913-12-ast@fiberby.net>
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

On Wed, Nov 05, 2025 at 06:32:20PM +0000, Asbjørn Sloth Tønnesen wrote:
>  drivers/net/wireguard/netlink_gen.c | 77 +++++++++++++++++++++++++++++
>  drivers/net/wireguard/netlink_gen.h | 29 +++++++++++
>  create mode 100644 drivers/net/wireguard/netlink_gen.c
>  create mode 100644 drivers/net/wireguard/netlink_gen.h
> +#include "netlink_gen.h"
> +// SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause)
> +/* Do not edit directly, auto-generated from: */
> +/*	Documentation/netlink/specs/wireguard.yaml */
> +/* YNL-GEN kernel source */

Similar to what's happening in the tools/ynl/samples build system,
instead of statically generating this, can you have this be generated at
build time, and placed into a generated/ folder that doesn't get checked
into git? I don't see the purpose of having to manually keep this in
check?

(And if for some reason, you refuse to do that, it'd be very nice if the
 DO NOT EDIT header of the file also had the command that generated it,
 in case I need to regenerate it later and can't remember how it was
 done, because I didn't do it the first time, etc. Go's generated files
 usually follow this pattern.

 But anyway, I think I'd prefer, if it's possible, to just have this
 generated at compile time.)

Jason
