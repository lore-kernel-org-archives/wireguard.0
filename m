Return-Path: ximin@dfinity.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 60803359
 for <wireguard@lists.zx2c4.com>; Thu, 5 Apr 2018 18:04:45 +0000 (UTC)
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
 [209.85.223.181])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e29dfe1d
 for <wireguard@lists.zx2c4.com>; Thu, 5 Apr 2018 18:04:45 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id m83so31674896ioi.8
 for <wireguard@lists.zx2c4.com>; Thu, 05 Apr 2018 11:17:56 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAKXLc7cy72yeFHSWtvC052-GNRRJOsHO4yzdAi0PcrZwL52aqw@mail.gmail.com>
References: <CADX+UFjEBcWRsL3SRv5_b0ezU0adcURqOJf=MvDbQkSXg3JRHg@mail.gmail.com>
 <CAKXLc7cy72yeFHSWtvC052-GNRRJOsHO4yzdAi0PcrZwL52aqw@mail.gmail.com>
From: Ximin Luo <ximin@dfinity.org>
Date: Thu, 5 Apr 2018 11:17:55 -0700
Message-ID: <CADX+UFh+jt855E3PfjhR009PvWQxzTAN8BPp5_dbyyswwiG3mQ@mail.gmail.com>
Subject: Re: Using WG for transport security in a p2p network
To: Kalin KOZHUHAROV <me.kalin@gmail.com>
Content-Type: multipart/alternative; boundary="001a11402fc066bbaa05691df582"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a11402fc066bbaa05691df582
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 5, 2018 at 8:32 AM, Kalin KOZHUHAROV <me.kalin@gmail.com> wrote:

> On Thu, Apr 5, 2018 at 5:22 AM, Ximin Luo <ximin@dfinity.org> wrote:
> > Our network churn is not expected to be very heavy, perhaps on the order
> of
> > ~30 new connections per node per week or so. So any extra latency in the
> initial
> > connection caused by this separation of layers, should not be
> significant.
> > However this churn is probably higher than what current typical WG usages
> > get exposed to.
> >
> Few times a day, I would even say few times per hour is a very normal use
> and
> should not be strange, AFAIK.
>

OK great, thanks for clarifying.


> > I'm also wondering how easy this would be to program. It would clearly be
> > much more heavyweight than simply opening a socket, but I guess it can
> be done
> > via invocations of the `wg` or `wg-quick` tools. Has anyone had any
> experience
> > with this level of WG automation, could you share your thoughts?
> >
> Definitely not "hard", it will depend more on what you are trying to
> achieve exactly.
>
> > Would the program need any extra system-level privileges?
> >
> Yes for sure ;-D Adding interfaces is a admin task, using sudo or
> similar should be trivial.
>
> > Ideally we wouldn't need root, of course - does that mean we're forced
> to wait for a userspace WG library such
> > as wireguard-rs? I understand there is a performance penalty here, but
> I'd have
> > to run benchmarks to know if this affects our use-case significantly.
> >
> I don't think performance matters in your case, as it will be only
> during setup; once setup,
> all data goes to a socket/kernel and it doesn't matter how it was set up.
>

Application-level data goes to a socket, but AIUI adding/removing WG
protocol wrapping is done either in the kernel (as in the main
implementation) or in userspace (as in wireguard-rs). In the latter case
there is apparently a performance penalty in terms of throughput (i.e. not
only for the setup phase), judging by Jason's comments in various places.
Did I understand wrong / could you explain in more detail if so?


> > Once the network is live, we'd need the transport protocol to be
> relatively
> > stable, or at least be easily upgradeable - perhaps using the noise
> > negotiation subprotocol to support two protocols during network upgrade
> times. This is
> > an extra requirement that seems beyond WG's current main use-case so I
> was also
> > wondering if that is something that you guys plan to cover.
> >
> Making it "support 2 protocols" in the design phase is a good practice
> for availability.
> It will introduce complexity, maintainability issues and thus possible
> security issues.
> Working out a "maintenance mode" might be easier.
>

Could you elaborate what is meant by "maintenance mode"?

I suppose in the worst case we could do something like: add logic "change
from protocol X to protocol Y at future round N" to software version V and
expect that everyone upgrades to software version V before round N. That
should hopefully work even if protocol X doesn't explicitly define a smooth
upgrade path to protocol Y (e.g. X = WG version 3, Y = WG version 4).

X

--001a11402fc066bbaa05691df582
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On T=
hu, Apr 5, 2018 at 8:32 AM, Kalin KOZHUHAROV <span dir=3D"ltr">&lt;<a href=
=3D"mailto:me.kalin@gmail.com" target=3D"_blank">me.kalin@gmail.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span c=
lass=3D"gmail-">
On Thu, Apr 5, 2018 at 5:22 AM, Ximin Luo &lt;<a href=3D"mailto:ximin@dfini=
ty.org">ximin@dfinity.org</a>&gt; wrote:<br>
&gt; Our network churn is not expected to be very heavy, perhaps on the ord=
er of<br>
&gt; ~30 new connections per node per week or so. So any extra latency in t=
he initial<br>
&gt; connection caused by this separation of layers, should not be signific=
ant.<br>
&gt; However this churn is probably higher than what current typical WG usa=
ges<br>
&gt; get exposed to.<br>
&gt;<br>
</span>Few times a day, I would even say few times per hour is a very norma=
l use and<br>
should not be strange, AFAIK.<span class=3D"gmail-"><br></span></blockquote=
><div><br></div><div>OK great, thanks for clarifying.<br>=C2=A0</div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex"><span class=3D"gmail-">
&gt; I&#39;m also wondering how easy this would be to program. It would cle=
arly be<br>
&gt; much more heavyweight than simply opening a socket, but I guess it can=
 be done<br>
&gt; via invocations of the `wg` or `wg-quick` tools. Has anyone had any ex=
perience<br>
&gt; with this level of WG automation, could you share your thoughts?<br>
&gt;<br>
</span>Definitely not &quot;hard&quot;, it will depend more on what you are=
 trying to<br>
achieve exactly.<br>
<span class=3D"gmail-"><br>
&gt; Would the program need any extra system-level privileges?<br>
&gt;<br>
</span>Yes for sure ;-D Adding interfaces is a admin task, using sudo or<br=
>
similar should be trivial.<br>
<span class=3D"gmail-"><br>
&gt; Ideally we wouldn&#39;t need root, of course - does that mean we&#39;r=
e forced to wait for a userspace WG library such<br>
&gt; as wireguard-rs? I understand there is a performance penalty here, but=
 I&#39;d have<br>
&gt; to run benchmarks to know if this affects our use-case significantly.<=
br>
&gt;<br>
</span>I don&#39;t think performance matters in your case, as it will be on=
ly<br>
during setup; once setup,<br>
all data goes to a socket/kernel and it doesn&#39;t matter how it was set u=
p.<span class=3D"gmail-"><br></span></blockquote><div><br></div><div>Applic=
ation-level data goes to a socket, but AIUI adding/removing WG protocol wra=
pping is done either in the kernel (as in the main implementation) or in us=
erspace (as in wireguard-rs). In the latter case there is apparently a perf=
ormance penalty in terms of throughput (i.e. not only for the setup phase),=
 judging by Jason&#39;s comments in various places. Did I understand wrong =
/ could you explain in more detail if so?<br>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><span class=3D"gmail-">
&gt; Once the network is live, we&#39;d need the transport protocol to be r=
elatively<br>
&gt; stable, or at least be easily upgradeable - perhaps using the noise<br=
>
&gt; negotiation subprotocol to support two protocols during network upgrad=
e times. This is<br>
&gt; an extra requirement that seems beyond WG&#39;s current main use-case =
so I was also<br>
&gt; wondering if that is something that you guys plan to cover.<br>
&gt;<br>
</span>Making it &quot;support 2 protocols&quot; in the design phase is a g=
ood practice<br>
for availability.<br>
It will introduce complexity, maintainability issues and thus possible<br>
security issues.<br>
Working out a &quot;maintenance mode&quot; might be easier.<br></blockquote=
><div><br></div><div>Could you elaborate what is meant by &quot;maintenance=
 mode&quot;?<br><br>I suppose in the worst case we could do something like:=
 add logic &quot;change from protocol X to protocol Y at future round N&quo=
t; to software version V and expect that everyone upgrades to software vers=
ion V before round N. That should hopefully work even if protocol X doesn&#=
39;t explicitly define a smooth upgrade path to protocol Y (e.g. X =3D WG v=
ersion 3, Y =3D WG version 4).<br><br></div><div>X<br></div></div></div></d=
iv>

--001a11402fc066bbaa05691df582--
