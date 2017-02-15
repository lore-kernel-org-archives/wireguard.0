Return-Path: pawel.pietkiewicz@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b54c9e48
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 Feb 2017 15:50:10 +0000 (UTC)
Received: from mail-yw0-f172.google.com (mail-yw0-f172.google.com
 [209.85.161.172])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b8dfc38b
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 Feb 2017 15:50:10 +0000 (UTC)
Received: by mail-yw0-f172.google.com with SMTP id u68so83683069ywg.0
 for <wireguard@lists.zx2c4.com>; Wed, 15 Feb 2017 07:50:16 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <8737ffmrnz.fsf@alice.fifthhorseman.net>
References: <CAHmME9pjv8xWoShiD4WhijExsBq3Q4ovCwbLfkOo7xOJ85+qRw@mail.gmail.com>
 <8737ffmrnz.fsf@alice.fifthhorseman.net>
From: Paul Pietkiewicz <pawel.pietkiewicz@gmail.com>
Date: Wed, 15 Feb 2017 07:49:55 -0800
Message-ID: <CADLc8pAONQboJvpwKKxQAgdQJGkqC8unw=Ef+Ygd4hc3oz=SbQ@mail.gmail.com>
Subject: Re: Wanted: Novice Guides
To: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
Content-Type: multipart/alternative; boundary=001a114e7ed2013f78054893a3d6
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a114e7ed2013f78054893a3d6
Content-Type: text/plain; charset=UTF-8

I think it would be brilliant to see an guide setting up a server on a
OpenWRT router, and then setting up a Mac laptop as a roaming client that
could connect to the network as required. Unfortunately I do not have much
time to help with this, but I believe that this would be a very common use
case.

Cheers,
Paul

On Wed, Feb 15, 2017 at 6:53 AM, Daniel Kahn Gillmor <dkg@fifthhorseman.net>
wrote:

> Hi all--
>
> On Wed 2017-02-15 09:05:29 -0500, Jason A. Donenfeld wrote:
> > As WireGuard gets more and more popular, I have more people contacting
> > me about novice guides and blog entries and step by step things. If
> > anybody would be up for writing these or assisting with it, it would
> > be much appreciated. Probably better to tackle this before horribly
> > written guides with bad advice fill the void instead.
>
> Agreed about wanting better-written guides to pre-empt terrible ones :)
>
> A good "novice guide" usually has the following pattern:
>
>  a) Present the specific goal of the guide at a high level (if you think
>     want X, this is the guide for you) -- the goal should not be
>     "install WireGuard", which is meaningless to a novice, but something
>     like one of the following:
>
>   * have two machines establish a secure connection between each other
>     across the public Internet
>
>   * give my laptop an IP address on my home network no matter where I am
>
>   * allow co-workers to access office resources from the road
>
>   * run a "virtual office" offering secure connections between the
>     computers of multiple co-workers who are scattered and have no
>     central physical location
>
>   * operate a public-facing encrypted Internet proxy service
>     (a.k.a. "VPN provider")
>
>  b) Present frequently-confused *non* use cases (if you think you want
>     these other things, this is not your guide)
>
>  c) Document assumed platform details (if your examples are only known to
>     work on Ubuntu 16.10, say so!)
>
>  d) Document steps to take to achieve the goal (these should be very
>     simple.  If it's more than 5 steps, the tools or the platform should
>     probably be improved)
>
>  e) Diagnostics, troubleshooting and debugging (again, should be
>     relatively minimal, but should include at least how to check that
>     things are working, what you might see if they're not working, and
>     recovery from common failure modes)
>
>  f) Outbound links to learn more (this should include suggestions about
>     where to file bug reports, and how to follow up on this mailing list)
>
>
> choosing (a) and (c) carefully are kind of critical for even knowing
> where to begin if you want to write such a guide for novices.
>
> Those of us who are not novices understand that tools like WireGuard can
> be used on a lot of different platforms (c) to perform a lot of
> different tasks (a), but how those tasks are carried out might have more
> to do with policy details (where do you get the peer's public keys from?
> how do you verify that they're the right public keys?  How do peers find
> each other if there are no stable public IP addresses?  How do you
> allocate IP addresses for the wg interfaces?  Which traffic should each
> peer route over which wg interfaces?) than with WireGuard itself.
>
> The fact that the WireGuard-specific instructions for any such guide are
> likely to be minimal is one of the strengths of WireGuard, i think.  But
> that also means that any novice guide is going to be at least as much
> about non-WireGuard details as it is about WireGuard itself.
>
> Jason, what kinds of novice guides are people asking for?  What kinds of
> guides are people on this list interested in writing?
>
>     --dkg
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>
>

--001a114e7ed2013f78054893a3d6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I think it would be brilliant to see an guide setting up a=
 server on a OpenWRT router, and then setting up a Mac laptop as a roaming =
client that could connect to the network as required. Unfortunately I do no=
t have much time to help with this, but I believe that this would be a very=
 common use case.<div><br></div><div>Cheers,</div><div>Paul</div></div><div=
 class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Wed, Feb 15, 2017 =
at 6:53 AM, Daniel Kahn Gillmor <span dir=3D"ltr">&lt;<a href=3D"mailto:dkg=
@fifthhorseman.net" target=3D"_blank">dkg@fifthhorseman.net</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">Hi all--<br>
<span class=3D""><br>
On Wed 2017-02-15 09:05:29 -0500, Jason A. Donenfeld wrote:<br>
&gt; As WireGuard gets more and more popular, I have more people contacting=
<br>
&gt; me about novice guides and blog entries and step by step things. If<br=
>
&gt; anybody would be up for writing these or assisting with it, it would<b=
r>
&gt; be much appreciated. Probably better to tackle this before horribly<br=
>
&gt; written guides with bad advice fill the void instead.<br>
<br>
</span>Agreed about wanting better-written guides to pre-empt terrible ones=
 :)<br>
<br>
A good &quot;novice guide&quot; usually has the following pattern:<br>
<br>
=C2=A0a) Present the specific goal of the guide at a high level (if you thi=
nk<br>
=C2=A0 =C2=A0 want X, this is the guide for you) -- the goal should not be<=
br>
=C2=A0 =C2=A0 &quot;install WireGuard&quot;, which is meaningless to a novi=
ce, but something<br>
=C2=A0 =C2=A0 like one of the following:<br>
<br>
=C2=A0 * have two machines establish a secure connection between each other=
<br>
=C2=A0 =C2=A0 across the public Internet<br>
<br>
=C2=A0 * give my laptop an IP address on my home network no matter where I =
am<br>
<br>
=C2=A0 * allow co-workers to access office resources from the road<br>
<br>
=C2=A0 * run a &quot;virtual office&quot; offering secure connections betwe=
en the<br>
=C2=A0 =C2=A0 computers of multiple co-workers who are scattered and have n=
o<br>
=C2=A0 =C2=A0 central physical location<br>
<br>
=C2=A0 * operate a public-facing encrypted Internet proxy service<br>
=C2=A0 =C2=A0 (a.k.a. &quot;VPN provider&quot;)<br>
<br>
=C2=A0b) Present frequently-confused *non* use cases (if you think you want=
<br>
=C2=A0 =C2=A0 these other things, this is not your guide)<br>
<br>
=C2=A0c) Document assumed platform details (if your examples are only known=
 to<br>
=C2=A0 =C2=A0 work on Ubuntu 16.10, say so!)<br>
<br>
=C2=A0d) Document steps to take to achieve the goal (these should be very<b=
r>
=C2=A0 =C2=A0 simple.=C2=A0 If it&#39;s more than 5 steps, the tools or the=
 platform should<br>
=C2=A0 =C2=A0 probably be improved)<br>
<br>
=C2=A0e) Diagnostics, troubleshooting and debugging (again, should be<br>
=C2=A0 =C2=A0 relatively minimal, but should include at least how to check =
that<br>
=C2=A0 =C2=A0 things are working, what you might see if they&#39;re not wor=
king, and<br>
=C2=A0 =C2=A0 recovery from common failure modes)<br>
<br>
=C2=A0f) Outbound links to learn more (this should include suggestions abou=
t<br>
=C2=A0 =C2=A0 where to file bug reports, and how to follow up on this maili=
ng list)<br>
<br>
<br>
choosing (a) and (c) carefully are kind of critical for even knowing<br>
where to begin if you want to write such a guide for novices.<br>
<br>
Those of us who are not novices understand that tools like WireGuard can<br=
>
be used on a lot of different platforms (c) to perform a lot of<br>
different tasks (a), but how those tasks are carried out might have more<br=
>
to do with policy details (where do you get the peer&#39;s public keys from=
?<br>
how do you verify that they&#39;re the right public keys?=C2=A0 How do peer=
s find<br>
each other if there are no stable public IP addresses?=C2=A0 How do you<br>
allocate IP addresses for the wg interfaces?=C2=A0 Which traffic should eac=
h<br>
peer route over which wg interfaces?) than with WireGuard itself.<br>
<br>
The fact that the WireGuard-specific instructions for any such guide are<br=
>
likely to be minimal is one of the strengths of WireGuard, i think.=C2=A0 B=
ut<br>
that also means that any novice guide is going to be at least as much<br>
about non-WireGuard details as it is about WireGuard itself.<br>
<br>
Jason, what kinds of novice guides are people asking for?=C2=A0 What kinds =
of<br>
guides are people on this list interested in writing?<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
=C2=A0 =C2=A0 --dkg<br>
</font></span><br>______________________________<wbr>_________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com">WireGuard@lists.zx2c4.com</a><=
br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/<wbr>mailman/listinfo/wire=
guard</a><br>
<br></blockquote></div><br></div>

--001a114e7ed2013f78054893a3d6--
