Return-Path: opensource@vdorst.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c0baa78b
 for <wireguard@lists.zx2c4.com>; Fri, 6 Oct 2017 10:30:28 +0000 (UTC)
Received: from smtp02.bhosted.nl (smtp02.bhosted.nl [94.124.121.13])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f53a2e03
 for <wireguard@lists.zx2c4.com>; Fri, 6 Oct 2017 10:30:28 +0000 (UTC)
Received: from www (www.lan.vdorst.com [172.16.2.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.vdorst.com (Postfix) with ESMTPSA id 9CC4B132EA1E
 for <wireguard@lists.zx2c4.com>; Fri,  6 Oct 2017 12:59:40 +0200 (CEST)
Date: Fri, 06 Oct 2017 10:59:40 +0000
Message-ID: <20171006105940.Horde.-YgH3Xzem0aIzxlyFy3xGun@www.vdorst.com>
From: =?utf-8?b?UmVuw6k=?= van Dorst <opensource@vdorst.com>
To: WireGuard list <wireguard@lists.zx2c4.com>
Subject: netns.sh: Sending cookie response for denied handshake
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

I was testing the latest version on my Cubox i4pro with netns.sh script.
Standard F26 kernel 4.13.4-200.fc26.armv7hl, on the device compiled  
Wireguard 0.0.20171005.

First test fails.

But after I connect and disconnect with my home tunnel "wg-quick up  
wg0", the test runs fine.
Also reload the module keeps the test working.
So it seems only on a fresh reboot it fails the test.

MESG + CONSOLE log:

[root@cubox tests]# ./netns.sh
[+] ip netns add wg-test-960-0
[+] ip netns add wg-test-960-1
[+] ip netns add wg-test-960-2
[+] NS0: ip link set up dev lo
[+] NS0: ip link add dev wg0 type wireguard
[  291.156574] wireguard: wg0: Interface created
[+] NS0: ip link set wg0 netns wg-test-960-1
[+] NS0: ip link add dev wg0 type wireguard
[  291.244318] wireguard: wg0: Interface created
[+] NS0: ip link set wg0 netns wg-test-960-2
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
WEteJQshsIwGXnjC/Bzz2+jM2ZVCWJJAp2YTeIKQGiw= preshared-key /dev/fd/62  
allowed-ips 192.168.241.2/32,fd00::2/128
[  291.520731] wireguard: wg0: Peer 3 created
[+] NS2: wg set wg0 private-key /dev/fd/63 listen-port 2 peer  
cxbjGbjkKFIVIv/Pv4LTkpcy+u5Mha/iTdkWyCo8t04= preshared-key /dev/fd/62  
allowed-ips 192.168.241.1/32,fd00::1/128
[  291.577721] wireguard: wg0: Peer 4 created
[+] NS1: ip link set up dev wg0
[+] NS2: ip link set up dev wg0
[+] NS1: ip link show dev wg0
[+] NS1: wg set wg0 peer WEteJQshsIwGXnjC/Bzz2+jM2ZVCWJJAp2YTeIKQGiw=  
endpoint 127.0.0.1:2
[+] NS2: wg set wg0 peer cxbjGbjkKFIVIv/Pv4LTkpcy+u5Mha/iTdkWyCo8t04=  
endpoint 127.0.0.1:1
[+] NS2: ping -c 10 -f -W 1 192.168.241.1
PING 192.168.241.1 (192.168.241.1) 56(84) bytes of data.
.[  291.798677] wireguard: wg0: Sending handshake initiation to peer 4  
(127.0.0.1:1)
[  291.800599] wireguard: wg0: Sending cookie response for denied  
handshake message for 127.0.0.1:2
[  291.800696] wireguard: wg0: Receiving cookie response from 127.0.0.1:1
.........
--- 192.168.241.1 ping statistics ---
10 packets transmitted, 0 received, 100% packet loss, time 98ms

[+] NS0: ip link del dev wg0
[+] NS1: ip link del dev wg0
[  293.004307] wireguard: wg0: Peer 3 (127.0.0.1:2) destroyed
[  293.013305] wireguard: wg0: Interface deleted
[+] NS2: ip link del dev wg0
[  293.064291] wireguard: wg0: Peer 4 (127.0.0.1:1) destroyed
[  293.084298] wireguard: wg0: Interface deleted
[+] ip netns del wg-test-960-1
[+] ip netns del wg-test-960-2
[+] ip netns del wg-test-960-0






MESG + CONSOLE log after the failed test to home tunnel:

[root@cubox tests]# wg-quick up wg0
[#] ip link add wg0 type wireguard
[  430.786542] wireguard: wg0: Interface created
[#] wg setconf wg0 /dev/fd/63

[  435.854103] wireguard: wg0: Peer 5 created
[#] ip address add 10.0.0.2/24 dev wg0
[#] ip address add fd00::2/128 dev wg0
[#] ip link set mtu 1440 dev wg0
[#] ip link set wg0 up
[  435.897244] wireguard: wg0: Sending keepalive packet to peer 5  
(192.168.2.222:36464)
[  435.897289] wireguard: wg0: Sending handshake initiation to peer 5  
(192.168.2.222:36464)
[  435.917129] wireguard: wg0: Receiving handshake response from peer  
5 (192.168.2.222:36464)
[  435.917175] wireguard: wg0: Keypair 1 created for peer 5
[#] ip route add fd00::/64 dev wg0
[root@cubox tests]#
[root@cubox tests]# ping 10.0.0.1
PING 10.0.0.1 (10.0.0.1) 56(84) bytes of data.
64 bytes from 10.0.0.1: icmp_seq=1 ttl=64 time=4.35 ms
64 bytes from 10.0.0.1: icmp_seq=2 ttl=64 time=9.00 ms
64 bytes from 10.0.0.1: icmp_seq=3 ttl=64 time=8.84 ms
^C
--- 10.0.0.1 ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 2002ms
rtt min/avg/max/mdev = 4.354/7.402/9.008/2.156 ms
[root@cubox tests]# [  454.590369] wireguard: wg0: Sending keepalive  
packet to peer 5 (192.168.2.222:36464)
[  479.676530] wireguard: wg0: Sending keepalive packet to peer 5  
(192.168.2.222:36464)
wg-quick down wg0
[#] ip link delete dev wg0
[  487.218969] wireguard: wg0: Keypair 1 destroyed for peer 5
[  487.240952] wireguard: wg0: Peer 5 (192.168.2.222:36464) destroyed
[  487.259973] wireguard: wg0: Interface deleted




MESG + CONSOLE log after to home tunnel and manual terminated the test.:

[root@cubox tests]# ./netns.sh
[+] ip netns add wg-test-1076-0
[+] ip netns add wg-test-1076-1
[+] ip netns add wg-test-1076-2
[+] NS0: ip link set up dev lo
[+] NS0: ip link add dev wg0 type wireguard
[  490.497685] wireguard: wg0: Interface created
[+] NS0: ip link set wg0 netns wg-test-1076-1
[+] NS0: ip link add dev wg0 type wireguard
[  490.576768] wireguard: wg0: Interface created
[+] NS0: ip link set wg0 netns wg-test-1076-2
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
1Eb46rPrWmtxhAKilAlPfuXpVHIQOpt3di3WEpPkOQ4= preshared-key /dev/fd/62  
allowed-ips 192.168.241.2/32,fd00::2/128
[  490.852081] wireguard: wg0: Peer 6 created
[+] NS2: wg set wg0 private-key /dev/fd/63 listen-port 2 peer  
hIzK+p/m7yHGVhbJedaZe8kDLURQi0bDY9Rr9a49GhI= preshared-key /dev/fd/62  
allowed-ips 192.168.241.1/32,fd00::1/128
[  490.910017] wireguard: wg0: Peer 7 created
[+] NS1: ip link set up dev wg0
[+] NS2: ip link set up dev wg0
[+] NS1: ip link show dev wg0
[+] NS1: wg set wg0 peer 1Eb46rPrWmtxhAKilAlPfuXpVHIQOpt3di3WEpPkOQ4=  
endpoint 127.0.0.1:2
[+] NS2: wg set wg0 peer hIzK+p/m7yHGVhbJedaZe8kDLURQi0bDY9Rr9a49GhI=  
endpoint 127.0.0.1:1
[+] NS2: ping -c 10 -f -W 1 192.168.241.1
PING 192.168.241.1 (192.168.241.1) 56(84) bytes of data.
.[  491.105139] wireguard: wg0: Sending handshake initiation to peer 7  
(127.0.0.1:1)
[  491.108754] wireguard: wg0: Receiving handshake initiation from  
peer 6 (127.0.0.1:2)
[  491.108765] wireguard: wg0: Sending handshake response to peer 6  
(127.0.0.1:2)
[  491.112220] wireguard: wg0: Keypair 2 created for peer 6
[  491.114402] wireguard: wg0: Receiving handshake response from peer  
7 (127.0.0.1:1)
[  491.114446] wireguard: wg0: Keypair 3 created for peer 7
--- 192.168.241.1 ping statistics ---
10 packets transmitted, 10 received, 0% packet loss, time 15ms
rtt min/avg/max/mdev = 0.350/1.544/10.808/3.089 ms, pipe 2, ipg/ewma  
1.745/3.616 ms
[+] NS2: ip -stats link show dev wg0
[+] NS2: ping -c 10 -f -W 1 192.168.241.1
PING 192.168.241.1 (192.168.241.1) 56(84) bytes of data.

--- 192.168.241.1 ping statistics ---
10 packets transmitted, 10 received, 0% packet loss, time 4ms
rtt min/avg/max/mdev = 0.330/0.427/0.609/0.080 ms, ipg/ewma 0.546/0.464 ms
[+] NS1: ping -c 10 -f -W 1 192.168.241.2
PING 192.168.241.2 (192.168.241.2) 56(84) bytes of data.

--- 192.168.241.2 ping statistics ---
10 packets transmitted, 10 received, 0% packet loss, time 5ms
rtt min/avg/max/mdev = 0.355/0.484/0.751/0.128 ms, ipg/ewma 0.614/0.550 ms
[+] NS2: ping6 -c 10 -f -W 1 fd00::1
PING fd00::1(fd00::1) 56 data bytes

--- fd00::1 ping statistics ---
10 packets transmitted, 10 received, 0% packet loss, time 5ms
rtt min/avg/max/mdev = 0.376/0.490/0.732/0.120 ms, ipg/ewma 0.627/0.529 ms
[+] NS1: ping6 -c 10 -f -W 1 fd00::2
PING fd00::2(fd00::2) 56 data bytes

--- fd00::2 ping statistics ---
10 packets transmitted, 10 received, 0% packet loss, time 5ms
rtt min/avg/max/mdev = 0.409/0.506/0.801/0.106 ms, ipg/ewma 0.662/0.575 ms
[+] NS2: wait for iperf:5201
[+] NS2: iperf3 -s -1 -B 192.168.241.2
-----------------------------------------------------------
Server listening on 5201
-----------------------------------------------------------
[+] NS1: iperf3 -Z -n 1G -c 192.168.241.2
Connecting to host 192.168.241.2, port 5201
Accepted connection from 192.168.241.1, port 52278
[  6] local 192.168.241.2 port 5201 connected to 192.168.241.1 port 52280
[  5] local 192.168.241.1 port 52280 connected to 192.168.241.2 port 5201
[ ID] Interval           Transfer     Bandwidth
[  6]   0.00-1.00   sec  23.6 MBytes   198 Mbits/sec
[ ID] Interval           Transfer     Bandwidth       Retr  Cwnd
[  5]   0.00-1.00   sec  25.0 MBytes   210 Mbits/sec    0    477 KBytes
^C[  6]   1.00-1.44   sec  11.4 MBytes   216 Mbits/sec
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bandwidth
[  6]   0.00-1.44   sec  0.00 Bytes  0.00 bits/sec                  sender
[  6]   0.00-1.44   sec  35.0 MBytes   203 Mbits/sec                  receiver
iperf3: interrupt - the server has terminated
[  5]   1.00-1.43   sec  11.0 MBytes   216 Mbits/sec    0    526 KBytes
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bandwidth       Retr
[  5]   0.00-1.43   sec  36.0 MBytes   212 Mbits/sec    0             sender
[  5]   0.00-1.43   sec  0.00 Bytes  0.00 bits/sec                  receiver
iperf3: interrupt - the client has terminated
[+] NS0: ip link del dev wg0
[+] NS1: ip link del dev wg0
[  493.248506] wireguard: wg0: Keypair 2 destroyed for peer 6
[  493.268504] wireguard: wg0: Peer 6 (127.0.0.1:2) destroyed
[  493.280524] wireguard: wg0: Interface deleted
[+] NS2: ip link del dev wg0
[  493.310507] wireguard: wg0: Keypair 3 destroyed for peer 7
[  493.325499] wireguard: wg0: Peer 7 (127.0.0.1:1) destroyed
[  493.341519] wireguard: wg0: Interface deleted
[+] ip netns del wg-test-1076-1
[+] ip netns del wg-test-1076-2
[+] ip netns del wg-test-1076-0




EXTRA INFO:



[root@cubox tests]# uname -a
Linux cubox 4.13.4-200.fc26.armv7hl #1 SMP Thu Sep 28 22:34:11 UTC  
2017 armv7l armv7l armv7l GNU/Linux

[root@cubox tests]# cat /proc/cpuinfo
processor       : 0-3
model name      : ARMv7 Processor rev 10 (v7l)
BogoMIPS        : 6.00
Features        : half thumb fastmult vfp edsp thumbee neon vfpv3 tls vfpd32
CPU implementer : 0x41
CPU architecture: 7
CPU variant     : 0x2
CPU part        : 0xc09
CPU revision    : 10

Hardware        : Freescale i.MX6 Quad/DualLite (Device Tree)
Revision        : 0000
Serial          : 0000000000000000


[root@cubox tests]# gcc -v
Using built-in specs.
COLLECT_GCC=gcc
COLLECT_LTO_WRAPPER=/usr/libexec/gcc/armv7hl-redhat-linux-gnueabi/7/lto-wrapper
Target: armv7hl-redhat-linux-gnueabi
Configured with: ../configure --enable-bootstrap  
--enable-languages=c,c++,objc,obj-c++,fortran,ada,go,lto --prefix=/usr  
--mandir=/usr/share/man --infodir=/usr/share/info  
--with-bugurl=http://bugzilla.redhat.com/bugzilla --enable-shared  
--enable-threads=posix --enable-checking=release --enable-multilib  
--with-system-zlib --enable-__cxa_atexit  
--disable-libunwind-exceptions --enable-gnu-unique-object  
--enable-linker-build-id --with-gcc-major-version-only  
--with-linker-hash-style=gnu --enable-plugin --enable-initfini-array  
--with-isl --disable-libmpx --enable-gnu-indirect-function  
--disable-sjlj-exceptions --with-tune=cortex-a8 --with-arch=armv7-a  
--with-float=hard --with-fpu=vfpv3-d16 --with-abi=aapcs-linux  
--build=armv7hl-redhat-linux-gnueabi
Thread model: posix
gcc version 7.2.1 20170915 (Red Hat 7.2.1-2) (GCC)


Greats,

René van Dorst.
