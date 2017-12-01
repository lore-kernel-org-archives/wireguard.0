Return-Path: gregkh@linuxfoundation.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ca64c67e
 for <wireguard@lists.zx2c4.com>; Fri, 1 Dec 2017 09:35:15 +0000 (UTC)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org
 [140.211.169.12])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 134a6a83
 for <wireguard@lists.zx2c4.com>; Fri, 1 Dec 2017 09:35:15 +0000 (UTC)
Date: Fri, 1 Dec 2017 09:41:33 +0000
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH 1/6] src/tools: add SPDX tags to all files
Message-ID: <20171201094133.GB9353@kroah.com>
References: <20171130152355.25387-1-gregkh@linuxfoundation.org>
 <20171130152355.25387-2-gregkh@linuxfoundation.org>
 <CAHmME9q=z9eacusHGf2apYFCghYce5aEXFF7WXLqJ=nGMGD1hQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CAHmME9q=z9eacusHGf2apYFCghYce5aEXFF7WXLqJ=nGMGD1hQ@mail.gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Thu, Nov 30, 2017 at 06:57:20PM +0100, Jason A. Donenfeld wrote:
> On Thu, Nov 30, 2017 at 4:23 PM, Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> > It's good to have SPDX identifiers in all files as the Linux kernel
> > diff --git a/src/tools/config.c b/src/tools/config.c
> > index 6ff03767f9e6..312cbcdd7a85 100644
> > --- a/src/tools/config.c
> > +++ b/src/tools/config.c
> > @@ -1,3 +1,4 @@
> > +// SPDX-License-Identifier: GPL-2.0
> >  /* Copyright (C) 2015-2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved. */
> >
> >  #include <arpa/inet.h>
> > diff --git a/src/tools/config.h b/src/tools/config.h
> > index 63a272cc1285..e3ad9f87404b 100644
> > --- a/src/tools/config.h
> > +++ b/src/tools/config.h
> > @@ -1,3 +1,4 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> >  /* Copyright (C) 2015-2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved. */
> 
> It looks like you're giving .h a /* style comment and .c a // style
> comment. Is there a reason for this, or did you just have two
> different sed commands by accident?

There's is a reason for it, please see:
	https://lwn.net/Articles/739183/
and the email thread on lkml about this, specifically the email with
this subject:
	Subject: [patch V4 01/11] Documentation: Add license-rules.rst to describe how to properly identify file licenses

It goes into why .c files should use // and why .h files should use /* */

thanks,

greg k-h
