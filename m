Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 82932770
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Nov 2017 17:51:11 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0bb2ec85
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Nov 2017 17:51:11 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 04a77eb6
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Nov 2017 17:51:11 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 409471a7
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Nov 2017 17:51:11 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id r63so5397003oia.6
 for <wireguard@lists.zx2c4.com>; Thu, 30 Nov 2017 09:57:21 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171130152355.25387-2-gregkh@linuxfoundation.org>
References: <20171130152355.25387-1-gregkh@linuxfoundation.org>
 <20171130152355.25387-2-gregkh@linuxfoundation.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 30 Nov 2017 18:57:20 +0100
Message-ID: <CAHmME9q=z9eacusHGf2apYFCghYce5aEXFF7WXLqJ=nGMGD1hQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] src/tools: add SPDX tags to all files
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Thu, Nov 30, 2017 at 4:23 PM, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> It's good to have SPDX identifiers in all files as the Linux kernel
> diff --git a/src/tools/config.c b/src/tools/config.c
> index 6ff03767f9e6..312cbcdd7a85 100644
> --- a/src/tools/config.c
> +++ b/src/tools/config.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /* Copyright (C) 2015-2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved. */
>
>  #include <arpa/inet.h>
> diff --git a/src/tools/config.h b/src/tools/config.h
> index 63a272cc1285..e3ad9f87404b 100644
> --- a/src/tools/config.h
> +++ b/src/tools/config.h
> @@ -1,3 +1,4 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
>  /* Copyright (C) 2015-2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved. */

It looks like you're giving .h a /* style comment and .c a // style
comment. Is there a reason for this, or did you just have two
different sed commands by accident?
