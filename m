Return-Path: j.e.aten@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0dd98eb5
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Apr 2017 21:21:06 +0000 (UTC)
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e2197ef6
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Apr 2017 21:21:06 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id o81so42203785wmb.1
 for <wireguard@lists.zx2c4.com>; Mon, 17 Apr 2017 14:28:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9qQmaQXBJ+pR6MHx90fUb0_EmwriBo6=rRupEDFF6d=Yg@mail.gmail.com>
References: <CAPNEFAaG3cQQJSyAuGxdHQHMm6+RzrQVt9ZrzTxrVNKm01z2dA@mail.gmail.com>
 <CAHmME9qQmaQXBJ+pR6MHx90fUb0_EmwriBo6=rRupEDFF6d=Yg@mail.gmail.com>
From: "Jason E. Aten" <j.e.aten@gmail.com>
Date: Mon, 17 Apr 2017 16:28:47 -0500
Message-ID: <CAPNEFAZZziFPm7mDxBA8WDYROBaBP-fv8RsYjGtTLDDd46+0Xw@mail.gmail.com>
Subject: Re: nat traversal / userspace impl
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: multipart/alternative; boundary=94eb2c1302760276dd054d637a88
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--94eb2c1302760276dd054d637a88
Content-Type: text/plain; charset=UTF-8

On Mon, Apr 17, 2017 at 12:55 PM, Jason A. Donenfeld <Jason@zx2c4.com>
wrote:

> On Mon, Apr 17, 2017 at 7:45 PM, Jason E. Aten <j.e.aten@gmail.com> wrote:
> > 1. If it uses UDP only, how does NAT traversal (firewall punch through)
> > work?
>
> The same way UDP punching works every place else.
>

Thanks, Jason, for the quick reply.

If I read through the wikipedia article on UDP hole punching, it (
https://en.wikipedia.org/wiki/UDP_hole_punching) suggests that a public 3rd
party is needed.

> S is a public server with a well-known, globally reachable IP address.

...which makes total sense. Conversely, I don't see described anywhere a
public 3rd party protocol for wireguard clients to rendezvous.

I found this post:
https://lists.zx2c4.com/pipermail/wireguard/2016-August/000372.html, which
makes rendezvous seem like an after thought.

Should I conclude that addressing NAT-ed clients is not something that
WireGuard itself plans to address?

The "number of security problems" with the approach mentioned in passing in
the 2016-August message would need enumeration and addressing. Is anybody
thinking about those? Is this on the roadmap for future plans?

Regards,
Jason

--94eb2c1302760276dd054d637a88
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Mon, Apr 17, 2017 at 12:55 PM, Jason A. Donenfeld <span=
 dir=3D"ltr">&lt;<a href=3D"mailto:Jason@zx2c4.com" target=3D"_blank">Jason=
@zx2c4.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span cl=
ass=3D"gmail-">On Mon, Apr 17, 2017 at 7:45 PM, Jason E. Aten &lt;<a href=
=3D"mailto:j.e.aten@gmail.com">j.e.aten@gmail.com</a>&gt; wrote:<br>
&gt; 1. If it uses UDP only, how does NAT traversal (firewall punch through=
)<br>
&gt; work?<br>
<br>
</span>The same way UDP punching works every place else.<span class=3D"gmai=
l-"><br></span></blockquote><div><br></div><div>Thanks, Jason, for the quic=
k reply.<br></div><div><br>If I read through the wikipedia article on UDP h=
ole punching, it (<a href=3D"https://en.wikipedia.org/wiki/UDP_hole_punchin=
g">https://en.wikipedia.org/wiki/UDP_hole_punching</a>) suggests that a pub=
lic 3rd party is needed.<br><br>&gt; S is a public server with a well-known=
, globally reachable IP address.<br><br></div><div>...which makes total sen=
se. Conversely, I don&#39;t see described anywhere a public 3rd party proto=
col for wireguard clients to rendezvous.<br><br>I found this post: <a href=
=3D"https://lists.zx2c4.com/pipermail/wireguard/2016-August/000372.html">ht=
tps://lists.zx2c4.com/pipermail/wireguard/2016-August/000372.html</a>, whic=
h makes rendezvous seem like an after thought. <br><br>Should I conclude th=
at addressing NAT-ed clients is not something that WireGuard itself plans t=
o address? <br><br>The &quot;number of security problems&quot; with the app=
roach mentioned in passing in the 2016-August message would need enumeratio=
n and addressing. Is anybody thinking about those? Is this on the roadmap f=
or future plans?<br></div><br>Regards,<div>Jason<br></div></div></div></div=
>

--94eb2c1302760276dd054d637a88--
