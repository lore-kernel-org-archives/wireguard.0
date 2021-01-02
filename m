Return-Path: <SRS0=i/Df=GF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E56EC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  2 Jan 2021 20:48:18 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2559B206CA
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  2 Jan 2021 20:48:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2559B206CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kerr.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f8b5ba23;
	Sat, 2 Jan 2021 20:37:11 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e05401b2
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 2 Jan 2021 20:37:09 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id b64so20307759qkc.12
 for <wireguard@lists.zx2c4.com>; Sat, 02 Jan 2021 12:47:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=L6vREWtMB5jbIyTHEcOxnklLp23LltlEMqEyTWbRv9w=;
 b=riGV9qS8WmXuOiFinTdB/kUsUK3JAuPsgxfqAXzB50YE5ognsLCVfLf2+pqjpPVLBY
 D4gC1bZCFXh4aEUAu+yx9wIjp/yucH4aJECwNbs8/c+3HszHefr2LoblcQpyARx9mWcI
 ybXz+fT7WI78Ao5OYaQtVwslXoGxbp+3n+p/SPY+KlqBa8ESoMXF9aLyN1IollknqFwf
 cRqAxoGUi2ZuImcmijsFAV9/mtX1OsJcIPpW0ht1p902aM2i5SdU3F6+Wj/Lj9WMtJkt
 wnNbXZtHt/TvamsfZheASfiebzIKNoQfLufmFb9WioZxNJuf3fhNN9ZjlqCafqW2wx9V
 +LSA==
X-Gm-Message-State: AOAM5331dMTHt09KQEttpkSGaJWJu+3I2zUEk56Dys5GtPOv1+Jcz0+G
 nYtmQD1VjoTaWLUg4H1/FsU8ZLSa2h46Qvw3YW589U4pukUJdXmV
X-Google-Smtp-Source: ABdhPJyEjXyspGFh7lf775ixxYrA71K6OWH+ryjD1IsZ+EjxSMLfyBaZEmv+8ILOYVPfRo3bLkjat5g/8CZX4GhMPQo=
X-Received: by 2002:a37:8b81:: with SMTP id
 n123mr66838714qkd.242.1609620467252; 
 Sat, 02 Jan 2021 12:47:47 -0800 (PST)
MIME-Version: 1.0
References: <201bd244-743e-ab52-55bb-798a1d75309e@dsander.de>
 <CAJJxGdHrrpr+NPXztZz+QBy=g+E=oOEQsW6Qh9eKGuFiVXN+Mg@mail.gmail.com>
 <67cc2ffb-cf1c-1321-ac68-d0116512847b@wim.email.be>
In-Reply-To: <67cc2ffb-cf1c-1321-ac68-d0116512847b@wim.email.be>
From: David Kerr <david@kerr.net>
Date: Sat, 2 Jan 2021 15:47:36 -0500
Message-ID: <CAJJxGdF4yb+DYpxfPdxLtWzc6FZBrk=LJDPPgmKDed+6-UhDWg@mail.gmail.com>
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

William,
  Yes, but this is expected behavior and nothing to do with wireguard.
I could have two WAN interfaces eth0 and eth1 for redundancy, let's
say one connected to Comcast other to Frontier (ex-AT&T) -- the two
ISPs that serve where I live.  If these are both always up, and I
accept connections on either, then it is important that replies to
incoming packets go back out on the same interface they arrived on.
Linux does not handle this by default.  Maybe it should and that is
pretty much what you are asking wireguard to do -- handle it by
default.  But that is not the role of wireguard, it is the role of
kernel packet routing and the architected mechanism to do that is to
mark incoming packets, etc etc.

David.

On Sat, Jan 2, 2021 at 3:04 PM William Golding
<wireguard-gafgf@wim.email.be> wrote:
>
> Hi David,
>
> I agree that following the standard routing table rules is good, but
> Wireguard should reply with the same IP as the one it received the
> packet on.
> Right now the reply packets doesn't use the endpoint IP (that the client
> uses) as the source IP for the return packet.
>
> We have a situation where our Wireguard endpoint has 2 IPs (2 uplinks).
> It receives a packet from the client on IP 1.1.1.1, but replies from IP
> 2.2.2.2, meaning the client just discards this packet, since it never
> sent a packet to 2.2.2.2 and has no clue what lives on 2.2.2.2 anyway.
>
> Kind regards,
> William
>
>
> On 2/01/2021 20:54, David Kerr wrote:
> > This is expected behavior... outbound packets follow routing table
> > rules to select the "best" interface to send from.  You can use
> > iptables to mark packets coming in from one interface and then set up
> > an ip routing table to make sure that replies to traffic on an
> > incoming interface go back out on the same interface.  Search for that
> > on google for suggested solutions.  By way of an example, here is what
> > I have on my router to make sure that any traffic coming in on wg0 to
> > my local network(s) is sent back out over wg0.
> >
> > # iptables -t mangle -S | grep restore-mark
> > -A PREROUTING -j CONNMARK --restore-mark --nfmask 0xffffffff --ctmask 0xffffffff
> > -A OUTPUT -j CONNMARK --restore-mark --nfmask 0xffffffff --ctmask 0xffffffff
> > # iptables -t mangle -S | grep WG0
> > -N PREROUTING_WG0
> > -A PREROUTING -i wg0 -j PREROUTING_WG0
> > -A PREROUTING_WG0 -m state --state NEW -j MARK --set-xmark 0x4/0x4
> > -A PREROUTING_WG0 -m state --state NEW -j CONNMARK --save-mark
> > --nfmask 0xffffffff --ctmask 0xffffffff
> > # ip rule
> > 0: from all lookup local
> > 1000: from 192.168.1.1/24 fwmark 0x4/0x4 lookup 300
> > 1001: from all to <redacted> lookup 51820
> > 32766: from all lookup main
> > 32767: from all lookup default
> > # ip route show table 300
> > default dev wg0 scope link
> >
> > David.
> >
> >
> > On Sat, Jan 2, 2021 at 10:34 AM Dominik Sander <mail@dsander.de> wrote:
> >> Hi!
> >>
> >> I would like to confirm if the behavior I am seeing is intended or if my
> >> use case should be supported without additional configuration.
> >>
> >> When wireguard is configured on a server that has multiple network
> >> interfaces the response is always send through the route with the lowest
> >> metric, even when the connection was initiated via a different interface.
> >>
> >> The Wireguard server is exposed via my router, port 13377 is forwarded
> >> to 192.168.1.246, the peer is connecting via an external IP:
> >>
> >> # ip route
> >> default via 10.0.0.1 dev eth1 proto dhcp src 10.0.0.171 metric 50
> >> default via 192.168.1.1 dev eth0 proto dhcp src 192.168.1.246 metric 100
> >> 10.0.0.0/24 dev eth1 proto kernel scope link src 10.0.0.171 metric 50
> >> 10.0.0.1 dev eth1 proto dhcp scope link src 10.0.0.171 metric 50
> >> 192.168.1.0/24 dev eth0 proto kernel scope link src 192.168.1.246 metric 100
> >> 192.168.1.1 dev eth0 proto dhcp scope link src 192.168.1.246 metric 100
> >>
> >> # tcpdump -i any -vn "(host 80.xxx.xxx.xxx or src port 13377 or dst port 13377)"
> >> tcpdump: listening on any, link-type LINUX_SLL (Linux cooked v1), capture size 262144 bytes
> >> 14:13:08.767409 IP (tos 0x0, ttl 50, id 12125, offset 0, flags [none], proto UDP (17), length 176)
> >>      80.xxx.xxx.xxx.17819 > 192.168.1.246.13377: UDP, length 148
> >> 14:13:08.768076 IP (tos 0x88, ttl 64, id 180, offset 0, flags [none], proto UDP (17), length 120)
> >>      10.0.0.171.13377 > .xxx.xxx.xxx.17819: UDP, length 92
> >>
> >> Because the response is send from the "wrong" IP address the router does not know
> >> how to forward it and the client never is properly connected.
> >>
> >> I was wondering if the IP/interface of the request could also be used for the response,
> >> to remove the need for policy based routing or iptable rules.
> >>
> >> The actual use case is wireguard on a OpenWRT router which has multiple WAN interfaces.
> >> The WAN with the lowest metric is not the interface that should be used for wireguard
> >> because it has better download speed, the wireguard WAN has better upload speed.
> >>
> >> Fore reference a thread discussing the problem on GitHub [1] and on the OpenWRT Forum [2].
> >>
> >> Thanks for creating/working on wireguard!
> >>
> >> Kind regards,
> >>
> >> Dominik
> >>
> >> [1] https://github.com/openwrt/packages/issues/9538
> >> [2] https://forum.openwrt.org/t/wireguard-server-can-only-successfully-be-used-via-one-wan-interface/83374
>
