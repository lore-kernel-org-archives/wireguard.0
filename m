Return-Path: bounce+1a9445.bb0-wireguard=lists.zx2c4.com@poorlab.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 21ed4129
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Aug 2018 21:01:49 +0000 (UTC)
Received: from m32-4.eu.mailgun.net (m32-4.eu.mailgun.net [141.193.32.4])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 84feade2
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Aug 2018 21:01:49 +0000 (UTC)
Sender: coder@poorlab.com
Received: by mail-qt0-f178.google.com with SMTP id h4-v6so528841qtj.7
 for <wireguard@lists.zx2c4.com>; Mon, 27 Aug 2018 14:15:21 -0700 (PDT)
MIME-Version: 1.0
References: <20180827171426.7c4ec614@natsu>
 <8c7ad33a-b1bc-1993-e442-836230f4bf37@gmail.com>
 <20180827185329.1a7bb24a@natsu>
 <AM5PR0802MB2450F5F2541FA58DF48E5D28FF0B0@AM5PR0802MB2450.eurprd08.prod.outlook.com>
In-Reply-To: <AM5PR0802MB2450F5F2541FA58DF48E5D28FF0B0@AM5PR0802MB2450.eurprd08.prod.outlook.com>
From: StarBrilliant <coder@poorlab.com>
Date: Tue, 28 Aug 2018 07:14:43 +1000
Message-ID: <CA+7UkwLVf28f1zg2zNUZZ7NmzBQsu+3sx7XhvSb-DqCOm2pvqA@mail.gmail.com>
Subject: Re: Getting IPv6 route advertisements to work over WG
To: Roman Mamedov <rm@romanrm.net>,
 Riccardo Paolo Bestetti <riccardo.kyogre@live.it>
Content-Type: text/plain; charset="UTF-8"
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Tue, Aug 28, 2018 at 12:46 AM Riccardo Paolo Bestetti
<riccardo.kyogre@live.it> wrote:
>
> I laughed in my head. :)
>
> For what my two cents are worth, L2 WireGuard would have its (limited) us=
e cases, but nothing beats having a simple and effective mono-purpose proto=
col like we do now. Everything else can be solved with OpenVPN or appropria=
te SDN techniques running on top of WG.


Hello,

At first, I would like to kindly invite you to search for images with
keyword "three layer network design" (if you lucky to not have the
painful experience of building a datacenter network,) so you would
know what I am talking about.

L2 WireGuard, if exists, can be very important for a "Core Layer" of a
SD-WAN network to run. That is to say, any node may process an IP
packet with any source or destination address, performing routing
decision according to BGP or other routing protocols, and send the
packet to any other node.

Please keep in mind that, in this kind of network, any node must have
an AllowedIPs=3D0.0.0.0, ::/0 to work. The trust model of a Core Layer
network is that, spoofed IP address should already be checked at
Access Layer so no other check need to be done. And we also have AEAD
cipher so even if the attacker knows the IP address of our core
router, they can not break in.

In current version if WireGuard, in order to set up the Core Layer, we
either need to:
- Establish N*(N-1) WireGuard links across N nodes
- Run network virtualization technologies on top of Wireguard like:
VXLAN / NVGRE / Multicast GRE </del>(oops I forgot Wireguard does not
support multicast)</del>

OpenVPN does not count since it sends all packets to the center, not
considered as a mesh network.


Here comes the question: Do we really need a MAC layer for routing?

Remember the past when we set up GRE tunnels over IPsec, running BGP
over it, we do not have MAC layer so we need to establish N*(N-1)
tunnels between nodes. We used OpenNHRP to discovery and build up the
tunnels automatically. This configuration is named DMVPN by Cisco and
is kind of baseline implementation in terms of SD-WAN.

Since we need OpenNHRP discovery, the discovery overhead is no less
than performing ARP / NDP. The MTU for this setup is 1406 with NAT
traversal (may vary). Additionally the numerous tunnels does not share
a common interface name so we need to generate firewall rules
automatically or use wildcard if supported.

>From the fact that Linux performs routing by sending packets with the
original L3 address, but modified L2 address, we need sort of L2
mechanism for a mesh to share a same interface name. I think the
easiest L2 we can have is a MAC layer. This only adds 14 bytes to MTU
overhead and we still have 1440 bytes, much larger than 1406.

Also switching from L3 to L2 does not actually make Wireguard
complicated. L2 is the same as L3, except for we changed IPv4 / IPv6
header to MAC header. And we still can perform security check with
AllowedMACs.


> <ot>
> And about that, I think that out-of-band comms support would be a very ni=
ce addition to the protocol. The tunnel could be initially established with=
 no tunnel addresses, but it could provide the ability for setup scripts on=
 each side to talk to each other to set up routing, addresses, firewalls, e=
tc. This would allow more complex setups, but would avoid adding all the co=
mplexity/edge cases/etc. to WireGuard.
> </ot>

The DMVPN example above is a perfect example for out-of-band comms. I
think it is worse than having a MAC layer, seriously.


On Mon, Aug 27, 2018 at 11:54 PM Roman Mamedov <rm@romanrm.net> wrote:
> I know people run VXLAN or other L2 tunneling protocols over WG. I suppos=
e
> you can call that "viable" as in "it can work", but it's a horrible worka=
round
> for the lack of better solution, nothing more. For instance the overhead
> reaches comical levels:

It reduces the inner MTU to 1390. I provide this value for convenience.


Best regards,
StarBrilliant
