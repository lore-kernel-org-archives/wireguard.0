Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD09CC04FFE
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 17 May 2024 14:48:21 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 32657307;
	Fri, 17 May 2024 14:48:19 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 72c3ebfd
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 May 2024 14:48:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DC3D361D26;
 Fri, 17 May 2024 14:48:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C99DC2BD10;
 Fri, 17 May 2024 14:48:12 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="QNIiwpei"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1715957290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0cBkPJS4a5BxMhrLDaw8NzLtBZZCj9gi/zQctsonxVI=;
 b=QNIiwpeic5qa/l6WvUy8VnPkDhwOw2O5t+Zqc3jVrwko+I6pojUkkvxst2Jk4OyqKLfd3J
 wK3xBSDhEAAJSz2SFq6ZkSt6Q5XXRnLGDdX/Nfp8hnhqgf1R4vLiNcFi+jHwY6DQZ+aShR
 9DLIWT0iMqYDchSnSp1S9+BJggdRqMU=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 8ba86458
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Fri, 17 May 2024 14:48:09 +0000 (UTC)
Date: Fri, 17 May 2024 16:48:02 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Edward Liaw <edliaw@google.com>
Cc: shuah@kernel.org, =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
 =?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>,
 Christian Brauner <brauner@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kernel-team@android.com, linux-security-module@vger.kernel.org,
 netdev@vger.kernel.org, linux-riscv@lists.infradead.org,
 bpf@vger.kernel.org, wireguard@lists.zx2c4.com
Subject: Re: [PATCH v4 65/66] selftests/wireguard: Drop define _GNU_SOURCE
Message-ID: <ZkduIlhF2XswiAJr@zx2c4.com>
References: <20240510000842.410729-1-edliaw@google.com>
 <20240510000842.410729-66-edliaw@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240510000842.410729-66-edliaw@google.com>
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

On Fri, May 10, 2024 at 12:07:22AM +0000, Edward Liaw wrote:
> _GNU_SOURCE is provided by lib.mk, so it should be dropped to prevent
> redefinition warnings.
> 
> Signed-off-by: Edward Liaw <edliaw@google.com>
> ---
>  tools/testing/selftests/wireguard/qemu/init.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/wireguard/qemu/init.c b/tools/testing/selftests/wireguard/qemu/init.c
> index 3e49924dd77e..08113f3c6189 100644
> --- a/tools/testing/selftests/wireguard/qemu/init.c
> +++ b/tools/testing/selftests/wireguard/qemu/init.c
> @@ -2,8 +2,6 @@
>  /*
>   * Copyright (C) 2015-2019 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
>   */
> -
> -#define _GNU_SOURCE
>  #include <unistd.h>
>  #include <errno.h>
>  #include <string.h>
> -- 

But this file doesn't use lib.mk.
