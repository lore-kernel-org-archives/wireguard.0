Return-Path: eric@ericlight.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3d435523
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Mar 2018 23:47:32 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cb3825a9
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Mar 2018 23:47:32 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 8CFBB20DB2
 for <wireguard@lists.zx2c4.com>; Sun, 25 Mar 2018 19:59:20 -0400 (EDT)
Message-Id: <1522022360.1403275.1315648448.5DA33E52@webmail.messagingengine.com>
From: Eric Light <eric@ericlight.com>
To: wireguard@lists.zx2c4.com
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="_----------=_152202236014032750"
Date: Mon, 26 Mar 2018 12:59:20 +1300
References: <CA+Hw3eZtBT6mrALQBLznKxQ8bEnB2YTKr7UjJ=Q+G=iAV9Z+HQ@mail.gmail.com>
 <C70E1FEB-611D-44B8-A902-3342A522A944@gmail.com>
Subject: Re: can't ping remote side IP range from WG instance
In-Reply-To: <C70E1FEB-611D-44B8-A902-3342A522A944@gmail.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is a multi-part message in MIME format.

--_----------=_152202236014032750
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Adri=C3=A1n,

Sounds like you're doing something similar to what I've been playing
with.  I chatted with Jason about it a bit, and he sorted me out with a
better solution - perhaps it'll work for you too:
Instead of spinning up a Masquerade rule in iptables, have you tried
just making sure that ProxyARP is enabled on the B side Ubuntu server?
Try removing the masquerade from iptables, and run this instead:
echo 1 > /proc/sys/net/ipv4/conf/all/proxy_arp

You may also need to enable IP forwarding:

echo 1 > /proc/sys/net/ipv4/ip_forward

If you want to make it permanent, add this to your /etc/sysctl.conf
(again on the B side Ubuntu):
net.ipv4.conf.all.proxy_arp =3D 1
net.ipv4.conf.all.forwarding =3D 1

You might be able to use net.ipv4.conf.*wg0 *instead, I've just used
.all as an example
Let me know if that helps  :)

E

--------------------------------------------
Q: Why is this email five sentences or less?
A: http://five.sentenc.es



On Mon, 26 Mar 2018, at 10:33, Adri=C3=A1n Mih=C3=A1lko wrote:
> Ah. The solution was trivial.
>=20
> On B side, Ubuntu server:
>=20
> post-up iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
>=20
> On my server eth0 doesn't exist it has another name: ens160.
>=20
> Now it's working.
>=20
>=20
>> On 25 Mar 2018, at 11:19, Adri=C3=A1n Mih=C3=A1lko
>> <adriankoooo@gmail.com> wrote:>>=20
>> A side (192.168.2.0/24):
>>=20
>> LEDE router 192.168.2.1 (static route to access remote side
>> 192.168.1.0/24 pointing to 192.168.2.100)>>=20
>> Pi Zero with Wireguard (192.168.2.100, WG: 192.168.5.2)
>>=20
>> Config:
>>=20
>> auto wg0
>> iface wg0 inet static
>>   pre-up ip link add dev wg0 type wireguard
>>   post-up wg setconf wg0 /etc/wireguard/wireguard.conf
>>   post-up ip link set dev wg0 up
>>   post-up ip route add 192.168.1.0/24 via 192.168.5.1 dev wg0
>>   post-up iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
>>   address 192.168.5.2
>>   netmask 255.255.255.0
>>=20
>>=20
>> B side (192.168.1.0/24):
>>=20
>> Unifi router 192.168.1.1 (static route to access remote side
>> 192.168.2.0/24 pointing to 192.168.1.54)>>=20
>> Ubuntu server with Wireguard (192.168.1.54, WG: 192.168.5.1)
>>=20
>> Config:
>>=20
>> iface wg0 inet static
>>   pre-up /sbin/ip link add dev wg0 type wireguard
>>   post-up /usr/bin/wg setconf wg0 /etc/wireguard/wg0.conf
>>   post-up /sbin/ip route add 192.168.2.0/24 via 192.168.5.2 dev wg0
>>   post-up iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
>>   post-down /sbin/ip link del wg0
>>   address 192.168.5.1
>>   netmask 255.255.255.0
>>=20
>> ---
>>=20
>> Everything is working great, except that on the "Pi Zero with
>> Wireguard" I can't access/ping remote devices in the 192.168.1.0/24
>> range, only the remote server 192.168.1.54. From any other machine in
>> the same "A side" I am able to access devices in the 192.168.1.0/24
>> range, just from the Pi Zero itself not.>>=20
>> What I am missing here?
>>=20
>>=20
>> pi@raspberrypizero:~ $ ping 192.168.1.54
>> PING 192.168.1.54 (192.168.1.54) 56(84) bytes of data.
>> 64 bytes from 192.168.1.54[1]: icmp_seq=3D1 ttl=3D64 time=3D48.6 ms
>> 64 bytes from 192.168.1.54[2]: icmp_seq=3D2 ttl=3D64 time=3D134 ms^C
>> --- 192.168.1.54 ping statistics ---
>> 2 packets transmitted, 2 received, 0% packet loss, time 1002ms
>> rtt min/avg/max/mdev =3D 48.671/91.554/134.437/42.883 ms
>> pi@raspberrypizero:~ $ ping 192.168.1.100
>> PING 192.168.1.100 (192.168.1.100) 56(84) bytes of data.
>> ^C
>> --- 192.168.1.100 ping statistics ---
>> 6 packets transmitted, 0 received, 100% packet loss, time 5188ms
>>=20
>> pi@raspberrypizero:~ $ traceroute 192.168.1.100
>> traceroute to 192.168.1.100 (192.168.1.100), 30 hops max, 60 byte
>> packets>>  1  192.168.5.1 (192.168.5.1)  42.279 ms  43.834 ms  44.678 ms
>>  2  * * *
>>  3  * * *
>>  4  * * *
>>=20
>>=20
>> ---
>>=20
>> B side is working great, I am able to ping everything, even from the
>> Ubuntu server.>>=20
>>=20
>> Regards,
>> Adrian
> _________________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard


Links:

  1. http://192.168.1.54/
  2. http://192.168.1.54/

--_----------=_152202236014032750
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="utf-8"

<!DOCTYPE html>
<html>
<head>
<title></title>
<style type=3D"text/css">p.MsoNormal,p.MsoNoSpacing{margin:0}</style>
</head>
<body><div>Hi Adri=C3=A1n,<br></div>
<div><br></div>
<div>Sounds like you're doing something similar to what I've been playing w=
ith.&nbsp; I chatted with Jason about it a bit, and he sorted me out with a=
 better solution - perhaps it'll work for you too:<br></div>
<div><br></div>
<div>Instead of spinning up a Masquerade rule in iptables, have you tried j=
ust making sure that ProxyARP is enabled on the B side Ubuntu server?&nbsp;=
 Try removing the masquerade from iptables, and run this instead:<br></div>
<div><br></div>
<pre>echo 1 &gt; /proc/sys/net/ipv4/c<span class=3D"font" style=3D"font-fam=
ily: menlo, consolas, monospace, sans-serif;"></span>onf/all/proxy_arp<br><=
/pre><div><br></div>
<div>You may also need to enable IP forwarding:<br></div>
<div><br></div>
<pre>echo 1 &gt; /proc/sys/net/ipv4/ip_forward<br></pre><div><br></div>
<div>If you want to make it permanent, add this to your /etc/sysctl.conf (a=
gain on the B side Ubuntu):<br></div>
<div><br></div>
<div><span class=3D"font" style=3D"font-family: menlo, consolas, monospace,=
 sans-serif;">net.ipv4.conf.all.proxy_arp =3D 1</span><br></div>
<div><span class=3D"font" style=3D"font-family: menlo, consolas, monospace,=
 sans-serif;">net.ipv4.conf.all.forwarding =3D 1</span><br></div>
<div><span class=3D"font" style=3D"font-family: menlo, consolas, monospace,=
 sans-serif;"></span><br></div>
<div>You might be able to use net.ipv4.conf.<b>wg0 </b>instead, I've just u=
sed .all as an example <br></div>
<div><br></div>
<div>Let me know if that helps&nbsp; :)<br></div>
<div><br></div>
<div>E<br></div>
<div><br></div>
<div id=3D"sig66226376"><div class=3D"signature">--------------------------=
------------------<br></div>
<div class=3D"signature">Q: Why is this email five sentences or less?<br></=
div>
<div class=3D"signature">A: http://five.sentenc.es<br></div>
<div class=3D"signature"><br></div>
</div>
<div><br></div>
<div><br></div>
<div>On Mon, 26 Mar 2018, at 10:33, Adri=C3=A1n Mih=C3=A1lko wrote:<br></di=
v>
<blockquote type=3D"cite"><div>Ah. The solution was trivial.<br></div>
<div><br></div>
<div>On B side, Ubuntu server:<br></div>
<div><br></div>
<div>post-up iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE<br></div>
<div><br></div>
<div>On my server eth0 doesn't exist it has another name: ens160.<br></div>
<div><br></div>
<div>Now it's working.<br></div>
<div><br></div>
<div><br></div>
<div><div><blockquote type=3D"cite"><div>On 25 Mar 2018, at 11:19, Adri=C3=
=A1n Mih=C3=A1lko &lt;<a href=3D"mailto:adriankoooo@gmail.com">adriankoooo@=
gmail.com</a>&gt; wrote:<br></div>
<div><br></div>
<div><div dir=3D"ltr"><div>A side (<a href=3D"http://192.168.2.0/24">192.16=
8.2.0/24</a>):<br></div>
<div><br></div>
<div>LEDE router 192.168.2.1 (static route to access remote side <a href=3D=
"http://192.168.1.0/24">192.168.1.0/24</a> pointing to 192.168.2.100)<br></=
div>
<div><br></div>
<div>Pi Zero with Wireguard (192.168.2.100, WG: 192.168.5.2)<br></div>
<div><br></div>
<div>Config:<br></div>
<div><br></div>
<div>auto wg0<br></div>
<div>iface wg0 inet static<br></div>
<div>&nbsp; pre-up ip link add dev wg0 type wireguard<br></div>
<div>&nbsp; post-up wg setconf wg0 /etc/wireguard/wireguard.conf<br></div>
<div>&nbsp; post-up ip link set dev wg0 up<br></div>
<div>&nbsp; post-up ip route add <a href=3D"http://192.168.1.0/24">192.168.=
1.0/24</a> via 192.168.5.1 dev wg0<br></div>
<div>&nbsp; post-up iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE<br=
></div>
<div>&nbsp; address 192.168.5.2<br></div>
<div>&nbsp; netmask 255.255.255.0<br></div>
<div><br></div>
<div><br></div>
<div>B side (<a href=3D"http://192.168.1.0/24">192.168.1.0/24</a>):<br></di=
v>
<div><br></div>
<div>Unifi router 192.168.1.1 (static route to access remote side <a href=
=3D"http://192.168.2.0/24">192.168.2.0/24</a> pointing to 192.168.1.54)<br>=
</div>
<div><br></div>
<div>Ubuntu server with Wireguard (192.168.1.54, WG: 192.168.5.1)<br></div>
<div><br></div>
<div>Config:<br></div>
<div><br></div>
<div>iface wg0 inet static<br></div>
<div>&nbsp; pre-up /sbin/ip link add dev wg0 type wireguard<br></div>
<div>&nbsp; post-up /usr/bin/wg setconf wg0 /etc/wireguard/wg0.conf<br></di=
v>
<div>&nbsp; post-up /sbin/ip route add <a href=3D"http://192.168.2.0/24">19=
2.168.2.0/24</a> via 192.168.5.2 dev wg0<br></div>
<div>&nbsp; post-up iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE<br=
></div>
<div>&nbsp; post-down /sbin/ip link del wg0<br></div>
<div>&nbsp; address 192.168.5.1<br></div>
<div>&nbsp; netmask 255.255.255.0<br></div>
<div><br></div>
<div>---<br></div>
<div><br></div>
<div>Everything is working great, except that on the "Pi Zero with Wireguar=
d" I can't access/ping remote devices in the <a href=3D"http://192.168.1.0/=
24">192.168.1.0/24</a> range, only the remote server 192.168.1.54. From any=
 other machine in the same "A side" I am able to access devices in the <a h=
ref=3D"http://192.168.1.0/24">192.168.1.0/24</a> range, just from the Pi Ze=
ro itself not.<br></div>
<div><br></div>
<div>What I am missing here?<br></div>
<div><br></div>
<div><br></div>
<div>pi@raspberrypizero:~ $ ping 192.168.1.54<br></div>
<div>PING 192.168.1.54 (192.168.1.54) 56(84) bytes of data.<br></div>
<div>64 bytes from <a href=3D"http://192.168.1.54/">192.168.1.54</a>: icmp_=
seq=3D1 ttl=3D64 time=3D48.6 ms<br></div>
<div>64 bytes from <a href=3D"http://192.168.1.54/">192.168.1.54</a>: icmp_=
seq=3D2 ttl=3D64 time=3D134 ms^C<br></div>
<div>--- 192.168.1.54 ping statistics ---<br></div>
<div>2 packets transmitted, 2 received, 0% packet loss, time 1002ms<br></di=
v>
<div>rtt min/avg/max/mdev =3D 48.671/91.554/134.437/42.883 ms<br></div>
<div>pi@raspberrypizero:~ $ ping 192.168.1.100<br></div>
<div>PING 192.168.1.100 (192.168.1.100) 56(84) bytes of data.<br></div>
<div>^C<br></div>
<div>--- 192.168.1.100 ping statistics ---<br></div>
<div>6 packets transmitted, 0 received, 100% packet loss, time 5188ms<br></=
div>
<div><br></div>
<div>pi@raspberrypizero:~ $ traceroute 192.168.1.100<br></div>
<div>traceroute to 192.168.1.100 (192.168.1.100), 30 hops max, 60 byte pack=
ets<br></div>
<div>&nbsp;1 &nbsp;192.168.5.1 (192.168.5.1) &nbsp;42.279 ms &nbsp;43.834 m=
s &nbsp;44.678 ms<br></div>
<div>&nbsp;2 &nbsp;* * *<br></div>
<div>&nbsp;3 &nbsp;* * *<br></div>
<div>&nbsp;4 &nbsp;* * *<br></div>
<div><br></div>
<div><br></div>
<div>---<br></div>
<div><br></div>
<div>B side is working great, I am able to ping everything, even from the U=
buntu server.<br></div>
<div><br></div>
<div><br></div>
<div>Regards,<br></div>
<div>Adrian<br></div>
</div>
</div>
</blockquote></div>
</div>
<div><u>_______________________________________________</u><br></div>
<div>WireGuard mailing list<br></div>
<div><a href=3D"mailto:WireGuard@lists.zx2c4.com">WireGuard@lists.zx2c4.com=
</a><br></div>
<div><a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard">https:/=
/lists.zx2c4.com/mailman/listinfo/wireguard</a><br></div>
</blockquote><div><br></div>
</body>
</html>

--_----------=_152202236014032750--
