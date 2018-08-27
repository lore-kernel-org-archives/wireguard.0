Return-Path: rm@romanrm.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fb598734
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Aug 2018 13:40:00 +0000 (UTC)
Received: from len.romanrm.net (len.romanrm.net [91.121.75.85])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 81ecc3f6
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Aug 2018 13:40:00 +0000 (UTC)
Date: Mon, 27 Aug 2018 18:53:29 +0500
From: Roman Mamedov <rm@romanrm.net>
To: netravnen@gmail.com
Subject: Re: Getting IPv6 route advertisements to work over WG
Message-ID: <20180827185329.1a7bb24a@natsu>
In-Reply-To: <8c7ad33a-b1bc-1993-e442-836230f4bf37@gmail.com>
References: <20180827171426.7c4ec614@natsu>
 <8c7ad33a-b1bc-1993-e442-836230f4bf37@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Mon, 27 Aug 2018 15:32:49 +0200
netravnen@gmail.com wrote:

> When using multicast over WireGuard, would it not be more viable to use
> an extra encapsulation layer to run multicast inside of?
> 
> I am specifically thinking of running either GRE or L2TPv3 over wgX.

I know people run VXLAN or other L2 tunneling protocols over WG. I suppose
you can call that "viable" as in "it can work", but it's a horrible workaround
for the lack of better solution, nothing more. For instance the overhead
reaches comical levels:

  TCP
    over IP
      over Ethernet
        over VXLAN
          over UDP
            over IP
              over Wireguard
                over UDP
                  over IP 
                    over Ethernet

Add more fun if you use something else such as PPPoE for Internet connection,
or a 6in4 tunnel for IPv6. At some point the whole thing will break down
because you can no longer fit 1280-byte packets into innermost MTU, and IPv6
won't work.

Not to mention the additional management overhead of an inner L2 tunneling
layer.

Now, if WG would support L2 mode natively (say, with AllowedMACs instead of
AllowedIPs) it would be awesome and that would solve a great number of other
issues as well. But since that appears to be unlikely, and since RAs already
mostly work, with just one piece missing, I hope at least that piece gets
dropped in at some point, and that we aren't stuck at least for this use case
with "more viable" tunneling workarounds forever.

-- 
With respect,
Roman
