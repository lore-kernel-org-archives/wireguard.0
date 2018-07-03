Return-Path: eric@bluelinelabs.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 251a030a
 for <wireguard@lists.zx2c4.com>; Tue, 3 Jul 2018 02:20:40 +0000 (UTC)
Received: from mail-qt0-x235.google.com (mail-qt0-x235.google.com
 [IPv6:2607:f8b0:400d:c0d::235])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9acae179
 for <wireguard@lists.zx2c4.com>; Tue, 3 Jul 2018 02:20:40 +0000 (UTC)
Received: by mail-qt0-x235.google.com with SMTP id y31-v6so342740qty.9
 for <wireguard@lists.zx2c4.com>; Mon, 02 Jul 2018 19:27:03 -0700 (PDT)
From: Eric Kuck <eric@bluelinelabs.com>
In-Reply-To: <CAHmME9qcXm65jFbGv24m-Pzx9c+nq2-D4y4kBkXk7W6u8HZLiw@mail.gmail.com>
References: <CAMj-8hS_bJado86_1V9hCyW=+-jO6BDnk1WnZE0EQoDembViEw@mail.gmail.com>
 <d939f3b9-ff51-4b94-fcdc-2e819a98459c@sholland.org>
 <CAMj-8hQFk_UPJO4-KEH8YvK5NOBH5vu23Vu5JM2Gt0srMD_kEg@mail.gmail.com>
 <CAHmME9qcXm65jFbGv24m-Pzx9c+nq2-D4y4kBkXk7W6u8HZLiw@mail.gmail.com>
 <CAHmME9qcXm65jFbGv24m-Pzx9c+nq2-D4y4kBkXk7W6u8HZLiw@mail.gmail.com>
MIME-Version: 1.0
Date: Mon, 2 Jul 2018 22:27:02 -0400
Message-ID: <CAMj-8hSnvCpY7sZ6xcH=2_Va33M1YsZ97H66PrDSo5=BV9vyOw@mail.gmail.com>
Subject: Re: Android app whitelist/blacklist feature
To: "Jason A. Donenfeld" <jason@zx2c4.com>
Content-Type: multipart/alternative; boundary="000000000000a6b21905700f0cc2"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--000000000000a6b21905700f0cc2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I was originally thinking the new fragment would be a per-tunnel thing (set
when you create the tunnel or edit it), but you=E2=80=99re right - making i=
t a
general setting likely makes a whole lot more sense. I can=E2=80=99t think =
of any
use-cases for different tunnels handling different apps.

On July 2, 2018 at 9:21:23 PM, Jason A. Donenfeld (jason@zx2c4.com) wrote:

Hey Eric,

Sorry for not responding earlier when you sent this to me directly.
I'm glad you sent it here and Samuel caught it, so your nice idea
won't go to waste.

On Tue, Jul 3, 2018 at 2:22 AM Eric Kuck <eric@bluelinelabs.com> wrote:
> If I were to do the work I initially proposed (new fragment + GoBackend
implementation), would this be enough to get merged?

No, but I can write the C part and just provide you with some sane
interface for passing off the relevant information to wg-quick. Send
me offlist an SSH key, and I'll give you commit access to branches
that begin with `ek/`.

> My proposal is to add another Fragment that=E2=80=99s just a list of all =
apps
installed on the phone with check boxes next to them.

How would one get to the Fragment? From the overflow menu, or from the
settings? I suspect the settings would be a more natural place for it.
Or were you thinking that this would actually be part of each
individual tunnel profile, stored within the configuration for the
tunnel somehow?

Regards,
Jason

--000000000000a6b21905700f0cc2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><head><style>body{font-family:Helvetica,Arial;font-size:13px}</style>=
</head><body style=3D"word-wrap:break-word"><div id=3D"bloop_customfont" st=
yle=3D"font-family:Helvetica,Arial;font-size:13px;color:rgba(0,0,0,1.0);mar=
gin:0px;line-height:auto">I was originally thinking the new fragment would =
be a per-tunnel thing (set when you create the tunnel or edit it), but you=
=E2=80=99re right - making it a general setting likely makes a whole lot mo=
re sense. I can=E2=80=99t think of any use-cases for different tunnels hand=
ling different apps.</div> <div id=3D"bloop_sign_1530584671369398016" class=
=3D"bloop_sign"></div> <br><p class=3D"airmail_on">On July 2, 2018 at 9:21:=
23 PM, Jason A. Donenfeld (<a href=3D"mailto:jason@zx2c4.com">jason@zx2c4.c=
om</a>) wrote:</p> <blockquote type=3D"cite" class=3D"clean_bq"><span><div>=
<div></div><div>Hey Eric,
<br>
<br>Sorry for not responding earlier when you sent this to me directly.
<br>I&#39;m glad you sent it here and Samuel caught it, so your nice idea
<br>won&#39;t go to waste.
<br>
<br>On Tue, Jul 3, 2018 at 2:22 AM Eric Kuck &lt;<a href=3D"mailto:eric@blu=
elinelabs.com">eric@bluelinelabs.com</a>&gt; wrote:
<br>&gt; If I were to do the work I initially proposed (new fragment + GoBa=
ckend implementation), would this be enough to get merged?
<br>
<br>No, but I can write the C part and just provide you with some sane
<br>interface for passing off the relevant information to wg-quick. Send
<br>me offlist an SSH key, and I&#39;ll give you commit access to branches
<br>that begin with `ek/`.
<br>
<br>&gt; My proposal is to add another Fragment that=E2=80=99s just a list =
of all apps installed on the phone with check boxes next to them.
<br>
<br>How would one get to the Fragment? From the overflow menu, or from the
<br>settings? I suspect the settings would be a more natural place for it.
<br>Or were you thinking that this would actually be part of each
<br>individual tunnel profile, stored within the configuration for the
<br>tunnel somehow?
<br>
<br>Regards,
<br>Jason
<br></div></div></span></blockquote></body></html>

--000000000000a6b21905700f0cc2--
