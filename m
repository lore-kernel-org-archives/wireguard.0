Return-Path: lesandie@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d88d7136
 for <wireguard@lists.zx2c4.com>; Mon, 8 May 2017 13:26:39 +0000 (UTC)
Received: from mail-yb0-f173.google.com (mail-yb0-f173.google.com
 [209.85.213.173])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 582db7ca
 for <wireguard@lists.zx2c4.com>; Mon, 8 May 2017 13:26:39 +0000 (UTC)
Received: by mail-yb0-f173.google.com with SMTP id p143so11448202yba.2
 for <wireguard@lists.zx2c4.com>; Mon, 08 May 2017 06:36:56 -0700 (PDT)
MIME-Version: 1.0
From: Le Sandie <lesandie@gmail.com>
Date: Mon, 8 May 2017 15:36:54 +0200
Message-ID: <CAKgwHq_tXi16AyAt-_30WtD6pOuR4gTHVxJ-zBFLJMX8CDCEGg@mail.gmail.com>
Subject: Handshake problem
To: wireguard@lists.zx2c4.com
Content-Type: multipart/alternative; boundary=94eb2c054ae4201d9a054f0355cd
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--94eb2c054ae4201d9a054f0355cd
Content-Type: text/plain; charset=UTF-8

Hi all,

I'm new to the list and also the wireguard community. I like a lot the
simplicity and power of the kmod. Coming from OpenVPN and the performance
difference is great.

Just to report some issues i've been having with the last
commit 5f25c6520d75dac1163c8353b80ebe5fde648d70 (merge).

The handshake between my LEDE router with kmod-wireguard and my Rpi3 with
latest commit just broke. If i fall back to the latest snapshot 20170421
the handshake starts to work again and the peers can see each other. Also
i've tested the handshake with two peers with the last commit and they can
see each other perfectly.

I don't use a pre-shared key, so i gues the redesign in the las commit has
nothing to do. If i have some time i'll go deep into the code and test some
scenarios to feel where the problem is.

Best regards and thanks for your contribution!

Le,

--94eb2c054ae4201d9a054f0355cd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi all,</div><div><br></div><div>I&#39;m new to the l=
ist and also the wireguard community. I like a lot the simplicity and power=
 of the kmod. Coming from OpenVPN and the performance difference is great.=
=C2=A0</div><div><br></div><div>Just to report some issues i&#39;ve been ha=
ving with the last commit=C2=A05f25c6520d75dac1163c8353b80ebe5fde648d70 (me=
rge).=C2=A0</div><div><br></div><div>The handshake between my LEDE router w=
ith kmod-wireguard and my Rpi3 with latest commit just broke. If i fall bac=
k to the latest snapshot 20170421 the handshake starts to work again and th=
e peers can see each other. Also i&#39;ve tested the handshake with two pee=
rs with the last commit and they can see each other perfectly.</div><div><b=
r></div><div>I don&#39;t use a pre-shared key, so i gues the redesign in th=
e las commit has nothing to do. If i have some time i&#39;ll go deep into t=
he code and test some scenarios to feel where the problem is.</div><div><br=
></div><div>Best regards and thanks for your contribution!=C2=A0</div><div>=
<br></div><div>Le,=C2=A0</div><div><br></div><div><br></div>
</div>

--94eb2c054ae4201d9a054f0355cd--
