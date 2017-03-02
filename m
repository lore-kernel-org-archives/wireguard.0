Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1d0414c0
 for <wireguard@lists.zx2c4.com>; Thu, 2 Mar 2017 15:17:12 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4743b3a4
 for <wireguard@lists.zx2c4.com>; Thu, 2 Mar 2017 15:17:12 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3545aa95
 for <wireguard@lists.zx2c4.com>; Thu, 2 Mar 2017 15:17:11 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c62f274e
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 2 Mar 2017 15:17:10 +0000 (UTC)
Received: by mail-oi0-f45.google.com with SMTP id m124so40815478oig.1
 for <wireguard@lists.zx2c4.com>; Thu, 02 Mar 2017 07:19:07 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CACCLhZTT78tEQzt5JK8nTs89bhV0ogJKo=k_7=vYhsfy8sgeGQ@mail.gmail.com>
References: <CACCLhZQtterheuB9NF4ppEAYbLKXtsPzCEnMGdtAS5KKVfPEjQ@mail.gmail.com>
 <871sugpifa.fsf@alice.fifthhorseman.net>
 <CACCLhZTT78tEQzt5JK8nTs89bhV0ogJKo=k_7=vYhsfy8sgeGQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 2 Mar 2017 07:19:06 -0800
Message-ID: <CAHmME9r0SUieGLm-R=JF9eRpctN4AUptUtBvvMasn_d7FB7j5w@mail.gmail.com>
Subject: Re: Encapsulation
To: James Wilson <ehdot795@gmail.com>
Content-Type: multipart/alternative; boundary=001a113d466e3ddf800549c0f35c
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a113d466e3ddf800549c0f35c
Content-Type: text/plain; charset=UTF-8

Hey James,

You're quite mistaken. WireGuard is layer 3 only.

Ethernet
IP
UDP
WireGuard header
==================
IP
Payload

Everything below the line is encrypted.

Jason

--001a113d466e3ddf800549c0f35c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hey James,</div><div class=3D"g=
mail_extra"><br></div><div class=3D"gmail_extra">You&#39;re quite mistaken.=
 WireGuard is layer 3 only.</div><div class=3D"gmail_extra"><br></div><div =
class=3D"gmail_extra">Ethernet</div><div class=3D"gmail_extra">IP</div><div=
 class=3D"gmail_extra">UDP</div><div class=3D"gmail_extra">WireGuard header=
</div><div class=3D"gmail_extra">=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D</div><div class=3D"gmail_extra">IP</div><div class=3D"gmail_ex=
tra">Payload</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_=
extra">Everything below the line is encrypted.</div><div class=3D"gmail_ext=
ra"><br></div><div class=3D"gmail_extra">Jason</div></div>

--001a113d466e3ddf800549c0f35c--
