Return-Path: bruno@wolff.to
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 09dbe165
 for <wireguard@lists.zx2c4.com>;
 Fri, 20 Oct 2017 17:47:01 +0000 (UTC)
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id 365128a7
 for <wireguard@lists.zx2c4.com>;
 Fri, 20 Oct 2017 17:47:00 +0000 (UTC)
Date: Fri, 20 Oct 2017 12:39:41 -0500
From: Bruno Wolff III <bruno@wolff.to>
To: wireguard@lists.zx2c4.com
Subject: crypto routing with subnets?
Message-ID: <20171020173941.GA23750@wolff.to>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

I want to try to route a local network over wireguard through my router 
while not breaking a direct connection from my server while I'm testing 
the new setup. And I'm wondering if I'm going to need two wg devices or 
if I can use one?

On the destination the config would be something like:
[peer]
PublicKey = I37b0D0JbbBrSyH/oHjdMvL0P3m8kZQ5RiJ0Dha3ClU=
    Endpoint = 98.103.208.27:992
    AllowedIPs = 192.168.7.1/32
    PersistentKeepalive = 25
[peer]
PublicKey = I37b0D0JbbBrSyH/oHjdMvL0P3m8kZQ5RiJ0Dha3ClU=
    Endpoint = 98.103.208.26:992
    AllowedIPs = 192.168.0.0/16
    PersistentKeepalive = 25

It seems like this should work, though the public keys would be different 
in the real setup. (The second peer doesn't exist yet, so I can't use its 
public key in the example.)

So my main question is will traffic to 192.168.7.1 go to the first peer even 
though it is covered by the network in the second peer or do I need to 
make a wg0 and wg1 and do the routing at the interface level?

If I actually left the public keys the same, would this still work? (The 
securtity domain is nearly the same as the hardware is in the same place.) 
I don't think it could work as I think this would break tracking what IP 
address was last used by each peer.

Eventually I want to do something a bit more complicated, because I will only 
want devices that connected to my router with wireguard (i.e. my devices, 
not guests on my network) to be able to send packets over that tunnel. 
But for now traffic going through the tunnel doesn't get any access where I 
would be worried about guest traffic using the tunnel. At that time the server 
and router peer networks will be disjoint.
