Return-Path: dave@natulte.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f6e0bd71
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 Feb 2017 21:24:36 +0000 (UTC)
Received: from mail-ua0-f174.google.com (mail-ua0-f174.google.com
 [209.85.217.174])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5b5ef202
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 Feb 2017 21:24:36 +0000 (UTC)
Received: by mail-ua0-f174.google.com with SMTP id y9so48531886uae.2
 for <wireguard@lists.zx2c4.com>; Sat, 11 Feb 2017 13:38:29 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20170211162758.GA4633@tuxmachine.polynome.dn42>
References: <CAMx+r7WsvfJ6j7JT9+Z5mNe=FEFwehTVNgX+7-8vnQMa5FxORg@mail.gmail.com>
 <CAHmME9q8+D7y0Hz4xOJv1MiVsq0=bUf3TgENseGEWWF2BEpx4Q@mail.gmail.com>
 <CAMx+r7VgJ0xDAy46d28Qv_Vv7vM8JO0yRbYEh6AHVWT55LEVAw@mail.gmail.com>
 <CAHmME9rumLr0V6yD=zoHk-GSN2-bCiGe644WHtt4EJvKrhtLoA@mail.gmail.com>
 <CAMx+r7VkgtkFdqkKVbeX_Pv=T1TO6KaTY-+T1iM2OphS-L8mWA@mail.gmail.com>
 <CAHmME9qkRgySY61Cqm76Lqs_f3U3V3p5YF1G0kE1CCPd9u398Q@mail.gmail.com>
 <CAMx+r7WLJ5S-Op_9dq4AY9BNmk6u7xMOwqwVoAis=_pqJX1_-g@mail.gmail.com>
 <20170211162758.GA4633@tuxmachine.polynome.dn42>
From: David Anderson <dave@natulte.net>
Date: Sat, 11 Feb 2017 13:38:08 -0800
Message-ID: <CAMx+r7VPbO5zvMYYnJ7anSf5fgg4Ofhr7V6Po-GazH1vFhVYkQ@mail.gmail.com>
Subject: Re: (Unofficial) wireguard packages for Debian Stretch (testing)
To: Baptiste Jonglez <baptiste@bitsofnetworks.org>
Content-Type: multipart/alternative; boundary=001a113ed1a2f805d005484808c9
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a113ed1a2f805d005484808c9
Content-Type: text/plain; charset=UTF-8

On Sat, Feb 11, 2017 at 8:27 AM, Baptiste Jonglez <
baptiste@bitsofnetworks.org> wrote:

> On Sat, Feb 11, 2017 at 03:48:59AM -0800, David Anderson wrote:
> > Okay, I've set up a Debian stable builder as well... However, Debian
> stable
> > has a 3.16 kernel, and wireguard-dkms requires >=3.18, so installation
> > fails. Assuming 3.18 is a hard lower-bound on kernel versions, it looks
> > like jessie will never run in-kernel wireguard. Fortunately it'll be moot
> > in a few months when stretch becomes the new stable.
>
> Jessie-backports has linux 4.9, so it's probably much simpler to require
> users to install this.
>

Oh, excellent! I'll leave the jessie builder running then.

Jason: I'll get back to you once I've looked into setting up builds for
arm, to see how to revise the instructions. Given that each distro version
is likely to be slightly different, perhaps it'd be better to just link to
a readme on packagecloud.io, to avoid cluttering the install instructions
on wireguard.io?

- Dave


>
> > On Sat, Feb 11, 2017 at 2:17 AM, Jason A. Donenfeld <Jason@zx2c4.com>
> wrote:
> >
> > > Hi Dave,
> > >
> > > Ahh right, that old debate.
> > >
> > > Jason
> > >
>
> > _______________________________________________
> > WireGuard mailing list
> > WireGuard@lists.zx2c4.com
> > https://lists.zx2c4.com/mailman/listinfo/wireguard
>
>

--001a113ed1a2f805d005484808c9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On S=
at, Feb 11, 2017 at 8:27 AM, Baptiste Jonglez <span dir=3D"ltr">&lt;<a href=
=3D"mailto:baptiste@bitsofnetworks.org" target=3D"_blank">baptiste@bitsofne=
tworks.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span cl=
ass=3D"">On Sat, Feb 11, 2017 at 03:48:59AM -0800, David Anderson wrote:<br=
>
&gt; Okay, I&#39;ve set up a Debian stable builder as well... However, Debi=
an stable<br>
&gt; has a 3.16 kernel, and wireguard-dkms requires &gt;=3D3.18, so install=
ation<br>
&gt; fails. Assuming 3.18 is a hard lower-bound on kernel versions, it look=
s<br>
&gt; like jessie will never run in-kernel wireguard. Fortunately it&#39;ll =
be moot<br>
&gt; in a few months when stretch becomes the new stable.<br>
<br>
</span>Jessie-backports has linux 4.9, so it&#39;s probably much simpler to=
 require<br>
users to install this.<br></blockquote><div><br></div><div>Oh, excellent! I=
&#39;ll leave the jessie builder running then.</div><div><br></div><div>Jas=
on: I&#39;ll get back to you once I&#39;ve looked into setting up builds fo=
r arm, to see how to revise the instructions. Given that each distro versio=
n is likely to be slightly different, perhaps it&#39;d be better to just li=
nk to a readme on <a href=3D"http://packagecloud.io">packagecloud.io</a>, t=
o avoid cluttering the install instructions on <a href=3D"http://wireguard.=
io">wireguard.io</a>?</div><div><br></div><div>- Dave</div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">
<span class=3D""><br>
&gt; On Sat, Feb 11, 2017 at 2:17 AM, Jason A. Donenfeld &lt;<a href=3D"mai=
lto:Jason@zx2c4.com">Jason@zx2c4.com</a>&gt; wrote:<br>
&gt;<br>
&gt; &gt; Hi Dave,<br>
&gt; &gt;<br>
&gt; &gt; Ahh right, that old debate.<br>
&gt; &gt;<br>
&gt; &gt; Jason<br>
&gt; &gt;<br>
<br>
</span>&gt; ______________________________<wbr>_________________<br>
&gt; WireGuard mailing list<br>
&gt; <a href=3D"mailto:WireGuard@lists.zx2c4.com">WireGuard@lists.zx2c4.com=
</a><br>
&gt; <a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"=
noreferrer" target=3D"_blank">https://lists.zx2c4.com/<wbr>mailman/listinfo=
/wireguard</a><br>
<br>
</blockquote></div><br></div></div>

--001a113ed1a2f805d005484808c9--
