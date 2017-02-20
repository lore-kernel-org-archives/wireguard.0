Return-Path: mail@danrl.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 93dff912
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Feb 2017 12:48:14 +0000 (UTC)
Received: from mx.cakelie.net (mx.cakelie.net [45.76.39.236])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8d4a102d
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Feb 2017 12:48:14 +0000 (UTC)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 10.2 \(3259\))
Subject: Re: [wireguard-devel] About ip management
From: =?utf-8?Q?Dan_L=C3=BCdtke?= <mail@danrl.com>
In-Reply-To: <CADdae-jNLBGrjwKjfibBtwKennPDESaBe0_hE3vbu5=x_BTmFw@mail.gmail.com>
Date: Mon, 20 Feb 2017 13:48:54 +0100
Message-Id: <11EB84FE-DEE6-4E3A-BEB2-FFCE80BA0524@danrl.com>
References: <CADdae-jNLBGrjwKjfibBtwKennPDESaBe0_hE3vbu5=x_BTmFw@mail.gmail.com>
To: nicolas prochazka <prochazka.nicolas@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Nicolas,


> On 17 Feb 2017, at 15:03, nicolas prochazka =
<prochazka.nicolas@gmail.com> wrote:
> I hope not to have misunderstood ip management with wireguard,=20
> in a "server mode operation" , as many peers -> one peer ( server ) ,
> private ip configuration must be coherent.

There is no need for private (assuming you mean RFC1918) addresses, but =
of course it works with private IPs as well as with public IP addresses.


> In fact, as server / client example in contrib, server must delivery =
ip to clients, there's no way for client to know good private_ip .

Unless it is configured statically, which is what I suggest doing. There =
is plenty of IP space to use. Think of ULA or subprefixes of you GU(s). =
A single /64 should be sufficient to address all your clients uniquely =
per "server wg interface". The situation for legacy IP is also not that =
bad. RFC1918 space is huge, and there is also RFC6598 to pick from. Why =
don't just roll out IP configurations the same way you roll out =
WireGuard configuration? It's just a line more in the config when you =
use wg-quick.


> We cannot use dhcp, layer 3 , so ...=20

That's true for legacy IP. It does not hold true for state-of-the-art =
IP.


> we need to implement a pool ip manager , is it correct ?

I do not really know what you are referring to when you write "pool ip =
manager", but if you want to distribute IP configuration data inside the =
wg tunnel, you would need to configure static addresses to bootstrap =
that from. This might change in the future, as Jason said to be working =
in OOB features. IP management would then take place in user space =
mostly/entirely.

Hope that helps!

Cheers,

Dan=
