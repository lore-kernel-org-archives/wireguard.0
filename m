Return-Path: joeblew99@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0a1c9496
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 Mar 2017 12:29:43 +0000 (UTC)
Received: from mail-ot0-f181.google.com (mail-ot0-f181.google.com
 [74.125.82.181])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 13bd9d0c
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 Mar 2017 12:29:43 +0000 (UTC)
Received: by mail-ot0-f181.google.com with SMTP id x37so89237395ota.2
 for <wireguard@lists.zx2c4.com>; Fri, 17 Mar 2017 05:33:31 -0700 (PDT)
MIME-Version: 1.0
From: Joe Blue <joeblew99@gmail.com>
Date: Fri, 17 Mar 2017 12:33:19 +0000
Message-ID: <CAGhajTJG2gkyUjs8xmV=zYj_=tPjefHJ70mhnn9RALeC_bXY1w@mail.gmail.com>
Subject: golang implemenation
To: wireguard@lists.zx2c4.com
Content-Type: multipart/alternative; boundary=94eb2c04fb248e041b054aec6223
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--94eb2c04fb248e041b054aec6223
Content-Type: text/plain; charset=UTF-8

Hey,

Wireguard looks really good and i read that golang / rust implemenations
were planned.

I looked the git tree and there is only one file, so i am was wondering
what the current intent is towards a golang port.
Part of the reason for being keen on a golang port is:
- Can run the server with just a linuxkernel and golang code and nothing
else to lower attack surface. For example of this see.
https://gokrazy.github.io/

- Can run clients on desktops and mobile very easily with golang. With
existing VPN clients its highly fragmented and so a cleint and server all
in golang really makes it easier to get going IMHO.

Please let me knwo the status, intent and how i can help.

Regards

Joe

--94eb2c04fb248e041b054aec6223
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hey,<div><br></div><div>Wireguard looks really good and i =
read that golang / rust implemenations were planned.</div><div><br></div><d=
iv>I looked the git tree and there is only one file, so i am was wondering =
what the current intent is towards a golang port.</div><div>Part of the rea=
son for being keen on a golang port is:</div><div>- Can run the server with=
 just a linuxkernel and golang code and nothing else to lower attack surfac=
e. For example of this see.=C2=A0<a href=3D"https://gokrazy.github.io/">htt=
ps://gokrazy.github.io/</a></div><div><br></div><div>- Can run clients on d=
esktops and mobile very easily with golang. With existing VPN clients its h=
ighly fragmented and so a cleint and server all in golang really makes it e=
asier to get going IMHO.</div><div><br></div><div>Please let me knwo the st=
atus, intent and how i can help.</div><div><br></div><div>Regards</div><div=
><br></div><div>Joe</div><div><br></div><div><br></div><div><br></div><div>=
<br></div></div>

--94eb2c04fb248e041b054aec6223--
