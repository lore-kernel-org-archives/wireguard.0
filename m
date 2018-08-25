Return-Path: b.candler@pobox.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c7e4a9e8
 for <wireguard@lists.zx2c4.com>;
 Sat, 25 Aug 2018 08:30:55 +0000 (UTC)
Received: from pb-smtp1.pobox.com (pb-smtp1.pobox.com [64.147.108.70])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1f8d9a34
 for <wireguard@lists.zx2c4.com>;
 Sat, 25 Aug 2018 08:30:55 +0000 (UTC)
Received: from pb-smtp20.pobox.com (unknown [10.110.30.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp1.pobox.com (Postfix) with ESMTPS id 78AB31104EF
 for <wireguard@lists.zx2c4.com>; Sat, 25 Aug 2018 04:44:10 -0400 (EDT)
Received: from pb-smtp20.pobox.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id EBB8319143
 for <wireguard@lists.zx2c4.com>; Sat, 25 Aug 2018 04:44:09 -0400 (EDT)
 (envelope-from b.candler@pobox.com)
Received: from pb-smtp20.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id E54E219142
 for <wireguard@lists.zx2c4.com>; Sat, 25 Aug 2018 04:44:09 -0400 (EDT)
 (envelope-from b.candler@pobox.com)
Received: from MacBook-Pro-2.local (unknown [84.92.42.166])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by pb-smtp20.pobox.com (Postfix) with ESMTPSA id EDC801913F
 for <wireguard@lists.zx2c4.com>; Sat, 25 Aug 2018 04:44:06 -0400 (EDT)
 (envelope-from b.candler@pobox.com)
Subject: Re: wg-quick IPv6 same route on different interfaces
To: wireguard@lists.zx2c4.com
References: <mailman.1444.1535173537.2201.wireguard@lists.zx2c4.com>
From: Brian Candler <b.candler@pobox.com>
Message-ID: <0c6baf83-3882-2d82-161d-3a9234502696@pobox.com>
Date: Sat, 25 Aug 2018 09:44:05 +0100
MIME-Version: 1.0
In-Reply-To: <mailman.1444.1535173537.2201.wireguard@lists.zx2c4.com>
Content-Type: multipart/alternative;
 boundary="------------BE65695A0C0829F7F3BA49A3"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is a multi-part message in MIME format.
--------------BE65695A0C0829F7F3BA49A3
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

> I'm setting up an WireGuard tunnel between my VPS and my home network. =
This
> tunnel should be IPv6 only.
> I assigned the IPv6 subnet fd00:1:a/64 to my home network and my wiregu=
ard
> client got the static IP fd00:1:a::1.
> On the VPS I assigned the IP fd00::1 to the wg0 interface.
>
> Here're the configs:
> *Client:*
>
>> [Interface]
>> PrivateKey =3D XXXX
>> Address =3D fd00:1:a::1/64
>> [Peer]
>> PublicKey =3D XXXX
>> AllowedIPs =3D fd00:0:0::/64
>> EndPoint =3D vpn.domain.tld:51820
>> PersistentKeepalive =3D 25
> Server:
>
>> [Interface]
>> PrivateKey =3D ...
>> ListenPort =3D 51820
>> Address =3D fd00:0:0::1
>>
>> [Peer]
>> PublicKey =3D XXXX
>> AllowedIPs =3D fd00:1:a::/64
It *might* work if at the client side you use

Address =3D fd00:1:a::1

instead of

Address =3D fd00:1:a::1/64

However, the safest way to make it work is for the [Interface] Address=20
at each end to be a separate point-to-point subnet.=C2=A0 These are the=20
addresses allocated to the wg0 interface itself.=C2=A0 I don't know if=20
"unnumbered" point-to-point links are supported by Wireguard (that is,=20
when you re-use an address from a subnet that belongs to a different=20
interface), but I know it definitely works with a separate link subnet.

So if you want to use the whole block fd00:0:0::/64 in your VPS, then I=20
suggest you allocate a new subnet for the point-to-point, e.g.

client

[Interface]
Address =3D fd00:2::2/64

server

[Interface]
Address =3D fd00:2::1/64

AllowedIPs are then still the remote subnets at each side, as you have no=
w.

If your VPS is just a single host with a single IPv6 address on the wg0=20
interface, then you can keep it as you have now but use

server

[Interface]
Address =3D fd00:0:0::1/64

client

[Interface]
Address =3D fd00:0:0::2/64

HTH,

Brian.

--------------BE65695A0C0829F7F3BA49A3
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf=
-8">
  </head>
  <body text=3D"#000000" bgcolor=3D"#FFFFFF">
    <blockquote type=3D"cite"
      cite=3D"mid:mailman.1444.1535173537.2201.wireguard@lists.zx2c4.com"=
>
      <pre wrap=3D"">
I'm setting up an WireGuard tunnel between my VPS and my home network. Th=
is
tunnel should be IPv6 only.
I assigned the IPv6 subnet fd00:1:a/64 to my home network and my wireguar=
d
client got the static IP fd00:1:a::1.
On the VPS I assigned the IP fd00::1 to the wg0 interface.

Here're the configs:
*Client:*

</pre>
      <blockquote type=3D"cite" style=3D"color: #000000;">
        <pre wrap=3D"">[Interface]
PrivateKey =3D XXXX
Address =3D fd00:1:a::1/64
[Peer]
PublicKey =3D XXXX
AllowedIPs =3D fd00:0:0::/64
EndPoint =3D vpn.domain.tld:51820
PersistentKeepalive =3D 25
</pre>
      </blockquote>
      <pre wrap=3D"">
Server:

</pre>
      <blockquote type=3D"cite" style=3D"color: #000000;">
        <pre wrap=3D"">[Interface]
PrivateKey =3D ...
ListenPort =3D 51820
Address =3D fd00:0:0::1

[Peer]
PublicKey =3D XXXX
AllowedIPs =3D fd00:1:a::/64
</pre>
      </blockquote>
    </blockquote>
    It *might* work if at the client side you use<br>
    <pre wrap=3D"">Address =3D fd00:1:a::1</pre>
    instead of<br>
    <pre wrap=3D"">Address =3D fd00:1:a::1/64</pre>
    However, the safest way to make it work is for the [Interface]
    Address at each end to be a separate point-to-point subnet.=C2=A0 The=
se
    are the addresses allocated to the wg0 interface itself.=C2=A0 I don'=
t
    know if "unnumbered" point-to-point links are supported by Wireguard
    (that is, when you re-use an address from a subnet that belongs to a
    different interface), but I know it definitely works with a separate
    link subnet.<br>
    <br>
    So if you want to use the whole block fd00:0:0::/64 in your VPS,
    then I suggest you allocate a new subnet for the point-to-point,
    e.g.<br>
    <br>
    client<br>
    <br>
    [Interface]<br>
    Address =3D fd00:2::2/64<br>
    <br>
    server<br>
    <br>
    [Interface]<br>
    Address =3D fd00:2::1/64<br>
    <br>
    AllowedIPs are then still the remote subnets at each side, as you
    have now.<br>
    <br>
    If your VPS is just a single host with a single IPv6 address on the
    wg0 interface, then you can keep it as you have now but use<br>
    <br>
    server<br>
    <br>
    [Interface]<br>
    Address =3D fd00:0:0::1/64<br>
    <br>
    client<br>
    <br>
    [Interface]<br>
    Address =3D fd00:0:0::2/64<br>
    <br>
    HTH,<br>
    <br>
    Brian.<br>
  </body>
</html>

--------------BE65695A0C0829F7F3BA49A3--
