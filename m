Return-Path: laszlo.kertesz@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f1280497
 for <wireguard@lists.zx2c4.com>;
 Fri, 27 Jul 2018 13:45:16 +0000 (UTC)
Received: from mail-qt0-x235.google.com (mail-qt0-x235.google.com
 [IPv6:2607:f8b0:400d:c0d::235])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 23aaa798
 for <wireguard@lists.zx2c4.com>;
 Fri, 27 Jul 2018 13:45:16 +0000 (UTC)
Received: by mail-qt0-x235.google.com with SMTP id y19-v6so5082121qto.5
 for <wireguard@lists.zx2c4.com>; Fri, 27 Jul 2018 06:54:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAHjFYUJp3A3Q_Jdqcn8XOnnYfsnMsF6x2FUM=AiAV=j0g8BY9w@mail.gmail.com>
 <CAHmME9r8zh_X5JDSHy+wkAyeX3Kt-FuWzpcxFSgkBdo8o13Rnw@mail.gmail.com>
 <e4f3f09a-1281-7f79-9d80-a878f0dd8cbe@mib-infotech.co.nz>
 <CAHmME9rUNWLQt528i7QkDfR3YK20KkMfD9SV7bOTMwQ0MdAUzg@mail.gmail.com>
 <CAKiCHuPJEbOK=V5qCLZma-Gv71+p2MEG6UXZE3n3AEPkMLNqhw@mail.gmail.com>
In-Reply-To: <CAKiCHuPJEbOK=V5qCLZma-Gv71+p2MEG6UXZE3n3AEPkMLNqhw@mail.gmail.com>
From: Laszlo KERTESZ <laszlo.kertesz@gmail.com>
Date: Fri, 27 Jul 2018 16:54:37 +0300
Message-ID: <CANcuY=qpNcFHLSP78pe6SAdigUn=Fyp08vXHujNOi+ep7HrfkA@mail.gmail.com>
Subject: Re: Android Update wants Camera Permissions
To: martinmoen@gmail.com
Content-Type: multipart/alternative; boundary="00000000000083ac4f0571fb74bc"
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--00000000000083ac4f0571fb74bc
Content-Type: text/plain; charset="UTF-8"

Wow. It actually works!
I tested it with qrencode and i was able to import the profile from my
headless router via ssh using only a terminal!
Just install qrencode and run:

cat profile.conf | qrencode -t UTF8 -o -


And scan the result.

Well done.

On Fri, Jul 27, 2018 at 10:12 AM Martin Eskdale Moen <martinmoen@gmail.com>
wrote:

> This is amazing, thank you.
>
> On Fri, Jul 27, 2018 at 12:12 AM Jason A. Donenfeld <Jason@zx2c4.com>
> wrote:
>
>> It now supports scanning QR codes.
>> _______________________________________________
>> WireGuard mailing list
>> WireGuard@lists.zx2c4.com
>> https://lists.zx2c4.com/mailman/listinfo/wireguard
>>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--00000000000083ac4f0571fb74bc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Wow. It actually works!<div>I tested it with qrencode and =
i was able to import the profile from my headless router via ssh using only=
 a terminal!<br></div><div>Just install qrencode and run:<br></div><div><br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">cat profile.conf |=
 qrencode=C2=A0-t UTF8 -o -</blockquote><div><br></div><div>And scan the re=
sult.</div><div><br></div><div>Well done.</div></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr">On Fri, Jul 27, 2018 at 10:12 AM Martin Eskdale M=
oen &lt;<a href=3D"mailto:martinmoen@gmail.com">martinmoen@gmail.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">This is a=
mazing, thank you.<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
>On Fri, Jul 27, 2018 at 12:12 AM Jason A. Donenfeld &lt;<a href=3D"mailto:=
Jason@zx2c4.com" target=3D"_blank">Jason@zx2c4.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">It now supports scanning QR codes.<br>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@li=
sts.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinfo/wireguard=
</a><br>
</blockquote></div>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@li=
sts.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinfo/wireguard=
</a><br>
</blockquote></div>

--00000000000083ac4f0571fb74bc--
