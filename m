Return-Path: ehdot795@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ae60f10d
 for <wireguard@lists.zx2c4.com>; Thu, 2 Mar 2017 00:36:14 +0000 (UTC)
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 781d4108
 for <wireguard@lists.zx2c4.com>; Thu, 2 Mar 2017 00:36:13 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id n11so12300537wma.0
 for <wireguard@lists.zx2c4.com>; Wed, 01 Mar 2017 16:38:06 -0800 (PST)
MIME-Version: 1.0
From: James Wilson <ehdot795@gmail.com>
Date: Wed, 1 Mar 2017 19:38:05 -0500
Message-ID: <CACCLhZQtterheuB9NF4ppEAYbLKXtsPzCEnMGdtAS5KKVfPEjQ@mail.gmail.com>
Subject: Encapsulation
To: wireguard@lists.zx2c4.com
Content-Type: multipart/alternative; boundary=001a1141e41677e5ec0549b4a46b
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a1141e41677e5ec0549b4a46b
Content-Type: text/plain; charset=UTF-8

Hi,

Just out of curiosity, how does a "wireguard packet' look like on the wire
??

I'm guessing:

 Ethernet
 IP
 UDP
|------------------|
| IP                 |
| WG payload |
|------------------|


What's in the box is encrypted

Is that right ?? If not, what does it look like?

Thanks,

James

--001a1141e41677e5ec0549b4a46b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>Just out of curiosity, how does a &=
quot;wireguard packet&#39; look like on the wire ??</div><div><br></div><di=
v>I&#39;m guessing:</div><div>=C2=A0</div><div>=C2=A0Ethernet</div><div>=C2=
=A0IP</div><div>=C2=A0UDP</div><div>|------------------|</div><div>| IP =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |</div><div>| WG paylo=
ad |</div><div>|------------------|</div><div><br></div><div><br></div><div=
>What&#39;s in the box is encrypted</div><div><br></div><div>Is that right =
?? If not, what does it look like?</div><div><br></div><div>Thanks,</div><d=
iv><br></div><div>James</div></div>

--001a1141e41677e5ec0549b4a46b--
