Return-Path: riccardo@rcrdbrt.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0f4fdf46
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Apr 2018 09:09:50 +0000 (UTC)
Received: from mail.rcrdbrt.com (rcrdbrt.com [45.32.6.71])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8a062247
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Apr 2018 09:09:50 +0000 (UTC)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Date: Fri, 13 Apr 2018 11:23:55 +0200
From: Riccardo Berto <riccardo@rcrdbrt.com>
To: wireguard@lists.zx2c4.com
Subject: Re: Re: Troubleshooting WireGuard connections
Message-ID: <628776a245ad4895630fd727c80e8bf1@rcrdbrt.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

I wasn't clear in the previous email, I'm only seeing ICMP requests and 
not answers so no traffic through the tunnel.
Also, I have not setup forwarding to another interface, maybe that's the 
next step for a road-warrior OpenVPN-like setup, but at the moment I'm 
keeping things simple and I'm just trying to figure out how to have an 
internal private network only.
As for the ports, the different ports per host is silly but I needed 
that because 3 of my hosts are under the same Wi-Fi and I needed to open 
different ports in the router to forward traffic to the right devices 
easily.

This is the output of the command requested:

rpi3-two pi # tcpdump -ni any icmp
tcpdump: verbose output suppressed, use -v or -vv for full protocol 
decode
listening on any, link-type LINUX_SLL (Linux cooked), capture size 
262144 bytes
10:35:02.177750 IP 10.0.0.3 > 10.0.0.1: ICMP echo request, id 25708, seq 
1, length 64
10:35:03.232761 IP 10.0.0.3 > 10.0.0.1: ICMP echo request, id 25708, seq 
2, length 64
10:35:04.272760 IP 10.0.0.3 > 10.0.0.1: ICMP echo request, id 25708, seq 
3, length 64
10:35:05.312754 IP 10.0.0.3 > 10.0.0.1: ICMP echo request, id 25708, seq 
4, length 64
10:35:06.352767 IP 10.0.0.3 > 10.0.0.1: ICMP echo request, id 25708, seq 
5, length 64
10:35:07.392772 IP 10.0.0.3 > 10.0.0.1: ICMP echo request, id 25708, seq 
6, length 64
10:35:08.432740 IP 10.0.0.3 > 10.0.0.1: ICMP echo request, id 25708, seq 
7, length 64
10:35:09.472758 IP 10.0.0.3 > 10.0.0.1: ICMP echo request, id 25708, seq 
8, length 64
10:35:10.512756 IP 10.0.0.3 > 10.0.0.1: ICMP echo request, id 25708, seq 
9, length 64
10:35:11.552763 IP 10.0.0.3 > 10.0.0.1: ICMP echo request, id 25708, seq 
10, length 64
10:35:12.592774 IP 10.0.0.3 > 10.0.0.1: ICMP echo request, id 25708, seq 
11, length 64
10:35:13.632778 IP 10.0.0.3 > 10.0.0.1: ICMP echo request, id 25708, seq 
12, length 64
10:35:14.672774 IP 10.0.0.3 > 10.0.0.1: ICMP echo request, id 25708, seq 
13, length 64
10:35:15.712755 IP 10.0.0.3 > 10.0.0.1: ICMP echo request, id 25708, seq 
14, length 64
10:35:16.752756 IP 10.0.0.3 > 10.0.0.1: ICMP echo request, id 25708, seq 
15, length 64
^C
15 packets captured
15 packets received by filter
0 packets dropped by kernel

This was run from a Raspberry Pi. I only have requests to 10.0.0.1 but 
no answer, while on 10.0.0.4 (my laptop) I get:

clevo-W230SD riccardo # tcpdump -ni any icmp
tcpdump: verbose output suppressed, use -v or -vv for full protocol 
decode
listening on any, link-type LINUX_SLL (Linux cooked), capture size 
262144 bytes
11:17:04.666013 IP 10.0.0.4 > 10.0.0.1: ICMP echo request, id 3840, seq 
1, length 64
11:17:04.785000 IP 10.0.0.1 > 10.0.0.4: ICMP echo reply, id 3840, seq 1, 
length 64
11:17:05.667080 IP 10.0.0.4 > 10.0.0.1: ICMP echo request, id 3840, seq 
2, length 64
11:17:05.808343 IP 10.0.0.1 > 10.0.0.4: ICMP echo reply, id 3840, seq 2, 
length 64
11:17:06.668457 IP 10.0.0.4 > 10.0.0.1: ICMP echo request, id 3840, seq 
3, length 64
11:17:06.832267 IP 10.0.0.1 > 10.0.0.4: ICMP echo reply, id 3840, seq 3, 
length 64
11:17:07.670317 IP 10.0.0.4 > 10.0.0.1: ICMP echo request, id 3840, seq 
4, length 64
11:17:07.820143 IP 10.0.0.1 > 10.0.0.4: ICMP echo reply, id 3840, seq 4, 
length 64

As it should be, I get replies on this host.

I must repeat that "sometimes" also 10.0.0.3 works, so I'd exclude a 
firewall/pubkeys configuration error. Without touching it it breaks, 
though.
Last time it worked I let it ping for hours at a fast pace just to keep 
it working. I then stopped to ping and a certain amount of time later I 
tried again and the wg0 interface wasn't working anymore.

Great WireGuard guide on your blog by the way.
