Return-Path: smntov@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 014f5d2e
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Apr 2018 12:44:04 +0000 (UTC)
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 981d90c4
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Apr 2018 12:44:04 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id r82so23381419wme.0
 for <wireguard@lists.zx2c4.com>; Tue, 10 Apr 2018 05:57:50 -0700 (PDT)
Return-Path: <smntov@gmail.com>
Message-ID: <1523365067.9961.32.camel@gmail.com>
Subject: Re: wg-ip, a tool to assign automatic ip addresses to wireguard
 interfaces
From: ST <smntov@gmail.com>
To: Christophe-Marie Duquesne <chmd@chmd.fr>
Date: Tue, 10 Apr 2018 15:57:47 +0300
In-Reply-To: <CAHLp1Yk8oz-agDoJzKuU1SK9zsFL7HKep02r-n3hNcrYffp-CQ@mail.gmail.com>
References: <CAHLp1Yk8oz-agDoJzKuU1SK9zsFL7HKep02r-n3hNcrYffp-CQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

PS: you write that the "tool does not handle collisions", but does it
recognize and/or warn about them? I.e. if a peer with the newly
suggested IP exists already - will it warn?

For automation it would be nice to have some sort of "force" or
"keep-trying" options, so the tool regenerates the keys trying to find a
free IP and subsequently assigns it. With the enabled SaveConfig options
the new IP will be saved in the config file...


On Tue, 2018-04-10 at 14:32 +0200, Christophe-Marie Duquesne wrote:
> Hi,
> 
> In an old thread [1], danrl suggested deriving node addresses from the
> peer public keys. I liked this idea, so I wrote a tool to do it. It
> works like this:
> 
> generate an ipv6 address from the default ipv6 subnet of the script
> (fd1a:6126:2887::/48):
> wg-ip -6 gen uymIRDopubn0XRLLRTymOvuK2iG90wRcXxhsb2EOYzg=
> fd1a:6126:2887:17a1:2793:518a:7886:e8a4
> 
> generate an ipv4 address from the default ipv4 subnet of the script
> (10.0.0.0/8):
> wg-ip -4 gen uymIRDopubn0XRLLRTymOvuK2iG90wRcXxhsb2EOYzg=
> 10.0.37.175
> 
> generate an ip address from a custom subnet (ip version inferred from prefix):
> wg-ip --subnet 172.16.0.0/12 gen uymIRDopubn0XRLLRTymOvuK2iG90wRcXxhsb2EOYzg=
> 172.16.37.175
> 
> assign an ip address to the selected interface and allowed ips to the
> peers, all in the same subnet (existing allowed ips are preserved):
> wg-ip [-4|-6|--subnet <subnet>] [dev wg0] apply
> 
> or just see which commands 'apply' would run
> wg-ip [-4|-6|--subnet <subnet>] [dryrun]
> 
> Derivation algorithm: the bytes of the ip address are taken from the
> beginning bytes of the sha256 hash of the corresponding pubkey, and
> are masked with the network mask.
> 
> The tool does not handle collisions nor special addresses: The idea is
> to pick a subnet large enough so that these cases are unlikely enough.
> For ipv6, with a /48 prefix, that would be a 80 bits address space, so
> birthday attacks say one needs about 2^40 peers until they reach a
> significant risk of collision, which will fill the routing table well
> before this even becomes a problem. For ipv4 with the 10.0.0.0/8, the
> address space is 24 bits, so odds are still pretty good until 2^12
> peers, but this time it is reachable. For my personal needs (about 10
> peers) and for anyone with a network of less than 1000 peers (if my
> maths are correct), it should be largely sufficient (collision
> probability under 5%). Worst case, if you don't like the ip address
> generated, just use another key pair.
> 
> It is written in bash, in the spirit of wg-quick. I am definitely open
> to have it integrated in wireguard if people show interest.
> 
> https://github.com/chmduquesne/wg-ip
> 
> [1]: https://lists.zx2c4.com/pipermail/wireguard/2016-December/000812.html
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
