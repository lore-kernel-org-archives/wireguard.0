Return-Path: gregkh@linuxfoundation.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4ca7c900
 for <wireguard@lists.zx2c4.com>;
 Wed, 31 Jan 2018 08:58:19 +0000 (UTC)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org
 [140.211.169.12])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d3ae8701
 for <wireguard@lists.zx2c4.com>;
 Wed, 31 Jan 2018 08:58:19 +0000 (UTC)
Date: Wed, 31 Jan 2018 10:03:19 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: John Wayne <matrixman3077@gmail.com>
Subject: Re: Wireguard backport to 2.6.3x kernels
Message-ID: <20180131090319.GA7820@kroah.com>
References: <CACwd1hYUb0aGFOQoDY30a0Gsu2E-OaSHF0319x-kGbTSwov9Hg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CACwd1hYUb0aGFOQoDY30a0Gsu2E-OaSHF0319x-kGbTSwov9Hg@mail.gmail.com>
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Wed, Jan 31, 2018 at 10:44:39AM +0200, John Wayne wrote:
> Hi,
> 
> I am working on a project that involves some old MIPS and ARM based
> custom boards.
> Current SDKs for these boards are pretty messy and there is no
> documentation about the
> patches that were applied to the 2.6.3x kernels in order make them
> work on these boards.

You can always just diff against the kernel.org release to see that.

> So my question is how painfully will it be to port wireguard to the
> even more ancient 2.6.3x kernels?

You shouldn't be running any device based on those old kernels exposed
to the network as they are probably totally insecure.  Instead work on
updating the kernel to something that was at least released in the past
5 years.

Wireguard support is the least of your problems here :)

good luck!

greg k-h
