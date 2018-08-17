Return-Path: finkandreas@web.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aba820ef
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 Aug 2018 05:48:06 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e6ccecd9
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 Aug 2018 05:48:06 +0000 (UTC)
Date: Fri, 17 Aug 2018 08:00:17 +0200
From: Andreas Fink <finkandreas@web.de>
To: Kalin KOZHUHAROV <me.kalin@gmail.com>
Subject: Re: Connection between two clients
Message-ID: <20180817080017.14e12eda@web.de>
In-Reply-To: <CAKXLc7dAUQbM_v3xhTzzamQ=O10W1eiVkke6augaFSJZ9RhH_g@mail.gmail.com>
References: <20180815091700.0d1d5923@web.de>
 <CAKXLc7dAUQbM_v3xhTzzamQ=O10W1eiVkke6augaFSJZ9RhH_g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Thu, 16 Aug 2018 21:40:20 +0200
Kalin KOZHUHAROV <me.kalin@gmail.com> wrote:

> Probanly a routing problem, check `ip route show` on (one) client and
> server.
> 
> Also you might need to enable ip forwarding on server (usually
> enabled on firewalls and routers). No iptables are not necessary if
> everything is one subnet.
> 
> Cheers,
> Kalin.

Yes, the ip forwarding was the trick I was missing.
Maybe it is worth adding a note in the documentation/quick start guide
that this is needed for client-to-client communication through a server.

Thank you
Andreas
