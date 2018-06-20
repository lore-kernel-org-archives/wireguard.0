Return-Path: tth@rfa.cz
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0cdb8e2c
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Jun 2018 18:12:36 +0000 (UTC)
Received: from vodka.rfa.cz (vodka.rfa.cz [88.86.120.134])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fb8f5cc4
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Jun 2018 18:12:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by vodka.rfa.cz (Postfix) with ESMTP id 1772890CD3
 for <wireguard@lists.zx2c4.com>; Wed, 20 Jun 2018 20:17:24 +0200 (CEST)
Received: from vodka.rfa.cz ([127.0.0.1])
 by localhost (vodka.rfa.cz [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qmydYqbWZmwJ for <wireguard@lists.zx2c4.com>;
 Wed, 20 Jun 2018 20:17:23 +0200 (CEST)
Subject: Re: listen on specific IP only
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <8d3124af-de51-3253-8b89-02233566c4f9@rfa.cz>
 <CAHmME9o1F6r6z8GMj3NqAWAM9-qybLfpOW=STbSso7hOdwFBqA@mail.gmail.com>
From: Tomas Herceg <tth@rfa.cz>
Message-ID: <ab9a32b9-33e4-d264-d0d5-982774520a24@rfa.cz>
Date: Wed, 20 Jun 2018 20:17:21 +0200
MIME-Version: 1.0
In-Reply-To: <CAHmME9o1F6r6z8GMj3NqAWAM9-qybLfpOW=STbSso7hOdwFBqA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Thanks
works like a charm =)

interface: wg0-default
   public key: (no no no)
   private key: (hidden)
   listening port: 51820
   fwmark: 0xca6c

peer: GUUrqy95QclZQZ9zxMkX+5G6HklnSaqhIAJpf7naSFI=
   endpoint: PUBIP1:53
   allowed ips: 192.168.11.0/24, 172.16.16.6/32
   latest handshake: 12 seconds ago
   transfer: 532 B received, 1.12 KiB sent
   persistent keepalive: every 25 seconds

peer: 4H52v5z94+LtLaiSw47V4/1zc8TiaQ05+kI63ESY12Q=
   endpoint: PUBIP2:53
   allowed ips: 0.0.0.0/0, ::/0
   latest handshake: 36 seconds ago
   transfer: 440.24 KiB received, 109.24 KiB sent
   persistent keepalive: every 25 seconds


On 06/20/2018 07:50 PM, Jason A. Donenfeld wrote:
> We don't allow this in WireGuard by design.
> 
> However, you can easily work around this with iptables:
> 
> $ wg set wg0 listen-port 11153
> $ iptables -t nat -A PREROUTING .... -p udp --dport 53 -j REDIRECT
> --to-port 11153
> 
> Fill in the ... with --destination or --in-interface or whatever you want.
> 
> Jason
> 
