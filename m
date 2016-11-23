Return-Path: orgads@gmail.com
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 656c6ac8
 for <wireguard@lists.zx2c4.com>;
 Wed, 23 Nov 2016 07:54:48 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id g23so963768wme.1
 for <wireguard@lists.zx2c4.com>; Tue, 22 Nov 2016 23:58:27 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAHmME9qHaQDuFW+HNZFip-Ba7q3aXoCpHUNz06hnFezGwXbjug@mail.gmail.com>
References: <CAHmME9qHaQDuFW+HNZFip-Ba7q3aXoCpHUNz06hnFezGwXbjug@mail.gmail.com>
From: Orgad Shaneh <orgads@gmail.com>
Date: Wed, 23 Nov 2016 09:58:26 +0200
Message-ID: <CAGHpTBJPXR08EMaHLtEawuQHRHOUF8MXsv1i_Kp_XTsWacdKqw@mail.gmail.com>
Subject: Re: [Qt-creator] Qt Creator for Linux Kernel Development
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: multipart/alternative; boundary=001a114b9e0805427e0541f341b2
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 "qt-creator@qt-project.org" <qt-creator@qt-project.org>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a114b9e0805427e0541f341b2
Content-Type: text/plain; charset=UTF-8

On Wed, Nov 23, 2016 at 7:51 AM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> (A) Qt Creator doesn't seem to parse the C correctly. Things like
> designated initializers and a few other C features here and there just
> don't get parsed correctly, and the IDE stops being useful. I suspect
> this is because things are actually being parsed in C++ mode. Bummer.
> Developers: any interest in improving C support in Qt Creator?
>

Which version do you use? Designated initializers support was added in 3.2 (
c56b999ffff249d4cb7dc7e8026a3297b63ff56d).

I now see that the members are not detected correctly (for e.g. Find
Usages), but parsing looks ok.

(B) There is no way to tell Qt Creator that a particular header file
> is included in every file -- that is, that gcc's "-include" is in use.
> There is a way of messing with the "C++ Code Model" on a file-by-file
> basis, for the duration of the time that the file is open, but no way
> to automatically have it included in every file of the project. This
> is a major hindrance. It means that every ifdef for every kconfig
> option is a grayed out unclickable region, rendering most things
> useless. Developers: any interest in fixing this? I spoke to a few of
> you in IRC several months ago about this, and there was interest, but
> it seems to have evaporated.
>

You can set PRECOMPILED_HEADER = header.h in your pro file. It should be
applied to all sources.

- Orgad

--001a114b9e0805427e0541f341b2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On W=
ed, Nov 23, 2016 at 7:51 AM, Jason A. Donenfeld <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:Jason@zx2c4.com" target=3D"_blank">Jason@zx2c4.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">(A) Qt Crea=
tor doesn&#39;t seem to parse the C correctly. Things like<br>
designated initializers and a few other C features here and there just<br>
don&#39;t get parsed correctly, and the IDE stops being useful. I suspect<b=
r>
this is because things are actually being parsed in C++ mode. Bummer.<br>
Developers: any interest in improving C support in Qt Creator?<br></blockqu=
ote><div><br></div><div>Which version do you use? Designated initializers s=
upport was added in 3.2 (<wbr>c56b999ffff249d4cb7dc7e8026a32<wbr>97b63ff56d=
).</div><div><br></div><div>I now see that the members are not detected cor=
rectly (for e.g. Find Usages), but parsing looks ok.</div><div><br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">(B) There is no way to tell=
 Qt Creator that a particular header file<br>
is included in every file -- that is, that gcc&#39;s &quot;-include&quot; i=
s in use.<br>
There is a way of messing with the &quot;C++ Code Model&quot; on a file-by-=
file<br>
basis, for the duration of the time that the file is open, but no way<br>
to automatically have it included in every file of the project. This<br>
is a major hindrance. It means that every ifdef for every kconfig<br>
option is a grayed out unclickable region, rendering most things<br>
useless. Developers: any interest in fixing this? I spoke to a few of<br>
you in IRC several months ago about this, and there was interest, but<br>
it seems to have evaporated.<br></blockquote><div><br></div><div>You can se=
t PRECOMPILED_HEADER =3D header.h in your pro file. It should be applied to=
 all sources.</div><div><br></div><div>- Orgad=C2=A0</div></div><br></div><=
/div>

--001a114b9e0805427e0541f341b2--
