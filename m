Return-Path: opensource@vdorst.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f4af4ca3
 for <wireguard@lists.zx2c4.com>; Fri, 6 Oct 2017 13:19:18 +0000 (UTC)
Received: from smtp21.bhosted.nl (smtp21.bhosted.nl [94.124.121.33])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d0b357aa
 for <wireguard@lists.zx2c4.com>; Fri, 6 Oct 2017 13:19:18 +0000 (UTC)
Date: Fri, 06 Oct 2017 13:48:32 +0000
Message-ID: <20171006134832.Horde.3UZthKbU46LLodtbmlSMMKb@www.vdorst.com>
From: =?utf-8?b?UmVuw6k=?= van Dorst <opensource@vdorst.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: netns.sh: Sending cookie response for denied handshake
References: <20171006105940.Horde.-YgH3Xzem0aIzxlyFy3xGun@www.vdorst.com>
 <20171006112215.Horde.PVbxF1OCC2ugTFVlOcX22n3@www.vdorst.com>
 <CAHmME9r9TNxJhWvXRgVEE1GtDktUvy5M2uqbhtuP7g=54BmFGw@mail.gmail.com>
In-Reply-To: <CAHmME9r9TNxJhWvXRgVEE1GtDktUvy5M2uqbhtuP7g=54BmFGw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Jason,

Quoting "Jason A. Donenfeld" <Jason@zx2c4.com>:

> Hey René,
>
> Fascinating. Can you tell me if this fixes it? http://ix.io/ARe
>
> Jason

After a bit of more testing and testing you patch.

Old situation:

I noticed that netns.sh fails before uptime reach 5m (300s).
Connecting to my home tunnel always works within 5mins.

Test oneliner: dmesg -w & sleep 2 && while [ 1 ]; do date; uptime;  
/usr/src/WireGuard/src/tests/netns.sh; sleep 10; done


Patched situation:

It works (tested it 3 times)

LOGGING with patch:

Fri Oct  6 15:36:17 CEST 2017
  15:36:17 up 1 min,  1 user,  load average: 0.75, 0.34, 0.13
[+] ip netns add wg-test-835-0
[+] ip netns add wg-test-835-1
[+] ip netns add wg-test-835-2
[+] NS0: ip link set up dev lo
[+] NS0: ip link add dev wg0 type wireguard
[  107.537250] wireguard: loading out-of-tree module taints kernel.
[  107.544470] wireguard: module verification failed: signature and/or  
required key missing - tainting kernel
[  107.558578] wireguard: routing table self-tests: pass
[  107.566686] wireguard: nonce counter self-tests: pass
[  107.577013] wireguard: curve25519 self-tests: pass
[  107.581938] wireguard: chacha20poly1305 self-tests: pass
[  107.590082] wireguard: blake2s self-tests: pass
[  107.944704] wireguard: ratelimiter self-tests: pass
[  107.949734] wireguard: WireGuard 0.0.20171005-dirty loaded. See  
www.wireguard.com for information.
[  107.958781] wireguard: Copyright (C) 2015-2017 Jason A. Donenfeld  
<Jason@zx2c4.com>. All Rights Reserved.
[  107.971666] wireguard: wg0: Interface created
[+] NS0: ip link set wg0 netns wg-test-835-1
[+] NS0: ip link add dev wg0 type wireguard
[  108.055197] wireguard: wg0: Interface created
[+] NS0: ip link set wg0 netns wg-test-835-2
[+] wg genkey
[+] wg genkey
[+] wg pubkey
[+] wg pubkey
[+] wg genpsk
[+] NS1: ip addr add 192.168.241.1/24 dev wg0
[+] NS1: ip addr add fd00::1/24 dev wg0
[+] NS2: ip addr add 192.168.241.2/24 dev wg0
[+] NS2: ip addr add fd00::2/24 dev wg0
[+] NS1: wg set wg0 private-key /dev/fd/63 listen-port 1 peer  
Fsp5iHWTDVoAHmtuDw6K2CBAG5/Xow4+09hdGvdXv1w= preshared-key /dev/fd/62  
allowed-ips 192.168.241.2/32,fd00::2/128
[  108.338023] wireguard: wg0: Peer 1 created
[+] NS2: wg set wg0 private-key /dev/fd/63 listen-port 2 peer  
6VAZNmgmrNrfpYiU0BsThCXhF9wn7Z6UJybMy4vnWH0= preshared-key /dev/fd/62  
allowed-ips 192.168.241.1/32,fd00::1/128
[  108.390021] wireguard: wg0: Peer 2 created
[+] NS1: ip link set up dev wg0
[+] NS2: ip link set up dev wg0
[+] NS1: ip link show dev wg0
[+] NS1: wg set wg0 peer Fsp5iHWTDVoAHmtuDw6K2CBAG5/Xow4+09hdGvdXv1w=  
endpoint 127.0.0.1:2
[+] NS2: wg set wg0 peer 6VAZNmgmrNrfpYiU0BsThCXhF9wn7Z6UJybMy4vnWH0=  
endpoint 127.0.0.1:1
[+] NS2: ping -c 10 -f -W 1 192.168.241.1
PING 192.168.241.1 (192.168.241.1) 56(84) bytes of data.
.[  108.622524] wireguard: wg0: Sending handshake initiation to peer 2  
(127.0.0.1:1)
[  108.625439] wireguard: wg0: Receiving handshake initiation from  
peer 1 (127.0.0.1:2)
[  108.625472] wireguard: wg0: Sending handshake response to peer 1  
(127.0.0.1:2)
[  108.628233] wireguard: wg0: Keypair 1 created for peer 1
[  108.630247] wireguard: wg0: Receiving handshake response from peer  
2 (127.0.0.1:1)
[  108.630312] wireguard: wg0: Keypair 2 created for peer 2
--- 192.168.241.1 ping statistics ---
10 packets transmitted, 10 received, 0% packet loss, time 13ms
rtt min/avg/max/mdev = 0.298/1.309/8.785/2.495 ms, ipg/ewma 1.535/2.950 ms
[+] NS2: ip -stats link show dev wg0
[+] NS2: ping -c 10 -f -W 1 192.168.241.1
PING 192.168.241.1 (192.168.241.1) 56(84) bytes of data.

--- 192.168.241.1 ping statistics ---
10 packets transmitted, 10 received, 0% packet loss, time 5ms
rtt min/avg/max/mdev = 0.325/0.427/0.624/0.087 ms, ipg/ewma 0.556/0.465 ms
[+] NS1: ping -c 10 -f -W 1 192.168.241.2
PING 192.168.241.2 (192.168.241.2) 56(84) bytes of data.

--- 192.168.241.2 ping statistics ---
10 packets transmitted, 10 received, 0% packet loss, time 5ms
rtt min/avg/max/mdev = 0.350/0.489/0.772/0.137 ms, ipg/ewma 0.589/0.567 ms
[+] NS2: ping6 -c 10 -f -W 1 fd00::1
PING fd00::1(fd00::1) 56 data bytes

--- fd00::1 ping statistics ---
10 packets transmitted, 10 received, 0% packet loss, time 5ms
rtt min/avg/max/mdev = 0.359/0.510/0.734/0.111 ms, ipg/ewma 0.632/0.544 ms
[+] NS1: ping6 -c 10 -f -W 1 fd00::2
PING fd00::2(fd00::2) 56 data bytes

--- fd00::2 ping statistics ---
10 packets transmitted, 10 received, 0% packet loss, time 5ms
rtt min/avg/max/mdev = 0.374/0.514/0.744/0.116 ms, ipg/ewma 0.650/0.555 ms
[+] NS2: wait for iperf:5201
[+] NS2: iperf3 -s -1 -B 192.168.241.2
-----------------------------------------------------------
Server listening on 5201
-----------------------------------------------------------
[+] NS1: iperf3 -Z -n 1G -c 192.168.241.2
Connecting to host 192.168.241.2, port 5201
Accepted connection from 192.168.241.1, port 57634
[  6] local 192.168.241.2 port 5201 connected to 192.168.241.1 port 57636
[  5] local 192.168.241.1 port 57636 connected to 192.168.241.2 port 5201
[ ID] Interval           Transfer     Bandwidth
[  6]   0.00-1.00   sec  23.4 MBytes   197 Mbits/sec
[ ID] Interval           Transfer     Bandwidth       Retr  Cwnd
[  5]   0.00-1.00   sec  25.0 MBytes   210 Mbits/sec    0    528 KBytes
[  6]   1.00-2.00   sec  25.3 MBytes   212 Mbits/sec
[  5]   1.00-2.00   sec  25.3 MBytes   212 Mbits/sec    0    528 KBytes
[  6]   2.00-3.00   sec  25.2 MBytes   212 Mbits/sec
[  5]   2.00-3.00   sec  25.5 MBytes   214 Mbits/sec    0    528 KBytes
[  6]   3.00-4.00   sec  25.5 MBytes   214 Mbits/sec
[  5]   3.00-4.00   sec  25.5 MBytes   214 Mbits/sec    0    585 KBytes
[  6]   4.00-5.00   sec  26.0 MBytes   218 Mbits/sec
[  5]   4.00-5.00   sec  25.8 MBytes   217 Mbits/sec    0    585 KBytes
[  6]   5.00-6.00   sec  25.3 MBytes   212 Mbits/sec
[  5]   5.00-6.00   sec  25.6 MBytes   214 Mbits/sec    0    585 KBytes
^C[  6]   6.00-6.44   sec  11.3 MBytes   215 Mbits/sec
- - - - - - - - - - - - - - - - - - - - - - - - -
[  5]   6.00-6.43   sec  11.2 MBytes   221 Mbits/sec    0    585 KBytes
[ ID] Interval           Transfer     Bandwidth
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bandwidth       Retr
[  6]   0.00-6.44   sec  0.00 Bytes  0.00 bits/sec                  sender
[  5]   0.00-6.43   sec   164 MBytes   214 Mbits/sec    0             sender
[  6]   0.00-6.44   sec   162 MBytes   211 Mbits/sec                  receiver
[  5]   0.00-6.43   sec  0.00 Bytes  0.00 bits/sec                  receiver
iperf3: interrupt - the client has terminated
iperf3: interrupt - the server has terminated
[+] NS0: ip link del dev wg0
[+] NS1: ip link del dev wg0
[  115.792219] net_ratelimit: 1 callbacks suppressed
[  115.796990] wireguard: wg0: Keypair 1 destroyed for peer 1
[  115.813215] wireguard: wg0: Peer 1 (127.0.0.1:2) destroyed
[  115.825231] wireguard: wg0: Interface deleted
[+] NS2: ip link del dev wg0
[  115.863200] wireguard: wg0: Keypair 2 destroyed for peer 2
[  115.883191] wireguard: wg0: Peer 2 (127.0.0.1:1) destroyed
[  115.900206] wireguard: wg0: Interface deleted
[+] ip netns del wg-test-835-1
[+] ip netns del wg-test-835-2
[+] ip netns del wg-test-835-0

Greats,

René
