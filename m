Return-Path: sitaramc@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 62271ec2
 for <wireguard@lists.zx2c4.com>;
 Sat, 25 Aug 2018 01:59:15 +0000 (UTC)
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3634d5d7
 for <wireguard@lists.zx2c4.com>;
 Sat, 25 Aug 2018 01:59:15 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id u10-v6so3334282pgr.1
 for <wireguard@lists.zx2c4.com>; Fri, 24 Aug 2018 19:12:28 -0700 (PDT)
Return-Path: <sitaramc@gmail.com>
Received: from sita-lt.atc.tcs.com ([183.83.81.223])
 by smtp.gmail.com with ESMTPSA id f6-v6sm15249457pff.29.2018.08.24.19.12.26
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 24 Aug 2018 19:12:27 -0700 (PDT)
Date: Sat, 25 Aug 2018 07:42:24 +0530
From: Sitaram Chamarty <sitaramc@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: wireguard works for 10.0.0.x/24, but not for 10.10.10.x/24
Message-ID: <20180825021224.GA30319@sita-lt.atc.tcs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi

I have a very peculiar problem.

My wireguard server serves up for my laptop and phone using
10.0.0.1 as its own IP, and .2 and .3 respectively as my laptop
and phone's IPs.

But if I switch it to any other subnet, like 192.168.25.x/24, or
even 10.10.10.x/24, it does not work.

(Before someone asks, yes I did remember to change the wg0.conf
on both sides before flipping the switch.)

I can provide more details, I can run any debugging commands you
ask me to, but there is literally no other difference except a
`:%s/10.0.0/10.10.10/g` in /etc/wireguard/wg0.conf, on both
sides.

I am using the wg-quick command, if it matters.

I can ping from the laptop to the server (10.10.10.2 ->
10.10.10.1).  I can access services running locally on the
server (such as tcp/80 or udp/53).  "traceroute" will show the
first hop as 10.10.10.1, but after that -- silence.  It just
won't go beyond that.

So whatever it is, it seems to be on the server side. Packets
make it to the remote endpoint, but don't get routed out to the
internet after that.

Both sides are running the same version of wireguard (20180809).
Server is CentOS 7.4, client is Fedora 28.

Does anything in this ring a bell for anyone?

thanks
sitaram
