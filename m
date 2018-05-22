Return-Path: mino@minux.it
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1a5bff54
 for <wireguard@lists.zx2c4.com>;
 Tue, 22 May 2018 13:42:14 +0000 (UTC)
Received: from mail-vk0-x22f.google.com (mail-vk0-x22f.google.com
 [IPv6:2607:f8b0:400c:c05::22f])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b565844d
 for <wireguard@lists.zx2c4.com>;
 Tue, 22 May 2018 13:42:13 +0000 (UTC)
Received: by mail-vk0-x22f.google.com with SMTP id g72-v6so10911078vke.2
 for <wireguard@lists.zx2c4.com>; Tue, 22 May 2018 06:43:19 -0700 (PDT)
MIME-Version: 1.0
From: Giacomo Bernardi <mino@minux.it>
Date: Tue, 22 May 2018 14:42:42 +0100
Message-ID: <CABcNfLs4Z8uLu+Bn-3RCeAXkowB1ty0P_7hfGrAy_taS75CRdA@mail.gmail.com>
Subject: Key distribution and rotation tools?
To: wireguard@lists.zx2c4.com
Content-Type: multipart/alternative; boundary="000000000000dba0af056ccb9946"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--000000000000dba0af056ccb9946
Content-Type: text/plain; charset="UTF-8"

Hello list,
I am aware that WireGuard does not include a mechanism to distribute and
rotate pre-shared secrets by design [1].

However, even discounting a full-blown PKI, in large deployments one needs
to automate the generation/distribution/rotation of those pre-shared keys
on endpoints.

I unsuccessfully scouted around for tools that would fit in this space, did
I miss anything? Any suggestions?

Thanks!
Giacomo



[1] "All issues of key distribution and pushed configurations are out of
scope of WireGuard; these are issues much better left for other layers,
lest we end up with the bloat of IKE or OpenVPN." (
https://www.wireguard.com/#conceptual-overview)

--000000000000dba0af056ccb9946
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello list,=C2=A0</div><div>I am aware that=C2=A0Wire=
Guard does not include a mechanism to distribute and rotate pre-shared secr=
ets=C2=A0<span style=3D"color:rgb(34,34,34);font-family:sans-serif;font-siz=
e:13px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:no=
rmal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px=
;text-transform:none;white-space:normal;word-spacing:0px;background-color:r=
gb(255,255,255);text-decoration-style:initial;text-decoration-color:initial=
;float:none;display:inline">by design [1].</span></div><div><br></div><div>=
However, even discounting a full-blown PKI, in large deployments one needs =
to automate the generation/distribution/rotation of those pre-shared keys o=
n endpoints.=C2=A0</div><div><br></div><div>I unsuccessfully scouted around=
 for tools that would fit in this space, did I miss anything? Any suggestio=
ns?</div><div><br></div><div>Thanks!</div><div>Giacomo</div><div><br></div>=
<div><br></div><div><br></div><div>[1] &quot;All issues of key distribution=
 and pushed configurations are out of scope of WireGuard; these are issues =
much better left for other layers, lest we end up with the bloat of IKE or =
OpenVPN.&quot; (<a href=3D"https://www.wireguard.com/#conceptual-overview">=
https://www.wireguard.com/#conceptual-overview</a>)</div><div><br></div><di=
v><br></div></div>

--000000000000dba0af056ccb9946--
