Return-Path: jan@incubaid.com
Received: from mail-lf0-f49.google.com (mail-lf0-f49.google.com
 [209.85.215.49])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d4c13343
 for <wireguard@lists.zx2c4.com>; Thu, 7 Jul 2016 12:53:23 +0000 (UTC)
Received: by mail-lf0-f49.google.com with SMTP id h129so10723068lfh.1
 for <wireguard@lists.zx2c4.com>; Thu, 07 Jul 2016 05:53:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAA5ikozfeQAFGx8Yi9d=1r5gkHNnq6e0yHFVLXHdVYD_V_Wwfg@mail.gmail.com>
 <CAHmME9oN9NU8fHTjfW6ougLf4u9ZfUHJ11MxDf3RhbC5n64g3g@mail.gmail.com>
In-Reply-To: <CAHmME9oN9NU8fHTjfW6ougLf4u9ZfUHJ11MxDf3RhbC5n64g3g@mail.gmail.com>
From: Jan De Landtsheer <jan@incubaid.com>
Date: Thu, 07 Jul 2016 12:53:24 +0000
Message-ID: <CAA5ikozn+uj+FPG1eLAR9uS+Lxqiab4+dMUhmBmyg9oBiWFQEg@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: multipart/alternative; boundary=001a114012647dc94c05370b2c71
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Client changes endpoint port, why?
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a114012647dc94c05370b2c71
Content-Type: text/plain; charset=UTF-8

  - about changing ports:
hmmm. can't really say...
What I noticed: I could ping yesterday, without doing anything, I couldn't
this morning. that's when I saw the difference.
I had something like it yesterday, and thinking I did something wrong, I
set it in stone in a config file. applied it, had my ping, kept the
terminal session on the server open (had also an openvpn to the remote).
This morning, from the remote , there was no ping. Verified why. And then I
sent this mail ;-)

Note: it's properly up since, so I don't know...
I'll keep it as it is, will let you know if something switches again.
Note2: No, no different peers, there is only one client, one server, so
there wouldn't be any overlap.

running arch linux, latest & geatest

  - about something else:
are these pure ip  tunnels, or could I envision to add the interfaces to an
OpenVSwitch bridge and use them as tunnel ports?

Thx
Jan


On Thu, Jul 7, 2016 at 1:29 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> Hi Jan,
>
> That's very strange. Are you sure there aren't other wireguard peers
> running thare using the same private key?
>
> Does it always change to the *same* wrong port?
>
> Jason
>

--001a114012647dc94c05370b2c71
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>=C2=A0 - about changing ports:</div>hmmm. can&#39;t r=
eally say...<div>What I noticed: I could ping yesterday, without doing anyt=
hing, I couldn&#39;t this morning. that&#39;s when I saw the difference.</d=
iv><div>I had something like it yesterday, and thinking I did something wro=
ng, I set it in stone in a config file. applied it, had my ping, kept the t=
erminal session on the server open (had also an openvpn to the remote).</di=
v><div>This morning, from the remote , there was no ping. Verified why. And=
 then I sent this mail ;-)</div><div><br></div><div>Note: it&#39;s properly=
 up since, so I don&#39;t know...=C2=A0</div><div>I&#39;ll keep it as it is=
, will let you know if something switches again.</div><div>Note2: No, no di=
fferent peers, there is only one client, one server, so there wouldn&#39;t =
be any overlap.</div><div><br></div><div>running arch linux, latest &amp; g=
eatest</div><div><br></div><div>=C2=A0 - about something else:</div><div>ar=
e these pure ip =C2=A0tunnels, or could I envision to add the interfaces to=
 an OpenVSwitch bridge and use them as tunnel ports?</div><div><br></div><d=
iv>Thx</div><div>Jan</div><div><br></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr">On Thu, Jul 7, 2016 at 1:29 PM Jason A. Donenfeld &lt;<a href=
=3D"mailto:Jason@zx2c4.com" target=3D"_blank">Jason@zx2c4.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">Hi Jan,<br>
<br>
That&#39;s very strange. Are you sure there aren&#39;t other wireguard peer=
s<br>
running thare using the same private key?<br>
<br>
Does it always change to the *same* wrong port?<br>
<br>
Jason<br>
</blockquote></div></div>

--001a114012647dc94c05370b2c71--
