Return-Path: <SRS0=i/Df=GF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9EC5C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  2 Jan 2021 20:51:35 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BE8420799
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  2 Jan 2021 20:51:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0BE8420799
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kerr.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e2007f5c;
	Sat, 2 Jan 2021 20:40:55 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 78063030
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 2 Jan 2021 20:40:52 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id et9so11231880qvb.10
 for <wireguard@lists.zx2c4.com>; Sat, 02 Jan 2021 12:51:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=yUAO3lPvZoBpdkt8EymzdT61ik0S8tvdmub7Vsu80dA=;
 b=nFAFa+gZUd92YOP7y70ZedFxeYExJ8ZufTL6IzSlNuhYnyE9GjFARv/F2DNpd4CZa3
 cBJI0NikgfvkU0AZ5GV4kXNvGDZoqWZkF4eTXBtrp/hT2WTjNDulSHjn+ORGyLBtjQfZ
 i0s9cIdWjyFkaWkAj13l88qr9xYrXOoQruP9vzKlPUQps52268dzrf1Nei48OoYtZIu0
 2xOefnIqhAZnnpomgBh64/CcxkgOZOP33KYFJXZ9Vo+C2zql85yR5B4mcQydZv95AsYJ
 XnXXEiaDpBCp7CzOpShaBjzZ5gVyY6xNye3NP/YhGQETvUnH8JF9yOxphBSrEHdvpRMf
 7dgw==
X-Gm-Message-State: AOAM530rJCoVoCY3u/lGGkTpwuOu22H/Qlg1rqgszzfhVk0uBeKBBr1r
 tLZZZVjI2T0PD4DpX2eILctShtZEGvVvdhVW0kz30PSya900cA==
X-Google-Smtp-Source: ABdhPJwCXcv7o5d6eVDVg2uyA1TRk+gDw2EUjmz7Sdo7WKXa3QiMQg14LLCyVt3T62eMFJe/JgGi7sNENkyx5oNTCIw=
X-Received: by 2002:ad4:4e09:: with SMTP id dl9mr68564546qvb.44.1609620689802; 
 Sat, 02 Jan 2021 12:51:29 -0800 (PST)
MIME-Version: 1.0
References: <201bd244-743e-ab52-55bb-798a1d75309e@dsander.de>
 <CAJJxGdHrrpr+NPXztZz+QBy=g+E=oOEQsW6Qh9eKGuFiVXN+Mg@mail.gmail.com>
 <67cc2ffb-cf1c-1321-ac68-d0116512847b@wim.email.be>
 <CAJJxGdF4yb+DYpxfPdxLtWzc6FZBrk=LJDPPgmKDed+6-UhDWg@mail.gmail.com>
In-Reply-To: <CAJJxGdF4yb+DYpxfPdxLtWzc6FZBrk=LJDPPgmKDed+6-UhDWg@mail.gmail.com>
From: David Kerr <david@kerr.net>
Date: Sat, 2 Jan 2021 15:51:19 -0500
Message-ID: <CAJJxGdFtqkBtqh_j1PJE3h=xAN=cr--uLgsTucM3oLfHTys-Ww@mail.gmail.com>
Subject: Re: Responses send by wireguard always use the default route
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
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

I might just add... that it could be perfectly feasible to do
something in wg-quick (or create a separate script) that adds the
necessary iptables and ip rules / ip route tables to do as requested
in a user friendly way.

On Sat, Jan 2, 2021 at 3:47 PM David Kerr <david@kerr.net> wrote:
>
> William,
>   Yes, but this is expected behavior and nothing to do with wireguard.
> I could have two WAN interfaces eth0 and eth1 for redundancy, let's
> say one connected to Comcast other to Frontier (ex-AT&T) -- the two
> ISPs that serve where I live.  If these are both always up, and I
> accept connections on either, then it is important that replies to
> incoming packets go back out on the same interface they arrived on.
> Linux does not handle this by default.  Maybe it should and that is
> pretty much what you are asking wireguard to do -- handle it by
> default.  But that is not the role of wireguard, it is the role of
> kernel packet routing and the architected mechanism to do that is to
> mark incoming packets, etc etc.
>
> David.
>
> On Sat, Jan 2, 2021 at 3:04 PM William Golding
> <wireguard-gafgf@wim.email.be> wrote:
> >
> > Hi David,
> >
> > I agree that following the standard routing table rules is good, but
> > Wireguard should reply with the same IP as the one it received the
> > packet on.
> > Right now the reply packets doesn't use the endpoint IP (that the client
> > uses) as the source IP for the return packet.
> >
> > We have a situation where our Wireguard endpoint has 2 IPs (2 uplinks).
> > It receives a packet from the client on IP 1.1.1.1, but replies from IP
> > 2.2.2.2, meaning the client just discards this packet, since it never
> > sent a packet to 2.2.2.2 and has no clue what lives on 2.2.2.2 anyway.
> >
> > Kind regards,
> > William
> >
> >
> > On 2/01/2021 20:54, David Kerr wrote:
> > > This is expected behavior... outbound packets follow routing table
> > > rules to select the "best" interface to send from.  You can use
> > > iptables to mark packets coming in from one interface and then set up
> > > an ip routing table to make sure that replies to traffic on an
> > > incoming interface go back out on the same interface.  Search for that
> > > on google for suggested solutions.  By way of an example, here is what
> > > I have on my router to make sure that any traffic coming in on wg0 to
> > > my local network(s) is sent back out over wg0.
> > >
> > > # iptables -t mangle -S | grep restore-mark
> > > -A PREROUTING -j CONNMARK --restore-mark --nfmask 0xffffffff --ctmask 0xffffffff
> > > -A OUTPUT -j CONNMARK --restore-mark --nfmask 0xffffffff --ctmask 0xffffffff
> > > # iptables -t mangle -S | grep WG0
> > > -N PREROUTING_WG0
> > > -A PREROUTING -i wg0 -j PREROUTING_WG0
> > > -A PREROUTING_WG0 -m state --state NEW -j MARK --set-xmark 0x4/0x4
> > > -A PREROUTING_WG0 -m state --state NEW -j CONNMARK --save-mark
> > > --nfmask 0xffffffff --ctmask 0xffffffff
> > > # ip rule
> > > 0: from all lookup local
> > > 1000: from 192.168.1.1/24 fwmark 0x4/0x4 lookup 300
> > > 1001: from all to <redacted> lookup 51820
> > > 32766: from all lookup main
> > > 32767: from all lookup default
> > > # ip route show table 300
> > > default dev wg0 scope link
> > >
> > > David.
> > >
> > >
> > > On Sat, Jan 2, 2021 at 10:34 AM Dominik Sander <mail@dsander.de> wrote:
> > >> Hi!
> > >>
> > >> I would like to confirm if the behavior I am seeing is intended or if my
> > >> use case should be supported without additional configuration.
> > >>
> > >> When wireguard is configured on a server that has multiple network
> > >> interfaces the response is always send through the route with the lowest
> > >> metric, even when the connection was initiated via a different interface.
> > >>
> > >> The Wireguard server is exposed via my router, port 13377 is forwarded
> > >> to 192.168.1.246, the peer is connecting via an external IP:
> > >>
> > >> # ip route
> > >> default via 10.0.0.1 dev eth1 proto dhcp src 10.0.0.171 metric 50
> > >> default via 192.168.1.1 dev eth0 proto dhcp src 192.168.1.246 metric 100
> > >> 10.0.0.0/24 dev eth1 proto kernel scope link src 10.0.0.171 metric 50
> > >> 10.0.0.1 dev eth1 proto dhcp scope link src 10.0.0.171 metric 50
> > >> 192.168.1.0/24 dev eth0 proto kernel scope link src 192.168.1.246 metric 100
> > >> 192.168.1.1 dev eth0 proto dhcp scope link src 192.168.1.246 metric 100
> > >>
> > >> # tcpdump -i any -vn "(host 80.xxx.xxx.xxx or src port 13377 or dst port 13377)"
> > >> tcpdump: listening on any, link-type LINUX_SLL (Linux cooked v1), capture size 262144 bytes
> > >> 14:13:08.767409 IP (tos 0x0, ttl 50, id 12125, offset 0, flags [none], proto UDP (17), length 176)
> > >>      80.xxx.xxx.xxx.17819 > 192.168.1.246.13377: UDP, length 148
> > >> 14:13:08.768076 IP (tos 0x88, ttl 64, id 180, offset 0, flags [none], proto UDP (17), length 120)
> > >>      10.0.0.171.13377 > .xxx.xxx.xxx.17819: UDP, length 92
> > >>
> > >> Because the response is send from the "wrong" IP address the router does not know
> > >> how to forward it and the client never is properly connected.
> > >>
> > >> I was wondering if the IP/interface of the request could also be used for the response,
> > >> to remove the need for policy based routing or iptable rules.
> > >>
> > >> The actual use case is wireguard on a OpenWRT router which has multiple WAN interfaces.
> > >> The WAN with the lowest metric is not the interface that should be used for wireguard
> > >> because it has better download speed, the wireguard WAN has better upload speed.
> > >>
> > >> Fore reference a thread discussing the problem on GitHub [1] and on the OpenWRT Forum [2].
> > >>
> > >> Thanks for creating/working on wireguard!
> > >>
> > >> Kind regards,
> > >>
> > >> Dominik
> > >>
> > >> [1] https://github.com/openwrt/packages/issues/9538
> > >> [2] https://forum.openwrt.org/t/wireguard-server-can-only-successfully-be-used-via-one-wan-interface/83374
> >
