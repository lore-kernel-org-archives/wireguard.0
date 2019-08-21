Return-Path: <SRS0=QHSY=WV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84176C3A5A1
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:37:33 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0FE82080C
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:37:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0FE82080C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=friedels.name
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3d6eaf07;
	Sun, 25 Aug 2019 15:36:26 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a6b46e32
 for <wireguard@lists.zx2c4.com>;
 Wed, 21 Aug 2019 19:14:03 +0000 (UTC)
Received: from smtprelay07.ispgateway.de (smtprelay07.ispgateway.de
 [134.119.228.104])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 95503d40
 for <wireguard@lists.zx2c4.com>;
 Wed, 21 Aug 2019 19:14:03 +0000 (UTC)
Received: from [178.3.106.141] (helo=[192.168.177.20])
 by smtprelay07.ispgateway.de with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92)
 (envelope-from <hendrik@friedels.name>) id 1i0W3V-00043i-Oh
 for wireguard@lists.zx2c4.com; Wed, 21 Aug 2019 21:14:01 +0200
From: "Hendrik Friedel" <hendrik@friedels.name>
To: wireguard@lists.zx2c4.com
Subject: Keep-alive does not keep the connection alive
Date: Wed, 21 Aug 2019 19:13:59 +0000
Message-Id: <em08a1734c-6242-4687-b8d8-cf84e0b95ec3@ryzen>
User-Agent: eM_Client/7.2.34062.0
Mime-Version: 1.0
X-Df-Sender: aGVuZHJpa0BmcmllZGVscy5uYW1l
X-Mailman-Approved-At: Sun, 25 Aug 2019 17:36:17 +0200
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
Reply-To: Hendrik Friedel <hendrik@friedels.name>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============6138589174689034742=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============6138589174689034742==
Content-Type: multipart/alternative;
 boundary="------=_MBFE9E87A2-11AB-43E1-878D-493EF5659F92"

--------=_MBFE9E87A2-11AB-43E1-878D-493EF5659F92
Content-Type: text/plain; format=flowed; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

I have a setup in which the Server IP is known, whereas the Client IP is=20
changing. Thus, I rely on the Client to connect to the Server. I want=20
the Client to keep the connection alive all the time though, so that the=20
Server can also initiate a connection to the Server when needed. Both,=20
client and server are behind a NAT/Router.
I would think, that the "PersistentKeepalive =3D 25" on the Client would=20
ckeep the connection open. The connection works fine while used. But=20
after a while, I cannot connect from the Server to the client anymore.
I would assume that a ping from the Client to the IP of the endpoint=20
would help to re-alive the connection - but it does not.

Only after a wg-quick down and up all is fine again.

Below some more information.

Can you help me to find, what I am doing wrong?

Regards,
Hendrik



At the time of the problem "wg" shows on the Client:
interface: wgnet0
   public key: cebXSxxx=3D
   private key: (hidden)
   listening port: 60147
   fwmark: 0xca6c

peer:  oNjoixxx=3D
   endpoint: 92.210.7.177:51820
   allowed ips: 0.0.0.0/0
   latest handshake: 1 day, 7 hours, 44 minutes, 19 seconds ago
   transfer: 48.48 GiB received, 1.22 TiB sent
   persistent keepalive: every 25 seconds


and on the Server
  wg
interface: wgnet0
   public key: oNjoijXxxx=3D
   private key: (hidden)
   listening port: 51820

peer: cebXSxx=3D
   endpoint: 185.22.142.254:60147
   allowed ips: 10.192.122.3/32
   latest handshake: 1 day, 7 hours, 46 minutes, 5 seconds ago
   transfer: 67.24 MiB received, 651.37 MiB sent

peer: ZiTlYnxx=3D
   endpoint: 109.41.65.27:5935
   allowed ips: 10.192.122.2/32
   latest handshake: 2 days, 21 hours, 49 minutes, 25 seconds ago
   transfer: 11.98 MiB received, 127.11 MiB sent


Note the "transfer" being different between the two by far. I show the=20
peer "ZiTIY" for completeness only. I do not think that it is relevant.











The Client config:
[Interface]
Address =3D 10.192.122.3/32
PrivateKey =3D xx=3D

[Peer]
PublicKey =3D yy=3D
Endpoint =3D Dyn.IP:51820
AllowedIPs =3D 0.0.0.0/0
PersistentKeepalive =3D 25

The Server config:
[Interface]
Address =3D 10.192.122.1/24
SaveConfig =3D true
PostUp =3D iptables -A FORWARD -i wgnet0 -j ACCEPT; iptables -A FORWARD -o=
=20
wgnet0 -j ACCEPT; iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
PostDown =3D iptables -D FORWARD -i wgnet0 -j ACCEPT; iptables -D FORWARD=
=20
-o wgnet0 -j ACCEPT; iptables -t nat -D POSTROUTING -o eth0 -j=20
MASQUERADE
ListenPort =3D 51820
PrivateKey =3D aa=3D

[Peer]
PublicKey =3D bb=3D
AllowedIPs =3D 10.192.122.2/32
Endpoint =3D hidden:41646

[Peer]
PublicKey =3D cc=3D
AllowedIPs =3D 10.192.122.3/32
Endpoint =3D hidden:60147





--------=_MBFE9E87A2-11AB-43E1-878D-493EF5659F92
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><style>#x8cab70c1932b41039c428c4731604d81{
	font-family:'Segoe UI';
	font-size:12pt;
}</style>

<style id=3D"css_styles">
blockquote.cite { margin-left: 5px; margin-right: 0px; padding-left: 10px;=
 padding-right:0px; border-left: 1px solid #cccccc }
blockquote.cite2 {margin-left: 5px; margin-right: 0px; padding-left: 10px;=
 padding-right:0px; border-left: 1px solid #cccccc; margin-top: 3px; padding=
-top: 0px; }
a img { border: 0px; }
li[style=3D'text-align: center;'], li[style=3D'text-align: right;'] {  list=
-style-position: inside;}
body { font-family: Segoe UI; font-size: 12pt;   }
</style>
</head>
<body>Hello,<div><br /></div><div>I have a setup in which the Server IP is=
 known, whereas the Client IP is changing. Thus, I rely on the Client to con=
nect to the Server. I want the Client to keep the connection alive all the=
 time though, so that the Server can also initiate a connection to the Serve=
r when needed. Both, client and server are behind a NAT/Router.</div><div>I =
would think, that the "PersistentKeepalive =3D 25" on the Client would cke=
ep the connection open.=C2=A0The connection works fine while used. But afte=
r a while, I cannot connect from the Server to the client anymore.</div><di=
v>I would assume that a ping from the Client to the IP of the endpoint woul=
d help to re-alive the connection - but it does not.</div><div><br /></div>=
<div>Only after a wg-quick down and up all is fine again.</div><div><br /><=
/div><div>Below some more information.</div><div><br /></div><div>Can you h=
elp me to find, what I am doing wrong?</div><div><br /></div><div>Regards,<=
/div><div>Hendrik</div><div><br /></div><div><br /></div><div><br /></div><=
div>At the time of the problem "wg" shows on the Client:</div><div>interfac=
e: wgnet0<br />=C2=A0 public key: cebXSxxx=3D<br />=C2=A0 private key: (hid=
den)<br />=C2=A0 listening port: 60147<br />=C2=A0 fwmark: 0xca6c<br /><br=
 />peer: =C2=A0oNjoixxx=3D<br />=C2=A0 endpoint: 92.210.7.177:51820<br />=C2=
=A0 allowed ips: 0.0.0.0/0<br />=C2=A0 latest handshake: 1 day, 7 hours, 44 =
minutes, 19 seconds ago<br />=C2=A0 transfer: 48.48 GiB received, 1.22 TiB =
sent<br />=C2=A0 persistent keepalive: every 25 seconds<br /></div><div><b=
r /></div><div><br /></div><div>and on the Server</div><div>=C2=A0wg<br />i=
nterface: wgnet0<br />=C2=A0 public key:=C2=A0oNjoijXxxx=3D</div><div>=C2=
=A0 private key: (hidden)<br />=C2=A0 listening port: 51820<br /><br />peer=
: cebXSxx=3D<br />=C2=A0 endpoint: 185.22.142.254:60147<br />=C2=A0 allowed =
ips: 10.192.122.3/32<br />=C2=A0 latest handshake: 1 day, 7 hours, 46 minu=
tes, 5 seconds ago<br />=C2=A0 transfer: 67.24 MiB received, 651.37 MiB sen=
t<br /><br />peer: ZiTlYnxx=3D<br />=C2=A0 endpoint: 109.41.65.27:5935<br /=
>=C2=A0 allowed ips: 10.192.122.2/32<br />=C2=A0 latest handshake: 2 days,=
 21 hours, 49 minutes, 25 seconds ago<br />=C2=A0 transfer: 11.98 MiB receiv=
ed, 127.11 MiB sent<br /></div><div><br /></div><div><br /></div><div>Note=
 the "transfer" being different between the two by far. I show the peer "ZiT=
IY" for completeness only. I do not think that it is relevant.</div><div><b=
r /></div><div><br /></div><div><br /></div><div><br /></div><div><br /></d=
iv><div><br /></div><div><br /></div><div><br /></div><div><br /></div><div=
><br /></div><div><br /></div><div>The Client config:</div><div>[Interface]=
</div><div>Address =3D 10.192.122.3/32</div><div>PrivateKey =3D xx=3D</div>=
<div><br /></div><div>[Peer]</div><div>PublicKey =3D yy=3D</div><div>Endpoi=
nt =3D Dyn.IP:51820</div><div>AllowedIPs =3D 0.0.0.0/0</div><div>Persistent=
Keepalive =3D 25</div><div><br /></div><div>The Server config:</div><div>[I=
nterface]</div><div>Address =3D 10.192.122.1/24</div><div>SaveConfig =3D tr=
ue</div><div>PostUp =3D iptables -A FORWARD -i wgnet0 -j ACCEPT; iptables -=
A FORWARD -o wgnet0 -j ACCEPT; iptables -t nat -A POSTROUTING -o eth0 -j MA=
SQUERADE</div><div>PostDown =3D iptables -D FORWARD -i wgnet0 -j ACCEPT; ip=
tables -D FORWARD -o wgnet0 -j ACCEPT; iptables -t nat -D POSTROUTING -o et=
h0 -j MASQUERADE</div><div>ListenPort =3D 51820</div><div>PrivateKey =3D aa=
=3D</div><div><br /></div><div>[Peer]</div><div>PublicKey =3D bb=3D</div><d=
iv>AllowedIPs =3D 10.192.122.2/32</div><div>Endpoint =3D hidden:41646</div>=
<div><br /></div><div>[Peer]</div><div>PublicKey =3D cc=3D</div><div>Allowe=
dIPs =3D 10.192.122.3/32</div><div>Endpoint =3D hidden:60147</div><div><br=
 /></div><div><br /></div><div><br /></div><div><br /></div><div><br /></div=
></body></html>
--------=_MBFE9E87A2-11AB-43E1-878D-493EF5659F92--


--===============6138589174689034742==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============6138589174689034742==--

