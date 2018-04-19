Return-Path: chm.duquesne@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6fa0ee2d
 for <wireguard@lists.zx2c4.com>;
 Thu, 19 Apr 2018 21:21:38 +0000 (UTC)
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
 [209.85.223.182])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id da80e0b6
 for <wireguard@lists.zx2c4.com>;
 Thu, 19 Apr 2018 21:21:38 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id d11-v6so412258iof.11
 for <wireguard@lists.zx2c4.com>; Thu, 19 Apr 2018 14:21:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAHLp1Ym8ZaKjJOtuKspFHfgTh4Y4yNU5FFy=ZAfjcg0p9iWhyw@mail.gmail.com>
 <20180419172828.GB2001@tuxmachine.localdomain>
In-Reply-To: <20180419172828.GB2001@tuxmachine.localdomain>
From: Christophe-Marie Duquesne <chmd@chmd.fr>
Date: Thu, 19 Apr 2018 21:21:34 +0000
Message-ID: <CAHLp1Yn8RhgxDzu-+W6GTiN=Mkwo8QMokjXeW3U_sMnuPxy6yA@mail.gmail.com>
Subject: Re: Broadcast on wireguard
To: Baptiste Jonglez <baptiste@bitsofnetworks.org>
Content-Type: multipart/alternative; boundary="000000000000a19da1056a3a2875"
Cc: wireguard@lists.zx2c4.com
Reply-To: chmd@chmd.fr
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--000000000000a19da1056a3a2875
Content-Type: text/plain; charset="UTF-8"

Hi Baptiste,

Thanks for the link! I started reading and it looks like exactly what I was
looking for.

Best,
Christophe-Marie

On Thu, Apr 19, 2018, 19:31 Baptiste Jonglez <baptiste@bitsofnetworks.org>
wrote:

> Hi,
>
> On 18-04-18, Christophe-Marie Duquesne wrote:
> > Hi list,
> >
> > Maybe the answer is obvious to some of you, but I don't quite
> > understand why wireguard does not support broadcasting, and I found no
> > clear explanation in the archive. In fact, this [1] seems to indicate
> > that implementing it would be doable, so I am wondering why this has
> > not been done.
>
> This has been further discussed here:
>
>   https://lists.zx2c4.com/pipermail/wireguard/2017-April/001177.html
>
> As far as I remember, there was no major blocking point, it was more about
> making a design/UI decision.
>
> > Could anyone explain - roughly - why this is the case? Is it for
> > security reasons? Performance? Complexity of implementation? Lack of
> > interest?
> >
> > Another possibility could be that my question is just poorly asked or
> > irrelevant, in that case I would also appreciate a hint :-)
> >
> > Best,
> > Christophe-Marie
> >
> > [1]:
> https://lists.zx2c4.com/pipermail/wireguard/2016-December/000813.html
> > _______________________________________________
> > WireGuard mailing list
> > WireGuard@lists.zx2c4.com
> > https://lists.zx2c4.com/mailman/listinfo/wireguard
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--000000000000a19da1056a3a2875
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Baptiste,<div dir=3D"auto"><br></div><div dir=3D"auto"=
>Thanks for the link! I started reading and it looks like exactly what I wa=
s looking for.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Best,</di=
v><div dir=3D"auto">Christophe-Marie</div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr">On Thu, Apr 19, 2018, 19:31 Baptiste Jonglez &lt;<a hr=
ef=3D"mailto:baptiste@bitsofnetworks.org">baptiste@bitsofnetworks.org</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">Hi,<br>
<br>
On 18-04-18, Christophe-Marie Duquesne wrote:<br>
&gt; Hi list,<br>
&gt; <br>
&gt; Maybe the answer is obvious to some of you, but I don&#39;t quite<br>
&gt; understand why wireguard does not support broadcasting, and I found no=
<br>
&gt; clear explanation in the archive. In fact, this [1] seems to indicate<=
br>
&gt; that implementing it would be doable, so I am wondering why this has<b=
r>
&gt; not been done.<br>
<br>
This has been further discussed here:<br>
<br>
=C2=A0 <a href=3D"https://lists.zx2c4.com/pipermail/wireguard/2017-April/00=
1177.html" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.zx=
2c4.com/pipermail/wireguard/2017-April/001177.html</a><br>
<br>
As far as I remember, there was no major blocking point, it was more about<=
br>
making a design/UI decision.<br>
<br>
&gt; Could anyone explain - roughly - why this is the case? Is it for<br>
&gt; security reasons? Performance? Complexity of implementation? Lack of<b=
r>
&gt; interest?<br>
&gt; <br>
&gt; Another possibility could be that my question is just poorly asked or<=
br>
&gt; irrelevant, in that case I would also appreciate a hint :-)<br>
&gt; <br>
&gt; Best,<br>
&gt; Christophe-Marie<br>
&gt; <br>
&gt; [1]: <a href=3D"https://lists.zx2c4.com/pipermail/wireguard/2016-Decem=
ber/000813.html" rel=3D"noreferrer noreferrer" target=3D"_blank">https://li=
sts.zx2c4.com/pipermail/wireguard/2016-December/000813.html</a><br>
&gt; _______________________________________________<br>
&gt; WireGuard mailing list<br>
&gt; <a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank" rel=3D"=
noreferrer">WireGuard@lists.zx2c4.com</a><br>
&gt; <a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"=
noreferrer noreferrer" target=3D"_blank">https://lists.zx2c4.com/mailman/li=
stinfo/wireguard</a><br>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank" rel=3D"noref=
errer">WireGuard@lists.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer noreferrer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinf=
o/wireguard</a><br>
</blockquote></div>

--000000000000a19da1056a3a2875--
