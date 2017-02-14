Return-Path: dave@natulte.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 32893f63
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Feb 2017 04:41:58 +0000 (UTC)
Received: from mail-vk0-f44.google.com (mail-vk0-f44.google.com
 [209.85.213.44])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0b364e54
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Feb 2017 04:41:58 +0000 (UTC)
Received: by mail-vk0-f44.google.com with SMTP id k127so73718565vke.0
 for <wireguard@lists.zx2c4.com>; Mon, 13 Feb 2017 20:56:07 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <874lzzqai9.fsf@alice.fifthhorseman.net>
References: <CAMx+r7WsvfJ6j7JT9+Z5mNe=FEFwehTVNgX+7-8vnQMa5FxORg@mail.gmail.com>
 <874lzzqai9.fsf@alice.fifthhorseman.net>
From: David Anderson <dave@natulte.net>
Date: Mon, 13 Feb 2017 20:55:45 -0800
Message-ID: <CAMx+r7XsHgrxy+1T4ndqzSebA6Ds4XTjQrD9VmoCWAtJkLygHw@mail.gmail.com>
Subject: Re: (Unofficial) wireguard packages for Debian Stretch (testing)
To: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
Content-Type: multipart/alternative; boundary=001a11415e88b491660548766155
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a11415e88b491660548766155
Content-Type: text/plain; charset=UTF-8

On Sun, Feb 12, 2017 at 3:01 PM, Daniel Kahn Gillmor <dkg@fifthhorseman.net>
wrote:

> On Fri 2017-02-10 19:23:50 -0500, David Anderson wrote:
> > In case it's of use to anyone, I've built wireguard packages for Debian
> > testing. I wanted to play with wireguard on my Debian Stretch systems,
> but
> > wireguard is currently locked to Sid only until 1.0 brings API stability
> > guarantees.
> >
> > So, I set up a cronjob that rebuilds the Sid source package on a Stretch
> > system, and the result is wireguard packages that track the latest
> release,
> > but don't pull in unstable versions of libc and whatnot when you try to
> > install them, as would happen if you tried to install via package
> pinning.
> >
> > Naturally, you have only my word that the packages are unmodified
> rebuilds
> > of Debian's original package, and you're trusting packagecloud to not
> > tamper with the packages (it's their signing keys, not mine) so caveat
> > emptor. It works for me, it might work for you as well.
> >
> > With the warnings and disclaimers out of the way, here's the repo:
> > https://packagecloud.io/danderson/wireguard?filter=debs
>
> I appreciate your interest in getting wider distribution for wireguard,
> David, but i'm not convinced this approach makes much sense.
>
> It seems like a lot of extra work compared to just putting wireguard
> into stretch-backports once stretch is released.
>

"Once stretch is released" could be a few months still, right? It's only
just gone into final freeze. I agree that once it's released, backports is
definitely the right way to distribute.


> Until stretch releases, people running testing should be able to just
> add the unstable repository and pin it to be lower priority than testing
> (see apt_preferences(5)).
>

So, I'd initially tried doing this, by adding the unstable repository at a
negative priority. What turned me off is that even with that low
preference, attempting to install the wireguard packages seemed to pull in
some core system libraries (libc and such) from unstable as well. And while
I'm excited about wireguard, I'm not "install unstable base libraries"
excited :).

That said, it's quite possible I was just not using the preference system
correctly. If it's possible to express "Install *only* wireguard-* from
unstable, never anything else", then I agree, that's definitely the way to
go.


>
> Using this standard approach, users won't need to:
>
>  a) add a new key to their apt configuration, which increases the attack
>     surface for all installed packages (btw, the proposed shell pipe
>     into "apt-key add -" is deprecated, see for example commentary at
>     https://bugs.debian.org/853858)
>
>  b) be dependent on some alternate suite of build daemons -- if debian
>     supports your build environment, the buildds will have the wireguard
>     packages.
>
> So I don't see much to recommend the proposed approach by comparison,
> and i don't think that it should be documented as a recommended approach
> upstream, unless there are clearer benefits that i'm missing here.  In
> that case, i'd like to know what those benefits are :)
>

Fair enough, I defer to your greater experience with Debian packaging.
Fortunately, packagecloud's stats say that there were no installs from my
repository, so assuming I can get pinning to work properly, the only
systems that need cleanup are my own.

Cheers,
- Dave


>
>          --dkg
>

--001a11415e88b491660548766155
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On S=
un, Feb 12, 2017 at 3:01 PM, Daniel Kahn Gillmor <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:dkg@fifthhorseman.net" target=3D"_blank">dkg@fifthhorseman.ne=
t</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">=
On Fri 2017-02-10 19:23:50 -0500, David Anderson wrote:<br>
&gt; In case it&#39;s of use to anyone, I&#39;ve built wireguard packages f=
or Debian<br>
&gt; testing. I wanted to play with wireguard on my Debian Stretch systems,=
 but<br>
&gt; wireguard is currently locked to Sid only until 1.0 brings API stabili=
ty<br>
&gt; guarantees.<br>
&gt;<br>
&gt; So, I set up a cronjob that rebuilds the Sid source package on a Stret=
ch<br>
&gt; system, and the result is wireguard packages that track the latest rel=
ease,<br>
&gt; but don&#39;t pull in unstable versions of libc and whatnot when you t=
ry to<br>
&gt; install them, as would happen if you tried to install via package pinn=
ing.<br>
&gt;<br>
&gt; Naturally, you have only my word that the packages are unmodified rebu=
ilds<br>
&gt; of Debian&#39;s original package, and you&#39;re trusting packagecloud=
 to not<br>
&gt; tamper with the packages (it&#39;s their signing keys, not mine) so ca=
veat<br>
&gt; emptor. It works for me, it might work for you as well.<br>
&gt;<br>
&gt; With the warnings and disclaimers out of the way, here&#39;s the repo:=
<br>
&gt; <a href=3D"https://packagecloud.io/danderson/wireguard?filter=3Ddebs" =
rel=3D"noreferrer" target=3D"_blank">https://packagecloud.io/<wbr>danderson=
/wireguard?filter=3D<wbr>debs</a><br>
<br>
</span>I appreciate your interest in getting wider distribution for wiregua=
rd,<br>
David, but i&#39;m not convinced this approach makes much sense.<br>
<br>
It seems like a lot of extra work compared to just putting wireguard<br>
into stretch-backports once stretch is released.<br></blockquote><div><br><=
/div><div>&quot;Once stretch is released&quot; could be a few months still,=
 right? It&#39;s only just gone into final freeze. I agree that once it&#39=
;s released, backports is definitely the right way to distribute.</div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">Until stretch releases, people =
running testing should be able to just<br>
add the unstable repository and pin it to be lower priority than testing<br=
>
(see apt_preferences(5)).<br></blockquote><div><br></div><div>So, I&#39;d i=
nitially tried doing this, by adding the unstable repository at a negative =
priority. What turned me off is that even with that low preference, attempt=
ing to install the wireguard packages seemed to pull in some core system li=
braries (libc and such) from unstable as well. And while I&#39;m excited ab=
out wireguard, I&#39;m not &quot;install unstable base libraries&quot; exci=
ted :).</div><div><br></div><div>That said, it&#39;s quite possible I was j=
ust not using the preference system correctly. If it&#39;s possible to expr=
ess &quot;Install *only* wireguard-* from unstable, never anything else&quo=
t;, then I agree, that&#39;s definitely the way to go.</div><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">
<br>
Using this standard approach, users won&#39;t need to:<br>
<br>
=C2=A0a) add a new key to their apt configuration, which increases the atta=
ck<br>
=C2=A0 =C2=A0 surface for all installed packages (btw, the proposed shell p=
ipe<br>
=C2=A0 =C2=A0 into &quot;apt-key add -&quot; is deprecated, see for example=
 commentary at<br>
=C2=A0 =C2=A0 <a href=3D"https://bugs.debian.org/853858" rel=3D"noreferrer"=
 target=3D"_blank">https://bugs.debian.org/853858</a><wbr>)<br>
<br>
=C2=A0b) be dependent on some alternate suite of build daemons -- if debian=
<br>
=C2=A0 =C2=A0 supports your build environment, the buildds will have the wi=
reguard<br>
=C2=A0 =C2=A0 packages.<br>
<br>
So I don&#39;t see much to recommend the proposed approach by comparison,<b=
r>
and i don&#39;t think that it should be documented as a recommended approac=
h<br>
upstream, unless there are clearer benefits that i&#39;m missing here.=C2=
=A0 In<br>
that case, i&#39;d like to know what those benefits are :)<br></blockquote>=
<div><br></div><div>Fair enough, I defer to your greater experience with De=
bian packaging. Fortunately, packagecloud&#39;s stats say that there were n=
o installs from my repository, so assuming I can get pinning to work proper=
ly, the only systems that need cleanup are my own.</div><div><br></div><div=
>Cheers,</div><div>- Dave</div><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--dkg<br>
</font></span></blockquote></div><br></div></div>

--001a11415e88b491660548766155--
