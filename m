Return-Path: jan.delandtsheer@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2003d05f
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 Aug 2017 20:55:51 +0000 (UTC)
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com
 [209.85.218.46])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ae292308
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 Aug 2017 20:55:51 +0000 (UTC)
Received: by mail-oi0-f46.google.com with SMTP id x3so18507610oia.1
 for <wireguard@lists.zx2c4.com>; Thu, 10 Aug 2017 14:17:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAF75rJBdfeD-7MpDGfFBV=bLbm0-H--mFin30QL9jDmpd4z1jw@mail.gmail.com>
 <CAHmME9oj1N3PdutkA1dAPOieqn6ukUPnRONp-_iBck1HhnjZiw@mail.gmail.com>
 <CAF75rJDubyJwgrwTFTTzM4nKX2e=+6h_qBBC+Vt4FvzVhbfnuw@mail.gmail.com>
 <CAHmME9pujFf3pUAr9NZK81DZMQHYsH1gvgh3uH6RAQwNEZ8JDA@mail.gmail.com>
 <CAF75rJD7ZcSKp6WiEHg+VUa7=07-+9P3r6TxU6s9ieW+LdkNhQ@mail.gmail.com>
 <CAF75rJD3LH-CcPt2Da2qfxtv7C+W4Ed=ORkUg0L2vW1QiUfBcg@mail.gmail.com>
 <CAHmME9rJ7BiinhPRhOqzAjZJEdc=wKzdk80Dvi=xQnP2fu_eqw@mail.gmail.com>
 <CAF75rJDj79FU7GMa1DKxPNZ9V2dSW0+rFUDQjmEJ_z3ZDeuuGA@mail.gmail.com>
 <CAHmME9q5T-KpTatXxLZ_H_j_Ly=ZTX63wKTeYD=jqKQeupFFpQ@mail.gmail.com>
 <CAHmME9r-TM_T7aqNfBhXVyF_Lc5Nf0KQGCqTCcZSEpZY+mMBYw@mail.gmail.com>
In-Reply-To: <CAHmME9r-TM_T7aqNfBhXVyF_Lc5Nf0KQGCqTCcZSEpZY+mMBYw@mail.gmail.com>
From: Jan De Landtsheer <jan.delandtsheer@gmail.com>
Date: Thu, 10 Aug 2017 21:17:48 +0000
Message-ID: <CABQfmN3JZ2oBQQJyEPv2CEV+LZJPjPDszyXL8Y-R=fzuy8NFhg@mail.gmail.com>
Subject: Re: Multihomed server issue
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, Wang Jian <larkwang@gmail.com>
Content-Type: multipart/alternative; boundary="001a113acab216001b05566cbb74"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Jan De Landtsheer <jan@delandtsheer.eu>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a113acab216001b05566cbb74
Content-Type: text/plain; charset="UTF-8"

indeed, this looks the same


On Thu, Aug 10, 2017 at 8:43 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> On Thu, Aug 10, 2017 at 4:29 PM, Jason A. Donenfeld <Jason@zx2c4.com>
> wrote:
> > It seems like the problem you're facing is that B does not belong to
> > I, because B belongs to an unrouted dummy0 interface. The solution
> > would be to change the question of step 4 to instead ask if _any_
> > interface contains B, not just the returned interface I. While this is
> > essentially what's done for IPv6, I'm not certain this is the correct
> > behavior for IPv4.
>
> This looks like http://ix.io/z3d if you want to try it and report back.
>
> Jason
>

--001a113acab216001b05566cbb74
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">indeed, this looks the same<div><br></div></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr">On Thu, Aug 10, 2017 at 8:43 PM Jason=
 A. Donenfeld &lt;<a href=3D"mailto:Jason@zx2c4.com">Jason@zx2c4.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">On Thu, Aug 10, 2017 at 4:=
29 PM, Jason A. Donenfeld &lt;<a href=3D"mailto:Jason@zx2c4.com" target=3D"=
_blank">Jason@zx2c4.com</a>&gt; wrote:<br>
&gt; It seems like the problem you&#39;re facing is that B does not belong =
to<br>
&gt; I, because B belongs to an unrouted dummy0 interface. The solution<br>
&gt; would be to change the question of step 4 to instead ask if _any_<br>
&gt; interface contains B, not just the returned interface I. While this is=
<br>
&gt; essentially what&#39;s done for IPv6, I&#39;m not certain this is the =
correct<br>
&gt; behavior for IPv4.<br>
<br>
This looks like <a href=3D"http://ix.io/z3d" rel=3D"noreferrer" target=3D"_=
blank">http://ix.io/z3d</a> if you want to try it and report back.<br>
<br>
Jason<br>
</blockquote></div>

--001a113acab216001b05566cbb74--
