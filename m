Return-Path: steven@honson.id.au
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 96544aa2
 for <wireguard@lists.zx2c4.com>; Fri, 7 Sep 2018 15:17:38 +0000 (UTC)
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5226d139
 for <wireguard@lists.zx2c4.com>; Fri, 7 Sep 2018 15:17:37 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id 2-v6so7164827pgo.4
 for <wireguard@lists.zx2c4.com>; Fri, 07 Sep 2018 08:17:59 -0700 (PDT)
Return-Path: <steven@honson.id.au>
From: Steven Honson <steven@honson.id.au>
Message-Id: <EA3885D6-7DD4-4DE2-B53A-25B7A7DC270F@honson.id.au>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_8E7621C3-B81F-460A-ACA0-C89C56F332A8"
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: Re: Wireguard behind NAT
Date: Sat, 8 Sep 2018 01:17:54 +1000
In-Reply-To: <CA+Hw3eaWT76rB1eAEVM4DOMr_t3GkU07crF_aq8x8Vkww-DeZg@mail.gmail.com>
To: =?utf-8?Q?Adri=C3=A1n_Mih=C3=A1lko?= <adriankoooo@gmail.com>
References: <CA+Hw3eaWT76rB1eAEVM4DOMr_t3GkU07crF_aq8x8Vkww-DeZg@mail.gmail.com>
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--Apple-Mail=_8E7621C3-B81F-460A-ACA0-C89C56F332A8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hi Adrian,

As SIDE_B has a public IP address, the example you give should work =
fine. In this case, SIDE_A will establish a connection with SIDE_B which =
effectively punches a NAT hole for return traffic from SIDE_B to SIDE_A.

When configuring the SIDE_A peer on SIDE_B, just leave EndPoint unset.

Inversely, when configuring the SIDE_B peer on SIDE_A, use the dynamic =
DNS name (and the port that SIDE_B is listening on).

The NAT Hole Punching example Jason provided is more applicable to =
situations where both WireGuard peers are NATed. In your example it =
sounds like this is only the case for SIDE_A.

Cheers,
Steven

> On 3 Sep 2018, at 5:51 am, Adri=C3=A1n Mih=C3=A1lko =
<adriankoooo@gmail.com> wrote:
>=20
> Is there any way to connect to Wireguard behind a Carrier-grade NAT?=20=

>=20
> On SIDE_A I have a backup LTE connection, without proper public ip, =
only dynamic ip and I server with Wireguard.=20
>=20
> SIDE_A =3D mobile LTE connection, without public IP, behind carrier =
grade NAT=20
> SIDE_A_SERVER =3D WIREGUARD (connecting to sideb.dyndns.org =
<http://sideb.dyndns.org/>)=20
>=20
> SIDE_B =3D VDSL with public ip + ddns (sideb.dyndns.org =
<http://sideb.dyndns.org/>)=20
> SIDE_B_SERVER =3D WIREGUARD (cannot connect to SIDE_A, because no =
public ip on SIDE_A)=20
>=20
>=20
> Best regards,=20
> Adrian
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard


--Apple-Mail=_8E7621C3-B81F-460A-ACA0-C89C56F332A8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D"">Hi =
Adrian,<div class=3D""><br class=3D""></div><div class=3D"">As SIDE_B =
has a public IP address, the example you give should work fine. In this =
case, SIDE_A will establish a connection with SIDE_B which effectively =
punches a NAT hole for return traffic from SIDE_B to SIDE_A.</div><div =
class=3D""><br class=3D""></div><div class=3D"">When configuring the =
SIDE_A peer on SIDE_B, just leave EndPoint unset.</div><div class=3D""><br=
 class=3D""></div><div class=3D"">Inversely, when configuring the SIDE_B =
peer on SIDE_A, use the dynamic DNS name (and the port that SIDE_B is =
listening on).</div><div class=3D""><br class=3D""></div><div =
class=3D"">The NAT Hole Punching example Jason provided is more =
applicable to situations where both WireGuard peers are NATed. In your =
example it sounds like this is only the case for SIDE_A.</div><div =
class=3D""><br class=3D""></div><div class=3D""><div =
class=3D"">Cheers,</div><div class=3D"">Steven</div></div><div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D"">On 3 Sep =
2018, at 5:51 am, Adri=C3=A1n Mih=C3=A1lko &lt;<a =
href=3D"mailto:adriankoooo@gmail.com" =
class=3D"">adriankoooo@gmail.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div dir=3D"ltr" =
class=3D"">Is there any way to connect to Wireguard behind a =
Carrier-grade NAT?&nbsp;<div class=3D""><br class=3D""></div><div =
class=3D"">On SIDE_A I have a backup LTE connection, without proper =
public ip, only dynamic ip and I server with Wireguard.&nbsp;</div><div =
class=3D""><br class=3D""></div><div class=3D"">SIDE_A =3D mobile LTE =
connection, without public IP, behind carrier grade NAT&nbsp;</div><div =
class=3D"">SIDE_A_SERVER =3D WIREGUARD (connecting to <a =
href=3D"http://sideb.dyndns.org/" =
class=3D"">sideb.dyndns.org</a>)&nbsp;</div><div class=3D""><br =
class=3D""></div><div class=3D"">SIDE_B =3D VDSL with public ip + ddns =
(<a href=3D"http://sideb.dyndns.org/" =
class=3D"">sideb.dyndns.org</a>)&nbsp;</div><div class=3D"">SIDE_B_SERVER =
=3D WIREGUARD (cannot connect to SIDE_A, because no public ip on =
SIDE_A)&nbsp;</div><div class=3D""><br class=3D""></div><div =
class=3D""><br class=3D""></div><div class=3D"">Best =
regards,&nbsp;</div><div class=3D"">Adrian</div></div>
_______________________________________________<br class=3D"">WireGuard =
mailing list<br class=3D""><a href=3D"mailto:WireGuard@lists.zx2c4.com" =
class=3D"">WireGuard@lists.zx2c4.com</a><br =
class=3D"">https://lists.zx2c4.com/mailman/listinfo/wireguard<br =
class=3D""></div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_8E7621C3-B81F-460A-ACA0-C89C56F332A8--
