Return-Path: SRS0=SGiK=JC=linuxfoundation.org=gregkh@kernel.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fb28ad24
 for <wireguard@lists.zx2c4.com>;
 Sat, 16 Jun 2018 08:00:52 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fee3f01d
 for <wireguard@lists.zx2c4.com>;
 Sat, 16 Jun 2018 08:00:52 +0000 (UTC)
Date: Sat, 16 Jun 2018 10:04:42 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Glen Bojsza <gbojsza@gmail.com>
Subject: Re: Ubuntu Error when trying to launch wireguard
Message-ID: <20180616080442.GB20457@kroah.com>
References: <CACW8NbD=B07z4WqgWv4+SP8P615Ois0_cCdk0d4viAGYp=Ki2w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CACW8NbD=B07z4WqgWv4+SP8P615Ois0_cCdk0d4viAGYp=Ki2w@mail.gmail.com>
Cc: wireguard <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Fri, Jun 15, 2018 at 04:27:09PM -0400, Glen Bojsza wrote:
> I am trying to run wireguard server on Bionic ARM processor.
> 
> After following the installation instructions and creating my server config
> file I get the following error when I run
> 
> root@odroidxu4:~# wg-quick up wg0
> 
> Warning: `/etc/wireguard/wg0.conf' is world accessible

You can fix the permissions on the file to not show this.

> 
> [#] ip link add wg0 type wireguard
> 
> RTNETLINK answers: Operation not supported

You need to have the wireguard kernel module installed, are you sure you
did that?

thanks,

greg k-h
