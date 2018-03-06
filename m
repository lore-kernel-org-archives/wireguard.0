Return-Path: strigeus@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c9801824
 for <wireguard@lists.zx2c4.com>; Tue, 6 Mar 2018 01:35:44 +0000 (UTC)
Received: from mail-ot0-f177.google.com (mail-ot0-f177.google.com
 [74.125.82.177])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 620c9f42
 for <wireguard@lists.zx2c4.com>; Tue, 6 Mar 2018 01:35:44 +0000 (UTC)
Received: by mail-ot0-f177.google.com with SMTP id g97so16883738otg.13
 for <wireguard@lists.zx2c4.com>; Mon, 05 Mar 2018 17:45:02 -0800 (PST)
MIME-Version: 1.0
From: Ludvig Strigeus <strigeus@gmail.com>
Date: Tue, 6 Mar 2018 02:44:31 +0100
Message-ID: <CAHT-BTRX+bgN8m7V95QqnKOD8g6vp3-+h_JozG5motqS0MLiZQ@mail.gmail.com>
Subject: Re: Tunsafe Windows client for wireguard (not opensource yet they say
To: wireguard@lists.zx2c4.com
Content-Type: multipart/alternative; boundary="94eb2c1c1ce2493a530566b497f9"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--94eb2c1c1ce2493a530566b497f9
Content-Type: text/plain; charset="UTF-8"

Jason A. Donenfeld wrote:
> Please stay away from this software, and generally be wary of >
closed-source WireGuard implementations trying to fill the void.* This **>
one was written by a community-unfriendly proprietary author*, and > we've
got little way of ensuring protocol compliance or basic > security. *Especially
from my discussions from him, it's clear what **> he's up to, and this
seems like some nastiness.* Should I spend my time > reverse engineering
this software and discovering zero-days? Probably > not a good use of my
time, despite my usual love of this sort of thing.

First of all could you change tone a little bit, personal attacks and
rudeness do not have a place in those discussions unless you actually
back them up with facts.

Never once during our IRC chat did I say something negative about you,
instead I wrote several times that WireGuard was fanastic and you're
an inspiring person.

I'd be happy to share IRC logs of our brief communication with this list
to prove my point, but your attitude appears to be that everything that
is not open source, and hosted under the WireGuard brand/webpage, is
community-unfriendly and nasty. Is that what you mean by community
unfriendly?

I said that if I release TunSafe I probably want it under my own name,
on my own website, where I'm free to develop the project in any
direction I want, without pressure to release it as open source.
I don't want to spend weeks or months building a client for it to end
up on some semi-hidden place on wireguard.com just because you
prefer Rust or Go, where my contribution may get diminished into
nothing at all.

How would you deal with Microsoft if they wanted to add a closed
source implementation of WireGuard in Windows. Would they also
be considered a community-unfriendly proprietary author with a
clear agenda of nastiness?

Is this how you envision how things would work should WireGuard
become a future RFC / Internet Standard? The only accepted
implementation would be that one from yourself? No companies
would be allowed to implement it or take part in discussions?
This is not how Internet protocols typically work.

Given these constraints, I'm happy to participate in whatever
protocol discussions or community related questions that I'm
in the capacity to answer or contribute to.

I totally understand your point about open source applications
being easier to audit, especially important when it's related
to security. I share this view, and will address it eventually,
in some way. Either just the wireguard protocol layer or the
whole UI too.

Though, your behavior this past day has confirmed even more that
I'm not interested in being a slave in a dictatorship. You've
ignored my attempts at communications for 2 weeks. You ban me
from #wireguard IRC even though I haven't talked there for weeks,
but just because I'm in there and not being as much of a die-hard
open-source evangelist as you are.

Jason A. Donenfeld wrote:
> This isn't the source code of tunsafe. This is the source code of the >
OpenVPN Windows tuntap kernel driver, *which has been hacked up in **>
various ways for tunsafe*. That's a super scary driver, by the way.

Incorrect. The driver files are not modified at all. They still
carry OpenVPN's codesigning signature. You can see this on the
driver install prompt:
https://tunsafe.com/img/quickstart-driver-confirm.png

I agree that the driver is scary, I think I even found some
potential OOB memory accesses in it from a quick glance. However,
this is the best driver the community has at this point in time,
and even your own userspace implementations of WG use it. I'd
be happy to improve it but then I need an expensive driver
codesigning certificate in order to load it into the kernel.

/Ludde

--94eb2c1c1ce2493a530566b497f9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr"><div><span sty=
le=3D"font-family:monospace,monospace">Jason A. Donenfeld wrote:</span><br>=
</div><span style=3D"font-family:monospace,monospace;color:rgb(0,0,0);white=
-space:pre-wrap">&gt; Please stay away from this software, and generally be=
 wary of
</span><span style=3D"font-family:monospace,monospace;color:rgb(0,0,0);whit=
e-space:pre-wrap">&gt; closed-source WireGuard implementations trying to fi=
ll the void.<b> This
</b></span><span style=3D"font-family:monospace,monospace;color:rgb(0,0,0);=
white-space:pre-wrap"><b>&gt; one was written by a community-unfriendly pro=
prietary author</b>, and
</span><span style=3D"font-family:monospace,monospace;color:rgb(0,0,0);whit=
e-space:pre-wrap">&gt; we&#39;ve got little way of ensuring protocol compli=
ance or basic
</span><span style=3D"font-family:monospace,monospace;color:rgb(0,0,0);whit=
e-space:pre-wrap">&gt; security. <b>Especially from my discussions from him=
, it&#39;s clear what
</b></span><span style=3D"font-family:monospace,monospace;color:rgb(0,0,0);=
white-space:pre-wrap"><b>&gt; he&#39;s up to, and this seems like some nast=
iness.</b> Should I spend my time
</span><span style=3D"font-family:monospace,monospace;color:rgb(0,0,0);whit=
e-space:pre-wrap">&gt; reverse engineering this software and discovering ze=
ro-days? Probably
</span><span style=3D"font-family:monospace,monospace;color:rgb(0,0,0);whit=
e-space:pre-wrap">&gt; not a good use of my time, despite my usual love of =
this sort of</span><span style=3D"font-family:monospace,monospace;color:rgb=
(0,0,0);white-space:pre-wrap"> thing.</span><div><font color=3D"#000000" fa=
ce=3D"monospace, monospace"><span style=3D"white-space:pre-wrap"><br></span=
></font></div><div><font color=3D"#000000" face=3D"monospace, monospace"><s=
pan style=3D"white-space:pre-wrap">First of all could you change tone a lit=
tle bit, personal attacks and</span></font></div><div><font color=3D"#00000=
0" face=3D"monospace, monospace"><span style=3D"white-space:pre-wrap">ruden=
ess do </span></font><span style=3D"white-space:pre-wrap;color:rgb(0,0,0);f=
ont-family:monospace,monospace">not have a place in those discussions unles=
s you actually</span></div><div><span style=3D"white-space:pre-wrap;color:r=
gb(0,0,0);font-family:monospace,monospace">back them up </span><span style=
=3D"white-space:pre-wrap;color:rgb(0,0,0);font-family:monospace,monospace">=
with facts. </span></div><div><font color=3D"#000000" face=3D"monospace, mo=
nospace"><span style=3D"white-space:pre-wrap"><br></span></font></div><div>=
<font color=3D"#000000" face=3D"monospace, monospace"><span style=3D"white-=
space:pre-wrap">Never once during our IRC chat did I say something negative=
 about you,</span></font></div><div><font color=3D"#000000" face=3D"monospa=
ce, monospace"><span style=3D"white-space:pre-wrap">instead I wrote several=
 times that WireGuard was fanastic and you&#39;re</span></font></div><div><=
font color=3D"#000000" face=3D"monospace, monospace"><span style=3D"white-s=
pace:pre-wrap">an inspiring person. </span></font></div><div><font color=3D=
"#000000" face=3D"monospace, monospace"><span style=3D"white-space:pre-wrap=
"><br></span></font></div><div><font color=3D"#000000" face=3D"monospace, m=
onospace"><span style=3D"white-space:pre-wrap">I&#39;d be happy to share IR=
C logs of our brief communication with this list</span></font></div><div><f=
ont color=3D"#000000" face=3D"monospace, monospace"><span style=3D"white-sp=
ace:pre-wrap">to prove my point, but your </span></font><span style=3D"whit=
e-space:pre-wrap;color:rgb(0,0,0);font-family:monospace,monospace">attitude=
 appears to be that everything that</span></div><div><span style=3D"white-s=
pace:pre-wrap;color:rgb(0,0,0);font-family:monospace,monospace">is not open=
 source, and </span><span style=3D"white-space:pre-wrap;color:rgb(0,0,0);fo=
nt-family:monospace,monospace">hosted under the WireGuard brand/webpage, is=
</span></div><div><span style=3D"color:rgb(0,0,0);font-family:monospace,mon=
ospace;white-space:pre-wrap">community-</span><span style=3D"color:rgb(0,0,=
0);font-family:monospace,monospace;white-space:pre-wrap">unfriendly and nas=
ty. Is that what you mean by community</span></div><div><span style=3D"colo=
r:rgb(0,0,0);font-family:monospace,monospace;white-space:pre-wrap">unfriend=
ly?</span></div><div><span style=3D"color:rgb(0,0,0);font-family:monospace,=
monospace;white-space:pre-wrap"><br></span></div><div><span style=3D"color:=
rgb(0,0,0);font-family:monospace,monospace;white-space:pre-wrap">I said tha=
t if I release TunSafe I probably want it under my own </span><span style=
=3D"color:rgb(0,0,0);font-family:monospace,monospace;white-space:pre-wrap">=
name,</span><br></div><div><span style=3D"color:rgb(0,0,0);font-family:mono=
space,monospace;white-space:pre-wrap">on my own website, where I&#39;m free=
 to develop the project in any</span></div><div><span style=3D"color:rgb(0,=
0,0);font-family:monospace,monospace;white-space:pre-wrap">direction I want=
, without pressure to release it as open source. </span></div><div><span st=
yle=3D"color:rgb(0,0,0);font-family:monospace,monospace;white-space:pre-wra=
p">I</span><span style=3D"color:rgb(0,0,0);font-family:monospace,monospace;=
white-space:pre-wrap"> don&#39;t want to spend weeks </span><span style=3D"=
color:rgb(0,0,0);font-family:monospace,monospace;white-space:pre-wrap">or <=
/span><span style=3D"color:rgb(0,0,0);font-family:monospace,monospace;white=
-space:pre-wrap">months </span><span style=3D"color:rgb(0,0,0);font-family:=
monospace,monospace;white-space:pre-wrap">building a </span><span style=3D"=
color:rgb(0,0,0);font-family:monospace,monospace;white-space:pre-wrap">clie=
nt for </span><span style=3D"color:rgb(0,0,0);font-family:monospace,monospa=
ce;white-space:pre-wrap">it to end</span></div><div><font face=3D"monospace=
, monospace"><span style=3D"color:rgb(0,0,0);white-space:pre-wrap">up on so=
me semi-hidden </span><span style=3D"color:rgb(0,0,0);white-space:pre-wrap"=
>place </span><span style=3D"color:rgb(0,0,0);white-space:pre-wrap">on </sp=
an><a href=3D"http://wireguard.com" target=3D"_blank" style=3D"white-space:=
pre-wrap">wireguard.com</a>=C2=A0just because you</font></div><div><font fa=
ce=3D"monospace, monospace">prefer Rust or Go,=C2=A0</font><span style=3D"f=
ont-family:monospace,monospace;color:rgb(0,0,0);white-space:pre-wrap">where=
 </span><span style=3D"font-family:monospace,monospace;color:rgb(0,0,0);whi=
te-space:pre-wrap">my contribution may </span><span style=3D"font-family:mo=
nospace,monospace;color:rgb(0,0,0);white-space:pre-wrap">get diminished int=
o</span></div><div><span style=3D"font-family:monospace,monospace;color:rgb=
(0,0,0);white-space:pre-wrap">nothing at all. </span></div><div><br></div><=
div><span style=3D"color:rgb(0,0,0);font-family:monospace,monospace;white-s=
pace:pre-wrap">How would you deal with Microsoft if they wanted to add a cl=
osed</span><br></div><div><span style=3D"color:rgb(0,0,0);font-family:monos=
pace,monospace;white-space:pre-wrap">source implementation of WireGuard in =
Windows. Would they also</span></div><div><span style=3D"color:rgb(0,0,0);f=
ont-family:monospace,monospace;white-space:pre-wrap">be considered a commun=
ity-unfriendly proprietary author with a </span></div><div><span style=3D"c=
olor:rgb(0,0,0);font-family:monospace,monospace;white-space:pre-wrap">clear=
 agenda of nastiness?</span></div><div><span style=3D"color:rgb(0,0,0);font=
-family:monospace,monospace;white-space:pre-wrap"><br></span></div><div><sp=
an style=3D"color:rgb(0,0,0);font-family:monospace,monospace;white-space:pr=
e-wrap">Is this how you envision how things would work should WireGuard</sp=
an></div><div><span style=3D"color:rgb(0,0,0);font-family:monospace,monospa=
ce;white-space:pre-wrap">become a </span><span style=3D"color:rgb(0,0,0);fo=
nt-family:monospace,monospace;white-space:pre-wrap">future RFC / Internet S=
tandard? The only accepted</span></div><div><span style=3D"color:rgb(0,0,0)=
;font-family:monospace,monospace;white-space:pre-wrap">implementation would=
 be that one from yourself? No companies</span></div><div><span style=3D"co=
lor:rgb(0,0,0);font-family:monospace,monospace;white-space:pre-wrap">would =
be allowed to implement it or take part in discussions?</span></div><div><s=
pan style=3D"color:rgb(0,0,0);font-family:monospace,monospace;white-space:p=
re-wrap">This is not </span><span style=3D"color:rgb(0,0,0);font-family:mon=
ospace,monospace;white-space:pre-wrap">how Internet protocols typically wor=
k.</span></div><div><br></div><div><span style=3D"color:rgb(0,0,0);font-fam=
ily:monospace,monospace;white-space:pre-wrap">Given these constraints, I&#3=
9;m happy to participate in whatever </span><br></div><div><span style=3D"c=
olor:rgb(0,0,0);font-family:monospace,monospace;white-space:pre-wrap">proto=
col discussions or community related questions that I&#39;m </span></div><d=
iv><span style=3D"color:rgb(0,0,0);font-family:monospace,monospace;white-sp=
ace:pre-wrap">in the capacity to answer or contribute to.</span></div><div>=
<br></div><div>

<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:sm=
all;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norma=
l;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;te=
xt-transform:none;white-space:normal;word-spacing:0px;text-decoration-style=
:initial;text-decoration-color:initial"><span style=3D"color:rgb(0,0,0);fon=
t-family:monospace,monospace;white-space:pre-wrap">I totally understand you=
r point about open source applications</span></div><div style=3D"color:rgb(=
34,34,34);font-family:arial,sans-serif;font-size:small;font-style:normal;fo=
nt-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter=
-spacing:normal;text-align:start;text-indent:0px;text-transform:none;white-=
space:normal;word-spacing:0px;text-decoration-style:initial;text-decoration=
-color:initial"><span style=3D"color:rgb(0,0,0);font-family:monospace,monos=
pace;white-space:pre-wrap">being easier to audit, especially important when=
 it&#39;s related</span></div><div style=3D"color:rgb(34,34,34);font-family=
:arial,sans-serif;font-size:small;font-style:normal;font-variant-ligatures:=
normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-=
align:start;text-indent:0px;text-transform:none;white-space:normal;word-spa=
cing:0px;text-decoration-style:initial;text-decoration-color:initial"><span=
 style=3D"color:rgb(0,0,0);font-family:monospace,monospace;white-space:pre-=
wrap">to security. I share this view, and will address it eventually,</span=
></div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-=
size:small;font-style:normal;font-variant-ligatures:normal;font-variant-cap=
s:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent=
:0px;text-transform:none;white-space:normal;word-spacing:0px;text-decoratio=
n-style:initial;text-decoration-color:initial"><span style=3D"color:rgb(0,0=
,0);font-family:monospace,monospace;white-space:pre-wrap">in some way. Eith=
er just the wireguard protocol layer or the</span></div><div style=3D"color=
:rgb(34,34,34);font-family:arial,sans-serif;font-size:small;font-style:norm=
al;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;l=
etter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;w=
hite-space:normal;word-spacing:0px;text-decoration-style:initial;text-decor=
ation-color:initial"><span style=3D"color:rgb(0,0,0);font-family:monospace,=
monospace;white-space:pre-wrap">whole </span><span style=3D"color:rgb(0,0,0=
);font-family:monospace,monospace;white-space:pre-wrap">UI too.</span></div=
></div><div><span style=3D"color:rgb(0,0,0);font-family:monospace,monospace=
;white-space:pre-wrap"><br></span></div><div><span style=3D"color:rgb(0,0,0=
);font-family:monospace,monospace;white-space:pre-wrap">Though, your behavi=
or this past day has confirmed even more that</span></div><div><span style=
=3D"color:rgb(0,0,0);font-family:monospace,monospace;white-space:pre-wrap">=
I&#39;m not </span><span style=3D"color:rgb(0,0,0);font-family:monospace,mo=
nospace;white-space:pre-wrap">interested in being a slave in a dictatorship=
. You&#39;ve</span></div><div><span style=3D"color:rgb(0,0,0);font-family:m=
onospace,monospace;white-space:pre-wrap">ignored </span><span style=3D"colo=
r:rgb(0,0,0);font-family:monospace,monospace;white-space:pre-wrap">my attem=
pts at communications for 2 weeks. You ban me</span></div><div><span style=
=3D"color:rgb(0,0,0);font-family:monospace,monospace;white-space:pre-wrap">=
from #wireguard </span><span style=3D"color:rgb(0,0,0);font-family:monospac=
e,monospace;white-space:pre-wrap">IRC even though I haven&#39;t talked ther=
e for weeks,</span></div><div><span style=3D"color:rgb(0,0,0);font-family:m=
onospace,monospace;white-space:pre-wrap">but just because I&#39;m in there =
and not being as much of a </span><span style=3D"color:rgb(0,0,0);font-fami=
ly:monospace,monospace;white-space:pre-wrap">die-hard</span></div><div><spa=
n style=3D"color:rgb(0,0,0);font-family:monospace,monospace;white-space:pre=
-wrap">open-source </span><span style=3D"color:rgb(0,0,0);font-family:monos=
pace,monospace;white-space:pre-wrap">evangelist as you are.</span></div><di=
v><br></div><div><span style=3D"font-family:monospace,monospace">Jason A. D=
onenfeld wrote:</span><br></div><div><span style=3D"color:rgb(0,0,0);white-=
space:pre-wrap;font-family:monospace,monospace">&gt; This isn&#39;t the sou=
rce code of tunsafe. This is the source code of the
</span><span style=3D"color:rgb(0,0,0);white-space:pre-wrap;font-family:mon=
ospace,monospace">&gt; OpenVPN Windows tuntap kernel driver, </span><b styl=
e=3D"color:rgb(0,0,0);white-space:pre-wrap;font-family:monospace,monospace"=
>which has been hacked up in
</b><b style=3D"color:rgb(0,0,0);white-space:pre-wrap;font-family:monospace=
,monospace">&gt; various ways for tunsafe</b><span style=3D"color:rgb(0,0,0=
);white-space:pre-wrap;font-family:monospace,monospace">. That&#39;s a supe=
r scary driver, by the way.</span></div><div><div><font face=3D"monospace, =
monospace"><br></font></div><div><font face=3D"monospace, monospace">

Incorrect. The driver files are not modified at all. They still</font></div=
><div><font face=3D"monospace, monospace">carry OpenVPN&#39;s codesigning s=
ignature. You can see this on the</font></div><div><font face=3D"monospace,=
 monospace">driver install prompt:</font></div><div><span style=3D"font-fam=
ily:monospace,monospace"><a href=3D"https://tunsafe.com/img/quickstart-driv=
er-confirm.png" target=3D"_blank">https://tunsafe.com/img/quicks<wbr>tart-d=
river-confirm.png</a></span><br></div><div><span style=3D"font-family:monos=
pace,monospace"><br></span></div><div><span style=3D"font-family:monospace,=
monospace">I agree that the driver is scary, I think I even found some=C2=
=A0</span></div><div><span style=3D"font-family:monospace,monospace">potent=
ial OOB=C2=A0</span><span style=3D"font-family:monospace,monospace">memory =
accesses in it from a quick glance. However,=C2=A0</span></div><div><span s=
tyle=3D"font-family:monospace,monospace">this is the best driver the=C2=A0<=
/span><span style=3D"font-family:monospace,monospace">community has at this=
 point in time,</span></div><div><span style=3D"font-family:monospace,monos=
pace">and even your own userspace=C2=A0</span><span style=3D"font-family:mo=
nospace,monospace">implementations of WG use it. I&#39;d</span></div><div><=
span style=3D"font-family:monospace,monospace">be happy to improve it but t=
hen I need an expensive driver</span></div><div><font face=3D"monospace, mo=
nospace">codesigning=C2=A0certificate in order to load it into the kernel.<=
/font></div><div><font face=3D"monospace, monospace"><br></font></div></div=
><div><font face=3D"monospace, monospace">/Ludde</font></div><div><br></div=
></div>
</div><br></div>

--94eb2c1c1ce2493a530566b497f9--
