Return-Path: raulbe@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id df5bae17
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Jul 2017 19:56:05 +0000 (UTC)
Received: from mail-qt0-f175.google.com (mail-qt0-f175.google.com
 [209.85.216.175])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6b9c0e48
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Jul 2017 19:56:05 +0000 (UTC)
Received: by mail-qt0-f175.google.com with SMTP id b40so82608159qtb.2
 for <wireguard@lists.zx2c4.com>; Mon, 10 Jul 2017 13:14:16 -0700 (PDT)
MIME-Version: 1.0
From: raul <raulbe@gmail.com>
Date: Tue, 11 Jul 2017 01:44:15 +0530
Message-ID: <CAOLRk5=eXFMcrtg6jcr6XyNT1mJiSR0EgrqTURH4SPdHT3ktXQ@mail.gmail.com>
Subject: Debian-based configuration for wireguard
To: wireguard@lists.zx2c4.com
Content-Type: multipart/alternative; boundary="001a113d4f302905d80553fc3a45"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a113d4f302905d80553fc3a45
Content-Type: text/plain; charset="UTF-8"

>
> On Sun, Jul 09, 2017 at 11:30:20PM +0200, Baptiste Jonglez wrote:
> >* Hi,
> *> >* I wrote up some configuration I use for Wireguard on Debian:
> *> >*     https://wiki.debian.org/Wireguard#Configuration_on_Debian <https://wiki.debian.org/Wireguard#Configuration_on_Debian>
> *> >* The goal is to reuse functionalities from /etc/network/interfaces, which
> *>* is quite natural on Debian.  Simple use-cases like the point-to-point
> *>* tunnel don't need wg-quick at all.
> *
> Terrific, thanks! Indeed, having nice integration into OSs' native
> configuration interfaces is preferred.
>
> Jason
>
>
Just to offer another POV a utility like wg-quick is very useful when
orchestrating across Linux distributions by offering a standardized
interface to manage Wireguard networks.

It's user friendly and sets up routes automatically depending on the
/etc/wireguard/configuration. In a dynamic changing environment that's
useful to have or you will have to manage the routes manually.


Raul

--001a113d4f302905d80553fc3a45
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><pre>On =
Sun, Jul 09, 2017 at 11:30:20PM +0200, Baptiste Jonglez wrote:
&gt;<i> Hi,
</i>&gt;<i>=20
</i>&gt;<i> I wrote up some configuration I use for Wireguard on Debian:
</i>&gt;<i>=20
</i>&gt;<i>     <a href=3D"https://wiki.debian.org/Wireguard#Configuration_=
on_Debian">https://wiki.debian.org/Wireguard#Configuration_on_Debian</a>
</i>&gt;<i>=20
</i>&gt;<i> The goal is to reuse functionalities from /etc/network/interfac=
es, which
</i>&gt;<i> is quite natural on Debian.  Simple use-cases like the point-to=
-point
</i>&gt;<i> tunnel don&#39;t need wg-quick at all.
</i>
Terrific, thanks! Indeed, having nice integration into OSs&#39; native
configuration interfaces is preferred.

Jason</pre></blockquote><div><br></div><div>Just to offer another POV a uti=
lity like wg-quick is very useful when orchestrating across Linux distribut=
ions by offering a standardized interface to manage Wireguard networks. <br=
><br>It&#39;s user friendly and sets up routes automatically depending on t=
he /etc/wireguard/configuration. In a dynamic changing environment that&#39=
;s useful to have or you will have to manage the routes manually.<br><br><b=
r></div><div>Raul <br></div></div>

--001a113d4f302905d80553fc3a45--
