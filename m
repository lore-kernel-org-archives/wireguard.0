Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cdc638eb
 for <wireguard@lists.zx2c4.com>; Tue, 2 May 2017 16:58:38 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5fd1902b
 for <wireguard@lists.zx2c4.com>; Tue, 2 May 2017 16:58:38 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 503dbf62
 for <wireguard@lists.zx2c4.com>; Tue, 2 May 2017 16:58:38 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 26437cc3
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 2 May 2017 16:58:38 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id a103so163322051ioj.1
 for <wireguard@lists.zx2c4.com>; Tue, 02 May 2017 10:08:11 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170502185455.4e88561e@msi.defcon1>
References: <20170502172752.4e234cd8@msi.defcon1>
 <CAHmME9rrgXSW5pbg56JwBXwcfey0MS-fT7zF-+SmiBwCa5a7bg@mail.gmail.com>
 <20170502185455.4e88561e@msi.defcon1>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 2 May 2017 19:08:10 +0200
Message-ID: <CAHmME9pSBfUtNBRYugC6o2hR8QhmQEzm4ZrTouzbo2vc9NuTfQ@mail.gmail.com>
Subject: Re: wg-quick can't down my vpn I/F and DNS problem
To: Bzzzz <lazyvirus@gmx.com>
Content-Type: multipart/alternative; boundary=f403043c4e989b8f75054e8d9578
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--f403043c4e989b8f75054e8d9578
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

DNS is solved using the PostUp line. See the man page example -- `man
wg-quick`.

For your down error, can you send precise command line output?

--
Sent from my telephone.

On May 2, 2017 18:55, "Bzzzz" <lazyvirus@gmx.com> wrote:

> On Tue, 2 May 2017 18:31:14 +0200
> "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:
>
> Oops, sorry for the PM, I put my answer back in the loop.
>
> > If your wg-quick config file is in /etc/wireguard and ends in ".conf"
> > then you can use `wg-quick down vpnserver`. Otherwise, please specify
> > the full path when calling wg-quick down.
>
> Hi Jason, very nice work BTW,
>
> this is _exactly_ what I do, on the server and the client, I've:
> /etc/wireguard/vpnserver.conf
> /etc/wireguard/vpnclient.conf
>
> I created 4 scripts: SERVER||CLIENT_WG_UP||DOWN.sh that use this syntax,
> (it either fails when typing it in command line).
>
> So the command issued are:
> wg-quick up vpnserver (works perfectly)
> wg-quick down vpnserver (fails)
> and d=C2=B0 for the client.
>
> My setup is basic (but may be wrong) on both srv & cli, here's the srv
> one:
>
> [Interface]
> Address         =3D 10.11.12.1/24
> ListenPort      =3D 1194
> PresharedKey    =3D =E2=80=A6
> PrivateKey      =3D =E2=80=A6
> [Peer]
> PublicKey       =3D =E2=80=A6
> AllowedIPs      =3D 0.0.0.0/0
>
> The VPN is working, I made a try yesterday, passing by my cell phone
> to reach my site and was amazed by the speed 'cos I keep my phone in gsm
> mode, otherwise it eats my battery alive (so ~20kB max speed on an old
> Xperia x10).
>
> This isn't really a problem, as I use 2 lines that do the work
> correctly; however, the DNS problem is a real concern.
>
> Jean-Yves
>

--f403043c4e989b8f75054e8d9578
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">DNS is solved using the PostUp line. See the man page exa=
mple -- `man wg-quick`.<div dir=3D"auto"><br></div><div dir=3D"auto">For yo=
ur down error, can you send precise command line output?<br><br><div data-s=
martmail=3D"gmail_signature" dir=3D"auto">--<br>Sent from my telephone.<br>=
</div></div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote"=
>On May 2, 2017 18:55, &quot;Bzzzz&quot; &lt;<a href=3D"mailto:lazyvirus@gm=
x.com">lazyvirus@gmx.com</a>&gt; wrote:<br type=3D"attribution"><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex">On Tue, 2 May 2017 18:31:14 +0200<br>
&quot;Jason A. Donenfeld&quot; &lt;<a href=3D"mailto:Jason@zx2c4.com">Jason=
@zx2c4.com</a>&gt; wrote:<br>
<br>
Oops, sorry for the PM, I put my answer back in the loop.<br>
<br>
&gt; If your wg-quick config file is in /etc/wireguard and ends in &quot;.c=
onf&quot;<br>
&gt; then you can use `wg-quick down vpnserver`. Otherwise, please specify<=
br>
&gt; the full path when calling wg-quick down.<br>
<br>
Hi Jason, very nice work BTW,<br>
<br>
this is _exactly_ what I do, on the server and the client, I&#39;ve:<br>
/etc/wireguard/vpnserver.conf<br>
/etc/wireguard/vpnclient.conf<br>
<br>
I created 4 scripts: SERVER||CLIENT_WG_UP||DOWN.sh that use this syntax,<br=
>
(it either fails when typing it in command line).<br>
<br>
So the command issued are:<br>
wg-quick up vpnserver (works perfectly)<br>
wg-quick down vpnserver (fails)<br>
and d=C2=B0 for the client.<br>
<br>
My setup is basic (but may be wrong) on both srv &amp; cli, here&#39;s the =
srv<br>
one:<br>
<br>
[Interface]<br>
Address=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D <a href=3D"http://10.11.12.1/2=
4" rel=3D"noreferrer" target=3D"_blank">10.11.12.1/24</a><br>
ListenPort=C2=A0 =C2=A0 =C2=A0 =3D 1194<br>
PresharedKey=C2=A0 =C2=A0 =3D =E2=80=A6<br>
PrivateKey=C2=A0 =C2=A0 =C2=A0 =3D =E2=80=A6<br>
[Peer]<br>
PublicKey=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D =E2=80=A6<br>
AllowedIPs=C2=A0 =C2=A0 =C2=A0 =3D <a href=3D"http://0.0.0.0/0" rel=3D"nore=
ferrer" target=3D"_blank">0.0.0.0/0</a><br>
<br>
The VPN is working, I made a try yesterday, passing by my cell phone<br>
to reach my site and was amazed by the speed &#39;cos I keep my phone in gs=
m<br>
mode, otherwise it eats my battery alive (so ~20kB max speed on an old<br>
Xperia x10).<br>
<br>
This isn&#39;t really a problem, as I use 2 lines that do the work<br>
correctly; however, the DNS problem is a real concern.<br>
<br>
Jean-Yves<br>
</blockquote></div></div>

--f403043c4e989b8f75054e8d9578--
