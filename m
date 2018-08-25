Return-Path: mc-mail@g.mc.cx
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9169712d
 for <wireguard@lists.zx2c4.com>;
 Sat, 25 Aug 2018 09:33:59 +0000 (UTC)
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 39762c39
 for <wireguard@lists.zx2c4.com>;
 Sat, 25 Aug 2018 09:33:59 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id f38-v6so7317471edd.8
 for <wireguard@lists.zx2c4.com>; Sat, 25 Aug 2018 02:47:15 -0700 (PDT)
Return-Path: <mc-mail@g.mc.cx>
Received: from ?IPv6:2001:470:28:7d9:296e:7728:85f7:e599?
 ([2001:470:28:7d9:296e:7728:85f7:e599])
 by smtp.googlemail.com with ESMTPSA id
 m35-v6sm2732341ede.14.2018.08.25.02.47.12
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 25 Aug 2018 02:47:12 -0700 (PDT)
Subject: Re: wireguard works for 10.0.0.x/24, but not for 10.10.10.x/24
To: wireguard@lists.zx2c4.com
References: <20180825021224.GA30319@sita-lt.atc.tcs.com>
From: Morten Christensen <mc-mail@g.mc.cx>
Message-ID: <a21f27c3-9398-4d0e-fb88-51d69c3de873@g.mc.cx>
Date: Sat, 25 Aug 2018 11:47:11 +0200
MIME-Version: 1.0
In-Reply-To: <20180825021224.GA30319@sita-lt.atc.tcs.com>
Content-Type: text/plain; charset=utf-8; format=flowed
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Den 25-08-2018 04:12, skrev Sitaram Chamarty:
> Hi
>
> I have a very peculiar problem.
>
> My wireguard server serves up for my laptop and phone using
> 10.0.0.1 as its own IP, and .2 and .3 respectively as my laptop
> and phone's IPs.
>
> But if I switch it to any other subnet, like 192.168.25.x/24, or
> even 10.10.10.x/24, it does not work.
>
> (Before someone asks, yes I did remember to change the wg0.conf
> on both sides before flipping the switch.)
>
> I can provide more details, I can run any debugging commands you
> ask me to, but there is literally no other difference except a
> `:%s/10.0.0/10.10.10/g` in /etc/wireguard/wg0.conf, on both
> sides.
>
> I am using the wg-quick command, if it matters.
>
> I can ping from the laptop to the server (10.10.10.2 ->
> 10.10.10.1).  I can access services running locally on the
> server (such as tcp/80 or udp/53).  "traceroute" will show the
> first hop as 10.10.10.1, but after that -- silence.  It just
> won't go beyond that.
>
> So whatever it is, it seems to be on the server side. Packets
> make it to the remote endpoint, but don't get routed out to the
> internet after that.

Most times vpn-packets get a step further. The remote endpoint do not 
know how to return them to the vpn-server.

Is your wireguard-server the router/gateway on your system ?

--

Morten Christensen
