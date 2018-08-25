Return-Path: sitaramc@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8026f4f9
 for <wireguard@lists.zx2c4.com>;
 Sat, 25 Aug 2018 13:03:44 +0000 (UTC)
Received: from mail-wm0-x22f.google.com (mail-wm0-x22f.google.com
 [IPv6:2a00:1450:400c:c09::22f])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a4f9fd50
 for <wireguard@lists.zx2c4.com>;
 Sat, 25 Aug 2018 13:03:44 +0000 (UTC)
Received: by mail-wm0-x22f.google.com with SMTP id o18-v6so4087447wmc.0
 for <wireguard@lists.zx2c4.com>; Sat, 25 Aug 2018 06:17:01 -0700 (PDT)
Return-Path: <sitaramc@gmail.com>
Date: Sat, 25 Aug 2018 18:46:54 +0530
From: Sitaram Chamarty <sitaramc@gmail.com>
To: Morten Christensen <mc-mail@g.mc.cx>
Subject: Re: wireguard works for 10.0.0.x/24, but not for 10.10.10.x/24
Message-ID: <20180825131654.GA24796@sita-lt.atc.tcs.com>
References: <20180825021224.GA30319@sita-lt.atc.tcs.com>
 <a21f27c3-9398-4d0e-fb88-51d69c3de873@g.mc.cx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <a21f27c3-9398-4d0e-fb88-51d69c3de873@g.mc.cx>
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Sat, Aug 25, 2018 at 11:47:11AM +0200, Morten Christensen wrote:
> Den 25-08-2018 04:12, skrev Sitaram Chamarty:
> > Hi
> > 
> > I have a very peculiar problem.
> > 
> > My wireguard server serves up for my laptop and phone using
> > 10.0.0.1 as its own IP, and .2 and .3 respectively as my laptop
> > and phone's IPs.
> > 
> > But if I switch it to any other subnet, like 192.168.25.x/24, or
> > even 10.10.10.x/24, it does not work.
> > 
> > (Before someone asks, yes I did remember to change the wg0.conf
> > on both sides before flipping the switch.)
> > 
> > I can provide more details, I can run any debugging commands you
> > ask me to, but there is literally no other difference except a
> > `:%s/10.0.0/10.10.10/g` in /etc/wireguard/wg0.conf, on both
> > sides.
> > 
> > I am using the wg-quick command, if it matters.
> > 
> > I can ping from the laptop to the server (10.10.10.2 ->
> > 10.10.10.1).  I can access services running locally on the
> > server (such as tcp/80 or udp/53).  "traceroute" will show the
> > first hop as 10.10.10.1, but after that -- silence.  It just
> > won't go beyond that.
> > 
> > So whatever it is, it seems to be on the server side. Packets
> > make it to the remote endpoint, but don't get routed out to the
> > internet after that.
> 
> Most times vpn-packets get a step further. The remote endpoint do not know
> how to return them to the vpn-server.
> 
> Is your wireguard-server the router/gateway on your system ?

Thank you!

It is the gateway, and that reminded me that, way back when I
first set it up, I had added an iptables MASQUERADE rule, but
only for 10.0.0.0/24.

I had completely forgotten about this till I saw your reply.

Sorry for the PEBCAK; all good now!

sitaram

> 
> --
> 
> Morten Christensen
> 
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
