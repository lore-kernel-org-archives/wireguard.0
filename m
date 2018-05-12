Return-Path: gbojsza@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 672a6845
 for <wireguard@lists.zx2c4.com>;
 Sat, 12 May 2018 00:03:05 +0000 (UTC)
Received: from mail-pl0-x22f.google.com (mail-pl0-x22f.google.com
 [IPv6:2607:f8b0:400e:c01::22f])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1bb2f24f
 for <wireguard@lists.zx2c4.com>;
 Sat, 12 May 2018 00:03:05 +0000 (UTC)
Received: by mail-pl0-x22f.google.com with SMTP id az12-v6so4103293plb.8
 for <wireguard@lists.zx2c4.com>; Fri, 11 May 2018 17:06:00 -0700 (PDT)
MIME-Version: 1.0
References: <c1e04862-162f-eff9-7884-467f672608e2@cgws.de>
 <CAKXLc7capqT5oFinwT6Cj1-b2h5gKo+CG+WTLbFO+bG7pR7NsQ@mail.gmail.com>
In-Reply-To: <CAKXLc7capqT5oFinwT6Cj1-b2h5gKo+CG+WTLbFO+bG7pR7NsQ@mail.gmail.com>
From: Glen Bojsza <gbojsza@gmail.com>
Date: Fri, 11 May 2018 20:05:48 -0400
Message-ID: <CACW8NbC6PuGHminw-yrCaX5q5Zkbd7ftRset90sPvsT6r4KgVA@mail.gmail.com>
Subject: Re: Need for HW-clock independent timestamps
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: multipart/alternative; boundary="0000000000007d0421056bf704b9"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--0000000000007d0421056bf704b9
Content-Type: text/plain; charset="UTF-8"

Why not add a configurable  timer feature to wireguard where you can set
the amount of time after power up before the wireguard vpn comes up? This
would solve the problem universally and may be the simplest / quickest
solution.

Disclaimer: I don't have a developer's background only a user's one so I am
not sure how hard this technically would be to implement...maybe someone
can weigh in from the wireguard team.

Glen

On Fri, May 11, 2018 at 6:46 PM Kalin KOZHUHAROV <me.kalin@gmail.com> wrote:

> On Sat, May 12, 2018 at 12:07 AM, Axel Neumann <neumann@cgws.de> wrote:
> > We have the following chicken-egg problem:
> > We are using WG on openwrt devices which do not have a hardware clock so
> > that time is resetted after each reboot.
> > Because internet access shall be routed via WG tunnels the internet and
> > network-time services (NTP) is not available unless WG works properly.
> > But, guess, to reconnect, WG needs a greater time than before it
> > rebooted :-(
> >
> > I heard that a suggested solution is to periodically save the current
> > time to filesystem and then fix it during boot based on the last saved
> > one. But all embedded devices use flash memory with a limited amount
> > (about 10^5) of write cycles before they become unstable which would
> > destroy the flash within weeks.
> >
> Good/Hard problem!
>
> > Any ideas how to circumvent this problem?
> >
> I only see 2 ways:
> * hardware: add a cheap RTC (best), or storage (USB, SD)
> * policy: add exception for ntpdate on base UDP (not WG) (or have
> dedicated server/s for that, which you control).
>
> BTW, while flash write cycles are indeed limited, you are writing a
> very small data (that causes a single block to be rewritten).
> So a device with say 32 MB(8000 x 4K blocks) will last about 9000
> years if you write one block once per hour until 10% (=800) of its
> cells are past 10^5 writes.
> (or 3 years if you write once per second!)
> But my knowledge says 10^3-10^4 write cycles (so still 90-900 years for
> 1/hour).
>
> If you have a large number of devices of the same hardware, I'd
> suggest a "kill test" of one of them, by rewriting its flash. You can
> further use specific file-systems optimized for NAND/NOR flash.
>
> Cheers,
> Kalin.
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--0000000000007d0421056bf704b9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">Why not add a configurable =C2=A0timer feature to wi=
reguard where you can set the amount of time after power up before the wire=
guard vpn comes up? This would solve the problem universally and may be the=
 simplest / quickest solution.</div><div dir=3D"auto"><br></div><div dir=3D=
"auto">Disclaimer: I don&#39;t have a developer&#39;s background only a use=
r&#39;s one so I am not sure how hard this technically would be to implemen=
t...maybe someone can weigh in from the wireguard team.</div><div dir=3D"au=
to"><br></div><div dir=3D"auto">Glen</div><br><div class=3D"gmail_quote"><d=
iv>On Fri, May 11, 2018 at 6:46 PM Kalin KOZHUHAROV &lt;<a href=3D"mailto:m=
e.kalin@gmail.com">me.kalin@gmail.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">On Sat, May 12, 2018 at 12:07 AM, Axel Neumann &lt;<a hre=
f=3D"mailto:neumann@cgws.de" target=3D"_blank">neumann@cgws.de</a>&gt; wrot=
e:<br>
&gt; We have the following chicken-egg problem:<br>
&gt; We are using WG on openwrt devices which do not have a hardware clock =
so<br>
&gt; that time is resetted after each reboot.<br>
&gt; Because internet access shall be routed via WG tunnels the internet an=
d<br>
&gt; network-time services (NTP) is not available unless WG works properly.=
<br>
&gt; But, guess, to reconnect, WG needs a greater time than before it<br>
&gt; rebooted :-(<br>
&gt;<br>
&gt; I heard that a suggested solution is to periodically save the current<=
br>
&gt; time to filesystem and then fix it during boot based on the last saved=
<br>
&gt; one. But all embedded devices use flash memory with a limited amount<b=
r>
&gt; (about 10^5) of write cycles before they become unstable which would<b=
r>
&gt; destroy the flash within weeks.<br>
&gt;<br>
Good/Hard problem!<br>
<br>
&gt; Any ideas how to circumvent this problem?<br>
&gt;<br>
I only see 2 ways:<br>
* hardware: add a cheap RTC (best), or storage (USB, SD)<br>
* policy: add exception for ntpdate on base UDP (not WG) (or have<br>
dedicated server/s for that, which you control).<br>
<br>
BTW, while flash write cycles are indeed limited, you are writing a<br>
very small data (that causes a single block to be rewritten).<br>
So a device with say 32 MB(8000 x 4K blocks) will last about 9000<br>
years if you write one block once per hour until 10% (=3D800) of its<br>
cells are past 10^5 writes.<br>
(or 3 years if you write once per second!)<br>
But my knowledge says 10^3-10^4 write cycles (so still 90-900 years for 1/h=
our).<br>
<br>
If you have a large number of devices of the same hardware, I&#39;d<br>
suggest a &quot;kill test&quot; of one of them, by rewriting its flash. You=
 can<br>
further use specific file-systems optimized for NAND/NOR flash.<br>
<br>
Cheers,<br>
Kalin.<br>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@li=
sts.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinfo/wireguard=
</a><br>
</blockquote></div></div>

--0000000000007d0421056bf704b9--
