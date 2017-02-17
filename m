Return-Path: jason.dusek@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4aa67db9
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 Feb 2017 18:38:58 +0000 (UTC)
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e4121119
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 Feb 2017 18:38:58 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id v77so16403147wmv.0
 for <wireguard@lists.zx2c4.com>; Fri, 17 Feb 2017 10:39:19 -0800 (PST)
MIME-Version: 1.0
References: <CAO3NbwO_Wh_h9UgGdBRz_BZn4Pp8G=CxMJCSsjZpDZ-ampPTYw@mail.gmail.com>
 <CAHmME9pbvZoJ16PkDVQEMo7OGx16QFg1H4PxXkS4iSqheabDmg@mail.gmail.com>
In-Reply-To: <CAHmME9pbvZoJ16PkDVQEMo7OGx16QFg1H4PxXkS4iSqheabDmg@mail.gmail.com>
From: Jason Dusek <jason.dusek@gmail.com>
Date: Fri, 17 Feb 2017 18:39:06 +0000
Message-ID: <CAO3NbwMUYfaCbGuwHLET3Q8MzC2Xz7X6HMPyM6iT1rVO7VXzgA@mail.gmail.com>
Subject: Re: [PATCH] Handle (a) changes in Screech and (b) borrow issue
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: multipart/alternative; boundary=001a11452e4c3a20d80548be3ba8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a11452e4c3a20d80548be3ba8
Content-Type: text/plain; charset=UTF-8

Hi Jason,

It was necessary to "vendor" Screech. A separate Git repo makes for a
cleaner patch than downloading and including all of Screech. The patch
makes some stuff public again that was once public and then went private:

https://github.com/solidsnack/screech/commit/6d91d075ad2f98f03c807a471953495c720a5696

I assume Trevor made them private for a reason; but also that the original
developer of the client used them for a reason. I would like to better
understand the application before making a suggestion as regards the
Screech API; but I would also really like the Rust client to build (as I
think we all would).

Kind Regards,
Jason

Jason A. Donenfeld <Jason@zx2c4.com> schrieb am Fr. 17. Feb. 2017 um 05:50:

> Hey,
>
> Thanks for the patch. This changes the screech repository to your own.
> Has Trevor agreed for you to officially take over that project? If so,
> please link me to the moderncrypto mailing list post about this. If
> not, why should things switch to yours rather than moving your patches
> upstream to Trevor?
>
> Regards,
> Jason
>

--001a11452e4c3a20d80548be3ba8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Jason,<br><br>It was necessary to &quot;vendor&quot; Screech. A separate=
 Git repo makes for a cleaner patch than downloading and including all of S=
creech. The patch makes some stuff public again that was once public and th=
en went private:<br><br><a href=3D"https://github.com/solidsnack/screech/co=
mmit/6d91d075ad2f98f03c807a471953495c720a5696">https://github.com/solidsnac=
k/screech/commit/6d91d075ad2f98f03c807a471953495c720a5696</a><br><br>I assu=
me Trevor made them private for a reason; but also that the original develo=
per of the client used them for a reason. I would like to better understand=
 the application before making a suggestion as regards the Screech API; but=
 I would also really like the Rust client to build (as I think we all would=
).<br><br>Kind Regards,<br>  Jason<br><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr">Jason A. Donenfeld &lt;<a href=3D"mailto:Jason@zx2c4.com">Jason@=
zx2c4.com</a>&gt; schrieb am Fr. 17. Feb. 2017 um 05:50:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">Hey,<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
Thanks for the patch. This changes the screech repository to your own.<br c=
lass=3D"gmail_msg">
Has Trevor agreed for you to officially take over that project? If so,<br c=
lass=3D"gmail_msg">
please link me to the moderncrypto mailing list post about this. If<br clas=
s=3D"gmail_msg">
not, why should things switch to yours rather than moving your patches<br c=
lass=3D"gmail_msg">
upstream to Trevor?<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
Regards,<br class=3D"gmail_msg">
Jason<br class=3D"gmail_msg">
</blockquote></div>

--001a11452e4c3a20d80548be3ba8--
