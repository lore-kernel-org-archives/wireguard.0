Return-Path: neumann@cgws.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id be25a8f0
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 May 2018 19:32:10 +0000 (UTC)
Received: from mail.dabax.net (mail.dabax.net [88.99.12.75])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 84d0311c
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 May 2018 19:32:09 +0000 (UTC)
Date: Wed, 16 May 2018 21:32:08 +0200
In-Reply-To: <CAKXLc7drht4CVexsCTXwHe-Z_RyFghAhQsXom=z9dtQuxQU48Q@mail.gmail.com>
References: <c1e04862-162f-eff9-7884-467f672608e2@cgws.de>
 <CAKXLc7capqT5oFinwT6Cj1-b2h5gKo+CG+WTLbFO+bG7pR7NsQ@mail.gmail.com>
 <793381ba-b59d-50e4-6d7b-cbe9bef91ba1@cgws.de>
 <489c2f57-574a-1223-9c4d-266904e52c94@gmail.com>
 <20180515202126.yw57deh6st5ebnk6@kowloon>
 <CAKXLc7drht4CVexsCTXwHe-Z_RyFghAhQsXom=z9dtQuxQU48Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----41J1W131W4EE11PWCVCBD7WW6S84AW"
Subject: Re: Need for HW-clock independent timestamps
To: wireguard@lists.zx2c4.com, Kalin KOZHUHAROV <me.kalin@gmail.com>,
 Devan Carpenter <mail@dvn.me>
From: Axel Neumann <neumann@cgws.de>
Message-ID: <20C72316-B8FC-4515-8DC8-8BC82BF3864F@cgws.de>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

------41J1W131W4EE11PWCVCBD7WW6S84AW
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



Am 15=2E Mai 2018 22:49:15 MESZ schrieb Kalin KOZHUHAROV <me=2Ekalin@gmail=
=2Ecom>:
>On Tue, May 15, 2018 at 10:21 PM, Devan Carpenter=20

>> Using NTP is not a viable solution for a distributed mesh network=2E
>What
>> if the Internet is only accesible via WG, or what if the network is
>not
>> connected to the Internet at all?
>>
>Why do you need the Internet at all?
>You can do as simple as plug a $20 GPS receiver (serial/USB) in any
>node and get precise time that is shared with others in the network=2E

$20 would increase the HW cost of many typical community-networks (CN) dep=
loyments significantly=2E Plus requiering more knowledge, maintenence, and =
power supply for sometimes solar-powered setups=2E Think of a recent typica=
l CN node like this [1], so no usb=2E The admins are not hackers=2E Also th=
ere are tens of thousands of existing and productively operating (partially=
 5-10-years-old) nodes that nobody wants to upgrade HW wise=2E=20
It is really NOT as simple as it sounds to plug a  $20 GPS !!!

[1] https://www=2Etp-link=2Ecom/en/products/details/cat-37_CPE510=2Ehtml


/axel



--=20
Diese Nachricht wurde von meinem Android-Ger=C3=A4t mit K-9 Mail gesendet=
=2E
------41J1W131W4EE11PWCVCBD7WW6S84AW
Content-Type: text/html;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

<br>
<br>
Am 15=2E Mai 2018 22:49:15 MESZ schrieb Kalin KOZHUHAROV &lt;me=2Ekalin@gm=
ail=2Ecom&gt;:<br>
&gt;On Tue, May 15, 2018 at 10:21 PM, Devan Carpenter <br>
<br>
&gt;&gt; Using NTP is not a viable solution for a distributed mesh network=
=2E<br>
&gt;What<br>
&gt;&gt; if the Internet is only accesible via WG, or what if the network =
is<br>
&gt;not<br>
&gt;&gt; connected to the Internet at all?<br>
&gt;&gt;<br>
&gt;Why do you need the Internet at all?<br>
&gt;You can do as simple as plug a $20 GPS receiver (serial/USB) in any<br=
>
&gt;node and get precise time that is shared with others in the network=2E=
<br>
<br>
$20 would increase the HW cost of many typical community-networks (CN) dep=
loyments significantly=2E Plus requiering more knowledge, maintenence, and =
power supply for sometimes solar-powered setups=2E Think of a recent typica=
l CN node like this [1], so no usb=2E The admins are not hackers=2E Also th=
ere are tens of thousands of existing and productively operating (partially=
 5-10-years-old) nodes that nobody wants to upgrade HW wise=2E <br>
It is really NOT as simple as it sounds to plug a  $20 GPS !!!<br>
<br>
[1] <a href=3D"https://www=2Etp-link=2Ecom/en/products/details/cat-37_CPE5=
10=2Ehtml">https://www=2Etp-link=2Ecom/en/products/details/cat-37_CPE510=2E=
html</a><br>
<br>
<br>
/axel<br>
<br>
<br>
<br>
-- <br>
Diese Nachricht wurde von meinem Android-Ger=C3=A4t mit K-9 Mail gesendet=
=2E
------41J1W131W4EE11PWCVCBD7WW6S84AW--
