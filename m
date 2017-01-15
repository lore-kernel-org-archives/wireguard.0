Return-Path: wasabee18@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c319b602
 for <wireguard@lists.zx2c4.com>;
 Sun, 15 Jan 2017 11:19:11 +0000 (UTC)
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c8a108fd
 for <wireguard@lists.zx2c4.com>;
 Sun, 15 Jan 2017 11:19:11 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id d140so5429787wmd.0
 for <wireguard@lists.zx2c4.com>; Sun, 15 Jan 2017 03:29:32 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAHmME9pr9jEdaPuLfperB3qtTbuAL-cB8c8vRHu+09EC+-Q7uw@mail.gmail.com>
References: <CAOnWvx_BCaSO3i=319vCUjKuXG6E+8ReGsFGFFVgJLsdyb4RGg@mail.gmail.com>
 <CAHmME9pr9jEdaPuLfperB3qtTbuAL-cB8c8vRHu+09EC+-Q7uw@mail.gmail.com>
From: Wasa Bee <wasabee18@gmail.com>
Date: Sun, 15 Jan 2017 11:29:31 +0000
Message-ID: <CAOnWvx_MFs5LS0q3ZSv-cV9Y-JoCPrSHn3zazjhKrBiY40_zaA@mail.gmail.com>
Subject: Re: limitations
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: multipart/alternative; boundary=001a1147d75a7a37610546206126
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a1147d75a7a37610546206126
Content-Type: text/plain; charset=UTF-8

thanks for the answers, it all makes sense now :)

On Sat, Jan 14, 2017 at 8:58 PM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> On Sat, Jan 14, 2017 at 8:11 PM, Wasa Bee <wasabee18@gmail.com> wrote:
> > Also:
> > if there are ongoing sessions with some clients, how would sessions be
> > re-established (afaik, the current design is to simply ignore irrelevant
> > messages)?
>
> Sorry, missed this last question before.
>
> The session will be dropped when you unload the module, but a peer
> will quickly figure out that something is amiss and reinitiate the
> session. Downtime is fairly minimal.
>

--001a1147d75a7a37610546206126
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">thanks for the answers, it all makes sense now :)</div><di=
v class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Sat, Jan 14, 2017=
 at 8:58 PM, Jason A. Donenfeld <span dir=3D"ltr">&lt;<a href=3D"mailto:Jas=
on@zx2c4.com" target=3D"_blank">Jason@zx2c4.com</a>&gt;</span> wrote:<br><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex"><span class=3D"">On Sat, Jan 14, 2017 at 8:11 =
PM, Wasa Bee &lt;<a href=3D"mailto:wasabee18@gmail.com">wasabee18@gmail.com=
</a>&gt; wrote:<br>
</span><span class=3D"">&gt; Also:<br>
&gt; if there are ongoing sessions with some clients, how would sessions be=
<br>
&gt; re-established (afaik, the current design is to simply ignore irreleva=
nt<br>
&gt; messages)?<br>
<br>
</span>Sorry, missed this last question before.<br>
<br>
The session will be dropped when you unload the module, but a peer<br>
will quickly figure out that something is amiss and reinitiate the<br>
session. Downtime is fairly minimal.<br>
</blockquote></div><br></div>

--001a1147d75a7a37610546206126--
