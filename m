Return-Path: opensource@vdorst.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 93686a89
 for <wireguard@lists.zx2c4.com>;
 Tue, 19 Sep 2017 16:41:00 +0000 (UTC)
Received: from smtp21.bhosted.nl (smtp21.bhosted.nl [94.124.121.33])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0a57f405
 for <wireguard@lists.zx2c4.com>;
 Tue, 19 Sep 2017 16:41:00 +0000 (UTC)
Received: from www (www.lan.vdorst.com [172.16.2.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.vdorst.com (Postfix) with ESMTPSA id E8F32131073F
 for <wireguard@lists.zx2c4.com>; Tue, 19 Sep 2017 17:15:33 +0200 (CEST)
Date: Tue, 19 Sep 2017 15:15:33 +0000
Message-ID: <20170919151533.Horde.MQvI7jMPhVKrVNqOVodg-dg@www.vdorst.com>
From: =?utf-8?b?UmVuw6k=?= van Dorst <opensource@vdorst.com>
To: WireGuard list <wireguard@lists.zx2c4.com>
Subject: Last pingtest always fails with netns.sh script on ARM device with
 F25.
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Jason,

I was playing with multiple versions of WireGuard to see the speed  
improvements on a Solidrun - Cubox i4-Pro (Quad core IMX6)
Simple running the netns.sh test.

I noticed that the last ping test fails to send any packet.
I modified the netns.sh script so that
- I wait longer: 5 sec
- send more pings 5x.
- show wg output of both namespaces
- removed the iperf tests.

Build from source on the ARM device.

tested:
- Latest: 0.0.20170918-7-g7758071 master
- 0.0.20170907

Distro:
- Fedora 25 Linux cubox.localhost.com 4.12.11-200.fc25.armv7hl #1 SMP  
Fri Sep 8 13:19:14 UTC 2017 armv7l armv7l armv7l GNU/Linux
4.12.11 is currently the latest kernel for the ARM.

[root@cubox src]# lscpu
Architecture:          armv7l
Byte Order:            Little Endian
CPU(s):                4
On-line CPU(s) list:   0-3
Thread(s) per core:    1
Core(s) per socket:    4
Socket(s):             1
Model name:            ARMv7 Processor rev 10 (v7l)

gcc version 6.4.1 20170727 (Red Hat 6.4.1-1) (GCC)



Output for both versions.

WireGuard 0.0.20170907: Log

[root@cubox src]# /root/netns.sh
[+] ip netns add wg-test-1985-0
[+] ip netns add wg-test-1985-1
[+] ip netns add wg-test-1985-2
[+] NS0: ip link set up dev lo
[+] NS0: ip link add dev wg0 type wireguard
[+] NS0: ip link set wg0 netns wg-test-1985-1
[+] NS0: ip link add dev wg0 type wireguard
[+] NS0: ip link set wg0 netns wg-test-1985-2
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
42PsgOL93pCIvxedeKtPSX+eMdtdZhFpJcbAMDVgNn0= preshared-key /dev/fd/62  
allowed-ips 192.168.241.2/32,fd00::2/128
[+] NS2: wg set wg0 private-key /dev/fd/63 listen-port 2 peer  
uxQWy0N2EoViNhmLs4mAmWVlgoJJ7zN6+QBKjdwXkwo= preshared-key /dev/fd/62  
allowed-ips 192.168.241.1/32,fd00::1/128
[+] NS1: ip link set up dev wg0
[+] NS2: ip link set up dev wg0
[+] NS1: ip link show dev wg0
[+] NS1: wg set wg0 peer 42PsgOL93pCIvxedeKtPSX+eMdtdZhFpJcbAMDVgNn0=  
endpoint 127.0.0.1:2
[+] NS2: wg set wg0 peer uxQWy0N2EoViNhmLs4mAmWVlgoJJ7zN6+QBKjdwXkwo=  
endpoint 127.0.0.1:1
[+] NS2: ping -c 10 -f -W 1 192.168.241.1
PING 192.168.241.1 (192.168.241.1) 56(84) bytes of data.

--- 192.168.241.1 ping statistics ---
10 packets transmitted, 10 received, 0% packet loss, time 11ms
rtt min/avg/max/mdev = 0.256/1.109/8.189/2.360 ms, ipg/ewma 1.302/2.682 ms
[+] NS2: ip -stats link show dev wg0
[+] NS1: ip link set wg0 mtu 1420
[+] NS2: ip link set wg0 mtu 1420
[+] NS0: ip -4 addr del 127.0.0.1/8 dev lo
[+] NS0: ip -4 addr add 127.212.121.99/8 dev lo
[+] NS1: wg set wg0 listen-port 9999
[+] NS1: wg set wg0 peer 42PsgOL93pCIvxedeKtPSX+eMdtdZhFpJcbAMDVgNn0=  
endpoint 127.0.0.1:2
[+] NS1: ping6 -W 1 -c 1 fd00::2
PING fd00::2(fd00::2) 56 data bytes
64 bytes from fd00::2: icmp_seq=1 ttl=64 time=0.596 ms

--- fd00::2 ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev = 0.596/0.596/0.596/0.000 ms
[+] NS2: wg show wg0 endpoints
[+] NS1: wg set wg0 listen-port 9998
[+] NS1: wg set wg0 peer 42PsgOL93pCIvxedeKtPSX+eMdtdZhFpJcbAMDVgNn0=  
endpoint [::1]:2
[+] NS1: ping -W 1 -c 1 192.168.241.2
PING 192.168.241.2 (192.168.241.2) 56(84) bytes of data.
64 bytes from 192.168.241.2: icmp_seq=1 ttl=64 time=0.530 ms

--- 192.168.241.2 ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev = 0.530/0.530/0.530/0.000 ms
[+] NS2: wg show wg0 endpoints
[+] NS1: wg set wg0 peer 42PsgOL93pCIvxedeKtPSX+eMdtdZhFpJcbAMDVgNn0=  
allowed-ips 192.168.241.0/24
[+] NS1: wait for udp:1111
[+] NS1: ncat -l -u -p 1111
[+] NS2: ncat -u 192.168.241.1 1111
[+] wg genkey
[+] wg pubkey
[+] NS1: wg set wg0 peer tHSfgulVLVdkBzn3eGFW4xku1UcGlJn3+Wg0ITuh6TM=  
allowed-ips 192.168.241.2/32
[+] NS2: wg set wg0 listen-port 9997
[+] NS1: wait for udp:1111
[+] NS1: ncat -l -u -p 1111
[+] NS2: ncat -u 192.168.241.1 1111
[+] NS1: wg set wg0 peer tHSfgulVLVdkBzn3eGFW4xku1UcGlJn3+Wg0ITuh6TM= remove
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
42PsgOL93pCIvxedeKtPSX+eMdtdZhFpJcbAMDVgNn0= preshared-key /dev/fd/62  
allowed-ips 192.168.241.2/32,fd00::2/128
[+] NS2: wg set wg0 private-key /dev/fd/63 listen-port 2 peer  
uxQWy0N2EoViNhmLs4mAmWVlgoJJ7zN6+QBKjdwXkwo= preshared-key /dev/fd/62  
allowed-ips 192.168.241.1/32,fd00::1/128
[+] NS1: ip link set up dev wg0
[+] NS2: ip link set up dev wg0
[+] NS0: ip link add vethrc type veth peer name vethc
[+] NS0: ip link add vethrs type veth peer name veths
[+] NS0: ip link set vethc netns wg-test-1985-1
[+] NS0: ip link set veths netns wg-test-1985-2
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
[+] NS1: wg set wg0 peer 42PsgOL93pCIvxedeKtPSX+eMdtdZhFpJcbAMDVgNn0=  
endpoint 10.0.0.100:2 persistent-keepalive 1
[+] NS1: ping -W 1 -c 1 192.168.241.2
PING 192.168.241.2 (192.168.241.2) 56(84) bytes of data.
64 bytes from 192.168.241.2: icmp_seq=1 ttl=64 time=0.680 ms

--- 192.168.241.2 ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev = 0.680/0.680/0.680/0.000 ms
[+] NS2: ping -W 1 -c 1 192.168.241.1
PING 192.168.241.1 (192.168.241.1) 56(84) bytes of data.
64 bytes from 192.168.241.1: icmp_seq=1 ttl=64 time=0.672 ms

--- 192.168.241.1 ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev = 0.672/0.672/0.672/0.000 ms
[+] NS2: wg show wg0 endpoints
[+] sleep 3
[+] NS2: ping -W 1 -c 1 192.168.241.1
PING 192.168.241.1 (192.168.241.1) 56(84) bytes of data.
64 bytes from 192.168.241.1: icmp_seq=1 ttl=64 time=0.667 ms

--- 192.168.241.1 ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev = 0.667/0.667/0.667/0.000 ms
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
42PsgOL93pCIvxedeKtPSX+eMdtdZhFpJcbAMDVgNn0= preshared-key /dev/fd/62  
allowed-ips 192.168.241.2/32,fd00::2/128
[+] NS2: wg set wg0 private-key /dev/fd/63 listen-port 2 peer  
uxQWy0N2EoViNhmLs4mAmWVlgoJJ7zN6+QBKjdwXkwo= preshared-key /dev/fd/62  
allowed-ips 192.168.241.1/32,fd00::1/128
[+] NS1: ip link set up dev wg0
[+] NS2: ip link set up dev wg0
[+] NS1: ip link add veth1 type veth peer name veth2
[+] NS1: ip link set veth2 netns wg-test-1985-2
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
[+] NS1: wg set wg0 peer 42PsgOL93pCIvxedeKtPSX+eMdtdZhFpJcbAMDVgNn0=  
endpoint 10.0.0.2:2
[+] NS1: ping -W 1 -c 1 192.168.241.2
PING 192.168.241.2 (192.168.241.2) 56(84) bytes of data.
64 bytes from 192.168.241.2: icmp_seq=1 ttl=64 time=8.40 ms

--- 192.168.241.2 ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev = 8.406/8.406/8.406/0.000 ms
[+] NS1: ip addr add 10.0.0.10/24 dev veth1
[+] NS1: ip addr del 10.0.0.1/24 dev veth1
[+] NS1: ping -W 1 -c 1 192.168.241.2
PING 192.168.241.2 (192.168.241.2) 56(84) bytes of data.
64 bytes from 192.168.241.2: icmp_seq=1 ttl=64 time=0.656 ms

--- 192.168.241.2 ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev = 0.656/0.656/0.656/0.000 ms
[+] NS1: wg set wg0 peer 42PsgOL93pCIvxedeKtPSX+eMdtdZhFpJcbAMDVgNn0=  
endpoint [fd00:aa::2]:2
[+] NS1: ping -W 1 -c 1 192.168.241.2
PING 192.168.241.2 (192.168.241.2) 56(84) bytes of data.
64 bytes from 192.168.241.2: icmp_seq=1 ttl=64 time=0.848 ms

--- 192.168.241.2 ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev = 0.848/0.848/0.848/0.000 ms
[+] NS1: ip addr add fd00:aa::10/96 dev veth1
[+] NS1: ip addr del fd00:aa::1/96 dev veth1
[+] NS1: ping -W 1 -c 1 192.168.241.2
PING 192.168.241.2 (192.168.241.2) 56(84) bytes of data.
64 bytes from 192.168.241.2: icmp_seq=1 ttl=64 time=0.822 ms

--- 192.168.241.2 ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev = 0.822/0.822/0.822/0.000 ms
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
[+] NS2: wg set wg0 peer uxQWy0N2EoViNhmLs4mAmWVlgoJJ7zN6+QBKjdwXkwo=  
endpoint 10.0.0.1:1
[+] NS2: ping -W 1 -c 1 192.168.241.1
PING 192.168.241.1 (192.168.241.1) 56(84) bytes of data.
64 bytes from 192.168.241.1: icmp_seq=1 ttl=64 time=0.733 ms

--- 192.168.241.1 ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev = 0.733/0.733/0.733/0.000 ms
[+] NS2: wg show wg0 endpoints
[+] NS2: wg set wg0 peer uxQWy0N2EoViNhmLs4mAmWVlgoJJ7zN6+QBKjdwXkwo=  
endpoint [fd00:aa::1]:1
[+] NS2: ping -W 1 -c 1 192.168.241.1
PING 192.168.241.1 (192.168.241.1) 56(84) bytes of data.
64 bytes from 192.168.241.1: icmp_seq=1 ttl=64 time=0.783 ms

--- 192.168.241.1 ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev = 0.783/0.783/0.783/0.000 ms
[+] NS2: wg show wg0 endpoints
[+] NS2: wg set wg0 peer uxQWy0N2EoViNhmLs4mAmWVlgoJJ7zN6+QBKjdwXkwo=  
endpoint 10.0.0.2:1
[+] NS2: ping -W 1 -c 1 192.168.241.1
PING 192.168.241.1 (192.168.241.1) 56(84) bytes of data.
64 bytes from 192.168.241.1: icmp_seq=1 ttl=64 time=0.720 ms

--- 192.168.241.1 ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev = 0.720/0.720/0.720/0.000 ms
[+] NS2: wg show wg0 endpoints
[+] NS2: wg set wg0 peer uxQWy0N2EoViNhmLs4mAmWVlgoJJ7zN6+QBKjdwXkwo=  
endpoint [fd00:aa::2]:1
[+] NS2: ping -W 1 -c 1 192.168.241.1
PING 192.168.241.1 (192.168.241.1) 56(84) bytes of data.
64 bytes from 192.168.241.1: icmp_seq=1 ttl=64 time=0.770 ms

--- 192.168.241.1 ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev = 0.770/0.770/0.770/0.000 ms
[+] NS2: wg show wg0 endpoints
[+] NS1: ip link add dummy0 type dummy
[+] NS1: ip addr add 10.50.0.1/24 dev dummy0
[+] NS1: ip link set dummy0 up
[+] NS2: ip route add 10.50.0.0/24 dev veth2
[+] NS2: wg set wg0 peer uxQWy0N2EoViNhmLs4mAmWVlgoJJ7zN6+QBKjdwXkwo=  
endpoint 10.50.0.1:1
[+] NS2: ping -W 1 -c 1 192.168.241.1
PING 192.168.241.1 (192.168.241.1) 56(84) bytes of data.
64 bytes from 192.168.241.1: icmp_seq=1 ttl=64 time=0.685 ms

--- 192.168.241.1 ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev = 0.685/0.685/0.685/0.000 ms
[+] NS2: wg show wg0 endpoints
[+] NS1: ip link del dummy0
[+] NS1: ip addr flush dev veth1
[+] NS2: ip addr flush dev veth2
[+] NS1: ip route flush dev veth1
[+] NS2: ip route flush dev veth2
[+] NS1: ip link add veth3 type veth peer name veth4
[+] NS1: ip link set veth4 netns wg-test-1985-2
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
[+] NS1: wg set wg0 peer 42PsgOL93pCIvxedeKtPSX+eMdtdZhFpJcbAMDVgNn0=  
endpoint 10.0.0.2:2
[+] NS1: ping -W 1 -c 1 192.168.241.2
PING 192.168.241.2 (192.168.241.2) 56(84) bytes of data.
64 bytes from 192.168.241.2: icmp_seq=1 ttl=64 time=0.740 ms

--- 192.168.241.2 ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev = 0.740/0.740/0.740/0.000 ms
[+] NS2: wg show wg0 endpoints
[+] NS1: ip route add 10.0.0.0/24 dev veth3 src 10.0.0.3 metric 1
[+] NS1: wg
interface: wg0
    public key: uxQWy0N2EoViNhmLs4mAmWVlgoJJ7zN6+QBKjdwXkwo=
    private key: 4B/KttKMU2JVTbLQtQlfiDcXLhCZLwb6nGc54UFHrGY=
    listening port: 1

peer: 42PsgOL93pCIvxedeKtPSX+eMdtdZhFpJcbAMDVgNn0=
    preshared key: roYV9xqkzIwKXPn7fm0MchPQqwqovbfZeX7KpFMwceU=
    endpoint: 10.0.0.2:2
    allowed ips: 192.168.241.2/32, fd00::2/128
    latest handshake: 2 seconds ago
    transfer: 932 B received, 1.39 KiB sent
[+] NS2: wg
interface: wg0
    public key: 42PsgOL93pCIvxedeKtPSX+eMdtdZhFpJcbAMDVgNn0=
    private key: UJsV2G5Mh4VJ4Id2zp0/cox1XalK9L1j7xQzuWpFpXk=
    listening port: 2

peer: uxQWy0N2EoViNhmLs4mAmWVlgoJJ7zN6+QBKjdwXkwo=
    preshared key: roYV9xqkzIwKXPn7fm0MchPQqwqovbfZeX7KpFMwceU=
    endpoint: 10.0.0.1:1
    allowed ips: 192.168.241.1/32, fd00::1/128
    latest handshake: 2 seconds ago
    transfer: 988 B received, 1.34 KiB sent
[+] NS1: ping -W 5 -c 5 192.168.241.2
PING 192.168.241.2 (192.168.241.2) 56(84) bytes of data.

--- 192.168.241.2 ping statistics ---
5 packets transmitted, 0 received, 100% packet loss, time 4088ms

[+] NS0: ip link del dev wg0
[+] NS1: ip link del dev wg0
[+] NS2: ip link del dev wg0
[+] ip netns del wg-test-1985-1
[+] ip netns del wg-test-1985-2
[+] ip netns del wg-test-1985-0





WireGuard 0.0.20170907: Dmesg

[  644.632814] wireguard: routing table self-tests: pass
[  644.641698] wireguard: nonce counter self-tests: pass
[  644.651929] wireguard: curve25519 self-tests: pass
[  644.656822] wireguard: chacha20poly1305 self-tests: pass
[  644.665544] wireguard: blake2s self-tests: pass
[  645.038725] wireguard: ratelimiter self-tests: pass
[  645.043963] wireguard: WireGuard 0.0.20170907 loaded. See  
www.wireguard.com for information.
[  645.052484] wireguard: Copyright (C) 2015-2017 Jason A. Donenfeld  
<Jason@zx2c4.com>. All Rights Reserved.
[  658.817910] wireguard: wg0: Interface created
[  658.898250] wireguard: wg0: Interface created
[  659.154857] wireguard: wg0: Peer 1 created
[  659.212788] wireguard: wg0: Peer 2 created
[  659.431138] wireguard: wg0: Sending handshake initiation to peer 2  
(127.0.0.1:1)
[  659.433922] wireguard: wg0: Receiving handshake initiation from  
peer 1 (127.0.0.1:2)
[  659.433935] wireguard: wg0: Sending handshake response to peer 1  
(127.0.0.1:2)
[  659.436326] wireguard: wg0: Keypair 1 created for peer 1
[  659.438157] wireguard: wg0: Receiving handshake response from peer  
2 (127.0.0.1:1)
[  659.438205] wireguard: wg0: Keypair 2 created for peer 2
[  660.341561] wireguard: wg0: Peer 3 created
[  660.590877] wireguard: wg0: Packet has unallowed src IP  
(192.168.241.2) from peer 1 ([::1]:9997/0%0)
[  661.640247] wireguard: wg0: Peer 3 ((invalid address)) destroyed
[  661.712236] wireguard: wg0: Keypair 1 destroyed for peer 1
[  661.733244] wireguard: wg0: Peer 1 ([::1]:9997/0%0) destroyed
[  661.755253] wireguard: wg0: Interface deleted
[  661.785231] wireguard: wg0: Keypair 2 destroyed for peer 2
[  661.805238] wireguard: wg0: Peer 2 ([::1]:9998/0%0) destroyed
[  661.840246] wireguard: wg0: Interface deleted
[  661.886038] wireguard: wg0: Interface created
[  661.931864] wireguard: wg0: Interface created
[  662.092582] wireguard: wg0: Peer 4 created
[  662.147552] wireguard: wg0: Peer 5 created
[  662.417864] IPv6: ADDRCONF(NETDEV_UP): vethrc: link is not ready
[  662.450898] IPv6: ADDRCONF(NETDEV_UP): vethrs: link is not ready
[  662.575570] IPv6: ADDRCONF(NETDEV_CHANGE): vethrc: link becomes ready
[  662.670312] IPv6: ADDRCONF(NETDEV_CHANGE): vethrs: link becomes ready
[  663.101630] wireguard: wg0: Sending keepalive packet to peer 4  
(10.0.0.100:2)
[  663.101694] wireguard: wg0: Sending handshake initiation to peer 4  
(10.0.0.100:2)
[  663.104717] wireguard: wg0: Receiving handshake initiation from  
peer 5 (10.0.0.1:1)
[  663.104729] wireguard: wg0: Sending handshake response to peer 5  
(10.0.0.1:1)
[  663.107232] wireguard: wg0: Keypair 3 created for peer 5
[  663.109007] wireguard: wg0: Receiving handshake response from peer  
4 (10.0.0.100:2)
[  663.109055] wireguard: wg0: Keypair 4 created for peer 4
[  663.109801] wireguard: wg0: Receiving keepalive packet from peer 5  
(10.0.0.1:1)
[  664.049085] wireguard: wg0: Sending keepalive packet to peer 4  
(10.0.0.100:2)
[  664.050002] wireguard: wg0: Receiving keepalive packet from peer 5  
(10.0.0.1:1)
[  665.073004] wireguard: wg0: Sending keepalive packet to peer 4  
(10.0.0.100:2)
[  665.073271] wireguard: wg0: Receiving keepalive packet from peer 5  
(10.0.0.1:1)
[  666.096932] wireguard: wg0: Sending keepalive packet to peer 4  
(10.0.0.100:2)
[  666.097173] wireguard: wg0: Receiving keepalive packet from peer 5  
(10.0.0.1:1)
[  666.424894] wireguard: wg0: Keypair 4 destroyed for peer 4
[  666.443897] wireguard: wg0: Peer 4 (10.0.0.100:2) destroyed
[  666.469904] wireguard: wg0: Interface deleted
[  666.499896] wireguard: wg0: Keypair 3 destroyed for peer 5
[  666.517908] wireguard: wg0: Peer 5 (10.0.0.1:1) destroyed
[  666.557922] wireguard: wg0: Interface deleted
[  666.599586] wireguard: wg0: Interface created
[  666.644488] wireguard: wg0: Interface created
[  666.808256] wireguard: wg0: Peer 6 created
[  666.860303] wireguard: wg0: Peer 7 created
[  667.272584] IPv6: ADDRCONF(NETDEV_UP): veth1: link is not ready
[  667.308870] IPv6: ADDRCONF(NETDEV_CHANGE): veth1: link becomes ready
[  667.470297] wireguard: wg0: Sending handshake initiation to peer 6  
(10.0.0.2:2)
[  667.473361] wireguard: wg0: Receiving handshake initiation from  
peer 7 (10.0.0.1:1)
[  667.473374] wireguard: wg0: Sending handshake response to peer 7  
(10.0.0.1:1)
[  667.475906] wireguard: wg0: Keypair 5 created for peer 7
[  667.477667] wireguard: wg0: Receiving handshake response from peer  
6 (10.0.0.2:2)
[  667.477712] wireguard: wg0: Keypair 6 created for peer 6
[  668.111570] IPv6: ADDRCONF(NETDEV_UP): veth1: link is not ready
[  668.140837] IPv6: ADDRCONF(NETDEV_CHANGE): veth1: link becomes ready
[  669.330430] IPv6: ADDRCONF(NETDEV_UP): veth3: link is not ready
[  669.360783] IPv6: ADDRCONF(NETDEV_CHANGE): veth3: link becomes ready
[  679.059966] wireguard: wg0: Keypair 6 destroyed for peer 6
[  679.078968] wireguard: wg0: Peer 6 (10.0.0.2:2) destroyed
[  679.105002] wireguard: wg0: Interface deleted
[  679.154094] wireguard: wg0: Keypair 5 destroyed for peer 7
[  679.177958] wireguard: wg0: Peer 7 (10.0.0.1:1) destroyed
[  679.235988] wireguard: wg0: Interface deleted






WireGuard 0.0.20170918-7-g7758071: Log

[root@cubox src]# /root/netns.sh
[+] ip netns add wg-test-4700-0
[+] ip netns add wg-test-4700-1
[+] ip netns add wg-test-4700-2
[+] NS0: ip link set up dev lo
[+] NS0: ip link add dev wg0 type wireguard
[+] NS0: ip link set wg0 netns wg-test-4700-1
[+] NS0: ip link add dev wg0 type wireguard
[+] NS0: ip link set wg0 netns wg-test-4700-2
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
1LkT3spIfryeo85Ct+1Rw1H7ksmp9h9qe57T6eyyPEw= preshared-key /dev/fd/62  
allowed-ips 192.168.241.2/32,fd00::2/128
[+] NS2: wg set wg0 private-key /dev/fd/63 listen-port 2 peer  
pn/24gxi3AlPbKvsD8JMFpeXqStEVmf8FBAnbWZ3iiY= preshared-key /dev/fd/62  
allowed-ips 192.168.241.1/32,fd00::1/128
[+] NS1: ip link set up dev wg0
[+] NS2: ip link set up dev wg0
[+] NS1: ip link show dev wg0
[+] NS1: wg set wg0 peer 1LkT3spIfryeo85Ct+1Rw1H7ksmp9h9qe57T6eyyPEw=  
endpoint 127.0.0.1:2
[+] NS2: wg set wg0 peer pn/24gxi3AlPbKvsD8JMFpeXqStEVmf8FBAnbWZ3iiY=  
endpoint 127.0.0.1:1
[+] NS2: ping -c 10 -f -W 1 192.168.241.1
PING 192.168.241.1 (192.168.241.1) 56(84) bytes of data.

--- 192.168.241.1 ping statistics ---
10 packets transmitted, 10 received, 0% packet loss, time 14ms
rtt min/avg/max/mdev = 0.317/1.359/10.206/2.949 ms, ipg/ewma 1.576/3.327 ms
[+] NS2: ip -stats link show dev wg0
[+] NS1: ip link set wg0 mtu 1420
[+] NS2: ip link set wg0 mtu 1420
[+] NS0: ip -4 addr del 127.0.0.1/8 dev lo
[+] NS0: ip -4 addr add 127.212.121.99/8 dev lo
[+] NS1: wg set wg0 listen-port 9999
[+] NS1: wg set wg0 peer 1LkT3spIfryeo85Ct+1Rw1H7ksmp9h9qe57T6eyyPEw=  
endpoint 127.0.0.1:2
[+] NS1: ping6 -W 1 -c 1 fd00::2
PING fd00::2(fd00::2) 56 data bytes
64 bytes from fd00::2: icmp_seq=1 ttl=64 time=0.571 ms

--- fd00::2 ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev = 0.571/0.571/0.571/0.000 ms
[+] NS2: wg show wg0 endpoints
[+] NS1: wg set wg0 listen-port 9998
[+] NS1: wg set wg0 peer 1LkT3spIfryeo85Ct+1Rw1H7ksmp9h9qe57T6eyyPEw=  
endpoint [::1]:2
[+] NS1: ping -W 1 -c 1 192.168.241.2
PING 192.168.241.2 (192.168.241.2) 56(84) bytes of data.
64 bytes from 192.168.241.2: icmp_seq=1 ttl=64 time=0.578 ms

--- 192.168.241.2 ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev = 0.578/0.578/0.578/0.000 ms
[+] NS2: wg show wg0 endpoints
[+] NS1: wg set wg0 peer 1LkT3spIfryeo85Ct+1Rw1H7ksmp9h9qe57T6eyyPEw=  
allowed-ips 192.168.241.0/24
[+] NS1: wait for udp:1111
[+] NS1: ncat -l -u -p 1111
[+] NS2: ncat -u 192.168.241.1 1111
[+] wg genkey
[+] wg pubkey
[+] NS1: wg set wg0 peer LnkhBKCtxk5FTRtKe0TFrJ8oOI+1cylcSPx31hj5Z1c=  
allowed-ips 192.168.241.2/32
[+] NS2: wg set wg0 listen-port 9997
[+] NS1: wait for udp:1111
[+] NS1: ncat -l -u -p 1111
[+] NS2: ncat -u 192.168.241.1 1111
[+] NS1: wg set wg0 peer LnkhBKCtxk5FTRtKe0TFrJ8oOI+1cylcSPx31hj5Z1c= remove
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
1LkT3spIfryeo85Ct+1Rw1H7ksmp9h9qe57T6eyyPEw= preshared-key /dev/fd/62  
allowed-ips 192.168.241.2/32,fd00::2/128
[+] NS2: wg set wg0 private-key /dev/fd/63 listen-port 2 peer  
pn/24gxi3AlPbKvsD8JMFpeXqStEVmf8FBAnbWZ3iiY= preshared-key /dev/fd/62  
allowed-ips 192.168.241.1/32,fd00::1/128
[+] NS1: ip link set up dev wg0
[+] NS2: ip link set up dev wg0
[+] NS0: ip link add vethrc type veth peer name vethc
[+] NS0: ip link add vethrs type veth peer name veths
[+] NS0: ip link set vethc netns wg-test-4700-1
[+] NS0: ip link set veths netns wg-test-4700-2
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
[+] NS1: wg set wg0 peer 1LkT3spIfryeo85Ct+1Rw1H7ksmp9h9qe57T6eyyPEw=  
endpoint 10.0.0.100:2 persistent-keepalive 1
[+] NS1: ping -W 1 -c 1 192.168.241.2
PING 192.168.241.2 (192.168.241.2) 56(84) bytes of data.
64 bytes from 192.168.241.2: icmp_seq=1 ttl=64 time=0.738 ms

--- 192.168.241.2 ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev = 0.738/0.738/0.738/0.000 ms
[+] NS2: ping -W 1 -c 1 192.168.241.1
PING 192.168.241.1 (192.168.241.1) 56(84) bytes of data.
64 bytes from 192.168.241.1: icmp_seq=1 ttl=64 time=0.725 ms

--- 192.168.241.1 ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev = 0.725/0.725/0.725/0.000 ms
[+] NS2: wg show wg0 endpoints
[+] sleep 3
[+] NS2: ping -W 1 -c 1 192.168.241.1
PING 192.168.241.1 (192.168.241.1) 56(84) bytes of data.
64 bytes from 192.168.241.1: icmp_seq=1 ttl=64 time=0.715 ms

--- 192.168.241.1 ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev = 0.715/0.715/0.715/0.000 ms
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
1LkT3spIfryeo85Ct+1Rw1H7ksmp9h9qe57T6eyyPEw= preshared-key /dev/fd/62  
allowed-ips 192.168.241.2/32,fd00::2/128
[+] NS2: wg set wg0 private-key /dev/fd/63 listen-port 2 peer  
pn/24gxi3AlPbKvsD8JMFpeXqStEVmf8FBAnbWZ3iiY= preshared-key /dev/fd/62  
allowed-ips 192.168.241.1/32,fd00::1/128
[+] NS1: ip link set up dev wg0
[+] NS2: ip link set up dev wg0
[+] NS1: ip link add veth1 type veth peer name veth2
[+] NS1: ip link set veth2 netns wg-test-4700-2
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
[+] NS1: wg set wg0 peer 1LkT3spIfryeo85Ct+1Rw1H7ksmp9h9qe57T6eyyPEw=  
endpoint 10.0.0.2:2
[+] NS1: ping -W 1 -c 1 192.168.241.2
PING 192.168.241.2 (192.168.241.2) 56(84) bytes of data.
64 bytes from 192.168.241.2: icmp_seq=1 ttl=64 time=8.15 ms

--- 192.168.241.2 ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev = 8.155/8.155/8.155/0.000 ms
[+] NS1: ip addr add 10.0.0.10/24 dev veth1
[+] NS1: ip addr del 10.0.0.1/24 dev veth1
[+] NS1: ping -W 1 -c 1 192.168.241.2
PING 192.168.241.2 (192.168.241.2) 56(84) bytes of data.
64 bytes from 192.168.241.2: icmp_seq=1 ttl=64 time=0.706 ms

--- 192.168.241.2 ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev = 0.706/0.706/0.706/0.000 ms
[+] NS1: wg set wg0 peer 1LkT3spIfryeo85Ct+1Rw1H7ksmp9h9qe57T6eyyPEw=  
endpoint [fd00:aa::2]:2
[+] NS1: ping -W 1 -c 1 192.168.241.2
PING 192.168.241.2 (192.168.241.2) 56(84) bytes of data.
64 bytes from 192.168.241.2: icmp_seq=1 ttl=64 time=0.911 ms

--- 192.168.241.2 ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev = 0.911/0.911/0.911/0.000 ms
[+] NS1: ip addr add fd00:aa::10/96 dev veth1
[+] NS1: ip addr del fd00:aa::1/96 dev veth1
[+] NS1: ping -W 1 -c 1 192.168.241.2
PING 192.168.241.2 (192.168.241.2) 56(84) bytes of data.
64 bytes from 192.168.241.2: icmp_seq=1 ttl=64 time=0.836 ms

--- 192.168.241.2 ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev = 0.836/0.836/0.836/0.000 ms
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
[+] NS2: wg set wg0 peer pn/24gxi3AlPbKvsD8JMFpeXqStEVmf8FBAnbWZ3iiY=  
endpoint 10.0.0.1:1
[+] NS2: ping -W 1 -c 1 192.168.241.1
PING 192.168.241.1 (192.168.241.1) 56(84) bytes of data.
64 bytes from 192.168.241.1: icmp_seq=1 ttl=64 time=0.844 ms

--- 192.168.241.1 ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev = 0.844/0.844/0.844/0.000 ms
[+] NS2: wg show wg0 endpoints
[+] NS2: wg set wg0 peer pn/24gxi3AlPbKvsD8JMFpeXqStEVmf8FBAnbWZ3iiY=  
endpoint [fd00:aa::1]:1
[+] NS2: ping -W 1 -c 1 192.168.241.1
PING 192.168.241.1 (192.168.241.1) 56(84) bytes of data.
64 bytes from 192.168.241.1: icmp_seq=1 ttl=64 time=0.892 ms

--- 192.168.241.1 ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev = 0.892/0.892/0.892/0.000 ms
[+] NS2: wg show wg0 endpoints
[+] NS2: wg set wg0 peer pn/24gxi3AlPbKvsD8JMFpeXqStEVmf8FBAnbWZ3iiY=  
endpoint 10.0.0.2:1
[+] NS2: ping -W 1 -c 1 192.168.241.1
PING 192.168.241.1 (192.168.241.1) 56(84) bytes of data.
64 bytes from 192.168.241.1: icmp_seq=1 ttl=64 time=0.723 ms

--- 192.168.241.1 ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev = 0.723/0.723/0.723/0.000 ms
[+] NS2: wg show wg0 endpoints
[+] NS2: wg set wg0 peer pn/24gxi3AlPbKvsD8JMFpeXqStEVmf8FBAnbWZ3iiY=  
endpoint [fd00:aa::2]:1
[+] NS2: ping -W 1 -c 1 192.168.241.1
PING 192.168.241.1 (192.168.241.1) 56(84) bytes of data.
64 bytes from 192.168.241.1: icmp_seq=1 ttl=64 time=0.937 ms

--- 192.168.241.1 ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev = 0.937/0.937/0.937/0.000 ms
[+] NS2: wg show wg0 endpoints
[+] NS1: ip link add dummy0 type dummy
[+] NS1: ip addr add 10.50.0.1/24 dev dummy0
[+] NS1: ip link set dummy0 up
[+] NS2: ip route add 10.50.0.0/24 dev veth2
[+] NS2: wg set wg0 peer pn/24gxi3AlPbKvsD8JMFpeXqStEVmf8FBAnbWZ3iiY=  
endpoint 10.50.0.1:1
[+] NS2: ping -W 1 -c 1 192.168.241.1
PING 192.168.241.1 (192.168.241.1) 56(84) bytes of data.
64 bytes from 192.168.241.1: icmp_seq=1 ttl=64 time=0.864 ms

--- 192.168.241.1 ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev = 0.864/0.864/0.864/0.000 ms
[+] NS2: wg show wg0 endpoints
[+] NS1: ip link del dummy0
[+] NS1: ip addr flush dev veth1
[+] NS2: ip addr flush dev veth2
[+] NS1: ip route flush dev veth1
[+] NS2: ip route flush dev veth2
[+] NS1: ip link add veth3 type veth peer name veth4
[+] NS1: ip link set veth4 netns wg-test-4700-2
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
[+] NS1: wg set wg0 peer 1LkT3spIfryeo85Ct+1Rw1H7ksmp9h9qe57T6eyyPEw=  
endpoint 10.0.0.2:2
[+] NS1: ping -W 1 -c 1 192.168.241.2
PING 192.168.241.2 (192.168.241.2) 56(84) bytes of data.
64 bytes from 192.168.241.2: icmp_seq=1 ttl=64 time=0.672 ms

--- 192.168.241.2 ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev = 0.672/0.672/0.672/0.000 ms
[+] NS2: wg show wg0 endpoints
[+] NS1: ip route add 10.0.0.0/24 dev veth3 src 10.0.0.3 metric 1
[+] NS1: wg
interface: wg0
    public key: pn/24gxi3AlPbKvsD8JMFpeXqStEVmf8FBAnbWZ3iiY=
    private key: 8N4S6mLt4XKcvUeNUpORD+Y1tNFdF9P5mBsSp98EtFU=
    listening port: 1

peer: 1LkT3spIfryeo85Ct+1Rw1H7ksmp9h9qe57T6eyyPEw=
    preshared key: mF2pLTMKyMP717c7E3VCHVoLnIXz7zXIZN5StUnlP/w=
    endpoint: 10.0.0.2:2
    allowed ips: 192.168.241.2/32, fd00::2/128
    latest handshake: 2 seconds ago
    transfer: 932 B received, 1.39 KiB sent
[+] NS2: wg
interface: wg0
    public key: 1LkT3spIfryeo85Ct+1Rw1H7ksmp9h9qe57T6eyyPEw=
    private key: INl86K1KzWviQzps1Dqmt/5VWfbeDWW4t17RutQ4kGY=
    listening port: 2

peer: pn/24gxi3AlPbKvsD8JMFpeXqStEVmf8FBAnbWZ3iiY=
    preshared key: mF2pLTMKyMP717c7E3VCHVoLnIXz7zXIZN5StUnlP/w=
    endpoint: 10.0.0.1:1
    allowed ips: 192.168.241.1/32, fd00::1/128
    latest handshake: 2 seconds ago
    transfer: 988 B received, 1.34 KiB sent
[+] NS1: ping -W 5 -c 5 192.168.241.2
PING 192.168.241.2 (192.168.241.2) 56(84) bytes of data.

--- 192.168.241.2 ping statistics ---
5 packets transmitted, 0 received, 100% packet loss, time 4127ms

[+] NS0: ip link del dev wg0
[+] NS1: ip link del dev wg0
[+] NS2: ip link del dev wg0
[+] ip netns del wg-test-4700-1
[+] ip netns del wg-test-4700-2
[+] ip netns del wg-test-4700-0


WireGuard 0.0.20170918-7-g7758071: Dmesg

[ 1701.241763] wireguard: routing table self-tests: pass
[ 1701.250460] wireguard: nonce counter self-tests: pass
[ 1701.260782] wireguard: curve25519 self-tests: pass
[ 1701.265676] wireguard: chacha20poly1305 self-tests: pass
[ 1701.275189] wireguard: blake2s self-tests: pass
[ 1701.640660] wireguard: ratelimiter self-tests: pass
[ 1701.645845] wireguard: WireGuard 0.0.20170918-7-g7758071 loaded.  
See www.wireguard.com for information.
[ 1701.655304] wireguard: Copyright (C) 2015-2017 Jason A. Donenfeld  
<Jason@zx2c4.com>. All Rights Reserved.
[ 1727.257834] wireguard: wg0: Interface created
[ 1727.334548] wireguard: wg0: Interface created
[ 1727.591395] wireguard: wg0: Peer 1 created
[ 1727.637290] wireguard: wg0: Peer 2 created
[ 1727.832393] wireguard: wg0: Sending handshake initiation to peer 2  
(127.0.0.1:1)
[ 1727.836026] wireguard: wg0: Receiving handshake initiation from  
peer 1 (127.0.0.1:2)
[ 1727.836059] wireguard: wg0: Sending handshake response to peer 1  
(127.0.0.1:2)
[ 1727.840139] wireguard: wg0: Keypair 1 created for peer 1
[ 1727.841993] wireguard: wg0: Receiving handshake response from peer  
2 (127.0.0.1:1)
[ 1727.842042] wireguard: wg0: Keypair 2 created for peer 2
[ 1728.592963] wireguard: wg0: Peer 3 created
[ 1728.836167] wireguard: wg0: Packet has unallowed src IP  
(192.168.241.2) from peer 1 ([::1]:9997/0%0)
[ 1729.887798] wireguard: wg0: Peer 3 ((invalid address)) destroyed
[ 1729.967793] wireguard: wg0: Peer 1 ([::1]:9997/0%0) destroyed
[ 1729.976813] wireguard: wg0: Interface deleted
[ 1730.023789] wireguard: wg0: Peer 2 ([::1]:9998/0%0) destroyed
[ 1730.043800] wireguard: wg0: Interface deleted
[ 1730.089743] wireguard: wg0: Interface created
[ 1730.129582] wireguard: wg0: Interface created
[ 1730.303089] wireguard: wg0: Peer 4 created
[ 1730.352168] wireguard: wg0: Peer 5 created
[ 1730.614417] IPv6: ADDRCONF(NETDEV_UP): vethrc: link is not ready
[ 1730.644550] IPv6: ADDRCONF(NETDEV_UP): vethrs: link is not ready
[ 1730.764877] IPv6: ADDRCONF(NETDEV_CHANGE): vethrc: link becomes ready
[ 1730.864801] IPv6: ADDRCONF(NETDEV_CHANGE): vethrs: link becomes ready
[ 1731.246920] wireguard: wg0: Sending keepalive packet to peer 4  
(10.0.0.100:2)
[ 1731.246987] wireguard: wg0: Sending handshake initiation to peer 4  
(10.0.0.100:2)
[ 1731.250046] wireguard: wg0: Receiving handshake initiation from  
peer 5 (10.0.0.1:1)
[ 1731.250059] wireguard: wg0: Sending handshake response to peer 5  
(10.0.0.1:1)
[ 1731.252468] wireguard: wg0: Keypair 3 created for peer 5
[ 1731.254266] wireguard: wg0: Receiving handshake response from peer  
4 (10.0.0.100:2)
[ 1731.254313] wireguard: wg0: Keypair 4 created for peer 4
[ 1731.254488] wireguard: wg0: Receiving keepalive packet from peer 5  
(10.0.0.1:1)
[ 1732.257636] wireguard: wg0: Sending keepalive packet to peer 4  
(10.0.0.100:2)
[ 1732.258751] wireguard: wg0: Receiving keepalive packet from peer 5  
(10.0.0.1:1)
[ 1733.281553] wireguard: wg0: Sending keepalive packet to peer 4  
(10.0.0.100:2)
[ 1733.281781] wireguard: wg0: Receiving keepalive packet from peer 5  
(10.0.0.1:1)
[ 1734.305516] wireguard: wg0: Sending keepalive packet to peer 4  
(10.0.0.100:2)
[ 1734.306261] wireguard: wg0: Receiving keepalive packet from peer 5  
(10.0.0.1:1)
[ 1734.556446] wireguard: wg0: Peer 4 (10.0.0.100:2) destroyed
[ 1734.566464] wireguard: wg0: Interface deleted
[ 1734.614444] wireguard: wg0: Peer 5 (10.0.0.1:1) destroyed
[ 1734.633460] wireguard: wg0: Interface deleted
[ 1734.675243] wireguard: wg0: Interface created
[ 1734.715979] wireguard: wg0: Interface created
[ 1734.889764] wireguard: wg0: Peer 6 created
[ 1734.950735] wireguard: wg0: Peer 7 created
[ 1735.365136] IPv6: ADDRCONF(NETDEV_UP): veth1: link is not ready
[ 1735.395591] IPv6: ADDRCONF(NETDEV_CHANGE): veth1: link becomes ready
[ 1735.575062] wireguard: wg0: Sending handshake initiation to peer 6  
(10.0.0.2:2)
[ 1735.578310] wireguard: wg0: Receiving handshake initiation from  
peer 7 (10.0.0.1:1)
[ 1735.578378] wireguard: wg0: Sending handshake response to peer 7  
(10.0.0.1:1)
[ 1735.580786] wireguard: wg0: Keypair 5 created for peer 7
[ 1735.582567] wireguard: wg0: Receiving handshake response from peer  
6 (10.0.0.2:2)
[ 1735.582614] wireguard: wg0: Keypair 6 created for peer 6
[ 1736.166096] IPv6: ADDRCONF(NETDEV_UP): veth1: link is not ready
[ 1736.204333] IPv6: ADDRCONF(NETDEV_CHANGE): veth1: link becomes ready
[ 1737.432942] IPv6: ADDRCONF(NETDEV_UP): veth3: link is not ready
[ 1737.463313] IPv6: ADDRCONF(NETDEV_CHANGE): veth3: link becomes ready
[ 1747.235507] wireguard: wg0: Peer 6 (10.0.0.2:2) destroyed
[ 1747.250522] wireguard: wg0: Interface deleted
[ 1747.303504] wireguard: wg0: Peer 7 (10.0.0.1:1) destroyed
[ 1747.320518] wireguard: wg0: Interface deleted



Script modifications.

[root@cubox src]# diff  /root/netns.sh /usr/src/WireGuard/src/tests/netns.sh
146a147,161
> tests
> ip1 link set wg0 mtu $big_mtu
> ip2 link set wg0 mtu $big_mtu
> tests
>
> ip1 link set wg0 mtu $orig_mtu
> ip2 link set wg0 mtu $orig_mtu
>
> # Test using IPv6 as outer transport
> n1 wg set wg0 peer "$pub2" endpoint [::1]:2
> n2 wg set wg0 peer "$pub1" endpoint [::1]:1
> tests
> ip1 link set wg0 mtu $big_mtu
> ip2 link set wg0 mtu $big_mtu
> tests
346,353c361
<
<
< n1 wg
< n2 wg
<
< n1 ping -W 5 -c 5 192.168.241.2
<
<
---
> n1 ping -W 1 -c 1 192.168.241.2
355d362
<



[root@cubox src]# ifconfig
eth0: flags=4099<UP,BROADCAST,MULTICAST>  mtu 1500
         ether d0:63:b4:00:1d:2f  txqueuelen 1000  (Ethernet)
         RX packets 0  bytes 0 (0.0 B)
         RX errors 0  dropped 0  overruns 0  frame 0
         TX packets 0  bytes 0 (0.0 B)
         TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
         inet 127.0.0.1  netmask 255.0.0.0
         inet6 ::1  prefixlen 128  scopeid 0x10<host>
         loop  txqueuelen 1000  (Local Loopback)
         RX packets 32  bytes 2768 (2.7 KiB)
         RX errors 0  dropped 0  overruns 0  frame 0
         TX packets 32  bytes 2768 (2.7 KiB)
         TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

wlan0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
         inet 192.168.2.32  netmask 255.255.255.0  broadcast 192.168.2.255
         inet6 fe80::663e:f78a:785f:d431  prefixlen 64  scopeid 0x20<link>
         inet6 2a02:<snip>:8e97  prefixlen 64  scopeid 0x0<global>
         ether 40:2c:f4:ae:28:f4  txqueuelen 1000  (Ethernet)
         RX packets 2928  bytes 228334 (222.9 KiB)
         RX errors 0  dropped 0  overruns 0  frame 0
         TX packets 2718  bytes 975589 (952.7 KiB)
         TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

[root@cubox src]# route -n
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
0.0.0.0         192.168.2.254   0.0.0.0         UG    600    0        0 wlan0
192.168.2.0     0.0.0.0         255.255.255.0   U     600    0        0 wlan0

Greats,

René van Dorst.
