Return-Path: gregkh@linuxfoundation.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b781b06e
 for <wireguard@lists.zx2c4.com>;
 Mon, 22 Jan 2018 15:19:44 +0000 (UTC)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org
 [140.211.169.12])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 83e9495b
 for <wireguard@lists.zx2c4.com>;
 Mon, 22 Jan 2018 15:19:44 +0000 (UTC)
Date: Mon, 22 Jan 2018 16:23:41 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Kevin <anaknaga@inventati.org>
Subject: Re: Trouble building WireGuard since December releases
Message-ID: <20180122152341.GA2598@kroah.com>
References: <1516632145.2241.49.camel@inventati.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1516632145.2241.49.camel@inventati.org>
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Mon, Jan 22, 2018 at 03:42:25PM +0100, Kevin wrote:
> Hi all,
> 
> I've been having trouble building WireGuard on Solus since its December
> snapshots. Earlier snapshots (e.g. November) still build without a
> problem, even on new kernels. Does this have to do with Solus kernel
> builds, or am I overlooking something?
> 
> user@t450s-solus ~/bin/WireGuard-0.0.20180118/src $ make debug
> test -e include/generated/autoconf.h -a -e include/config/auto.conf ||
> (	\
> echo >&2;							\
> echo >&2 "  ERROR: Kernel configuration is invalid.";		\
> echo >&2 "         include/generated/autoconf.h or
> include/config/auto.conf are missing.";\
> echo >&2 "         Run 'make oldconfig && make prepare' on kernel src
> to fix it.";	\

Have you run 'make oldconfig' and 'make prepare' on the kernel source
tree you are wanting to build the wireguard code against?

thanks,

greg k-h
