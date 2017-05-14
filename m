Return-Path: greg@kroah.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ada5850a
 for <wireguard@lists.zx2c4.com>;
 Sun, 14 May 2017 10:37:24 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bb0af517
 for <wireguard@lists.zx2c4.com>;
 Sun, 14 May 2017 10:37:24 +0000 (UTC)
Date: Sun, 14 May 2017 12:48:17 +0200
From: Greg KH <greg@kroah.com>
To: Baptiste Jonglez <baptiste@bitsofnetworks.org>
Subject: Re: Performance of Wireguard on Infiniband 40G
Message-ID: <20170514104817.GA29758@kroah.com>
References: <20170513073721.GD22218@tuxmachine.polynome.dn42>
 <CAHmME9pgLtP4z-vvuHxH4ST2f6ZeHhKZXM8FnyrRnxojYDsGGQ@mail.gmail.com>
 <20170514095552.GB7227@tuxmachine.polynome.dn42>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170514095552.GB7227@tuxmachine.polynome.dn42>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Sun, May 14, 2017 at 11:55:52AM +0200, Baptiste Jonglez wrote:
> On Sun, May 14, 2017 at 12:52:11AM +0200, Jason A. Donenfeld wrote:
> > One small and unfortunate thought just occurred to me: the backporting
> > to really old kernels I'm pretty sure is way less efficient than newer
> > kernels on the RX, due to some missing core fast-path APIs in the old
> > kernels. In particular, I had to wrap the UDP layer with some nasty
> > hacks to get packets out, whereas newer kernels have an elegant API
> > for that which integrates in the right place. Just a thought... I
> > haven't actually done concrete measurements though.
> 
> Good idea, I have redone the same setup with kernel 4.9.18 from
> jessie-backports.
> 
> TL;DR: when switching from kernel 3.16 to 4.9, wireguard has a 50%
> performance gain in the most favourable case (large MTU).  Also, iperf
> seems generally faster than iperf3, most likely because iperf3 has no
> multi-threading.

4.9 is 6 months old, I'd be curious if 4.11 is any faster given the rate
of change in the network stack :)

thanks,

greg k-h
