Return-Path: riccardo@rcrdbrt.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 761c3625
 for <wireguard@lists.zx2c4.com>;
 Fri, 20 Apr 2018 13:56:52 +0000 (UTC)
Received: from mail.rcrdbrt.com (rcrdbrt.com [45.32.6.71])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3a203b4c
 for <wireguard@lists.zx2c4.com>;
 Fri, 20 Apr 2018 13:56:52 +0000 (UTC)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Date: Fri, 20 Apr 2018 15:57:02 +0200
From: Riccardo Berto <riccardo@rcrdbrt.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: Troubleshooting WireGuard connections
In-Reply-To: <9896807f0c6cbee1c7c99647a3c289cc@rcrdbrt.com>
References: <628776a245ad4895630fd727c80e8bf1@rcrdbrt.com>
 <CAHmME9rFZMXcjZgFQBrZHDCbqmYT+MdBEJmS6f6=5=F-7nrJBA@mail.gmail.com>
 <33d0fd1f4c60919b98b50e2b9d04fe78@rcrdbrt.com>
 <2c17e7ba2590353afa04fc1619d726c2@rcrdbrt.com>
 <CAHmME9oFYswr1KjBGiP+2iMHDGYmZhpv_SovCMT3xxMMErK19A@mail.gmail.com>
 <9896807f0c6cbee1c7c99647a3c289cc@rcrdbrt.com>
Message-ID: <f541248bfc8b47975b34acbc1c7bfa9b@rcrdbrt.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Sorry for the late answer, I've been busy with exams this week.

I updated WireGuard to the latest snapshot 20180420 on both server and 
peers.

I use unique key pairs for every host and I'm using the right 
privkey/pubkey combo, I just checked manually via the `wg pubkey` 
command.
I also tried removing all the peers but one Raspberry Pi, I'm still 
getting this weird output on the server from `tcpdump -vv -ni ens3 'port 
51820'`:

15:45:49.138470 IP (tos 0x0, ttl 52, id 27235, offset 0, flags [none], 
proto UDP (17), length 176)
     raspberry-ip.51820 > server-ip.51820: [udp sum ok] UDP, length 148
15:45:49.138883 IP (tos 0x88, ttl 64, id 2728, offset 0, flags [none], 
proto UDP (17), length 120)
     server-ip.51820 > raspberry-ip.51820: [bad udp cksum 0x92e3 -> 
0x0eae!] UDP, length 92
15:46:05.778398 IP (tos 0x0, ttl 52, id 27850, offset 0, flags [none], 
proto UDP (17), length 176)
     raspberry-ip.51820 > server-ip.51820: [udp sum ok] UDP, length 148
15:46:05.778890 IP (tos 0x88, ttl 64, id 5807, offset 0, flags [none], 
proto UDP (17), length 120)
     server-ip.51820 > raspberry-ip.51820: [bad udp cksum 0x92e3 -> 
0x85d0!] UDP, length 92
15:46:22.419043 IP (tos 0x0, ttl 52, id 28761, offset 0, flags [none], 
proto UDP (17), length 176)
     raspberry-ip.51820 > server-ip.51820: [udp sum ok] UDP, length 148
15:46:22.419748 IP (tos 0x88, ttl 64, id 8596, offset 0, flags [none], 
proto UDP (17), length 120)
     server-ip.51820 > raspberry-ip.51820: [bad udp cksum 0x92e3 -> 
0x6d8c!] UDP, length 92

Removing everything and simply adding the "always working" peer (my 
laptop) in the server config makes it working perfectly fine.
