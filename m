Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6ea33999
 for <wireguard@lists.zx2c4.com>;
 Fri, 12 Jan 2018 19:42:47 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8ef00df3
 for <wireguard@lists.zx2c4.com>;
 Fri, 12 Jan 2018 19:42:47 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 32e8a845
 for <wireguard@lists.zx2c4.com>;
 Fri, 12 Jan 2018 19:33:56 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3a4f018b
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 12 Jan 2018 19:33:55 +0000 (UTC)
Received: by mail-oi0-f48.google.com with SMTP id o64so4655507oia.9
 for <wireguard@lists.zx2c4.com>; Fri, 12 Jan 2018 11:45:31 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1515772241.1125.13.camel@eggiecode.org>
References: <CAHmME9pJHQOTkOm4Cn6rt-ER14L8Pb54L2r3=T=4DphA0wNBTA@mail.gmail.com>
 <871siz6ouv.fsf@fifthhorseman.net>
 <CAHmME9qrfy4Lf78NkChdv6tPnSFTcGArwgsizAaapL9k=Tc31w@mail.gmail.com>
 <87efmy42c0.fsf@fifthhorseman.net>
 <81bb0726-8f67-0163-875f-0d3403f8df29@urlichs.de>
 <87wp0p1h5j.fsf@fifthhorseman.net>
 <CAB=oiXauSSzhqEgF32spvWmkd3ZaGZfFmy5NEpQmvqxeuDASqw@mail.gmail.com>
 <87k1wo1pfu.fsf@fifthhorseman.net>
 <CAHmME9q8_4Ln=OB7_NDTzE3JpTdf8Ae4isJ+qiAVCJJS1qCDcQ@mail.gmail.com>
 <8760880xvk.fsf@fifthhorseman.net> <1515772241.1125.13.camel@eggiecode.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 12 Jan 2018 20:45:29 +0100
Message-ID: <CAHmME9qZuzMO7hRE7QUOnJq9jfbAsF+AdF7nWP=yUC8kzwHPsQ@mail.gmail.com>
Subject: Re: WireGuard in systemd-networkd
To: Egbert Verhage <egbert@eggiecode.org>
Content-Type: multipart/alternative; boundary="001a113cbec8d0dbfa0562998146"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a113cbec8d0dbfa0562998146
Content-Type: text/plain; charset="UTF-8"

Wonderful! Thanks guys. I'll update the documentation shortly.

Jason

On Jan 12, 2018 16:51, "Egbert Verhage" <egbert@eggiecode.org> wrote:

> Hey dkg,
>
> I wanted to do the same thing with the meta package, so I have included
> your patch in the ubuntu ppa repo.
>
> I have pushed the packages to the PPA, so will be up in 10min.
>
> Here the commit with the meta package patch:
> https://github.com/EggieCode/wireguard-ppa/commit/1c502977301cfc1695996
> ba68fa260576f0f0cad
>
> Thanks dkg for the patch!
>
> Greetz,
> Egbert
>
> On Thu, 2018-01-11 at 18:38 -0500, Daniel Kahn Gillmor wrote:
> > On Thu 2018-01-11 16:02:30 +0100, Jason A. Donenfeld wrote:
> > > On Thu, Jan 11, 2018 at 2:43 PM, Daniel Kahn Gillmor
> > > <dkg@fifthhorseman.net> wrote:
> > > > Matthias was suggesting a simply-named meta-package: just
> > > > "wireguard",
> > > > which would ensure that both wireguard-dkms and wireguard-tools
> > > > are
> > > > installed.  The advantage there is that you can tell people to
> > > > do:
> > > >
> > > >    apt install wireguard
> > > >
> > > > and apt make sure the system has the common setup by default :)
> > >
> > > This is a great idea. Let me know if you wind up making this. I've
> > > added Egbert to the CC so that he can make an identical change in
> > > the
> > > Ubuntu PPA.
> >
> > I've just uploaded this arrangement to debian, but it needs to clear
> > the
> > NEW queue, which can take a little while.
> >
> > You should be able to follow the NEW queue here:
> >
> >    https://ftp-master.debian.org/new.html
> >
> > Egbert (or any other packager for a debian derivative) can see my
> > packaging here, if they're interested:
> >
> >    https://salsa.debian.org/debian/wireguard
> >
> > in particular:
> >
> >    https://salsa.debian.org/debian/wireguard/commit/cc3cab4b799a64e9c
> > 74985da627fc85ba0ee2cc8
> >
> > as always, I welcome feedback and suggestions for other improvements.
> >
> > Regards,
> >
> >         --dkg
>

--001a113cbec8d0dbfa0562998146
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div data-smartmail=3D"gmail_signature">Wonderful! Thanks=
 guys. I&#39;ll update the documentation shortly.</div><div data-smartmail=
=3D"gmail_signature" dir=3D"auto"><br></div><div data-smartmail=3D"gmail_si=
gnature" dir=3D"auto">Jason</div></div><div class=3D"gmail_extra"><br><div =
class=3D"gmail_quote">On Jan 12, 2018 16:51, &quot;Egbert Verhage&quot; &lt=
;<a href=3D"mailto:egbert@eggiecode.org">egbert@eggiecode.org</a>&gt; wrote=
:<br type=3D"attribution"><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hey dkg,<br>
<br>
I wanted to do the same thing with the meta package, so I have included<br>
your patch in the ubuntu ppa repo.<br>
<br>
I have pushed the packages to the PPA, so will be up in 10min.<br>
<br>
Here the commit with the meta package patch:<br>
<a href=3D"https://github.com/EggieCode/wireguard-ppa/commit/1c502977301cfc=
1695996
ba68fa260576f0f0cad" rel=3D"noreferrer" target=3D"_blank">https://github.co=
m/EggieCode/<wbr>wireguard-ppa/commit/<wbr>1c502977301cfc1695996<br>
ba68fa260576f0f0cad</a><br>
<br>
Thanks dkg for the patch!<br>
<br>
Greetz,<br>
Egbert<br>
<br>
On Thu, 2018-01-11 at 18:38 -0500, Daniel Kahn Gillmor wrote:<br>
&gt; On Thu 2018-01-11 16:02:30 +0100, Jason A. Donenfeld wrote:<br>
&gt; &gt; On Thu, Jan 11, 2018 at 2:43 PM, Daniel Kahn Gillmor<br>
&gt; &gt; &lt;<a href=3D"mailto:dkg@fifthhorseman.net">dkg@fifthhorseman.ne=
t</a>&gt; wrote:<br>
&gt; &gt; &gt; Matthias was suggesting a simply-named meta-package: just<br=
>
&gt; &gt; &gt; &quot;wireguard&quot;,<br>
&gt; &gt; &gt; which would ensure that both wireguard-dkms and wireguard-to=
ols<br>
&gt; &gt; &gt; are<br>
&gt; &gt; &gt; installed.=C2=A0 The advantage there is that you can tell pe=
ople to<br>
&gt; &gt; &gt; do:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 apt install wireguard<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; and apt make sure the system has the common setup by default=
 :)<br>
&gt; &gt;<br>
&gt; &gt; This is a great idea. Let me know if you wind up making this. I&#=
39;ve<br>
&gt; &gt; added Egbert to the CC so that he can make an identical change in=
<br>
&gt; &gt; the<br>
&gt; &gt; Ubuntu PPA.<br>
&gt;<br>
&gt; I&#39;ve just uploaded this arrangement to debian, but it needs to cle=
ar<br>
&gt; the<br>
&gt; NEW queue, which can take a little while.<br>
&gt;<br>
&gt; You should be able to follow the NEW queue here:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 <a href=3D"https://ftp-master.debian.org/new.html" rel=3D=
"noreferrer" target=3D"_blank">https://ftp-master.debian.org/<wbr>new.html<=
/a><br>
&gt;<br>
&gt; Egbert (or any other packager for a debian derivative) can see my<br>
&gt; packaging here, if they&#39;re interested:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 <a href=3D"https://salsa.debian.org/debian/wireguard" rel=
=3D"noreferrer" target=3D"_blank">https://salsa.debian.org/<wbr>debian/wire=
guard</a><br>
&gt;<br>
&gt; in particular:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 <a href=3D"https://salsa.debian.org/debian/wireguard/comm=
it/cc3cab4b799a64e9c" rel=3D"noreferrer" target=3D"_blank">https://salsa.de=
bian.org/<wbr>debian/wireguard/commit/<wbr>cc3cab4b799a64e9c</a><br>
&gt; 74985da627fc85ba0ee2cc8<br>
&gt;<br>
&gt; as always, I welcome feedback and suggestions for other improvements.<=
br>
&gt;<br>
&gt; Regards,<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--dkg<br>
</blockquote></div></div>

--001a113cbec8d0dbfa0562998146--
