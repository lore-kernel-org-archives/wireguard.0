Return-Path: labawi-wg@matrix-dream.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2bbb16be
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Sep 2018 09:15:24 +0000 (UTC)
Received: from mail1.matrix-dream.net (mail1.matrix-dream.net
 [IPv6:2a0a:51c0::71])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c28d0111
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Sep 2018 09:15:24 +0000 (UTC)
Received: from ivan by mail1.matrix-dream.net with local (Exim 4.91)
 (envelope-from <labawi-wg@matrix-dream.net>) id 1g1pdz-0001Qa-EX
 for wireguard@lists.zx2c4.com; Mon, 17 Sep 2018 09:16:35 +0000
Date: Mon, 17 Sep 2018 09:16:35 +0000
From: Ivan =?iso-8859-1?Q?Lab=E1th?= <labawi-wg@matrix-dream.net>
Cc: wireguard@lists.zx2c4.com
Subject: Re: what to do when the peers use different IPs to transmit and
 receive
Message-ID: <20180917091635.GB5016@matrix-dream.net>
References: <CACOeLq+PG-SFUhSZUejCVWc+uMnBq1ATRwUFFLQZBTCU6JMSew@mail.gmail.com>
 <20180916165458.GA31165@matrix-dream.net>
 <CACOeLqLN5vc7O9_VwGhipycVE5Yi+phDKKwf2U4VPzZM00KeMw@mail.gmail.com>
 <CACOeLq+GseaDTZaOKD3qA_pPoT0_xRFAgqip2+KEkxTeG1Mw=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CACOeLq+GseaDTZaOKD3qA_pPoT0_xRFAgqip2+KEkxTeG1Mw=Q@mail.gmail.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Sun, Sep 16, 2018 at 07:08:58PM -0400, Raffaele Spazzoli wrote:
> sh-4.2# iptables -t nat -n -L Chain PREROUTING (policy ACCEPT) target prot
> opt source destination Chain INPUT (policy ACCEPT) target prot opt source
> destination SNAT udp -- 10.128.2.10 0.0.0.0/0 udp dpt:5555 to:
> 192.168.99.12:5555 SNAT udp -- 10.128.1.94 0.0.0.0/0 udp dpt:5555 to:
> 192.168.99.14:5555 SNAT udp -- 10.130.0.136 0.0.0.0/0 udp dpt:5555 to:
> 192.168.99.13:5555 SNAT udp -- 10.129.1.158 0.0.0.0/0 udp dpt:5555 to:
> 192.168.99.15:5555 SNAT udp -- 10.131.0.199 0.0.0.0/0 udp dpt:5555 to:
> 192.168.99.7:5555 SNAT udp -- 10.129.2.217 0.0.0.0/0 udp dpt:5555 to:
> 192.168.99.6:5555 Chain OUTPUT (policy ACCEPT) target prot opt source
> destination Chain POSTROUTING (policy ACCEPT) target prot opt source
> destination

Please try to have no or reasonable line wrapping.

If you are applying SNAT on your source node, you are setting
the source address, which should be set to the reachable address
for the replies to come to. In your case VIP.
If you are setting it on the destination, you are IMO doing it wrong.

Same thing applies to TCP and most typical protocol, nothing special
about wireguard here.

If you have a middlebox doing DNAT, it would normaly be expected
for it or something else to do SNAT in the reverse direction.
Or, if your node has both adresses assigned, then it might be
a case of improperly set source address on outgoing packets
(e.g. your routing might need tuning).

Regards,
Ivan
