Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6318CCEBF97
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Nov 2025 15:18:53 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c6ec9756;
	Tue, 18 Nov 2025 15:17:31 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2173864c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 18 Nov 2025 15:17:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A2AE360236;
 Tue, 18 Nov 2025 15:17:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0071EC116D0;
 Tue, 18 Nov 2025 15:17:25 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="AKYDQIwL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1763479044;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uhDcgp2F0+Ob9aaLUyNKyb9g3TlinvuDBZqNJsuWEOw=;
 b=AKYDQIwLbcw6eAuvJbHAIG8dKoTmVe0Fo7cmSQ16i/m74o5FjD2n91R+3Tx9qhuIr0C6K2
 dBJvkrdV56B0dflK4jIcBU3NcY8FS3zkJZBUJfKkZokfQ+OwiHCOwNi4mRCJEMcvIsHQZY
 cR1Txv2x1WVR0KpDfEGhpSaj+VYtZwo=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4c36a217
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Tue, 18 Nov 2025 15:17:24 +0000 (UTC)
Date: Tue, 18 Nov 2025 16:17:21 +0100
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
Subject: Re: [PATCH net-next v3 07/11] uapi: wireguard: generate header with
 ynl-gen
Message-ID: <aRyOAYuWZE440WQ4@zx2c4.com>
References: <20251105183223.89913-1-ast@fiberby.net>
 <20251105183223.89913-8-ast@fiberby.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251105183223.89913-8-ast@fiberby.net>
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

On Wed, Nov 05, 2025 at 06:32:16PM +0000, Asbjørn Sloth Tønnesen wrote:
> Use ynl-gen to generate the UAPI header for wireguard.
> diff --git a/include/uapi/linux/wireguard.h b/include/uapi/linux/wireguard.h
> index a2815f4f2910..dc3924d0c552 100644
> --- a/include/uapi/linux/wireguard.h
> +++ b/include/uapi/linux/wireguard.h
> @@ -1,32 +1,28 @@
> -/* SPDX-License-Identifier: (GPL-2.0 WITH Linux-syscall-note) OR MIT */
> -/*
> - * Copyright (C) 2015-2019 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
> - */
> +/* SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause) */
> +/* Do not edit directly, auto-generated from: */
> +/*	Documentation/netlink/specs/wireguard.yaml */
> +/* YNL-GEN uapi header */

Same desire here -- can this get auto generated at compile time (or in
headers_install time).

Jason
