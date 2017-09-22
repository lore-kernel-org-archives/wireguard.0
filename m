Return-Path: opensource@vdorst.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 377d73fc
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Sep 2017 12:21:45 +0000 (UTC)
Received: from smtp21.bhosted.nl (smtp21.bhosted.nl [94.124.121.33])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1b688dab
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Sep 2017 12:21:45 +0000 (UTC)
Date: Fri, 22 Sep 2017 12:49:13 +0000
Message-ID: <20170922124913.Horde.l7vpYDEtJHMgZ9U602cMi6K@www.vdorst.com>
From: =?utf-8?b?UmVuw6k=?= van Dorst <opensource@vdorst.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: Failed to give packet to userspace from peer with very poor
 wifi connection.
References: <20170922101756.Horde.0028OWy_TWcXeR6q3nnfYrp@www.vdorst.com>
 <CAHmME9qPOjjtjVt-E03uz8PUs3voGDGjpJ9f8YDGbDsfBPVAqw@mail.gmail.com>
In-Reply-To: <CAHmME9qPOjjtjVt-E03uz8PUs3voGDGjpJ9f8YDGbDsfBPVAqw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Cc: WireGuard list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Quoting "Jason A. Donenfeld" <Jason@zx2c4.com>:

> Are you *positive* you don't have it reversed?
>
> In my testing, 0.0.20170918 has the issue with "failed to give packet
> to userspace", whereas current git master does _not_ have the issue.
>
> Can you make sure that after building the new module, you're sure to
> unload the previous one (rmmod)?

I recompiled and tested again with git master, 0.0.20170918-9-g31ae6e6

[root@cubox src]# modprobe wireguard
[  851.416239] wireguard: routing table self-tests: pass
[  851.425864] wireguard: nonce counter self-tests: pass
[  851.437725] wireguard: curve25519 self-tests: pass
[  851.443139] wireguard: chacha20poly1305 self-tests: pass
[  851.451343] wireguard: blake2s self-tests: pass
[  851.819278] wireguard: ratelimiter self-tests: pass
[  851.824417] wireguard: WireGuard 0.0.20170918-9-g31ae6e6 loaded.  
See www.wireguard.com for information.
[  851.833915] wireguard: Copyright (C) 2015-2017 Jason A. Donenfeld  
<Jason@zx2c4.com>. All Rights Reserved.
[root@cubox src]# wg-quick up wg0
[#] ip link add wg0 type wireguard
[  859.735321] wireguard: wg0: Interface created
[#] wg setconf wg0 /dev/fd/63
[  859.784055] wireguard: wg0: Peer 1 created
[#] ip address add 10.0.0.2/24 dev wg0
[#] ip address add fd00::2/128 dev wg0
[#] ip link set mtu 1440 dev wg0
[#] ip link set wg0 up
[  859.827675] wireguard: wg0: Sending keepalive packet to peer 1  
(192.168.2.222:36464)
[  859.827733] wireguard: wg0: Sending handshake initiation to peer 1  
(192.168.2.222:36464)
[  859.882635] wireguard: wg0: Receiving handshake response from peer  
1 (192.168.2.222:36464)
[  859.882687] wireguard: wg0: Keypair 1 created for peer 1
[#] ip route add fd00::/64 dev wg0
[#] ip route add 2a02:<SNIP>/48 dev wg0
[root@cubox src]# iperf3 -c 10.0.0.1 -b 1M -t 30 -i 1
[  885.151542] wireguard: wg0: Sending keepalive packet to peer 1  
(192.168.2.222:36464)

Connecting to host 10.0.0.1, port 5201
[  4] local 10.0.0.2 port 58610 connected to 10.0.0.1 port 5201
[ ID] Interval           Transfer     Bandwidth       Retr  Cwnd
[  4]   0.00-1.00   sec   117 KBytes   955 Kbits/sec    0   43.4 KBytes
[  4]   1.00-2.00   sec   235 KBytes  1.93 Mbits/sec    0   51.5 KBytes
[  4]   2.00-3.00   sec   128 KBytes  1.05 Mbits/sec    0   56.9 KBytes
[  4]   3.00-4.00   sec  0.00 Bytes  0.00 bits/sec    0   56.9 KBytes
[  4]   4.00-5.00   sec  88.9 KBytes   728 Kbits/sec    0   56.9 KBytes
[  4]   5.00-6.00   sec   125 KBytes  1.02 Mbits/sec    0   56.9 KBytes
[  4]   6.00-7.00   sec  0.00 Bytes  0.00 bits/sec    5   27.1 KBytes
[  4]   7.00-8.00   sec  0.00 Bytes  0.00 bits/sec    8   23.0 KBytes
[  4]   8.00-9.00   sec   125 KBytes  1.02 Mbits/sec    0   43.4 KBytes
[  4]   9.00-10.00  sec  0.00 Bytes  0.00 bits/sec    2   32.5 KBytes
[  4]  10.00-11.00  sec  0.00 Bytes  0.00 bits/sec   10   27.1 KBytes
[  4]  11.00-12.00  sec  0.00 Bytes  0.00 bits/sec    8   24.4 KBytes
[  4]  12.00-13.00  sec  0.00 Bytes  0.00 bits/sec    3   20.3 KBytes
[  4]  13.00-14.00  sec  0.00 Bytes  0.00 bits/sec    0   20.3 KBytes
[  4]  14.00-15.00  sec  0.00 Bytes  0.00 bits/sec    0   20.3 KBytes
[  4]  15.00-16.00  sec  0.00 Bytes  0.00 bits/sec    0   20.3 KBytes
[  4]  16.00-17.00  sec  0.00 Bytes  0.00 bits/sec    0   20.3 KBytes
[  4]  17.00-18.00  sec  0.00 Bytes  0.00 bits/sec    1   1.36 KBytes
[  4]  18.00-19.00  sec  0.00 Bytes  0.00 bits/sec    0   1.36 KBytes
[  4]  19.00-20.00  sec  0.00 Bytes  0.00 bits/sec    0   1.36 KBytes
[  4]  20.00-21.00  sec  0.00 Bytes  0.00 bits/sec    0   1.36 KBytes
[  4]  21.00-22.00  sec  0.00 Bytes  0.00 bits/sec    0   1.36 KBytes
[  4]  22.00-23.00  sec  0.00 Bytes  0.00 bits/sec    0   1.36 KBytes
[  4]  23.00-24.00  sec  0.00 Bytes  0.00 bits/sec    0   1.36 KBytes
[  4]  24.00-25.00  sec  0.00 Bytes  0.00 bits/sec    0   1.36 KBytes
[  4]  25.00-26.00  sec  0.00 Bytes  0.00 bits/sec    0   1.36 KBytes
[  4]  26.00-27.00  sec  0.00 Bytes  0.00 bits/sec    1   1.36 KBytes
[  4]  27.00-28.00  sec  62.4 KBytes   511 Kbits/sec   13   4.07 KBytes
[  4]  28.00-29.00  sec  0.00 Bytes  0.00 bits/sec    3   6.78 KBytes
[  920.064607] wireguard: wg0: Failed to give packet to userspace from  
peer 1 (192.168.2.222:36464)
[  920.073695] wireguard: wg0: Failed to give packet to userspace from  
peer 1 (192.168.2.222:36464)
[  920.081211] wireguard: wg0: Failed to give packet to userspace from  
peer 1 (192.168.2.222:36464)
[  4]  29.00-30.00  sec   125 KBytes  1.02 Mbits/sec    1   5.42 KBytes
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bandwidth       Retr
[  4]   0.00-30.00  sec  1005 KBytes   274 Kbits/sec   55             sender
[  4]   0.00-30.00  sec   780 KBytes   213 Kbits/sec                  receiver

iperf Done.
[root@cubox src]#

Greats,

René
