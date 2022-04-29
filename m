Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0396FC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 30 Apr 2022 14:41:40 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id dc2285e8;
	Sat, 30 Apr 2022 14:39:49 +0000 (UTC)
Received: from b-painless.mh.aa.net.uk (b-painless.mh.aa.net.uk
 [2001:8b0:0:30::52])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 22dd29ea
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 29 Apr 2022 17:32:55 +0000 (UTC)
Received: from
 6.1.c.8.3.e.5.7.c.e.5.d.a.b.c.f.0.5.8.0.9.1.8.0.0.b.8.0.1.0.0.2.ip6.arpa
 ([2001:8b0:819:850:fcba:d5ec:75e3:8c16] helo=[IPV6:fd34:5ae5:ae:ae15::1])
 by painless-b.tch.aa.net.uk with esmtp (Exim 4.94.2)
 (envelope-from <andrew-wireguard@pileofstuff.org>)
 id 1nkUUB-00H5Qt-NX
 for wireguard@lists.zx2c4.com; Fri, 29 Apr 2022 18:32:55 +0100
Message-ID: <01945803-1ae8-135b-17d8-3e5504548763@pileofstuff.org>
Date: Fri, 29 Apr 2022 18:32:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
From: Andrew Sayers <andrew-wireguard@pileofstuff.org>
Subject: bug(?): Wireguard should allow packets from multiple peers
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 30 Apr 2022 14:39:45 +0000
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hi,

I think this is a bug, but some of it is beyond me.
This e-mail might actually just be a request for help :)

In some cases, an address can be associated with multiple peers.
I'll describe a specific scenario below, but in short: a device might have
peers with different-length netmasks, and might send and receive packets via
different routes depending on configuration of devices across the network.

A configuration similar to the one described below causes the error
"Packet has unallowed src IP" for the kernel backend, and causes
"packet with disallowed source address" for the Go backend.
See 
https://git.zx2c4.com/wireguard-linux/tree/drivers/net/wireguard/receive.c#n415
and https://git.zx2c4.com/wireguard-go/tree/device/receive.go#n437
for the start of the relevant blocks. I assume other backends behave 
similarly,
but don't have relevant test devices to hand.

If I understand correctly, these blocks only accept a *single* valid peer.
I'll argue below that behaviour is incorrect, but if it's right, the message
could stand to be improved.  The kernel backend message reads:

     "%s: Packet has unallowed src IP (%pISc) from peer %llu (%pISpfsc)\n"

Something like the following would be more helpful:

     "%s: Packet has incorrect src IP (%pISc) from peer %llu (%pISpfsc) 
instead of peer %llu (%pISpfsc)\n"

Using the word "incorrect" and specifying the (single) correct value would
indicate there's only one right value and would provide a hint to fix it.

To see why multiple peers should be allowed, consider the following:

Alice and Bob each have a home server and a phone with a networked camera.
They would like their servers to regularly download pictures from the 
phones,
and would occasionally like to access the other's camera from their own 
phone.

Their servers are reliably accessible over the Internet,
while their phones are behind firewalls and change address frequently.

They need to create a VPN that lets all four devices communicate.
They don't want to unnecessarily forward packets between servers,
and don't want to reconfigure their phones when they add more devices.

So they create an "Alice and Bob" subnet with IPv6* prefix `fdab::`.

Alice's phone's Wireguard configuration looks like this:

     [Interface]
     # Alice's phone has a single IP on the VPN:
     Address = fdab:A1ce::1/128

     [Peer]
     # Alice's phone accepts all devices verified by her server:
     AllowedIPs = fdab::/16
     Endpoint = alices-server.example.com:51820

     [Peer]
     # Connect directly to Bob's server where possible:
     AllowedIPs = fdab:B0b::/64
     Endpoint = bobs-server.example.com:51820

Bob's phone's configuration is the inverse:

     [Interface]
     # Bob's phone has a single IP on the VPN:
     Address = fdab:B0b::1/128

     [Peer]
     # Bob's phone accepts all devices verified by his server:
     AllowedIPs = fdab::/16
     Endpoint = bobs-server.example.com:51820

     [Peer]
     # Connect directly to Alice's server where possible:
     AllowedIPs = fdab:A1ce::/64
     Endpoint = alices-server.example.com:51820

When Alice's server tries to access Bob's camera, it sends packets directly
to his phone.  Bob's phone sees a packet with a `fdab:A1ce::` source and
peer `alices-server.example.com`.  That's fine - it accepts the packet.

But when Alice tries to access Bob's camera from her phone, the phone
sends those packets via Bob's server.  Bob's phone sees a packet with
a `fdab:A1ce::` source and peer `bobs-server.example.com`.
Wireguard rejects these packets in my tests, presumably because
it expects Alice's packets to come from Alice's server.

Instead, Wireguard should accept packets from any peer
with a matching IP prefix in `AllowedIPs`.

To reply in advance to some obvious counterarguments:

Yes, this creates a needlessly asymmetric route (Bob's phone receives
messages via Bob's server and replies via Alice's server).  You can argue
that's bad for complexity or good for privacy.  So long as the packets 
get to
their destination, I'd argue it doesn't matter.

Yes, this two-user example would be better solved with a star network
around either Alice or Bob's server.  The value is more obvious at scale,
as load gets distributed between multiple servers.  If you prefer, you can
add Carol and Dave to the network with configurations similar to the above.

No, this can't be solved by selecting a different "correct" peer.
That would force the servers to route data between them, adding
an extra hop and wasting bandwidth.

No, this can't be solved by telling the phones about each other.
Even if we could work around whatever firewall the phone might be behind,
and we could update DNS entries quickly enough when devices change address,
Alice and Bob would have to manually update their phones for every
device on the network.  That's fine with the four nodes in the example,
but not practical at any greater scale.

	- Andrew Sayers

* I'm just using IPv6 addresses for readability, although IPv6's larger
   address space might cause more people to notice this issue
