Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f856e19a
 for <wireguard@lists.zx2c4.com>;
 Wed, 23 May 2018 22:34:16 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9b5e1a8c
 for <wireguard@lists.zx2c4.com>;
 Wed, 23 May 2018 22:34:16 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c468ecbe
 for <wireguard@lists.zx2c4.com>;
 Wed, 23 May 2018 22:33:03 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id aa91e891
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 23 May 2018 22:33:03 +0000 (UTC)
Received: by mail-ot0-f179.google.com with SMTP id m11-v6so27148244otf.3
 for <wireguard@lists.zx2c4.com>; Wed, 23 May 2018 15:35:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAHmME9rJonVbSRHCPy0W7Pr=vmJoMbVTHbGw0C1xwBze4Px7uA@mail.gmail.com>
 <CAKYr3zzm6E_KNXA3acW7QcJWHh1gw3+Laxh2fN+AS3E0LPn0gg@mail.gmail.com>
 <CAHmME9q7Bcigcn5-sEK3=pnuyfDbxxc=HKg4qBCNe_Mj+cLjfg@mail.gmail.com>
 <05f62a24-2683-3a96-9885-9f51fede4649@higgsboson.tk>
In-Reply-To: <05f62a24-2683-3a96-9885-9f51fede4649@higgsboson.tk>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 24 May 2018 00:35:20 +0200
Message-ID: <CAHmME9oFQHorZwcbGSpmoGf8uMp6zLrSFrt37eAMg2i5NzTBrQ@mail.gmail.com>
Subject: Re: WireGuard for FreeBSD
To: =?UTF-8?Q?J=C3=B6rg_Thalheim?= <joerg@higgsboson.tk>
Content-Type: multipart/alternative; boundary="000000000000138299056ce72754"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--000000000000138299056ce72754
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 24, 2018, 00:22 J=C3=B6rg Thalheim <joerg@higgsboson.tk> wrote:

> On 2018-05-22 02:44, Jason A. Donenfeld wrote:
> > On Tue, May 22, 2018 at 2:33 AM, Outback Dingo <outbackdingo@gmail.com>
> wrote:
> > I too would prefer this, and maybe at some point down the line I'll
> > put some real time and effort into porting WireGuard from the Linux
> > kernel to kFreeBSD. But it's not the case that it's "not that hard";
> > doing so will be a pretty serious undertaking. That's going to take a
> > lot of time. Until that day arrives, what you speak of doesn't exist.
> > What we have instead today is tons of hard work that's gone into
> > bringing a userspace implementation.
> >
> > So please, don't derail the current efforts in favor of an effort that
> > doesn't even exist at the moment.
>
> Submitting ports here worked for me in the past:
>
>   https://bugs.freebsd.org/bugzilla/query.cgi
>
> They are not picky usually. I am not using FreeBSD these days so.
>

Looks like things are underway and mostly done now, with the remaining
blocker being me tagging a snapshot, which I plan to do soon.





> > _______________________________________________
> > WireGuard mailing list
> > WireGuard@lists.zx2c4.com
> > https://lists.zx2c4.com/mailman/listinfo/wireguard
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--000000000000138299056ce72754
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div data-smartmail=3D"gmail_signature"><br></div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr">On Thu, May 24, 2018, 00:22 J=
=C3=B6rg Thalheim &lt;<a href=3D"mailto:joerg@higgsboson.tk">joerg@higgsbos=
on.tk</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 2018-05-22 =
02:44, Jason A. Donenfeld wrote:<br>
&gt; On Tue, May 22, 2018 at 2:33 AM, Outback Dingo &lt;<a href=3D"mailto:o=
utbackdingo@gmail.com" target=3D"_blank" rel=3D"noreferrer">outbackdingo@gm=
ail.com</a>&gt; wrote:<br>
&gt; I too would prefer this, and maybe at some point down the line I&#39;l=
l<br>
&gt; put some real time and effort into porting WireGuard from the Linux<br=
>
&gt; kernel to kFreeBSD. But it&#39;s not the case that it&#39;s &quot;not =
that hard&quot;;<br>
&gt; doing so will be a pretty serious undertaking. That&#39;s going to tak=
e a<br>
&gt; lot of time. Until that day arrives, what you speak of doesn&#39;t exi=
st.<br>
&gt; What we have instead today is tons of hard work that&#39;s gone into<b=
r>
&gt; bringing a userspace implementation.<br>
&gt;<br>
&gt; So please, don&#39;t derail the current efforts in favor of an effort =
that<br>
&gt; doesn&#39;t even exist at the moment.<br>
<br>
Submitting ports here worked for me in the past:<br>
<br>
=C2=A0 <a href=3D"https://bugs.freebsd.org/bugzilla/query.cgi" rel=3D"noref=
errer noreferrer" target=3D"_blank">https://bugs.freebsd.org/bugzilla/query=
.cgi</a><br>
<br>
They are not picky usually. I am not using FreeBSD these days so.<br></bloc=
kquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Looks like=
 things are underway and mostly done now, with the remaining blocker being =
me tagging a snapshot, which I plan to do soon.</div><div dir=3D"auto"><br>=
</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"a=
uto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">
<br>
&gt; _______________________________________________<br>
&gt; WireGuard mailing list<br>
&gt; <a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank" rel=3D"=
noreferrer">WireGuard@lists.zx2c4.com</a><br>
&gt; <a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"=
noreferrer noreferrer" target=3D"_blank">https://lists.zx2c4.com/mailman/li=
stinfo/wireguard</a><br>
<br>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank" rel=3D"noref=
errer">WireGuard@lists.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer noreferrer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinf=
o/wireguard</a><br>
</blockquote></div></div></div>

--000000000000138299056ce72754--
