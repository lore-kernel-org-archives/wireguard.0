Return-Path: adriankoooo@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 686a1099
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Mar 2018 21:21:49 +0000 (UTC)
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 40c57910
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Mar 2018 21:21:48 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id t6so11999283wmt.5
 for <wireguard@lists.zx2c4.com>; Sun, 25 Mar 2018 14:33:36 -0700 (PDT)
Return-Path: <adriankoooo@gmail.com>
Received: from macbook-pro.localdomain (90-64-42-231.dynamic.orange.sk.
 [90.64.42.231])
 by smtp.gmail.com with ESMTPSA id v53sm15999392wrc.45.2018.03.25.14.33.35
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 25 Mar 2018 14:33:35 -0700 (PDT)
From: =?utf-8?Q?Adri=C3=A1n_Mih=C3=A1lko?= <adriankoooo@gmail.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_C0FBF642-D593-4766-B945-834B0BE66C5A"
Mime-Version: 1.0 (Mac OS X Mail 11.2 \(3445.5.20\))
Subject: Re: can't ping remote side IP range from WG instance
Date: Sun, 25 Mar 2018 23:33:33 +0200
References: <CA+Hw3eZtBT6mrALQBLznKxQ8bEnB2YTKr7UjJ=Q+G=iAV9Z+HQ@mail.gmail.com>
To: wireguard@lists.zx2c4.com
In-Reply-To: <CA+Hw3eZtBT6mrALQBLznKxQ8bEnB2YTKr7UjJ=Q+G=iAV9Z+HQ@mail.gmail.com>
Message-Id: <C70E1FEB-611D-44B8-A902-3342A522A944@gmail.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--Apple-Mail=_C0FBF642-D593-4766-B945-834B0BE66C5A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Ah. The solution was trivial.

On B side, Ubuntu server:

post-up iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

On my server eth0 doesn't exist it has another name: ens160.

Now it's working.


> On 25 Mar 2018, at 11:19, Adri=C3=A1n Mih=C3=A1lko =
<adriankoooo@gmail.com> wrote:
>=20
> A side (192.168.2.0/24 <http://192.168.2.0/24>):
>=20
> LEDE router 192.168.2.1 (static route to access remote side =
192.168.1.0/24 <http://192.168.1.0/24> pointing to 192.168.2.100)
>=20
> Pi Zero with Wireguard (192.168.2.100, WG: 192.168.5.2)
>=20
> Config:
>=20
> auto wg0
> iface wg0 inet static
>   pre-up ip link add dev wg0 type wireguard
>   post-up wg setconf wg0 /etc/wireguard/wireguard.conf
>   post-up ip link set dev wg0 up
>   post-up ip route add 192.168.1.0/24 <http://192.168.1.0/24> via =
192.168.5.1 dev wg0
>   post-up iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
>   address 192.168.5.2
>   netmask 255.255.255.0
>=20
>=20
> B side (192.168.1.0/24 <http://192.168.1.0/24>):
>=20
> Unifi router 192.168.1.1 (static route to access remote side =
192.168.2.0/24 <http://192.168.2.0/24> pointing to 192.168.1.54)
>=20
> Ubuntu server with Wireguard (192.168.1.54, WG: 192.168.5.1)
>=20
> Config:
>=20
> iface wg0 inet static
>   pre-up /sbin/ip link add dev wg0 type wireguard
>   post-up /usr/bin/wg setconf wg0 /etc/wireguard/wg0.conf
>   post-up /sbin/ip route add 192.168.2.0/24 <http://192.168.2.0/24> =
via 192.168.5.2 dev wg0
>   post-up iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
>   post-down /sbin/ip link del wg0
>   address 192.168.5.1
>   netmask 255.255.255.0
>=20
> ---
>=20
> Everything is working great, except that on the "Pi Zero with =
Wireguard" I can't access/ping remote devices in the 192.168.1.0/24 =
<http://192.168.1.0/24> range, only the remote server 192.168.1.54. =46rom=
 any other machine in the same "A side" I am able to access devices in =
the 192.168.1.0/24 <http://192.168.1.0/24> range, just from the Pi Zero =
itself not.
>=20
> What I am missing here?
>=20
>=20
> pi@raspberrypizero:~ $ ping 192.168.1.54
> PING 192.168.1.54 (192.168.1.54) 56(84) bytes of data.
> 64 bytes from 192.168.1.54 <http://192.168.1.54/>: icmp_seq=3D1 ttl=3D64=
 time=3D48.6 ms
> 64 bytes from 192.168.1.54 <http://192.168.1.54/>: icmp_seq=3D2 ttl=3D64=
 time=3D134 ms^C
> --- 192.168.1.54 ping statistics ---
> 2 packets transmitted, 2 received, 0% packet loss, time 1002ms
> rtt min/avg/max/mdev =3D 48.671/91.554/134.437/42.883 ms
> pi@raspberrypizero:~ $ ping 192.168.1.100
> PING 192.168.1.100 (192.168.1.100) 56(84) bytes of data.
> ^C
> --- 192.168.1.100 ping statistics ---
> 6 packets transmitted, 0 received, 100% packet loss, time 5188ms
>=20
> pi@raspberrypizero:~ $ traceroute 192.168.1.100
> traceroute to 192.168.1.100 (192.168.1.100), 30 hops max, 60 byte =
packets
>  1  192.168.5.1 (192.168.5.1)  42.279 ms  43.834 ms  44.678 ms
>  2  * * *
>  3  * * *
>  4  * * *
>=20
>=20
> ---
>=20
> B side is working great, I am able to ping everything, even from the =
Ubuntu server.
>=20
>=20
> Regards,
> Adrian


--Apple-Mail=_C0FBF642-D593-4766-B945-834B0BE66C5A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D"">Ah. =
The solution was trivial.<div class=3D""><br class=3D""></div><div =
class=3D"">On B side, Ubuntu server:</div><div class=3D""><br =
class=3D""></div><div class=3D"">post-up iptables -t nat -A POSTROUTING =
-o eth0 -j MASQUERADE</div><div class=3D""><br class=3D""></div><div =
class=3D"">On my server eth0 doesn't exist it has another name: =
ens160.</div><div class=3D""><br class=3D""></div><div class=3D"">Now =
it's working.</div><div class=3D""><br class=3D""></div><div =
class=3D""><br class=3D""></div><div class=3D""><div><blockquote =
type=3D"cite" class=3D""><div class=3D"">On 25 Mar 2018, at 11:19, =
Adri=C3=A1n Mih=C3=A1lko &lt;<a href=3D"mailto:adriankoooo@gmail.com" =
class=3D"">adriankoooo@gmail.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div dir=3D"ltr" =
class=3D""><div class=3D"">A side (<a href=3D"http://192.168.2.0/24" =
class=3D"">192.168.2.0/24</a>):</div><div class=3D""><br =
class=3D""></div><div class=3D"">LEDE router 192.168.2.1 (static route =
to access remote side <a href=3D"http://192.168.1.0/24" =
class=3D"">192.168.1.0/24</a> pointing to 192.168.2.100)</div><div =
class=3D""><br class=3D""></div><div class=3D"">Pi Zero with Wireguard =
(192.168.2.100, WG: 192.168.5.2)</div><div class=3D""><br =
class=3D""></div><div class=3D"">Config:</div><div class=3D""><br =
class=3D""></div><div class=3D"">auto wg0</div><div class=3D"">iface wg0 =
inet static</div><div class=3D"">&nbsp; pre-up ip link add dev wg0 type =
wireguard</div><div class=3D"">&nbsp; post-up wg setconf wg0 =
/etc/wireguard/wireguard.conf</div><div class=3D"">&nbsp; post-up ip =
link set dev wg0 up</div><div class=3D"">&nbsp; post-up ip route add <a =
href=3D"http://192.168.1.0/24" class=3D"">192.168.1.0/24</a> via =
192.168.5.1 dev wg0</div><div class=3D"">&nbsp; post-up iptables -t nat =
-A POSTROUTING -o eth0 -j MASQUERADE</div><div class=3D"">&nbsp; address =
192.168.5.2</div><div class=3D"">&nbsp; netmask 255.255.255.0</div><div =
class=3D""><br class=3D""></div><div class=3D""><br class=3D""></div><div =
class=3D"">B side (<a href=3D"http://192.168.1.0/24" =
class=3D"">192.168.1.0/24</a>):</div><div class=3D""><br =
class=3D""></div><div class=3D"">Unifi router 192.168.1.1 (static route =
to access remote side <a href=3D"http://192.168.2.0/24" =
class=3D"">192.168.2.0/24</a> pointing to 192.168.1.54)</div><div =
class=3D""><br class=3D""></div><div class=3D"">Ubuntu server with =
Wireguard (192.168.1.54, WG: 192.168.5.1)</div><div class=3D""><br =
class=3D""></div><div class=3D"">Config:</div><div class=3D""><br =
class=3D""></div><div class=3D"">iface wg0 inet static</div><div =
class=3D"">&nbsp; pre-up /sbin/ip link add dev wg0 type =
wireguard</div><div class=3D"">&nbsp; post-up /usr/bin/wg setconf wg0 =
/etc/wireguard/wg0.conf</div><div class=3D"">&nbsp; post-up /sbin/ip =
route add <a href=3D"http://192.168.2.0/24" class=3D"">192.168.2.0/24</a> =
via 192.168.5.2 dev wg0</div><div class=3D"">&nbsp; post-up iptables -t =
nat -A POSTROUTING -o eth0 -j MASQUERADE</div><div class=3D"">&nbsp; =
post-down /sbin/ip link del wg0</div><div class=3D"">&nbsp; address =
192.168.5.1</div><div class=3D"">&nbsp; netmask 255.255.255.0</div><div =
class=3D""><br class=3D""></div><div class=3D"">---</div><div =
class=3D""><br class=3D""></div><div class=3D"">Everything is working =
great, except that on the "Pi Zero with Wireguard" I can't access/ping =
remote devices in the <a href=3D"http://192.168.1.0/24" =
class=3D"">192.168.1.0/24</a> range, only the remote server =
192.168.1.54. =46rom any other machine in the same "A side" I am able to =
access devices in the <a href=3D"http://192.168.1.0/24" =
class=3D"">192.168.1.0/24</a> range, just from the Pi Zero itself =
not.</div><div class=3D""><br class=3D""></div><div class=3D"">What I am =
missing here?</div><div class=3D""><br class=3D""></div><div =
class=3D""><br class=3D""></div><div class=3D"">pi@raspberrypizero:~ $ =
ping 192.168.1.54</div><div class=3D"">PING 192.168.1.54 (192.168.1.54) =
56(84) bytes of data.</div><div class=3D"">64 bytes from <a =
href=3D"http://192.168.1.54/" class=3D"">192.168.1.54</a>: icmp_seq=3D1 =
ttl=3D64 time=3D48.6 ms</div><div class=3D"">64 bytes from <a =
href=3D"http://192.168.1.54/" class=3D"">192.168.1.54</a>: icmp_seq=3D2 =
ttl=3D64 time=3D134 ms^C</div><div class=3D"">--- 192.168.1.54 ping =
statistics ---</div><div class=3D"">2 packets transmitted, 2 received, =
0% packet loss, time 1002ms</div><div class=3D"">rtt min/avg/max/mdev =3D =
48.671/91.554/134.437/42.883 ms</div><div class=3D"">pi@raspberrypizero:~ =
$ ping 192.168.1.100</div><div class=3D"">PING 192.168.1.100 =
(192.168.1.100) 56(84) bytes of data.</div><div class=3D"">^C</div><div =
class=3D"">--- 192.168.1.100 ping statistics ---</div><div class=3D"">6 =
packets transmitted, 0 received, 100% packet loss, time 5188ms</div><div =
class=3D""><br class=3D""></div><div class=3D"">pi@raspberrypizero:~ $ =
traceroute 192.168.1.100</div><div class=3D"">traceroute to =
192.168.1.100 (192.168.1.100), 30 hops max, 60 byte packets</div><div =
class=3D"">&nbsp;1 &nbsp;192.168.5.1 (192.168.5.1) &nbsp;42.279 ms =
&nbsp;43.834 ms &nbsp;44.678 ms</div><div class=3D"">&nbsp;2 &nbsp;* * =
*</div><div class=3D"">&nbsp;3 &nbsp;* * *</div><div class=3D"">&nbsp;4 =
&nbsp;* * *</div><div class=3D""><br class=3D""></div><div class=3D""><br =
class=3D""></div><div class=3D"">---</div><div class=3D""><br =
class=3D""></div><div class=3D"">B side is working great, I am able to =
ping everything, even from the Ubuntu server.</div><div class=3D""><br =
class=3D""></div><div class=3D""><br class=3D""></div><div =
class=3D"">Regards,</div><div class=3D"">Adrian</div></div>
</div></blockquote></div><br class=3D""></div></body></html>=

--Apple-Mail=_C0FBF642-D593-4766-B945-834B0BE66C5A--
