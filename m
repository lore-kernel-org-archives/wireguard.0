Return-Path: quanzhou822@gmail.com
Received: from mail-yw0-f180.google.com (mail-yw0-f180.google.com
 [209.85.161.180])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d1f56b0a
 for <wireguard@lists.zx2c4.com>;
 Mon, 18 Jul 2016 13:15:49 +0000 (UTC)
Received: by mail-yw0-f180.google.com with SMTP id l125so158869212ywb.2
 for <wireguard@lists.zx2c4.com>; Mon, 18 Jul 2016 06:17:23 -0700 (PDT)
MIME-Version: 1.0
From: Quan Zhou <quanzhou822@gmail.com>
Date: Mon, 18 Jul 2016 21:17:02 +0800
Message-ID: <CAMRLKH_CB2oKmYnyBX3ntyqyLHUCZh_m5Wk-bWdYd_tkm-FxGA@mail.gmail.com>
To: wireguard@lists.zx2c4.com
Content-Type: multipart/alternative; boundary=001a1140fd9cd0902a0537e8c9dd
Subject: [WireGuard] 0.0.0.0/0 in AllowedIPs for multiple peer on the same
	interface.
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a1140fd9cd0902a0537e8c9dd
Content-Type: text/plain; charset=UTF-8

Hi,

I'm having a problem with multiple peers on the same interface, here's my
config:

wg0.conf:
[Peer]
PublicKey = YuIUz2kuf5mtTt9Ya0BM6GifbJK7YJQEcXf/2euRT1s=
AllowedIPs = 0.0.0.0/0, ::0/0

[Peer]
PublicKey = /i1OM+/kfFukFjA4Kd35YH/TWc3+jjW0ldxZp5xNDkY=
AllowedIPs = 0.0.0.0/0, ::0/0
Endpoint = [SNIPPED]:41414

[Peer]
PublicKey = 3o0xu/E/iGRibhrE2ehvxyBMqgqBW7oY2kjsbYsR3E8=
AllowedIPs = 0.0.0.0/0, ::0/0
Endpoint = [SNIPPED]:41414

The output:

/*****/
peer: /i1OM+/kfFukFjA4Kd35YH/TWc3+jjW0ldxZp5xNDkY=
  endpoint: [SNIPPED]:41414
  allowed ips: (none)
  latest handshake: 4 minutes, 34 seconds ago
  bandwidth: 145 B received, 89 B sent

peer: YuIUz2kuf5mtTt9Ya0BM6GifbJK7YJQEcXf/2euRT1s=
  allowed ips: (none)

peer: 3o0xu/E/iGRibhrE2ehvxyBMqgqBW7oY2kjsbYsR3E8=
  endpoint: [SNIPPED]:41414
  allowed ips: 0.0.0.0/0, ::/0
/*****/

Results that only two out of three peers is pingable within each interface.


-- 
Regards,

Quan Zhou
+------------------------+
|pub [expires 2019-05-04]|
|2C0C 4D88 E631 4C73 4C44|
|CDE0 C0E 5470 1D2D 3F3EE|
+------------------------+
|pub [revoked 2016-04-16]|
|44D2 0307 1643 E80F 2E31|
|F081 FAFA 6643 7F9F D46F|
+------------------------+
|quanzhou822@gmail.com   |
|https://keybase.io/qzhou|
+------------------------+

--001a1140fd9cd0902a0537e8c9dd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I&#39;m having a problem with multi=
ple peers on the same interface, here&#39;s my config:</div><div><br></div>=
<div>wg0.conf:</div><div><div>[Peer]</div><div>PublicKey =3D YuIUz2kuf5mtTt=
9Ya0BM6GifbJK7YJQEcXf/2euRT1s=3D</div><div>AllowedIPs =3D <a href=3D"http:/=
/0.0.0.0/0">0.0.0.0/0</a>, ::0/0</div><div><br></div><div>[Peer]</div><div>=
PublicKey =3D /i1OM+/kfFukFjA4Kd35YH/TWc3+jjW0ldxZp5xNDkY=3D</div><div>Allo=
wedIPs =3D <a href=3D"http://0.0.0.0/0">0.0.0.0/0</a>, ::0/0</div><div>Endp=
oint =3D [SNIPPED]:41414</div><div><br></div><div>[Peer]</div><div>PublicKe=
y =3D 3o0xu/E/iGRibhrE2ehvxyBMqgqBW7oY2kjsbYsR3E8=3D</div><div>AllowedIPs =
=3D <a href=3D"http://0.0.0.0/0">0.0.0.0/0</a>, ::0/0</div><div>Endpoint =
=3D [SNIPPED]:41414</div></div><div><br></div><div>The output:</div><div><b=
r></div><div>/*****/</div><div><div>peer: /i1OM+/kfFukFjA4Kd35YH/TWc3+jjW0l=
dxZp5xNDkY=3D</div><div>=C2=A0 endpoint: [SNIPPED]:41414</div><div>=C2=A0 a=
llowed ips: (none)</div><div>=C2=A0 latest handshake: 4 minutes, 34 seconds=
 ago</div><div>=C2=A0 bandwidth: 145 B received, 89 B sent</div><div><br></=
div><div>peer: YuIUz2kuf5mtTt9Ya0BM6GifbJK7YJQEcXf/2euRT1s=3D</div><div>=C2=
=A0 allowed ips: (none)</div><div><br></div><div>peer: 3o0xu/E/iGRibhrE2ehv=
xyBMqgqBW7oY2kjsbYsR3E8=3D</div><div>=C2=A0 endpoint: [SNIPPED]:41414</div>=
<div>=C2=A0 allowed ips: <a href=3D"http://0.0.0.0/0">0.0.0.0/0</a>, ::/0</=
div></div><div>/*****/<br></div><div><br></div><div>Results that only two o=
ut of three peers is pingable within each interface.</div><div><br></div><d=
iv><div><br></div>-- <br><div class=3D"gmail_signature" data-smartmail=3D"g=
mail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div dir=3D"ltr"><di=
v dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><font face=
=3D"monospace, monospace">Regards,<br><br>Quan Zhou<br></font><span style=
=3D"font-family:monospace,monospace;font-size:12.8px">+--------------------=
----+</span></div><div dir=3D"ltr"><font face=3D"monospace, monospace">|pub=
 [expires 2019-05-04]|</font><br style=3D"font-family:monospace,monospace;f=
ont-size:12.8px"><font face=3D"monospace, monospace">|2C0C 4D88 E631 4C73 4=
C44|<br>|CDE0 C0E 5470 1D2D 3F3EE|</font></div><div dir=3D"ltr"><font face=
=3D"monospace, monospace">+------------------------+<br>|pub [revoked 2016-=
04-16]|<br>|44D2 0307 1643 E80F 2E31|<br>|F081 FAFA 6643 7F9F D46F|<br>+---=
---------------------+<br>|<a href=3D"mailto:quanzhou822@gmail.com" target=
=3D"_blank">quanzhou822@gmail.com</a>=C2=A0 =C2=A0|<br>|<a href=3D"https://=
keybase.io/qzhou" target=3D"_blank">https://keybase.io/qzhou</a>|<br>+-----=
-------------------+</font></div></div></div></div></div></div></div></div>=
</div>
</div></div>

--001a1140fd9cd0902a0537e8c9dd--
