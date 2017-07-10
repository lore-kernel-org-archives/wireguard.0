Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ccdea6ab
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Jul 2017 02:26:35 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ffb13174
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Jul 2017 02:26:35 +0000 (UTC)
Date: Mon, 10 Jul 2017 04:43:25 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: raul <raulbe@gmail.com>
Subject: Re: Early Feedback on Container Networking, Resilience, Json Config
 and AcceptedIPs
Message-ID: <20170710024322.GA31153@zx2c4.com>
References: <CAOLRk5n2FvxWN_O+Th8Zy+Mga-MKA7_bOaWVsFh6MvVdfM6S2A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
In-Reply-To: <CAOLRk5n2FvxWN_O+Th8Zy+Mga-MKA7_bOaWVsFh6MvVdfM6S2A@mail.gmail.com>
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Raul,


On Sat, Jul 08, 2017 at 07:56:28AM +0530, raul wrote:
> First, this is a stunning piece of work.
> You have been able to hide a tremendous amount of complexity to expose a
> simple, flexible but powerful front end and I am certain this must have
> taken extraordinary talent, experience, time and engineering.

Glad to hear you like it!

> 1. Do you anticipate a situation where differing Wireguard versions across
> distributions and kernels do not inter-operate? This introduces a huge
> amount of complexity to managing clusters. I faced this with Gluster and it
> is a significant pain and blocker.

Once WireGuard hits 1.0, the protocol will be stable and won't change.
Until then, it might change, but such changes have been (will be?)
extremely rare. It's certainly something I'm trying to avoid, and I
don't have any planned changes, so it very well could be that what we
have now is what we have at 1.0 time. But I don't want to make promises
until we're at 1.0, just in case.

So: things won't be too big of a pain, and at some point, there won't be
any possibility of pains.

> 2. Would you consider supporting a json configuration file? The current
> Wireguard ini format has duplicate entires for 'Peers' and the python ini
> parser for instance does not support duplicate section heads.

I wrote this toy example code:
https://git.zx2c4.com/WireGuard/tree/contrib/examples/json

The WireGuard config format is actually much simpler than "full INI",
and you should probably be able to generate the format with just a
simple printf loop.

What precisely are you doing that you think might be easier with JSON?

> 3. While the allowed IPs construct is powerful it can sometimes feel a bit
> unintuitive. 

When a packet hits the WireGuard interface for outgoing, AllowedIPs
determines for which peer the packet will be encrypted and sent by
examining the destination address. In this sense, on outgoing, it's sort
of like a routing table.

When a packet arrives and is authenticated and decrypted, the decrypted
inner-packet's source address is examined, and the packet is only
allowed if this source address matches an AllowedIP for the
authenticated peer. In this sense, on incoming, it's sort of like an
IP access control list.

> 4. The Wireguard server is a single point of failure in a star topology. If
> the server host goes down your network goes down with it. How can we add
> more resilience in a simple way? A backup server in L2 with identical keys
> and a floating internal IP?

You don't have to run WireGuard in a star topology. You can do full mesh
if you want, or whatever other topology. One interface can have multiple
peers, so you can connect things together any which way you like.

Hope this clarifies things!

Jason
