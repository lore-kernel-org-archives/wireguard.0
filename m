Return-Path: opensource@vdorst.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ec787c61
 for <wireguard@lists.zx2c4.com>;
 Tue, 19 Sep 2017 18:07:33 +0000 (UTC)
Received: from smtp02.bhosted.nl (smtp02.bhosted.nl [94.124.121.13])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fca7afed
 for <wireguard@lists.zx2c4.com>;
 Tue, 19 Sep 2017 18:07:32 +0000 (UTC)
Date: Tue, 19 Sep 2017 18:34:38 +0000
Message-ID: <20170919183438.Horde.O_l7lFVqHiv6-cvQ2uGXuyk@www.vdorst.com>
From: =?utf-8?b?UmVuw6k=?= van Dorst <opensource@vdorst.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: Last pingtest always fails with netns.sh script on ARM device
 with F25.
References: <20170919151533.Horde.MQvI7jMPhVKrVNqOVodg-dg@www.vdorst.com>
 <CAHmME9p17p2Hq6c1rw4QB=PztStywoR-r1r-L6bGiNZ2WU=62g@mail.gmail.com>
In-Reply-To: <CAHmME9p17p2Hq6c1rw4QB=PztStywoR-r1r-L6bGiNZ2WU=62g@mail.gmail.com>
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

> Hi Rene,
>
> Thanks for your detailed report. Could you let me know if this problem
> exists with 0.0.20170918? Or only with 0.0.20170918-7-g7758071?
>
> Thanks,
> Jason

Also with 0.0.20170918.

I was hoping it was the firewall. (firewalld runs by default)
But disabling it did not change the behavior.

Iptables output with firewalld stopped.

[root@cubox src]# iptables -L -n
Chain INPUT (policy ACCEPT)
target     prot opt source               destination

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination


See log below.

[13682.282190] wireguard: routing table self-tests: pass
[13682.290870] wireguard: nonce counter self-tests: pass
[13682.301229] wireguard: curve25519 self-tests: pass
[13682.306125] wireguard: chacha20poly1305 self-tests: pass
[13682.314910] wireguard: blake2s self-tests: pass
[13682.680800] wireguard: ratelimiter self-tests: pass
[13682.685969] wireguard: WireGuard 0.0.20170918 loaded. See  
www.wireguard.com for information.
[13682.694513] wireguard: Copyright (C) 2015-2017 Jason A. Donenfeld  
<Jason@zx2c4.com>. All Rights Reserved.
[13693.374935] wireguard: wg0: Interface created
[13693.460242] wireguard: wg0: Interface created
[13693.738858] wireguard: wg0: Peer 1 created
[13693.790832] wireguard: wg0: Peer 2 created
[13694.002272] wireguard: wg0: Sending handshake initiation to peer 2  
(127.0.0.1:1)
[13694.005132] wireguard: wg0: Receiving handshake initiation from  
peer 1 (127.0.0.1:2)
[13694.005144] wireguard: wg0: Sending handshake response to peer 1  
(127.0.0.1:2)
[13694.007977] wireguard: wg0: Keypair 1 created for peer 1
[13694.009812] wireguard: wg0: Receiving handshake response from peer  
2 (127.0.0.1:1)
[13694.009861] wireguard: wg0: Keypair 2 created for peer 2
[13694.838251] wireguard: wg0: Peer 3 created
[13695.095959] wireguard: wg0: Packet has unallowed src IP  
(192.168.241.2) from peer 1 ([::1]:9997/0%0)
[13696.145347] wireguard: wg0: Peer 3 ((invalid address)) destroyed
[13696.222302] wireguard: wg0: Peer 1 ([::1]:9997/0%0) destroyed
[13696.233310] wireguard: wg0: Interface deleted
[13696.280293] wireguard: wg0: Peer 2 ([::1]:9998/0%0) destroyed
[13696.299310] wireguard: wg0: Interface deleted
[13696.341319] wireguard: wg0: Interface created
[13696.380717] wireguard: wg0: Interface created
[13696.530698] wireguard: wg0: Peer 4 created
[13696.581591] wireguard: wg0: Peer 5 created
[13696.820924] IPv6: ADDRCONF(NETDEV_UP): vethrc: link is not ready
[13696.854916] IPv6: ADDRCONF(NETDEV_UP): vethrs: link is not ready
[13696.979207] IPv6: ADDRCONF(NETDEV_CHANGE): vethrc: link becomes ready
[13697.063414] IPv6: ADDRCONF(NETDEV_CHANGE): vethrs: link becomes ready
[13697.431495] wireguard: wg0: Sending keepalive packet to peer 4  
(10.0.0.100:2)
[13697.431557] wireguard: wg0: Sending handshake initiation to peer 4  
(10.0.0.100:2)
[13697.434593] wireguard: wg0: Receiving handshake initiation from  
peer 5 (10.0.0.1:1)
[13697.434604] wireguard: wg0: Sending handshake response to peer 5  
(10.0.0.1:1)
[13697.437067] wireguard: wg0: Keypair 3 created for peer 5
[13697.438875] wireguard: wg0: Receiving handshake response from peer  
4 (10.0.0.100:2)
[13697.438924] wireguard: wg0: Keypair 4 created for peer 4
[13697.439164] wireguard: wg0: Receiving keepalive packet from peer 5  
(10.0.0.1:1)
[13698.372160] wireguard: wg0: Sending keepalive packet to peer 4  
(10.0.0.100:2)
[13698.372455] wireguard: wg0: Receiving keepalive packet from peer 5  
(10.0.0.1:1)
[13699.396082] wireguard: wg0: Sending keepalive packet to peer 4  
(10.0.0.100:2)
[13699.396331] wireguard: wg0: Receiving keepalive packet from peer 5  
(10.0.0.1:1)
[13700.420003] wireguard: wg0: Sending keepalive packet to peer 4  
(10.0.0.100:2)
[13700.420215] wireguard: wg0: Receiving keepalive packet from peer 5  
(10.0.0.1:1)
[13700.758975] wireguard: wg0: Peer 4 (10.0.0.100:2) destroyed
[13700.769988] wireguard: wg0: Interface deleted
[13700.817966] wireguard: wg0: Peer 5 (10.0.0.1:1) destroyed
[13700.839979] wireguard: wg0: Interface deleted
[13700.882514] wireguard: wg0: Interface created
[13700.925344] wireguard: wg0: Interface created
[13701.064275] wireguard: wg0: Peer 6 created
[13701.117368] wireguard: wg0: Peer 7 created
[13701.508678] IPv6: ADDRCONF(NETDEV_UP): veth1: link is not ready
[13701.542948] IPv6: ADDRCONF(NETDEV_CHANGE): veth1: link becomes ready
[13701.715577] wireguard: wg0: Sending handshake initiation to peer 6  
(10.0.0.2:2)
[13701.718488] wireguard: wg0: Receiving handshake initiation from  
peer 7 (10.0.0.1:1)
[13701.718498] wireguard: wg0: Sending handshake response to peer 7  
(10.0.0.1:1)
[13701.720928] wireguard: wg0: Keypair 5 created for peer 7
[13701.722678] wireguard: wg0: Receiving handshake response from peer  
6 (10.0.0.2:2)
[13701.722726] wireguard: wg0: Keypair 6 created for peer 6
[13702.317678] IPv6: ADDRCONF(NETDEV_UP): veth1: link is not ready
[13702.349958] IPv6: ADDRCONF(NETDEV_CHANGE): veth1: link becomes ready
[13703.506517] IPv6: ADDRCONF(NETDEV_UP): veth3: link is not ready
[13703.538697] IPv6: ADDRCONF(NETDEV_CHANGE): veth3: link becomes ready
[13713.270076] wireguard: wg0: Peer 6 (10.0.0.2:2) destroyed
[13713.280111] wireguard: wg0: Interface deleted
[13713.323067] wireguard: wg0: Peer 7 (10.0.0.1:1) destroyed
[13713.342089] wireguard: wg0: Interface deleted





[root@cubox src]# /root/netns.sh
[+] ip netns add wg-test-6573-0
[+] ip netns add wg-test-6573-1
[+] ip netns add wg-test-6573-2
[+] NS0: ip link set up dev lo
[+] NS0: ip link add dev wg0 type wireguard
[+] NS0: ip link set wg0 netns wg-test-6573-1
[+] NS0: ip link add dev wg0 type wireguard
[+] NS0: ip link set wg0 netns wg-test-6573-2
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
qp5HZuPu/rlYBeupDbAkJGZlruGAm/YmdbzU/Cq5sAg= preshared-key /dev/fd/62  
allowed-ips 192.168.241.2/32,fd00::2/128
[+] NS2: wg set wg0 private-key /dev/fd/63 listen-port 2 peer  
m0ZOHPMLWIJZofQvj1c19YXs78XAJ/n6pXXM51Aj1RQ= preshared-key /dev/fd/62  
allowed-ips 192.168.241.1/32,fd00::1/128
[+] NS1: ip link set up dev wg0
[+] NS2: ip link set up dev wg0
[+] NS1: ip link show dev wg0
[+] NS1: wg set wg0 peer qp5HZuPu/rlYBeupDbAkJGZlruGAm/YmdbzU/Cq5sAg=  
endpoint 127.0.0.1:2
[+] NS2: wg set wg0 peer m0ZOHPMLWIJZofQvj1c19YXs78XAJ/n6pXXM51Aj1RQ=  
endpoint 127.0.0.1:1
[+] NS2: ping -c 10 -f -W 1 192.168.241.1
PING 192.168.241.1 (192.168.241.1) 56(84) bytes of data.

--- 192.168.241.1 ping statistics ---
10 packets transmitted, 10 received, 0% packet loss, time 13ms
rtt min/avg/max/mdev = 0.321/1.276/8.192/2.316 ms, ipg/ewma 1.502/2.779 ms
[+] NS2: ip -stats link show dev wg0
[+] NS1: ip link set wg0 mtu 1420
[+] NS2: ip link set wg0 mtu 1420
[+] NS0: ip -4 addr del 127.0.0.1/8 dev lo
[+] NS0: ip -4 addr add 127.212.121.99/8 dev lo
[+] NS1: wg set wg0 listen-port 9999
[+] NS1: wg set wg0 peer qp5HZuPu/rlYBeupDbAkJGZlruGAm/YmdbzU/Cq5sAg=  
endpoint 127.0.0.1:2
[+] NS1: ping6 -W 1 -c 1 fd00::2
PING fd00::2(fd00::2) 56 data bytes
64 bytes from fd00::2: icmp_seq=1 ttl=64 time=0.762 ms

--- fd00::2 ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev = 0.762/0.762/0.762/0.000 ms
[+] NS2: wg show wg0 endpoints
[+] NS1: wg set wg0 listen-port 9998
[+] NS1: wg set wg0 peer qp5HZuPu/rlYBeupDbAkJGZlruGAm/YmdbzU/Cq5sAg=  
endpoint [::1]:2
[+] NS1: ping -W 1 -c 1 192.168.241.2
PING 192.168.241.2 (192.168.241.2) 56(84) bytes of data.
64 bytes from 192.168.241.2: icmp_seq=1 ttl=64 time=0.721 ms

--- 192.168.241.2 ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev = 0.721/0.721/0.721/0.000 ms
[+] NS2: wg show wg0 endpoints
[+] NS1: wg set wg0 peer qp5HZuPu/rlYBeupDbAkJGZlruGAm/YmdbzU/Cq5sAg=  
allowed-ips 192.168.241.0/24
[+] NS1: wait for udp:1111
[+] NS1: ncat -l -u -p 1111
[+] NS2: ncat -u 192.168.241.1 1111
[+] wg genkey
[+] wg pubkey
[+] NS1: wg set wg0 peer eKuS0Q7oRlI+GT9hB8F3vyd14zpK3cbWSmjMxLPlDkQ=  
allowed-ips 192.168.241.2/32
[+] NS2: wg set wg0 listen-port 9997
[+] NS1: wait for udp:1111
[+] NS1: ncat -l -u -p 1111
[+] NS2: ncat -u 192.168.241.1 1111
[+] NS1: wg set wg0 peer eKuS0Q7oRlI+GT9hB8F3vyd14zpK3cbWSmjMxLPlDkQ= remove
[+] NS1: wg show wg0 endpoints
[+] NS1: ip link del wg0
[+] NS2: ip link del wg0
[+] NS1: ip link add dev wg0 type wireguard
[+] NS2: ip link add dev wg0 type wireguard
[+] NS1: ip addr add 192.168.241.1/24 dev wg0
[+] NS1: ip addr add fd00::1/24 dev wg0
[+] NS2: ip addr add 192.168.241.2/24 dev wg0
[+] NS2: ip addr add fd00::2/24 dev wg0
[+] NS1: wg set wg0 private-key /dev/fd/63 listen-port 1 peer  
qp5HZuPu/rlYBeupDbAkJGZlruGAm/YmdbzU/Cq5sAg= preshared-key /dev/fd/62  
allowed-ips 192.168.241.2/32,fd00::2/128
[+] NS2: wg set wg0 private-key /dev/fd/63 listen-port 2 peer  
m0ZOHPMLWIJZofQvj1c19YXs78XAJ/n6pXXM51Aj1RQ= preshared-key /dev/fd/62  
allowed-ips 192.168.241.1/32,fd00::1/128
[+] NS1: ip link set up dev wg0
[+] NS2: ip link set up dev wg0
[+] NS0: ip link add vethrc type veth peer name vethc
[+] NS0: ip link add vethrs type veth peer name veths
[+] NS0: ip link set vethc netns wg-test-6573-1
[+] NS0: ip link set veths netns wg-test-6573-2
[+] NS0: ip link set vethrc up
[+] NS0: ip link set vethrs up
[+] NS0: ip addr add 192.168.1.1/24 dev vethrc
[+] NS0: ip addr add 10.0.0.1/24 dev vethrs
[+] NS1: ip addr add 192.168.1.100/24 dev vethc
[+] NS1: ip link set vethc up
[+] NS1: ip route add default via 192.168.1.1
[+] NS2: ip addr add 10.0.0.100/24 dev veths
[+] NS2: ip link set veths up
[+] NS0: wait for vethrc to come up
[+] NS0: wait for vethrs to come up
[+] NS1: wait for vethc to come up
[+] NS2: wait for veths to come up
[+] NS0: bash -c printf 1 > /proc/sys/net/ipv4/ip_forward
[+] NS0: bash -c printf 2 > /proc/sys/net/netfilter/nf_conntrack_udp_timeout
[+] NS0: bash -c printf 2 >  
/proc/sys/net/netfilter/nf_conntrack_udp_timeout_stream
[+] NS0: iptables -t nat -A POSTROUTING -s 192.168.1.0/24 -d  
10.0.0.0/24 -j SNAT --to 10.0.0.1
[+] NS1: wg set wg0 peer qp5HZuPu/rlYBeupDbAkJGZlruGAm/YmdbzU/Cq5sAg=  
endpoint 10.0.0.100:2 persistent-keepalive 1
[+] NS1: ping -W 1 -c 1 192.168.241.2
PING 192.168.241.2 (192.168.241.2) 56(84) bytes of data.
64 bytes from 192.168.241.2: icmp_seq=1 ttl=64 time=0.769 ms

--- 192.168.241.2 ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev = 0.769/0.769/0.769/0.000 ms
[+] NS2: ping -W 1 -c 1 192.168.241.1
PING 192.168.241.1 (192.168.241.1) 56(84) bytes of data.
64 bytes from 192.168.241.1: icmp_seq=1 ttl=64 time=0.653 ms

--- 192.168.241.1 ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev = 0.653/0.653/0.653/0.000 ms
[+] NS2: wg show wg0 endpoints
[+] sleep 3
[+] NS2: ping -W 1 -c 1 192.168.241.1
PING 192.168.241.1 (192.168.241.1) 56(84) bytes of data.
64 bytes from 192.168.241.1: icmp_seq=1 ttl=64 time=0.709 ms

--- 192.168.241.1 ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev = 0.709/0.709/0.709/0.000 ms
[+] NS0: iptables -t nat -F
[+] NS0: ip link del vethrc
[+] NS0: ip link del vethrs
[+] NS1: ip link del wg0
[+] NS2: ip link del wg0
[+] NS1: ip link add dev wg0 type wireguard
[+] NS2: ip link add dev wg0 type wireguard
[+] NS1: ip addr add 192.168.241.1/24 dev wg0
[+] NS1: ip addr add fd00::1/24 dev wg0
[+] NS2: ip addr add 192.168.241.2/24 dev wg0
[+] NS2: ip addr add fd00::2/24 dev wg0
[+] NS1: wg set wg0 private-key /dev/fd/63 listen-port 1 peer  
qp5HZuPu/rlYBeupDbAkJGZlruGAm/YmdbzU/Cq5sAg= preshared-key /dev/fd/62  
allowed-ips 192.168.241.2/32,fd00::2/128
[+] NS2: wg set wg0 private-key /dev/fd/63 listen-port 2 peer  
m0ZOHPMLWIJZofQvj1c19YXs78XAJ/n6pXXM51Aj1RQ= preshared-key /dev/fd/62  
allowed-ips 192.168.241.1/32,fd00::1/128
[+] NS1: ip link set up dev wg0
[+] NS2: ip link set up dev wg0
[+] NS1: ip link add veth1 type veth peer name veth2
[+] NS1: ip link set veth2 netns wg-test-6573-2
[+] NS1: bash -c printf 0 > /proc/sys/net/ipv6/conf/veth1/accept_dad
[+] NS2: bash -c printf 0 > /proc/sys/net/ipv6/conf/veth2/accept_dad
[+] NS1: bash -c printf 1 > /proc/sys/net/ipv4/conf/veth1/promote_secondaries
[+] NS1: ip addr add 10.0.0.1/24 dev veth1
[+] NS1: ip addr add fd00:aa::1/96 dev veth1
[+] NS2: ip addr add 10.0.0.2/24 dev veth2
[+] NS2: ip addr add fd00:aa::2/96 dev veth2
[+] NS1: ip link set veth1 up
[+] NS2: ip link set veth2 up
[+] NS1: wait for veth1 to come up
[+] NS2: wait for veth2 to come up
[+] NS1: wg set wg0 peer qp5HZuPu/rlYBeupDbAkJGZlruGAm/YmdbzU/Cq5sAg=  
endpoint 10.0.0.2:2
[+] NS1: ping -W 1 -c 1 192.168.241.2
PING 192.168.241.2 (192.168.241.2) 56(84) bytes of data.
64 bytes from 192.168.241.2: icmp_seq=1 ttl=64 time=7.82 ms

--- 192.168.241.2 ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev = 7.824/7.824/7.824/0.000 ms
[+] NS1: ip addr add 10.0.0.10/24 dev veth1
[+] NS1: ip addr del 10.0.0.1/24 dev veth1
[+] NS1: ping -W 1 -c 1 192.168.241.2
PING 192.168.241.2 (192.168.241.2) 56(84) bytes of data.
64 bytes from 192.168.241.2: icmp_seq=1 ttl=64 time=0.757 ms

--- 192.168.241.2 ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev = 0.757/0.757/0.757/0.000 ms
[+] NS1: wg set wg0 peer qp5HZuPu/rlYBeupDbAkJGZlruGAm/YmdbzU/Cq5sAg=  
endpoint [fd00:aa::2]:2
[+] NS1: ping -W 1 -c 1 192.168.241.2
PING 192.168.241.2 (192.168.241.2) 56(84) bytes of data.
64 bytes from 192.168.241.2: icmp_seq=1 ttl=64 time=0.921 ms

--- 192.168.241.2 ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev = 0.921/0.921/0.921/0.000 ms
[+] NS1: ip addr add fd00:aa::10/96 dev veth1
[+] NS1: ip addr del fd00:aa::1/96 dev veth1
[+] NS1: ping -W 1 -c 1 192.168.241.2
PING 192.168.241.2 (192.168.241.2) 56(84) bytes of data.
64 bytes from 192.168.241.2: icmp_seq=1 ttl=64 time=0.828 ms

--- 192.168.241.2 ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev = 0.828/0.828/0.828/0.000 ms
[+] NS1: ip link set veth1 down
[+] NS2: ip link set veth2 down
[+] NS1: ip addr flush dev veth1
[+] NS2: ip addr flush dev veth2
[+] NS1: ip addr add 10.0.0.1/24 dev veth1
[+] NS1: ip addr add 10.0.0.2/24 dev veth1
[+] NS1: ip addr add fd00:aa::1/96 dev veth1
[+] NS1: ip addr add fd00:aa::2/96 dev veth1
[+] NS2: ip addr add 10.0.0.3/24 dev veth2
[+] NS2: ip addr add fd00:aa::3/96 dev veth2
[+] NS1: ip link set veth1 up
[+] NS2: ip link set veth2 up
[+] NS1: wait for veth1 to come up
[+] NS2: wait for veth2 to come up
[+] NS2: wg set wg0 peer m0ZOHPMLWIJZofQvj1c19YXs78XAJ/n6pXXM51Aj1RQ=  
endpoint 10.0.0.1:1
[+] NS2: ping -W 1 -c 1 192.168.241.1
PING 192.168.241.1 (192.168.241.1) 56(84) bytes of data.
64 bytes from 192.168.241.1: icmp_seq=1 ttl=64 time=0.875 ms

--- 192.168.241.1 ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev = 0.875/0.875/0.875/0.000 ms
[+] NS2: wg show wg0 endpoints
[+] NS2: wg set wg0 peer m0ZOHPMLWIJZofQvj1c19YXs78XAJ/n6pXXM51Aj1RQ=  
endpoint [fd00:aa::1]:1
[+] NS2: ping -W 1 -c 1 192.168.241.1
PING 192.168.241.1 (192.168.241.1) 56(84) bytes of data.
64 bytes from 192.168.241.1: icmp_seq=1 ttl=64 time=0.912 ms

--- 192.168.241.1 ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev = 0.912/0.912/0.912/0.000 ms
[+] NS2: wg show wg0 endpoints
[+] NS2: wg set wg0 peer m0ZOHPMLWIJZofQvj1c19YXs78XAJ/n6pXXM51Aj1RQ=  
endpoint 10.0.0.2:1
[+] NS2: ping -W 1 -c 1 192.168.241.1
PING 192.168.241.1 (192.168.241.1) 56(84) bytes of data.
64 bytes from 192.168.241.1: icmp_seq=1 ttl=64 time=0.699 ms

--- 192.168.241.1 ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev = 0.699/0.699/0.699/0.000 ms
[+] NS2: wg show wg0 endpoints
[+] NS2: wg set wg0 peer m0ZOHPMLWIJZofQvj1c19YXs78XAJ/n6pXXM51Aj1RQ=  
endpoint [fd00:aa::2]:1
[+] NS2: ping -W 1 -c 1 192.168.241.1
PING 192.168.241.1 (192.168.241.1) 56(84) bytes of data.
64 bytes from 192.168.241.1: icmp_seq=1 ttl=64 time=0.912 ms

--- 192.168.241.1 ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev = 0.912/0.912/0.912/0.000 ms
[+] NS2: wg show wg0 endpoints
[+] NS1: ip link add dummy0 type dummy
[+] NS1: ip addr add 10.50.0.1/24 dev dummy0
[+] NS1: ip link set dummy0 up
[+] NS2: ip route add 10.50.0.0/24 dev veth2
[+] NS2: wg set wg0 peer m0ZOHPMLWIJZofQvj1c19YXs78XAJ/n6pXXM51Aj1RQ=  
endpoint 10.50.0.1:1
[+] NS2: ping -W 1 -c 1 192.168.241.1
PING 192.168.241.1 (192.168.241.1) 56(84) bytes of data.
64 bytes from 192.168.241.1: icmp_seq=1 ttl=64 time=0.809 ms

--- 192.168.241.1 ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev = 0.809/0.809/0.809/0.000 ms
[+] NS2: wg show wg0 endpoints
[+] NS1: ip link del dummy0
[+] NS1: ip addr flush dev veth1
[+] NS2: ip addr flush dev veth2
[+] NS1: ip route flush dev veth1
[+] NS2: ip route flush dev veth2
[+] NS1: ip link add veth3 type veth peer name veth4
[+] NS1: ip link set veth4 netns wg-test-6573-2
[+] NS1: ip addr add 10.0.0.1/24 dev veth1
[+] NS2: ip addr add 10.0.0.2/24 dev veth2
[+] NS1: ip addr add 10.0.0.3/24 dev veth3
[+] NS1: ip link set veth1 up
[+] NS2: ip link set veth2 up
[+] NS1: ip link set veth3 up
[+] NS2: ip link set veth4 up
[+] NS1: wait for veth1 to come up
[+] NS2: wait for veth2 to come up
[+] NS1: wait for veth3 to come up
[+] NS2: wait for veth4 to come up
[+] NS1: ip route flush dev veth1
[+] NS1: ip route flush dev veth3
[+] NS1: ip route add 10.0.0.0/24 dev veth1 src 10.0.0.1 metric 2
[+] NS1: wg set wg0 peer qp5HZuPu/rlYBeupDbAkJGZlruGAm/YmdbzU/Cq5sAg=  
endpoint 10.0.0.2:2
[+] NS1: ping -W 1 -c 1 192.168.241.2
PING 192.168.241.2 (192.168.241.2) 56(84) bytes of data.
64 bytes from 192.168.241.2: icmp_seq=1 ttl=64 time=0.811 ms

--- 192.168.241.2 ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev = 0.811/0.811/0.811/0.000 ms
[+] NS2: wg show wg0 endpoints
[+] NS1: ip route add 10.0.0.0/24 dev veth3 src 10.0.0.3 metric 1
[+] NS1: wg
interface: wg0
   public key: m0ZOHPMLWIJZofQvj1c19YXs78XAJ/n6pXXM51Aj1RQ=
   private key: wLr9KiOFW7h8FCHVJn2GYGYTuXlSyDyow8fe5uxYanQ=
   listening port: 1

peer: qp5HZuPu/rlYBeupDbAkJGZlruGAm/YmdbzU/Cq5sAg=
   preshared key: qI2OTus+9Kb+7NPmXtyi9+1ZIvLslZrJDEaatUMBzjA=
   endpoint: 10.0.0.2:2
   allowed ips: 192.168.241.2/32, fd00::2/128
   latest handshake: 2 seconds ago
   transfer: 932 B received, 1.39 KiB sent
[+] NS2: wg
interface: wg0
   public key: qp5HZuPu/rlYBeupDbAkJGZlruGAm/YmdbzU/Cq5sAg=
   private key: oEjfcatLDq37pzE/vevcTO1ld4t7jUFuYeAAczs/uUs=
   listening port: 2

peer: m0ZOHPMLWIJZofQvj1c19YXs78XAJ/n6pXXM51Aj1RQ=
   preshared key: qI2OTus+9Kb+7NPmXtyi9+1ZIvLslZrJDEaatUMBzjA=
   endpoint: 10.0.0.1:1
   allowed ips: 192.168.241.1/32, fd00::1/128
   latest handshake: 2 seconds ago
   transfer: 988 B received, 1.34 KiB sent
[+] NS1: ping -W 5 -c 5 192.168.241.2
PING 192.168.241.2 (192.168.241.2) 56(84) bytes of data.

--- 192.168.241.2 ping statistics ---
5 packets transmitted, 0 received, 100% packet loss, time 4135ms

[+] NS0: ip link del dev wg0
[+] NS1: ip link del dev wg0
[+] NS2: ip link del dev wg0
[+] ip netns del wg-test-6573-1
[+] ip netns del wg-test-6573-2
[+] ip netns del wg-test-6573-0

Greats,

René van Dorst.
