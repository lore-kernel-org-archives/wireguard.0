Return-Path: rost.bel@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ace403f0
 for <wireguard@lists.zx2c4.com>;
 Sun, 30 Apr 2017 11:34:23 +0000 (UTC)
Received: from mail-lf0-f44.google.com (mail-lf0-f44.google.com
 [209.85.215.44])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 21670cfc
 for <wireguard@lists.zx2c4.com>;
 Sun, 30 Apr 2017 11:34:23 +0000 (UTC)
Received: by mail-lf0-f44.google.com with SMTP id c80so51548761lfh.3
 for <wireguard@lists.zx2c4.com>; Sun, 30 Apr 2017 04:43:39 -0700 (PDT)
MIME-Version: 1.0
From: Rostislav Belotserkovski <rost.bel@gmail.com>
Date: Sun, 30 Apr 2017 14:43:17 +0300
Message-ID: <CAKJBWRfDRi9KGM_OJwgN2ZaQ9a56Gxshh=apnj5j9ish-WOOcg@mail.gmail.com>
Subject: do a client behind NAT needs to define listening port?
To: wireguard@lists.zx2c4.com
Content-Type: multipart/alternative; boundary=f403045fbf9a460581054e60d197
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--f403045fbf9a460581054e60d197
Content-Type: text/plain; charset=UTF-8

Hi!

Wanted to ask you a question: do a client behind the NAT needs to declare a
listening port?

here is my conf w/o listening port and it obviously  works (I guess the
server-2-client connection works because of PersistentKeepalive )

server:

[Interface]
PrivateKey = *********
ListenPort = 500

[Peer]
PublicKey = *********
AllowedIPs = 192.168.4.2
PersistentKeepalive = 25

client:
[Interface]
PrivateKey = *********

[Peer]
PublicKey = *********
Endpoint = serverip:500
AllowedIPs = 0.0.0.0/0
PersistentKeepalive = 25

Thanks in advance.

-- 
Rostislav Belotserkovski

--f403045fbf9a460581054e60d197
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi!<div><br></div><div>Wanted to ask you a question: do a =
client behind the NAT needs to declare a listening port?</div><div><br></di=
v><div>here is my conf w/o listening port and it obviously =C2=A0works (I g=
uess the server-2-client connection works because of PersistentKeepalive )<=
br></div><div><br></div><div>server:</div><div><br clear=3D"all"><div><div>=
[Interface]</div><div>PrivateKey =3D *********</div><div>ListenPort =3D 500=
</div><div><br></div><div>[Peer]</div><div>PublicKey =3D *********</div><di=
v>AllowedIPs =3D 192.168.4.2</div><div>PersistentKeepalive =3D 25</div></di=
v><div><br></div><div>client:</div><div><div>[Interface]</div><div>PrivateK=
ey =3D *********</div><div><br></div><div>[Peer]</div><div>PublicKey =3D **=
*******</div><div>Endpoint =3D serverip:500</div><div>AllowedIPs =3D <a hre=
f=3D"http://0.0.0.0/0">0.0.0.0/0</a></div><div>PersistentKeepalive =3D 25</=
div></div><div><br></div><div>Thanks in advance.</div><div><br></div>-- <br=
><div class=3D"gmail_signature">Rostislav Belotserkovski</div>
</div></div>

--f403045fbf9a460581054e60d197--
