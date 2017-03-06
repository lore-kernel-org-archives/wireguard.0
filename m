Return-Path: nicolas.prochazka@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c8438bcb
 for <wireguard@lists.zx2c4.com>; Mon, 6 Mar 2017 17:38:21 +0000 (UTC)
Received: from mail-lf0-f48.google.com (mail-lf0-f48.google.com
 [209.85.215.48])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 91699c93
 for <wireguard@lists.zx2c4.com>; Mon, 6 Mar 2017 17:38:21 +0000 (UTC)
Received: by mail-lf0-f48.google.com with SMTP id j90so39120199lfk.2
 for <wireguard@lists.zx2c4.com>; Mon, 06 Mar 2017 09:40:49 -0800 (PST)
MIME-Version: 1.0
From: Nicolas Prochazka <nicolas.prochazka@gmail.com>
Date: Mon, 6 Mar 2017 18:40:46 +0100
Message-ID: <CADdae-hV6TSfo+1JqgKYE9TUTXhK9MzHHLKYf3SU6Yd5eMa1QA@mail.gmail.com>
Subject: [wireguard-devel ] traffic shapping
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: multipart/alternative; boundary=f403045fb58e463012054a1365d1
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--f403045fb58e463012054a1365d1
Content-Type: text/plain; charset=UTF-8

Hello,
is there an incompatibilty between wireguard and traffic shaping or i
misconfig something  ?

After configuring Qos , I need to add filter to flow

If i'm trying with simple tc command :
tc filter add dev wg0 protocol ip parent 1: prio 10 u32 match ip dport 80
0xffff flowid 1:10

or If i'm trying with tc + iptables,

tc filter add dev wg0 protocol ip parent 1: prio 1 handle 6 fw flowid 1:10
and iptables mark rules,

traffic seems to be not "apply" to queue .

Regards,
Nicolas Prochazka.

-----
Example :  after this configuration, traffic on wg0 on port 80,443,8080 are
going to 1:30 ,not to 1:10
_trafficShappingMaxRate=15

tc qdisc del dev wg0 root

tc qdisc add dev wg0 root handle 1: htb default 30

# Base
tc class add dev wg0 parent 1: classid 1:1 htb rate
${_trafficShappingMaxRate}mbit burst 15k

# http/https

# Class 1:10,
tc class add dev wg0 parent 1:1 classid 1:10 htb rate
${_trafficShappingMaxRate}mbit ceil ${_trafficShappingMaxRate} burst 15k

# Class 1:20,
tc class add dev wg0 parent 1:1 classid 1:20 htb rate
${_trafficShappingMaxRate}mbit ceil ${_trafficShappingMaxRate}mbit burst 15k

# Class 1:30, which has a rate of 1kbit. This one is the default class.
tc class add dev wg0 parent 1:1 classid 1:30 htb rate 10kbit ceil 1mbit
burst 15k

tc qdisc add dev wg0 parent 1:10 handle 10: fq_codel quantum 300 noecn
tc qdisc add dev wg0 parent 1:20 handle 20: fq_codel quantum 300 noecn
tc qdisc add dev wg0 parent 1:30 handle 30: fq_codel quantum 300 noecn

# --- associate queue with traffic

#tc filter add dev wg0 protocol ipv6 parent 1: prio 1 handle 6 fw flowid
1:10
# http/https
tc filter add dev wg0 protocol ipv6 parent 1: prio 10 u32 match ip dport 80
0xffff flowid 1:10
tc filter add dev wg0 protocol ipv6 parent 1: prio 10 u32 match ip dport
443 0xffff flowid 1:10
tc filter add dev wg0 protocol ipv6 parent 1: prio 10 u32 match ip dport
8080 0xffff flowid 1:10
# ncfs
tc filter add dev wg0 parent 1: protocol ipv6 prio 5 u32 match ip dport
16379 0xffff flowid 1:20
# icmp
tc filter add dev wg0 parent 1: protocol ip prio 1 u32 match  ip protocol 1
0xff flowid 1:30

tc -s qdisc ls dev wg0

--f403045fb58e463012054a1365d1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hello, <br></div>is there an incompatibilty betw=
een wireguard and traffic shaping or i misconfig something=C2=A0 ?<br></div=
><br>After configuring Qos , I need to add filter to flow<br><div><div><div=
><div><br></div><div>If i&#39;m trying with simple tc command : <br>tc filt=
er add dev wg0 protocol ip parent 1: prio 10 u32 match ip dport 80 0xffff f=
lowid 1:10 <br></div><div><br></div><div>or If i&#39;m trying with tc + ipt=
ables, <br></div><div><br>tc filter add dev wg0 protocol ip parent 1: prio =
1 handle 6 fw flowid 1:10<br></div><div>and iptables mark rules, <br><br></=
div><div>traffic seems to be not &quot;apply&quot; to queue . <br></div><di=
v><br></div><div>Regards, <br></div><div>Nicolas Prochazka.<br></div><div><=
br>-----<br>Example :=C2=A0 after this configuration, traffic on wg0 on por=
t 80,443,8080 are going to 1:30 ,not to 1:10<br>_trafficShappingMaxRate=3D1=
5<br><br>tc qdisc del dev wg0 root<br><br>tc qdisc add dev wg0 root handle =
1: htb default 30<br><br># Base<br>tc class add dev wg0 parent 1: classid 1=
:1 htb rate ${_trafficShappingMaxRate}mbit burst 15k<br><br># http/https<br=
><br># Class 1:10, <br>tc class add dev wg0 parent 1:1 classid 1:10 htb rat=
e ${_trafficShappingMaxRate}mbit ceil ${_trafficShappingMaxRate} burst 15k<=
br><br># Class 1:20, <br>tc class add dev wg0 parent 1:1 classid 1:20 htb r=
ate ${_trafficShappingMaxRate}mbit ceil ${_trafficShappingMaxRate}mbit burs=
t 15k<br><br># Class 1:30, which has a rate of 1kbit. This one is the defau=
lt class.<br>tc class add dev wg0 parent 1:1 classid 1:30 htb rate 10kbit c=
eil 1mbit=C2=A0 burst 15k<br><br>tc qdisc add dev wg0 parent 1:10 handle 10=
: fq_codel quantum 300 noecn<br>tc qdisc add dev wg0 parent 1:20 handle 20:=
 fq_codel quantum 300 noecn<br>tc qdisc add dev wg0 parent 1:30 handle 30: =
fq_codel quantum 300 noecn<br><br># --- associate queue with traffic<br><br=
>#tc filter add dev wg0 protocol ipv6 parent 1: prio 1 handle 6 fw flowid 1=
:10<br># http/https<br>tc filter add dev wg0 protocol ipv6 parent 1: prio 1=
0 u32 match ip dport 80 0xffff flowid 1:10<br>tc filter add dev wg0 protoco=
l ipv6 parent 1: prio 10 u32 match ip dport 443 0xffff flowid 1:10<br>tc fi=
lter add dev wg0 protocol ipv6 parent 1: prio 10 u32 match ip dport 8080 0x=
ffff flowid 1:10<br># ncfs<br>tc filter add dev wg0 parent 1: protocol ipv6=
 prio 5 u32 match ip dport 16379 0xffff flowid 1:20<br># icmp<br>tc filter =
add dev wg0 parent 1: protocol ip prio 1 u32 match=C2=A0 ip protocol 1 0xff=
 flowid 1:30<br><br>tc -s qdisc ls dev wg0<br><br></div></div></div></div><=
/div>

--f403045fb58e463012054a1365d1--
