Return-Path: sirus.lopus@yahoo.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e90667d1
 for <wireguard@lists.zx2c4.com>;
 Thu, 22 Feb 2018 12:30:56 +0000 (UTC)
Received: from sonic314-19.consmr.mail.gq1.yahoo.com
 (sonic314-19.consmr.mail.gq1.yahoo.com [98.137.69.82])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7bba746c
 for <wireguard@lists.zx2c4.com>;
 Thu, 22 Feb 2018 12:30:56 +0000 (UTC)
Date: Thu, 22 Feb 2018 12:38:28 +0000 (UTC)
From: Hannes Wagner <sirus.lopus@yahoo.com>
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Message-ID: <630889583.2626955.1519303108947@mail.yahoo.com>
Subject: ExtIP change no new handshake
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_Part_2626954_671528259.1519303108945"
References: <630889583.2626955.1519303108947.ref@mail.yahoo.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

------=_Part_2626954_671528259.1519303108945
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I stumbled upon the following observation. I have a router with an dynamic =
external IP with changes every 24h. It can be reached via it's dyndns test.=
test.zzz. Client1 and 2 have the same config to reach the endpoint:[Peer]
PublicKey =3D 5JZzs90SBYzXc8pfDW......
Endpoint =3D test.test.zzz:443
PersistentKeepAlive=3D3600
Client2 Ext IP 145.x.y.z wg0 10.2.1.3
=C2=A0=C2=A0=C2=A0=C2=A0|
=C2=A0=C2=A0=C2=A0=C2=A0|
Router IP 10.1.1.1=C2=A0 Dynamic Ext IP 83.x1.y1.z1 (after 24h/change to 84=
.x2.y2.z2) dyndns: test.test.zzz
=C2=A0=C2=A0 | =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |
=C2=A0=C2=A0 | =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Client1 10.1.1.3 wg0 1=
0.2.1.2 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Server 10.1.1.2 wg0 10.2=
.1.1
After the external IP address changes I cannot reach client1 from server or=
 client2 on it's wireguard wg0 device.
wg show on client1=20
peer: 5JZzs90SBYzXc8pfDW......
endpoint: 83.x.y.z:443
allowed ips: 10.2.0.0/16
latest handshake: 8 hours, 14 minutes, 42 seconds ago
transfer: 9.98 KiB received, 49.73 KiB sent
persistent keepalive: every 6 minutes

wg show on server
peer: 9BhasduiUTa3d.....
endpoint: 83.x.y.z:43765
allowed ips: 10.2.1.2/32
latest handshake: 8 hours, 14 minutes, 42 seconds ago
transfer: 22.73 KiB=C2=A0 received, 169.98 KiB sent

Both devices still list the old external IP. Although on client1 and server=
 test.test.zzz resolves to it's new external IP 84.x2.y2.z2. I know that I =
could fix this by entering the internal IP of the server as the endpoint ad=
dress on client1, but I thought that if the server couldn't be reached any =
more a new handshake process (with DNS lookup) would be initiated?=C2=A0=20



------=_Part_2626954_671528259.1519303108945
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div style=3D"font-family:Helvetica Neue, Helvetic=
a, Arial, sans-serif;font-size:13px;"><div>I stumbled upon the following ob=
servation. I have a router with an dynamic external IP with changes every 2=
4h. It can be reached via it's dyndns test.test.zzz. Client1 and 2 have the=
 same config to reach the endpoint:</div><div>[Peer]<br>PublicKey =3D 5JZzs=
90SBYzXc8pfDW......<br>Endpoint =3D test.test.zzz:443<br></div><div>Persist=
entKeepAlive=3D3600</div><div><br></div><div>Client2 Ext IP 145.x.y.z wg0 1=
0.2.1.3<br></div><div>&nbsp;&nbsp;&nbsp;&nbsp;|<br></div><div>&nbsp;&nbsp;&=
nbsp;&nbsp;|<br></div><div>Router IP 10.1.1.1&nbsp; Dynamic Ext IP 83.x1.y1=
.z1 (after 24h/change to 84.x2.y2.z2) dyndns: test.test.zzz<br></div><div>&=
nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; |<br></div><div>&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</d=
iv><div>Client1 10.1.1.3 wg0 10.2.1.2 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; Server 10.1.1.2 wg0 10.2.1.1</div><div><br></div><div>After the exter=
nal IP address changes I cannot reach client1 from server or client2 on it'=
s wireguard wg0 device.</div><div><br></div><div>wg show on client1 <br></d=
iv><div>peer: 5JZzs90SBYzXc8pfDW......<br>endpoint: 83.x.y.z:443<br>allowed=
 ips: 10.2.0.0/16<br>latest handshake: 8 hours, 14 minutes, 42 seconds ago<=
br>transfer: 9.98 KiB received, 49.73 KiB sent<br>persistent keepalive: eve=
ry 6 minutes<br></div><div><br></div><div><div>wg show on server<br></div>p=
eer: 9BhasduiUTa3d.....<br>endpoint: 83.x.y.z:43765<br>allowed ips: 10.2.1.=
2/32<br>latest handshake: 8 hours, 14 minutes, 42 seconds ago<br>transfer: =
22.73 KiB&nbsp; received, 169.98 KiB sent<br></div><div><br></div><div>Both=
 devices still list the old external IP. Although on client1 and server tes=
t.test.zzz resolves to it's new external IP 84.x2.y2.z2. </div><div>I know =
that I could fix this by entering the internal IP of the server as the endp=
oint address on client1, but I thought that if the server couldn't be reach=
ed any more a new handshake process (with DNS lookup) would be initiated?&n=
bsp; <br></div><div><br></div><div><br></div></div></body></html>
------=_Part_2626954_671528259.1519303108945--
