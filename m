Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 552E6CF64A0
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 20 Nov 2025 00:57:50 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e86b580e;
	Thu, 20 Nov 2025 00:55:57 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 40f1a5f3
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 20 Nov 2025 00:55:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 345A560174;
 Thu, 20 Nov 2025 00:55:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A554EC4CEF5;
 Thu, 20 Nov 2025 00:55:52 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="isUTSwDq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1763600151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3WInqmEFbDY/RNTxo/ojAG1xVSL8xc4rSolc9zgV/Ec=;
 b=isUTSwDqz/O9aQIVXmq8x3m8Q17M+ZNH3Boeq+6dsokl2bXo1wXUizy8q9SUvf26ogkeS2
 vG6I9VH+DYdi9Cpg1Bba1VglO3Eqc71p6ffGMtgdmda3nh1pYVQgErf0vfKsymgh/N7Wz7
 +R9bONq8+sgufWODyOZxyWhUEa9Eozc=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3c48548b
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Thu, 20 Nov 2025 00:55:50 +0000 (UTC)
Date: Thu, 20 Nov 2025 01:55:46 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: =?utf-8?Q?Asbj=C3=B8rn_Sloth_T=C3=B8nnesen?= <ast@fiberby.net>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Donald Hunter <donald.hunter@gmail.com>, Simon Horman <horms@kernel.org>,
 Jacob Keller <jacob.e.keller@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jordan Rife <jordan@jrife.io>
Subject: Re: [PATCH net-next v3 07/11] uapi: wireguard: generate header with
 ynl-gen
Message-ID: <aR5nEnP2PWJ7G7yp@zx2c4.com>
References: <20251105183223.89913-1-ast@fiberby.net>
 <20251105183223.89913-8-ast@fiberby.net>
 <aRyOAYuWZE440WQ4@zx2c4.com> <20251118165315.281a21ca@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251118165315.281a21ca@kernel.org>
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

On Tue, Nov 18, 2025 at 04:53:15PM -0800, Jakub Kicinski wrote:
> On Tue, 18 Nov 2025 16:17:21 +0100 Jason A. Donenfeld wrote:
> > On Wed, Nov 05, 2025 at 06:32:16PM +0000, Asbjørn Sloth Tønnesen wrote:
> > > Use ynl-gen to generate the UAPI header for wireguard.
> > > diff --git a/include/uapi/linux/wireguard.h b/include/uapi/linux/wireguard.h
> > > index a2815f4f2910..dc3924d0c552 100644
> > > --- a/include/uapi/linux/wireguard.h
> > > +++ b/include/uapi/linux/wireguard.h
> > > @@ -1,32 +1,28 @@
> > > -/* SPDX-License-Identifier: (GPL-2.0 WITH Linux-syscall-note) OR MIT */
> > > -/*
> > > - * Copyright (C) 2015-2019 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
> > > - */
> > > +/* SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause) */
> > > +/* Do not edit directly, auto-generated from: */
> > > +/*	Documentation/netlink/specs/wireguard.yaml */
> > > +/* YNL-GEN uapi header */  
> > 
> > Same desire here -- can this get auto generated at compile time (or in
> > headers_install time).
> 
> IMHO generating uAPI on the fly has more downsides than benefits.
> For one thing people grepping the code and looking and lxr will
> never find the definition. All the user space code in tools/ is
> generated at build time, but the amount of kernel code we generate
> is not significant at this stage. Not significant enough to complicate
> everyone's life..

I was thinking that doing this automatically at compile-time or
install-time would be _less_ complicated, not more, since everything
would be kept in sync automatically and such. But alright, so be it.
