Return-Path: rcwhelan@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d4bc9654
 for <wireguard@lists.zx2c4.com>; Tue, 5 Dec 2017 13:58:28 +0000 (UTC)
Received: from mail-qt0-f174.google.com (mail-qt0-f174.google.com
 [209.85.216.174])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cae9c93b
 for <wireguard@lists.zx2c4.com>; Tue, 5 Dec 2017 13:58:28 +0000 (UTC)
Received: by mail-qt0-f174.google.com with SMTP id f2so895208qtj.4
 for <wireguard@lists.zx2c4.com>; Tue, 05 Dec 2017 06:05:15 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAHmME9qBc1Wm1=QgAY6gSR65bsfNppsRjeZFwJfF1nBAr1WF9A@mail.gmail.com>
References: <CAM3m09QZc=kJoXUQvCpCVQG62TeDX0B4BdcuUU3A9T2Lfg10VQ@mail.gmail.com>
 <CAHmME9qBc1Wm1=QgAY6gSR65bsfNppsRjeZFwJfF1nBAr1WF9A@mail.gmail.com>
From: Ryan Whelan <rcwhelan@gmail.com>
Date: Tue, 5 Dec 2017 09:05:14 -0500
Message-ID: <CAM3m09TR-ySFu=E=D3gEQJjeqw3awW5pP2mu+-OKN7jKOfbCDQ@mail.gmail.com>
Subject: Re: Another allowed-ips question
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: multipart/alternative; boundary="f403043b217cee3cb9055f985262"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--f403043b217cee3cb9055f985262
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 22, 2017 at 6:51 PM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> Hi Ryan,
>
> Sorry for the delayed response. The high volume and churn of
> development recently has gotten me a bit behind on the mail queue and
> rather confused.
>
> You wrote:
> >  what i'm struggling with is if they are unable to communicate directly
> and build routes to one another via an intermediary router (which is also
> connected to each 'client' via wireguard).
>
> If I understood you correctly, you're looking at this situation: Peer
> A connects to Peer S. Peer B connects to Peer S. A wants to talk to B,
> through S. In this case, the allowed-ips of S on A lists B's internal
> IP, and the allowed-ips of S on B lists A's internal IP address. In
> other words, you have A/B state that "I trust S to send me the traffic
> of B/A."
>
> Does this answer your question?
>
> Regards,
> Jason
>

Sorry for my latent reply- I was traveling all last week and have been
doing a bad job keeping up on my email

I think you understand the setup, mostly.  The missing piece is that A and
B need to connect directly to one another as well. (Its kind of like a
triangle).  The idea is that the link between A and B is 'primary' but if
they are unable to communicate with one another directly, they will 'fall
back' to using the 'Server' (S).  A and B will both likely be behind NATs,
so is likely that at some point they will both be behind symmetric-nats and
be unable to communicate directly, needing the fallback route provided by
the server.

That said, i think i have a working setup.  there are 2 interfaces
created.  one called 'server0' and one called 'direct0'.  On the server
interface there is a single peer with an allowed-ips of fc00::/7 and on the
direct interface, there is a peer for each of the other devices we want to
connect to directly.  Each peer on the direct interface has an allowed-ips
that matches the addr of the corresponding peer. (/128).

That provides 2 routes between peers- route selection is just matter of
picking an interface.  Hopefully something that will be done via a routing
daemon.

Hopefully the above makes sense.  I think i have a screenshot that will
paint a clearer picture if needed.  (not sure if i can paste pictures into
the mailing list)

ryan

--f403043b217cee3cb9055f985262
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Nov 22, 2017 at 6:51 PM, Jason A. Donenfeld <span dir=3D"ltr">&=
lt;<a href=3D"mailto:Jason@zx2c4.com" target=3D"_blank">Jason@zx2c4.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Ryan,<br>
<br>
Sorry for the delayed response. The high volume and churn of<br>
development recently has gotten me a bit behind on the mail queue and<br>
rather confused.<br>
<span class=3D""><br>
You wrote:<br>
&gt;=C2=A0 what i&#39;m struggling with is if they are unable to communicat=
e directly and build routes to one another via an intermediary router (whic=
h is also connected to each &#39;client&#39; via wireguard).<br>
<br>
</span>If I understood you correctly, you&#39;re looking at this situation:=
 Peer<br>
A connects to Peer S. Peer B connects to Peer S. A wants to talk to B,<br>
through S. In this case, the allowed-ips of S on A lists B&#39;s internal<b=
r>
IP, and the allowed-ips of S on B lists A&#39;s internal IP address. In<br>
other words, you have A/B state that &quot;I trust S to send me the traffic=
<br>
of B/A.&quot;<br>
<br>
Does this answer your question?<br>
<br>
Regards,<br>
Jason<br></blockquote><div><br></div><div>Sorry for my latent reply- I was =
traveling all last week and have been doing a bad job keeping up on my emai=
l</div><div><br></div><div>I think you understand the setup, mostly.=C2=A0 =
The missing piece is that A and B need to connect directly to one another a=
s well. (Its kind of like a triangle).=C2=A0 The idea is that the link betw=
een A and B is &#39;primary&#39; but if they are unable to communicate with=
 one another directly, they will &#39;fall back&#39; to using the &#39;Serv=
er&#39; (S).=C2=A0 A and B will both likely be behind NATs, so is likely th=
at at some point they will both be behind symmetric-nats and be unable to c=
ommunicate directly, needing the fallback route provided by the server.</di=
v><div><br></div><div>That said, i think i have a working setup.=C2=A0 ther=
e are 2 interfaces created.=C2=A0 one called &#39;server0&#39; and one call=
ed &#39;direct0&#39;.=C2=A0 On the server interface there is a single peer =
with an allowed-ips of fc00::/7 and on the direct interface, there is a pee=
r for each of the other devices we want to connect to directly.=C2=A0 Each =
peer on the direct interface has an allowed-ips that matches the addr of th=
e corresponding peer. (/128).</div><div><br></div><div>That provides 2 rout=
es between peers- route selection is just matter of picking an interface.=
=C2=A0 Hopefully something that will be done via a routing daemon.</div><di=
v><br></div><div>Hopefully the above makes sense.=C2=A0 I think i have a sc=
reenshot that will paint a clearer picture if needed.=C2=A0 (not sure if i =
can paste pictures into the mailing list)</div><div><br></div><div>ryan</di=
v></div><br></div></div>

--f403043b217cee3cb9055f985262--
