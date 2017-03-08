Return-Path: nicolas.prochazka@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1a5625de
 for <wireguard@lists.zx2c4.com>; Wed, 8 Mar 2017 11:23:40 +0000 (UTC)
Received: from mail-lf0-f50.google.com (mail-lf0-f50.google.com
 [209.85.215.50])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 15d74c6f
 for <wireguard@lists.zx2c4.com>; Wed, 8 Mar 2017 11:23:40 +0000 (UTC)
Received: by mail-lf0-f50.google.com with SMTP id a6so13260238lfa.0
 for <wireguard@lists.zx2c4.com>; Wed, 08 Mar 2017 03:26:21 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CADdae-hV6TSfo+1JqgKYE9TUTXhK9MzHHLKYf3SU6Yd5eMa1QA@mail.gmail.com>
References: <CADdae-hV6TSfo+1JqgKYE9TUTXhK9MzHHLKYf3SU6Yd5eMa1QA@mail.gmail.com>
From: Nicolas Prochazka <nicolas.prochazka@gmail.com>
Date: Wed, 8 Mar 2017 12:26:16 +0100
Message-ID: <CADdae-hrvCdqrnGJeKf_6swqd_dWhn7kzTx3NfM3iOtGzn5vHQ@mail.gmail.com>
Subject: Re: [wireguard-devel ] traffic shapping
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: multipart/alternative; boundary=94eb2c1a1b3aa49f1a054a36657f
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--94eb2c1a1b3aa49f1a054a36657f
Content-Type: text/plain; charset=UTF-8

Hello again,
So i verify my configuration,
- on a virtual tap , traffic shaping is ok with same configuration
- on physical card, traffic shaping is ok
- on wg0 , all traffic are going to default queue,filter seems to be not
applied ,  tcpdump on wg0 is ok with my queue definition, only difference
is wg0 is configured as ipv6 tunnel.


Regards,
NIcolas



2017-03-06 18:40 GMT+01:00 Nicolas Prochazka <nicolas.prochazka@gmail.com>:

> Hello,
> is there an incompatibilty between wireguard and traffic shaping or i
> misconfig something  ?
>
> After configuring Qos , I need to add filter to flow
>
> If i'm trying with simple tc command :
> tc filter add dev wg0 protocol ip parent 1: prio 10 u32 match ip dport 80
> 0xffff flowid 1:10
>
> or If i'm trying with tc + iptables,
>
> tc filter add dev wg0 protocol ip parent 1: prio 1 handle 6 fw flowid 1:10
> and iptables mark rules,
>
> traffic seems to be not "apply" to queue .
>
> Regards,
> Nicolas Prochazka.
>
> -----
> Example :  after this configuration, traffic on wg0 on port 80,443,8080
> are going to 1:30 ,not to 1:10
> _trafficShappingMaxRate=15
>
> tc qdisc del dev wg0 root
>
> tc qdisc add dev wg0 root handle 1: htb default 30
>
> # Base
> tc class add dev wg0 parent 1: classid 1:1 htb rate
> ${_trafficShappingMaxRate}mbit burst 15k
>
> # http/https
>
> # Class 1:10,
> tc class add dev wg0 parent 1:1 classid 1:10 htb rate
> ${_trafficShappingMaxRate}mbit ceil ${_trafficShappingMaxRate} burst 15k
>
> # Class 1:20,
> tc class add dev wg0 parent 1:1 classid 1:20 htb rate
> ${_trafficShappingMaxRate}mbit ceil ${_trafficShappingMaxRate}mbit burst 15k
>
> # Class 1:30, which has a rate of 1kbit. This one is the default class.
> tc class add dev wg0 parent 1:1 classid 1:30 htb rate 10kbit ceil 1mbit
> burst 15k
>
> tc qdisc add dev wg0 parent 1:10 handle 10: fq_codel quantum 300 noecn
> tc qdisc add dev wg0 parent 1:20 handle 20: fq_codel quantum 300 noecn
> tc qdisc add dev wg0 parent 1:30 handle 30: fq_codel quantum 300 noecn
>
> # --- associate queue with traffic
>
> #tc filter add dev wg0 protocol ipv6 parent 1: prio 1 handle 6 fw flowid
> 1:10
> # http/https
> tc filter add dev wg0 protocol ipv6 parent 1: prio 10 u32 match ip dport
> 80 0xffff flowid 1:10
> tc filter add dev wg0 protocol ipv6 parent 1: prio 10 u32 match ip dport
> 443 0xffff flowid 1:10
> tc filter add dev wg0 protocol ipv6 parent 1: prio 10 u32 match ip dport
> 8080 0xffff flowid 1:10
> # ncfs
> tc filter add dev wg0 parent 1: protocol ipv6 prio 5 u32 match ip dport
> 16379 0xffff flowid 1:20
> # icmp
> tc filter add dev wg0 parent 1: protocol ip prio 1 u32 match  ip protocol
> 1 0xff flowid 1:30
>
> tc -s qdisc ls dev wg0
>
>

--94eb2c1a1b3aa49f1a054a36657f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div><div>Hello again, <br></div>So i =
verify my configuration, <br></div>- on a virtual tap , traffic shaping is =
ok with same configuration<br></div>- on physical card, traffic shaping is =
ok <br></div>- on wg0 , all traffic are going to default queue,filter seems=
 to be not applied ,=C2=A0 tcpdump on wg0 is ok with my queue definition, o=
nly difference is wg0 is configured as ipv6 tunnel.<br><br><br></div>Regard=
s, <br></div>NIcolas<br><div><div><div><br><br></div></div></div></div><div=
 class=3D"gmail_extra"><br><div class=3D"gmail_quote">2017-03-06 18:40 GMT+=
01:00 Nicolas Prochazka <span dir=3D"ltr">&lt;<a href=3D"mailto:nicolas.pro=
chazka@gmail.com" target=3D"_blank">nicolas.prochazka@gmail.com</a>&gt;</sp=
an>:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div><div>Hello, <b=
r></div>is there an incompatibilty between wireguard and traffic shaping or=
 i misconfig something=C2=A0 ?<br></div><br>After configuring Qos , I need =
to add filter to flow<br><div><div><div><div><br></div><div>If i&#39;m tryi=
ng with simple tc command : <br>tc filter add dev wg0 protocol ip parent 1:=
 prio 10 u32 match ip dport 80 0xffff flowid 1:10 <br></div><div><br></div>=
<div>or If i&#39;m trying with tc + iptables, <br></div><div><br>tc filter =
add dev wg0 protocol ip parent 1: prio 1 handle 6 fw flowid 1:10<br></div><=
div>and iptables mark rules, <br><br></div><div>traffic seems to be not &qu=
ot;apply&quot; to queue . <br></div><div><br></div><div>Regards, <br></div>=
<div>Nicolas Prochazka.<br></div><div><br>-----<br>Example :=C2=A0 after th=
is configuration, traffic on wg0 on port 80,443,8080 are going to 1:30 ,not=
 to 1:10<br>_trafficShappingMaxRate=3D15<br><br>tc qdisc del dev wg0 root<b=
r><br>tc qdisc add dev wg0 root handle 1: htb default 30<br><br># Base<br>t=
c class add dev wg0 parent 1: classid 1:1 htb rate ${_trafficShappingMaxRat=
e}mbit burst 15k<br><br># http/https<br><br># Class 1:10, <br>tc class add =
dev wg0 parent 1:1 classid 1:10 htb rate ${_trafficShappingMaxRate}mbit cei=
l ${_trafficShappingMaxRate} burst 15k<br><br># Class 1:20, <br>tc class ad=
d dev wg0 parent 1:1 classid 1:20 htb rate ${_trafficShappingMaxRate}mbit c=
eil ${_trafficShappingMaxRate}mbit burst 15k<br><br># Class 1:30, which has=
 a rate of 1kbit. This one is the default class.<br>tc class add dev wg0 pa=
rent 1:1 classid 1:30 htb rate 10kbit ceil 1mbit=C2=A0 burst 15k<br><br>tc =
qdisc add dev wg0 parent 1:10 handle 10: fq_codel quantum 300 noecn<br>tc q=
disc add dev wg0 parent 1:20 handle 20: fq_codel quantum 300 noecn<br>tc qd=
isc add dev wg0 parent 1:30 handle 30: fq_codel quantum 300 noecn<br><br># =
--- associate queue with traffic<br><br>#tc filter add dev wg0 protocol ipv=
6 parent 1: prio 1 handle 6 fw flowid 1:10<br># http/https<br>tc filter add=
 dev wg0 protocol ipv6 parent 1: prio 10 u32 match ip dport 80 0xffff flowi=
d 1:10<br>tc filter add dev wg0 protocol ipv6 parent 1: prio 10 u32 match i=
p dport 443 0xffff flowid 1:10<br>tc filter add dev wg0 protocol ipv6 paren=
t 1: prio 10 u32 match ip dport 8080 0xffff flowid 1:10<br># ncfs<br>tc fil=
ter add dev wg0 parent 1: protocol ipv6 prio 5 u32 match ip dport 16379 0xf=
fff flowid 1:20<br># icmp<br>tc filter add dev wg0 parent 1: protocol ip pr=
io 1 u32 match=C2=A0 ip protocol 1 0xff flowid 1:30<br><br>tc -s qdisc ls d=
ev wg0<br><br></div></div></div></div></div>
</blockquote></div><br></div>

--94eb2c1a1b3aa49f1a054a36657f--
