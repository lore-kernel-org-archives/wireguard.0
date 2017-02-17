Return-Path: nicolas.prochazka@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b4928663
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 Feb 2017 13:54:52 +0000 (UTC)
Received: from mail-lf0-f44.google.com (mail-lf0-f44.google.com
 [209.85.215.44])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9a5bae1b
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 Feb 2017 13:54:52 +0000 (UTC)
Received: by mail-lf0-f44.google.com with SMTP id z127so22827158lfa.2
 for <wireguard@lists.zx2c4.com>; Fri, 17 Feb 2017 05:55:12 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAHmME9popejSYDF-yHB+FxX-dSo9PVqMwo-MOG7mQj56QiA4EQ@mail.gmail.com>
References: <CADdae-jq5UET3utsK=gzpWig=MK3ts2KjF7=UYbAec0_Y08MGQ@mail.gmail.com>
 <CAHmME9popejSYDF-yHB+FxX-dSo9PVqMwo-MOG7mQj56QiA4EQ@mail.gmail.com>
From: Nicolas Prochazka <nicolas.prochazka@gmail.com>
Date: Fri, 17 Feb 2017 14:55:11 +0100
Message-ID: <CADdae-gZVqKC12_7zaqj1FVsjTe+6A8cuohjqM6fn5_DYRMBQw@mail.gmail.com>
Subject: Re: Some questions about wireguard
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: multipart/alternative; boundary=94eb2c1cb94a2d6b4a0548ba43a1
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--94eb2c1cb94a2d6b4a0548ba43a1
Content-Type: text/plain; charset=UTF-8

hello,
sorry for my english.
This question(udp tunnel ..)  is not relevant, I learn a lot with the read
of mailing list.
Regards,
Nicolas

2017-02-17 14:48 GMT+01:00 Jason A. Donenfeld <Jason@zx2c4.com>:

> On Wed, Feb 15, 2017 at 11:12 AM, Nicolas Prochazka
> <nicolas.prochazka@gmail.com> wrote:
> > - how many tunnels a peer can manage ?
> > In our environnement, ~ 10 000 clients --> "server"|peer
>
> Each interface can have 65536 peers. Each linux system can have
> multiple interfaces.
>
> (If that peer limit becomes a problem for somebody, it wouldn't be
> difficult to remove it and expand it to 4294967296.)
>
> > how wireguard manage this ( udp tunnel from kernel ? )
>
> Not sure I understand your question. Could you rephrase?
>
> >
> > - about peer key management ?
> > with 10 000 peer keys, how can we manage it
>
> You can load the keys into the interface using wg(8). At some later
> date there may be support for dynamic database stuff.
>

--94eb2c1cb94a2d6b4a0548ba43a1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div>hello, <br></div>sorry for my english.=
<br></div>This question(udp tunnel ..)=C2=A0 is not relevant, I learn a lot=
 with the read of mailing list.<br></div>Regards, <br></div>Nicolas<br></di=
v><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">2017-02-17 14:4=
8 GMT+01:00 Jason A. Donenfeld <span dir=3D"ltr">&lt;<a href=3D"mailto:Jaso=
n@zx2c4.com" target=3D"_blank">Jason@zx2c4.com</a>&gt;</span>:<br><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex"><span class=3D"">On Wed, Feb 15, 2017 at 11:12 AM, Ni=
colas Prochazka<br>
&lt;<a href=3D"mailto:nicolas.prochazka@gmail.com">nicolas.prochazka@gmail.=
com</a>&gt; wrote:<br>
&gt; - how many tunnels a peer can manage ?<br>
&gt; In our environnement, ~ 10 000 clients --&gt; &quot;server&quot;|peer<=
br>
<br>
</span>Each interface can have 65536 peers. Each linux system can have<br>
multiple interfaces.<br>
<br>
(If that peer limit becomes a problem for somebody, it wouldn&#39;t be<br>
difficult to remove it and expand it to 4294967296.)<br>
<span class=3D""><br>
&gt; how wireguard manage this ( udp tunnel from kernel ? )<br>
<br>
</span>Not sure I understand your question. Could you rephrase?<br>
<span class=3D""><br>
&gt;<br>
&gt; - about peer key management ?<br>
&gt; with 10 000 peer keys, how can we manage it<br>
<br>
</span>You can load the keys into the interface using wg(8). At some later<=
br>
date there may be support for dynamic database stuff.<br>
</blockquote></div><br></div>

--94eb2c1cb94a2d6b4a0548ba43a1--
