Return-Path: johan@netsense.nl
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ebfe6109
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Feb 2018 20:09:40 +0000 (UTC)
Received: from mail.netsense.nl (pretsense.xs4all.nl [212.238.167.101])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d851e651
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Feb 2018 20:09:39 +0000 (UTC)
From: Johan Henselmans <johan@netsense.nl>
Message-Id: <40A3F7E7-C870-4BDB-B6A6-5BBE771B08FA@netsense.nl>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_E7D539DD-9B0F-490F-B505-A342DD877D12"
Mime-Version: 1.0 (Mac OS X Mail 11.3 \(3445.6.11\))
Subject: Re: Is this a valid wireguard application or a scam?
Date: Sun, 25 Feb 2018 21:17:53 +0100
In-Reply-To: <CAHmME9r4apEw2LkxZdiE71hQ5XP8PG-qqzD8T+V5GMwB4T+TmQ@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <BE93C582-5F9E-42A3-83AF-4C72BACCC03D@gmail.com>
 <CAHmME9rwGF6TqNmQekTW1oEcuf2wBULPOuMZbk56Fy2FxncAvA@mail.gmail.com>
 <t2wq51ADDGJR6JJ_bayW4tLNf3CPXkKlI-2IRnp43-qb0uyKx7567kA79RgoavxfuBe3cxWUAlBS9FJcqmCG9G3Su_Rq4At2BUpJCevSHzY=@protonmail.com>
 <CAHmME9rHhH8Nfx-QGM_ndLiS-z=Yc=Vi+C5SY4NjMjc1LCPS-w@mail.gmail.com>
 <D2CE13D3-E95C-4E02-9715-810507889925@gmail.com>
 <CAHmME9r4apEw2LkxZdiE71hQ5XP8PG-qqzD8T+V5GMwB4T+TmQ@mail.gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--Apple-Mail=_E7D539DD-9B0F-490F-B505-A342DD877D12
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

I do have an Apple Dev account, so that hurdle has been taken. My plan =
would be to first get wireguard-go to compile, use that as a framework =
for as well IOS as Android, and then build an interface on top of that.=20=


That is what they have done with the IRMA project =
(https://github.com/privacybydesign). Sietse has built the user =
interface in React, but I am not to sure about using React, I would =
nudge to use Flutter.=20

But first getting wireguard-go to compile on MacOS=E2=80=A6.


> On 25 Feb 2018, at 19:47, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>=20
> On Sun, Feb 25, 2018 at 7:43 PM, Henrique Carrega <hcarrega@gmail.com> =
wrote:
>> I=E2=80=99d love to see a iOS version in future
>=20
> As would we all. Working on it. Let me know if you'd like to help out.
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard

Kind Regards,
=20
Johan Henselmans




--Apple-Mail=_E7D539DD-9B0F-490F-B505-A342DD877D12
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D"">I =
do have an Apple Dev account, so that hurdle has been taken. My plan =
would be to first get wireguard-go to compile, use that as a framework =
for as well IOS as Android, and then build an interface on top of =
that.&nbsp;<div class=3D""><br class=3D""></div><div class=3D"">That is =
what they have done with the IRMA project (<a =
href=3D"https://github.com/privacybydesign" =
class=3D"">https://github.com/privacybydesign</a>). Sietse has built the =
user interface in React, but I am not to sure about using React, I would =
nudge to use Flutter.&nbsp;</div><div class=3D""><br class=3D""></div><div=
 class=3D"">But first getting wireguard-go to compile on =
MacOS=E2=80=A6.</div><div class=3D""><br class=3D""><div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D"">On 25 =
Feb 2018, at 19:47, Jason A. Donenfeld &lt;<a =
href=3D"mailto:Jason@zx2c4.com" class=3D"">Jason@zx2c4.com</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><div =
class=3D"">On Sun, Feb 25, 2018 at 7:43 PM, Henrique Carrega &lt;<a =
href=3D"mailto:hcarrega@gmail.com" class=3D"">hcarrega@gmail.com</a>&gt; =
wrote:<br class=3D""><blockquote type=3D"cite" class=3D"">I=E2=80=99d =
love to see a iOS version in future<br class=3D""></blockquote><br =
class=3D"">As would we all. Working on it. Let me know if you'd like to =
help out.<br class=3D"">_______________________________________________<br=
 class=3D"">WireGuard mailing list<br class=3D""><a =
href=3D"mailto:WireGuard@lists.zx2c4.com" =
class=3D"">WireGuard@lists.zx2c4.com</a><br =
class=3D"">https://lists.zx2c4.com/mailman/listinfo/wireguard<br =
class=3D""></div></div></blockquote></div><br class=3D""><div class=3D"">
<div style=3D"color: rgb(0, 0, 0); font-family: Helvetica; font-style: =
normal; font-variant: normal; font-weight: normal; letter-spacing: =
normal; line-height: normal; orphans: 2; text-align: -webkit-auto; =
text-indent: 0px; text-transform: none; white-space: normal; widows: 2; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; word-wrap: =
break-word; -webkit-nbsp-mode: space; -webkit-line-break: =
after-white-space;" class=3D""><div class=3D"">Kind Regards,</div><div =
class=3D"">&nbsp;</div><div class=3D"">Johan Henselmans</div><div =
class=3D""><br class=3D""></div></div><br =
class=3D"Apple-interchange-newline">

</div>


<br class=3D""></div></body></html>=

--Apple-Mail=_E7D539DD-9B0F-490F-B505-A342DD877D12--
