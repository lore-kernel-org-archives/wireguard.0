Return-Path: eawalker@pm.me
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a4b14fc5
 for <wireguard@lists.zx2c4.com>;
 Tue, 26 Jun 2018 18:52:44 +0000 (UTC)
Received: from mail2.protonmail.ch (mail2.protonmail.ch [185.70.40.22])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dbfdbbee
 for <wireguard@lists.zx2c4.com>;
 Tue, 26 Jun 2018 18:52:44 +0000 (UTC)
Date: Tue, 26 Jun 2018 14:58:10 -0400
To: wireguard@lists.zx2c4.com
From: Allen <eawalker@pm.me>
Subject: Ipv6 - Cannot ping ipv6 lan nodes after 'wg-quick up config_file'
Message-ID: <qJnEMDAKflDsFPpZWYnB906uwwDeFlV6A-euyjONSdfN2hp83E0mYkDtm-ohByEMOmrrCaLREoa9w6JBbONroYYQNCqx1ptTvZXP-NrBtm0=@pm.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Reply-To: Allen <eawalker@pm.me>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Problem: Bringing up wireguard via wq-quick causes pings to lan clients
to fail. Ip4 has no issues. Ultimately I think this is breaking LAN
client routing ipv6 packets thru my route (single board computer/rasp
pi) device. I need to fix my ipv6 routing table but don't know how.
Here's some info:

# wg-quick up mullvad-us1
[#] ip link add mullvad-us1 type wireguard
[#] wg setconf mullvad-us1 /dev/fd/63
[#] ip address add 10.99.XX.XXX/32 dev mullvad-us1
[#] ip address add fc00:bbbb:bbbb:bb01::XXXX/128 dev mullvad-us1
[#] ip link set mtu 1420 dev mullvad-us1
[#] ip link set mullvad-us1 up
[#] resolvconf -a tun.mullvad-us1 -m 0 -x
[#] wg set mullvad-us1 fwmark 51820
[#] ip -6 route add ::/0 dev mullvad-us1 table 51820
[#] ip -6 rule add not fwmark 51820 table 51820
[#] ip -6 rule add table main suppress_prefixlength 0
[#] ip -4 route add 0.0.0.0/0 dev mullvad-us1 table 51820
[#] ip -4 rule add not fwmark 51820 table 51820
[#] ip -4 rule add table main suppress_prefixlength 0

Ping a LAN ipv6 client FAILS

# ping fd00::ba27:ebff:feeb:a757
PING fd00::ba27:ebff:feeb:a757(fd00::XXXX:ebff:feeb:XXXX) 56 data bytes
^C
--- fd00::XXXX:ebff:feeb:XXXX ping statistics ---
6 packets transmitted, 0 received, 100% packet loss, time 5013ms

Take wireguard down:

# wg-quick down mullvad-us1
[#] ip -4 rule delete table 51820
[#] ip -4 rule delete table main suppress_prefixlength 0
[#] ip -6 rule delete table 51820
[#] ip -6 rule delete table main suppress_prefixlength 0
[#] ip link delete dev mullvad-us1
[#] resolvconf -d tun.mullvad-us1

Ping a LAN ipv6 client SUCCEEDS

# ping fd00::ba27:ebff:feeb:a757
PING fd00::ba27:ebff:feeb:a757(fd00::XXXX:ebff:feeb:XXXX) 56 data bytes
64 bytes from fd00::XXXX:ebff:feeb:XXXX: icmp_seq=3D1 ttl=3D64 time=3D0.884=
 ms
64 bytes from fd00::XXXX:ebff:feeb:XXXX: icmp_seq=3D2 ttl=3D64 time=3D0.881=
 ms
^C
--- fd00::XXXX:ebff:feeb:XXXX ping statistics ---
2 packets transmitted, 2 received, 0% packet loss, time 1001ms
rtt min/avg/max/mdev =3D 0.881/0.882/0.884/0.029 ms


SYSTEM CONFIGURATION:

# uname -ra
Linux DietPi 3.16.56+ #1 SMP PREEMPT Wed Apr 18 16:59:34 CEST 2018
aarch64 GNU/Linux

# cat /proc/sys/net/ipv6/conf/all/forwarding
1

# cat /etc/os-release
PRETTY_NAME=3D"Debian GNU/Linux 9 (stretch)"
NAME=3D"Debian GNU/Linux"
VERSION_ID=3D"9"
VERSION=3D"9 (stretch)"
ID=3Ddebian
HOME_URL=3D"https://www.debian.org/"
SUPPORT_URL=3D"https://www.debian.org/support"
BUG_REPORT_URL=3D"https://bugs.debian.org/"

radvd.conf:

interface eth0 {
 =C2=A0=C2=A0=C2=A0=C2=A0 AdvSendAdvert on;
 =C2=A0=C2=A0=C2=A0=C2=A0 MinRtrAdvInterval 3;
 =C2=A0=C2=A0=C2=A0=C2=A0 MaxRtrAdvInterval 10;
 =C2=A0=C2=A0=C2=A0=C2=A0 AdvDefaultPreference high;
 =C2=A0=C2=A0=C2=A0=C2=A0 prefix fd00::/64 {
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 AdvOnLink on;
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 AdvAutonomous on;
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 AdvRouterAddr on;
 =C2=A0=C2=A0=C2=A0=C2=A0 };
 =C2=A0=C2=A0=C2=A0=C2=A0 RDNSS fd00::1 {};
};

# cat /etc/network/interfaces
#/etc/network/interfaces
#Please use DietPi-Config to modify network settings.

# Local
auto lo
iface lo inet loopback

# Ethernet
allow-hotplug eth0
iface eth0 inet static
address 192.168.2.4
netmask 255.255.255.0
gateway 192.168.2.1
dns-nameservers 127.0.0.1 8.8.8.8

iface eth0 inet6 static
address fd00::1
netmask 64

# cat /etc/wireguard/mullvad-us1.conf
[Interface]
PrivateKey =3D XXXXXXXXXXXXXXXXXXXX
Address =3D 10.99.XX.XXX/32,fc00:bbbb:bbbb:bb01::XXXX/128
DNS =3D 8.8.8.8
PostUp =3D iptables -A FORWARD -i %i -j ACCEPT; iptables -A FORWARD -o %i
-j ACCEPT; iptables -t nat -A POSTROUTING -o %i -j MASQUERADE; ip6tables
-t nat -A POSTROUTING -s fd00::/64 -o %i -j SNAT --to-source
fc00:bbbb:bbbb:bb01::XXXX
PostDown =3D iptables -D FORWARD -i %i -j ACCEPT; iptables -D FORWARD -o
%i -j ACCEPT; iptables -t nat -D POSTROUTING -o %i -j
MASQUERADE;ip6tables -t nat -D POSTROUTING -s fd00::/64 -o %i -j SNAT
--to-source fc00:bbbb:bbbb:bb01::XXXX



[Peer]
PublicKey =3D XXXXXXXXXXXXXXXXXXXX
Endpoint =3D 185.232.XX.XX:51820
AllowedIPs =3D 0.0.0.0/0, ::/0

Wireguard down:

#ip -d -6 route
unicast fd00::/64 dev eth0 proto kernel scope global metric 256
unicast fe80::/64 dev eth0 proto kernel scope global metric 256

Wireguard up:

# ip -d -6 route
unicast fc00:bbbb:bbbb:bb01::XXXX dev mullvad-us1 proto kernel scope
global metric 256
unicast fd00::/64 dev eth0 proto kernel scope global metric 256
unicast fe80::/64 dev eth0 proto kernel scope global metric 256


With wireguard up, if I try to see the route taken to my lan ping I
see it's trying to go thru mullvad-us1 which logically is incorrect:

# ip -s route get fd00::XXXX:ebff:feeb:XXXX
fd00::XXXX:ebff:feeb:XXXX from :: dev mullvad-us1 table 51820 src
fc00:bbbb:bbbb:bb01::XXXX metric 0
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cache=C2=A0 users 1 used 1

No problems pinging google though:

# ping -6 google.com
PING google.com(lga25s56-in-x0e.1e100.net (2607:f8b0:4006:800::200e)) 56
data bytes
64 bytes from lga25s56-in-x0e.1e100.net (2607:f8b0:4006:800::200e):
icmp_seq=3D1 ttl=3D54 time=3D41.1 ms
64 bytes from lga25s56-in-x0e.1e100.net (2607:f8b0:4006:800::200e):
icmp_seq=3D2 ttl=3D54 time=3D41.1 ms
^C
--- google.com ping statistics ---
2 packets transmitted, 2 received, 0% packet loss, time 1001ms
rtt min/avg/max/mdev =3D 41.144/41.153/41.162/0.009 ms
