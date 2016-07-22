Return-Path: bruno@wolff.to
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id 2d2c5f66
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Jul 2016 09:09:07 +0000 (UTC)
Date: Fri, 22 Jul 2016 04:09:13 -0500
From: Bruno Wolff III <bruno@wolff.to>
To: Baptiste Jonglez <baptiste@bitsofnetworks.org>
Message-ID: <20160722090913.GA8383@wolff.to>
References: <20160721205742.GA10312@wolff.to>
 <20160722081821.GA11505@lud.polynome.dn42>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
In-Reply-To: <20160722081821.GA11505@lud.polynome.dn42>
Cc: wireguard@lists.zx2c4.com
Subject: Re: [WireGuard] Using wireguard link as a proxy?
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Fri, Jul 22, 2016 at 10:18:21 +0200,
  Baptiste Jonglez <baptiste@bitsofnetworks.org> wrote:
>
>Yes, the notion of "immediate next destinaton" does not make sense for
>Wireguard.  It encapsulates plain IP, not Ethernet.

I thought that the next IP address might have been available for wireguard 
to see as the information seems to be available for routing. But as you 
mention below and I realized, that doesn't help with the return packets 
since they can have (almost) any source address.

>You need "allowed ips 0.0.0.0/0" here.  Your situation is just a regular
>client/server tunneling setup, there's nothing special about "proxying",
>whatever that means.

Yeah I realized that when thinking about this some more. "Proxy" in this 
case means source nat will be used on the outgoing packets.

Thanks.
