Return-Path: luis.dominguez@mtz.desoft.cu
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 126a2be0
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Apr 2018 13:02:39 +0000 (UTC)
Received: from mx.desoft.cu (mx.desoft.cu [200.55.138.203])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 06d131bd
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Apr 2018 13:02:38 +0000 (UTC)
Date: Tue, 10 Apr 2018 09:16:16 -0400 (CDT)
From: =?utf-8?Q?Ing=2E_Luis_Felipe_Dom=C3=ADnguez?= Vega
 <luis.dominguez@mtz.desoft.cu>
To: Eric Light <eric@ericlight.com>
Message-ID: <632862084.551608.1523366176107.JavaMail.zimbra@mtz.desoft.cu>
In-Reply-To: <1523310199.2505184.1332166016.6F8F8F11@webmail.messagingengine.com>
References: <1183404859.513012.1523305020741.JavaMail.zimbra@mtz.desoft.cu>
 <1523310199.2505184.1332166016.6F8F8F11@webmail.messagingengine.com>
Subject: Re: Working only one way
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Cc: wireguard <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Jajajajaj sorry and sorry.. that's was the problem (the server interface wi=
th .0), ufff now is working, thanks... I love this new VPN, is so easy to c=
onfigure. I have a question, I'm new in WireGuard:

1 - Can I change the length (to 4096 bits for example) of private key? or i=
s not neccesary, I am a little paranoic with this kind of security cipher.


----- Mensaje original -----
De: "Eric Light" <eric@ericlight.com>
Para: "wireguard" <wireguard@lists.zx2c4.com>
Enviados: Lunes, 9 de Abril 2018 17:43:19
Asunto: Re: Working only one way

Hi Luis,

Welcome!

I would change your server Interface address to .1/24; .0/24 would be the n=
etwork address so would probably behave poorly.

Then I'd change your client Interface address to a /24 as well.  I think be=
cause the scope of that interface is /32, the routing table is probably not=
 sending packets down your wireguard route.

E

--------------------------------------------
Q: Why is this email five sentences or less?
A: http://five.sentenc.es

On Tue, 10 Apr 2018, at 08:17, Ing. Luis Felipe Dom=C3=ADnguez Vega wrote:
> Hello people, i currently installed wireguard (So easy !!!!!!), but i=20
> have a problem i have ping from server -> client, but not client ->=20
> server, when in server I execute tcpdump -i empresa only i see ICMP=20
> request and not response:=20
>=20
> Config server:=20
> ************************************
> [Interface]=20
> Address =3D 10.11.2.0/24=20
> SaveConfig =3D true=20
> ListenPort =3D 51820=20
> PrivateKey =3D --------=20
>=20
> [Peer]=20
> PublicKey =3D hgwZKihI4axZZwoWPsucpX+rZMo6dEhnJgb7ulZmzDE=3D=20
> AllowedIPs =3D 10.11.2.2/32=20
> Endpoint =3D 192.168.0.215:59160
>=20
>=20
> Config client:=20
> ************************************
> [Interface]
> PrivateKey =3D --------=20
> Address =3D 10.11.2.2/32
>=20
> [Peer]
> PublicKey =3D v+5UJACf6odzR4ct0vPheVaaKpIdEMjqa9SECloq5CE=3D
> Endpoint =3D 192.168.0.251:51820
> AllowedIPs =3D 10.11.2.0/24
>=20
>=20
>=20
>=20
> Routing in server:
> ------------------
> default via 192.168.0.254 dev enp1s0 onlink=20
> 10.11.2.0/24 dev empresa proto kernel scope link src 10.11.2.0=20
> 192.168.0.0/24 dev enp1s0 proto kernel scope link src 192.168.0.251
>=20
> Routing in client:
> ------------------
> default via 192.168.0.254 dev enp3s0 proto static metric 100=20
> 10.8.0.0/24 via 10.11.0.57 dev enp5s0 proto static metric 100=20
> 10.9.0.0/24 via 10.11.0.57 dev enp5s0 proto static metric 100=20
> 10.11.0.0/24 dev enp5s0 proto kernel scope link src 10.11.0.61 metric 100=
=20
> 10.11.2.0/24 dev empresa-vpn scope link=20
> 172.17.0.0/16 dev docker0 proto kernel scope link src 172.17.0.1=20
> 192.168.0.0/24 dev enp3s0 proto kernel scope link src 192.168.0.215 metri=
c 100=20
> 192.168.44.0/24 via 10.11.0.254 dev enp5s0 proto static metric 100
>=20
>=20
>=20
>=20
> --=20
> Luis Felipe Dominguez Vega=20
> System Administration in Desoft Matanzas | Mob: [ tel:+5353694785 |=20
> +5353694785 ] | [ http://www.desoft.cu/ | www.desoft.cu ]=20
> [ https://www.facebook.com/lfdominguez0104 |    ]=20
> [ https://www.linkedin.com/in/luis-felipe-dom%C3%ADnguez-vega-47725794/=
=20
> |    ] [ https://twitter.com/LuisFelipeDV1 |    ]
> XVII CONVENCI=C3=93N Y FERIA INTERNACIONAL: INFORM=C3=81TICA 2018. En La =
Habana,=20
> Cuba, del 19 al 23 de marzo
>=20
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
--=20
Luis Felipe Dominguez Vega=20
System Administration in Desoft Matanzas | Mob: [ tel:+5353694785 | +535369=
4785 ] | [ http://www.desoft.cu/ | www.desoft.cu ]=20
[ https://www.facebook.com/lfdominguez0104 |    ] [ https://www.linkedin.co=
m/in/luis-felipe-dom%C3%ADnguez-vega-47725794/ |    ] [ https://twitter.com=
/LuisFelipeDV1 |    ]
XVII CONVENCIÓN Y FERIA INTERNACIONAL: INFORMÁTICA 2018. En La Habana, Cuba, del 19 al 23 de marzo
