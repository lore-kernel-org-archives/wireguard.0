Return-Path: riccardo@rcrdbrt.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2ed8c10e
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Apr 2018 07:42:11 +0000 (UTC)
Received: from mail.rcrdbrt.com (rcrdbrt.com [45.32.6.71])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id caa0ce04
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Apr 2018 07:42:11 +0000 (UTC)
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Date: Sat, 14 Apr 2018 09:56:21 +0200
From: Riccardo Berto <riccardo@rcrdbrt.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: Troubleshooting WireGuard connections
In-Reply-To: <CAHmME9oFYswr1KjBGiP+2iMHDGYmZhpv_SovCMT3xxMMErK19A@mail.gmail.com>
References: <628776a245ad4895630fd727c80e8bf1@rcrdbrt.com>
 <CAHmME9rFZMXcjZgFQBrZHDCbqmYT+MdBEJmS6f6=5=F-7nrJBA@mail.gmail.com>
 <33d0fd1f4c60919b98b50e2b9d04fe78@rcrdbrt.com>
 <2c17e7ba2590353afa04fc1619d726c2@rcrdbrt.com>
 <CAHmME9oFYswr1KjBGiP+2iMHDGYmZhpv_SovCMT3xxMMErK19A@mail.gmail.com>
Message-ID: <9896807f0c6cbee1c7c99647a3c289cc@rcrdbrt.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 2018-04-14 03:26, Jason A. Donenfeld wrote:
> Hi Riccardo,
> 
> Based on those tcpdump timestamps, it looks like the handshake
> response happens nearly immediately after the handshake initiation.
> Yet from your description, it appears only after many moments. In my
> experience, tcpdump blocks like this when it has to do too many DNS
> resolutions and the resolver is slow. You might get a more accurate
> picture of what is going on if you additionally pass `-n` to tcpdump,
> which should make the packets appear more instantaneously.
> 
> Jason

I used tne -n flag on tcpdump now and I'm having the exact same problem. 
Now DNS servers aren't involved.
It worked briefly the first time I tried. I was happily getting ICMP 
requests and responses on the client. Then I stopped `ping 10.0.0.1` 
and, without touching anything, ran it again and it hung.

#################
# Client output #
#################
rpi3-two pi # ping 10.0.0.1
PING 10.0.0.1 (10.0.0.1) 56(84) bytes of data.
^C
--- 10.0.0.1 ping statistics ---
25 packets transmitted, 0 received, 100% packet loss, time 24954ms


#################
# Server output #
#################
╭─root@rcrd-online /etc/wireguard
╰─# tcpdump -vv -ni ens3 'port 51820'
tcpdump: listening on ens3, link-type EN10MB (Ethernet), capture size 
262144 bytes
09:49:43.996538 IP (tos 0x0, ttl 52, id 25142, offset 0, flags [none], 
proto UDP (17), length 176)
     ---.51821 > ---.51820: [udp sum ok] UDP, length 148
09:49:43.997138 IP (tos 0x88, ttl 64, id 42124, offset 0, flags [none], 
proto UDP (17), length 120)
     ---.51820 > ---.51821: [bad udp cksum 0x92e3 -> 0xb363!] UDP, length 
92
09:50:00.636714 IP (tos 0x0, ttl 52, id 26161, offset 0, flags [none], 
proto UDP (17), length 176)
     ---.51821 > ---.51820: [udp sum ok] UDP, length 148
09:50:00.637240 IP (tos 0x88, ttl 64, id 48907, offset 0, flags [none], 
proto UDP (17), length 120)
     ---.51820 > ---.51821: [bad udp cksum 0x92e3 -> 0xefc7!] UDP, length 
92
