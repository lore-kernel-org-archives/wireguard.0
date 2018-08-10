Return-Path: ahanins@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b85660fd
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Aug 2018 07:55:05 +0000 (UTC)
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fae49837
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Aug 2018 07:55:05 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id l15-v6so6493941lji.6
 for <wireguard@lists.zx2c4.com>; Fri, 10 Aug 2018 01:06:25 -0700 (PDT)
Return-Path: <ahanins@gmail.com>
From: Andrejs Hanins <ahanins@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH 0/1] Fix broken inner checksums for non TCP/UDP protocols
Date: Fri, 10 Aug 2018 11:06:16 +0300
Message-Id: <20180810080617.20283-1-ahanins@gmail.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi,
    I'm using GRE tunnel (transparent Ethernet bridging flavor) over Wireguard
interface to be able to bridge L2 network segments. The typical protocol chain
looks like this IP->GRE->EthernetHeader->IP->UDP. UDP here is the packet sent
from the L2 network segment which is tunneled using GRE over Wireguard. Indeed,
there is a checksum inside UDP header which is, as a rule, kept partially
calculated while packet travels through network stack and outer protocols are
added until the packet reaches WG device which exposes NETIF_F_HW_CSUM feature
meaning it can handle checksum offload for all protocols.

    But the problem here is that skb_checksum_setup called from skb_encrypt
handles only TCP/UDP protocols under top level IP, but in my case there is a
GRE protocol there, so skb_checksum_help is not called and packet continues its
life with unfinished (broken) checksum and gets encrypted as-is. When such
packet is received by other side and reaches L2 networks it's seen there with
a broken checksum inside the UDP header.

    The fact that Wireguard on the receiving side sets skb->ip_summed to
CHECKSUM_UNNECESSARY partially mitigates the problem by telling network stack
on the receiving side that validation of the checksum is not necessary, so
local TCP stack, for example, works fine. But it doesn't help in situations
when packet needs to be forwarded further (sent out from the box). In this case
there is no way we can tell next hop that checksum verification for this packet
is not necessary, we just send it out with bad checksum and packet gets dropped
on the next hop box.

    I think the issue of the original code was the wrong usage of
skb_checksum_setup, simply because it's not needed in this case. Instead, we
can just rely on ip_summed skb field to see if partial checksum needs to be
finalized or not. Note that many other drivers in kernel follow this approach.

    I'm not a kernel networking expert, but additional change (paranoid?)
could be to call skb_checksum_setup followed by skb_checksum_help for packets
which don't have CHECKSUM_PARTIAL in order to make sure we handle some buggy
packets. This trick is done in checksum_setup from xen-netback. But I'm
really not sure whether it's needed in Wireguard case...

____________
BR, Andrey

Andrejs Hanins (1):
  Calculate inner checksums for all L4 protocols (was for TCP/UDP only).

 src/send.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
2.17.1
