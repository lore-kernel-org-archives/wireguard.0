Return-Path: riccardo@rcrdbrt.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 69bb54cc
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Apr 2018 22:22:15 +0000 (UTC)
Received: from mail.rcrdbrt.com (rcrdbrt.com [45.32.6.71])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c5977bb4
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Apr 2018 22:22:15 +0000 (UTC)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Date: Sat, 14 Apr 2018 00:36:25 +0200
From: Riccardo Berto <riccardo@rcrdbrt.com>
To: jason@zx2c4.com
Subject: Re: Troubleshooting WireGuard connections
In-Reply-To: <33d0fd1f4c60919b98b50e2b9d04fe78@rcrdbrt.com>
References: <628776a245ad4895630fd727c80e8bf1@rcrdbrt.com>
 <CAHmME9rFZMXcjZgFQBrZHDCbqmYT+MdBEJmS6f6=5=F-7nrJBA@mail.gmail.com>
 <33d0fd1f4c60919b98b50e2b9d04fe78@rcrdbrt.com>
Message-ID: <2c17e7ba2590353afa04fc1619d726c2@rcrdbrt.com>
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

I didn't think about using tcpdump by checking the default interface, 
thanks for the suggestion!

I updated to the April 2018 snapshot on every peer.

I removed the server endpoints and since I was there, switched the 
server port to 51820, the protocol "default" one. It still works for the 
laptop but not on the 2 Raspberry Pis. When I run `ping 10.0.0.1` from 
one of them and `tcpdump -i ens3 'port 51820'` on the server, I promptly 
get this message:

00:20:36.146370 IP (tos 0x0, ttl 52, id 16258, offset 0, flags [none], 
proto UDP (17), length 176)
     net-2-34-88-190.cust.vodafonedsl.it.51821 > rcrd-online.51820: [udp 
sum ok] UDP, length 148

and it stops there, with no ping answers. When I stop the ping command 
with Ctrl-C, after a few moments I get:

00:20:36.146853 IP (tos 0x88, ttl 64, id 12226, offset 0, flags [none], 
proto UDP (17), length 120)
     rcrd-online.51820 > net-2-34-88-190.cust.vodafonedsl.it.51821: [bad 
udp cksum 0x8ebc -> 0xabb8!] UDP, length 92

and then STDOUT returns silent... Inexorably waiting for some other 
packet that never arrives...

Trying `ping 10.0.0.1` from the laptop (that has always worked with 0 
issues) works correctly but tcpdump on the server shows a bad UDP 
checksum, not sure if this is expected behavior.
