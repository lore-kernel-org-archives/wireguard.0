Return-Path: wireguard@eldondev.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b0d26623
 for <wireguard@lists.zx2c4.com>;
 Thu, 16 Aug 2018 19:40:35 +0000 (UTC)
Received: from npcomp.net (npcomp.net [69.61.8.91])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 12b91993
 for <wireguard@lists.zx2c4.com>;
 Thu, 16 Aug 2018 19:40:35 +0000 (UTC)
Date: Thu, 16 Aug 2018 15:52:43 -0400
From: Eldon <wireguard@eldondev.com>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: Connection between two clients
Message-ID: <20180816195243.GC12438@npcomp.net>
References: <20180815091700.0d1d5923@web.de>
 <CAKXLc7dAUQbM_v3xhTzzamQ=O10W1eiVkke6augaFSJZ9RhH_g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CAKXLc7dAUQbM_v3xhTzzamQ=O10W1eiVkke6augaFSJZ9RhH_g@mail.gmail.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Here is some documentation on how some of this can be done:

https://unix.stackexchange.com/questions/14056/what-is-kernel-ip-forwarding/14058#14058

https://docs.fedoraproject.org/en-US/Fedora/18/html/Security_Guide/sect-Security_Guide-Firewalls-FORWARD_and_NAT_Rules.html

On Thu, Aug 16, 2018 at 09:40:20PM +0200, Kalin KOZHUHAROV wrote:
> Probanly a routing problem, check `ip route show` on (one) client and
> server.
> 
> Also you might need to enable ip forwarding on server (usually enabled on
> firewalls and routers). No iptables are not necessary if everything is one
> subnet.
> 
> Cheers,
> Kalin.

> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
