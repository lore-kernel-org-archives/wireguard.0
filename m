Return-Path: augustus_meyer@yahoo.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a46e7f3f
 for <wireguard@lists.zx2c4.com>; Tue, 1 May 2018 06:50:56 +0000 (UTC)
Received: from sonic306-19.consmr.mail.ir2.yahoo.com
 (sonic306-19.consmr.mail.ir2.yahoo.com [77.238.176.205])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a303da85
 for <wireguard@lists.zx2c4.com>; Tue, 1 May 2018 06:50:56 +0000 (UTC)
Date: Tue, 1 May 2018 06:52:24 +0000 (UTC)
From: reiner otto <augustus_meyer@yahoo.de>
To: <wireguard@lists.zx2c4.com>
Message-ID: <91522494.4338044.1525157544752@mail.yahoo.com>
Subject: Why does it work ?
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
References: <91522494.4338044.1525157544752.ref@mail.yahoo.com>
Reply-To: reiner otto <augustus_meyer@yahoo.de>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Having found myself a solution to the problem described in https://lists.zx2c4.com/pipermail/wireguard/2018-April/002736.html,
(I only want to tunnel all traffic destined to 1.2.3.4, the ubuntu-server, via wg from client, an openwrt-router. 
Where 1.2.3.4 also is endpoint of tunnel. All other traffic via eth0 of client to the web.)
I am not really happy with my solution, as I found it simply  by try-and-error. And the solution looks odd to me, because in essence
it is the following sequence of statements in my rc.local, when starting wg on the client:
...
        /etc/wireguard/wireguard_up.sh
        /etc/wireguard/wireguard_down.sh
        /etc/wireguard/wireguard_up.sh 

Or, in other words, simple 
        /etc/wireguard/wireguard_up.sh
does not work. (After starting wg on client, wg does not show any received data.)


One difference I found between working and non-working in /proc/net/nf_conntrack:
working:
ipv4     2 udp      17 158 src=192.168.178.49 dst=1.2.3.4 sport=5555 dport=5555 packets=2615 bytes=384236 src=1.2.3.4 dst=192.168.178.49 sport=5555 dport=5555 packets=2414 bytes=447664 [ASSURED] mark=0 use=2


not working:
ipv4     2 udp      17 55 src=192.168.178.49 dst=1.2.3.4 sport=5555 dport=5555 packets=31 bytes=5456 [UNREPLIED] src=172.16.0.1 dst=172.16.18.31 sport=5555 dport=5555 packets=0 bytes=0 mark=0 use=15

192.168.178.49: IP of eth0 of my router/client (received via dhcp)
172.16.0.1:	wg-ip of 1.2.3.4
172.16.18.31:	wg-ip of client

Not using wg-quick anywhere, the configurations of wg:
server, wg0.conf:
[Interface]
ListenPort = 5555
PrivateKey = ....

[Peer]
PublicKey = ....
#No diffference whether using one of next two
#AllowedIPs = 172.16.0.0/16
AllowedIPs = 0.0.0.0/0

server, wg_up.sh:
ip link add wg0 type wireguard
wg setconf wg0 /etc/wireguard/wg0.conf
ip address add 172.16.0.1/16 dev wg0
ip link set mtu 1420 dev wg0
ip link set wg0 up

server, wg_down.sh:
ip link delete dev wg0
---------
client, wg0.conf:
[Interface]
PrivateKey = ...
ListenPort = 5555
[Peer]
PublicKey = ...
AllowedIPs = 172.16.0.0/16
Endpoint = 1.2.3.4:5555
PersistentKeepalive = 25

client, wg_up.sh:
ip link add wg0 type wireguard
wg setconf wg0 /etc/wireguard/wg0.conf
ip address add 172.16.18.31/16 dev wg0
ip link set mtu 1420 dev wg0
ip link set wg0 up
iptables -t nat -I POSTROUTING -o wg0 -j MASQUERADE
iptables -t nat -A OUTPUT -d 1.2.3.4 -j DNAT --to-destination 172.16.0.1

client, wg_down.sh:
ip link delete dev wg0
iptables -t nat -D POSTROUTING -o wg0 -j MASQUERADE
iptables -t nat -D OUTPUT -d 1.2.3.4 -j DNAT --to-destination 172.16.0.1


It looks like some important info secretly kept during
        /etc/wireguard/wireguard_up.sh
        /etc/wireguard/wireguard_down.sh
so that next
        /etc/wireguard/wireguard_up.sh
succeeds. 

Having got some feedback from different sources, that
it is not possible to do, what I want, some insight into my "magic"
appreciated :-)
