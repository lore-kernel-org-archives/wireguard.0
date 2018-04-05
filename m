Return-Path: ximin@dfinity.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 473b5c91
 for <wireguard@lists.zx2c4.com>; Thu, 5 Apr 2018 18:47:21 +0000 (UTC)
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
 [209.85.223.171])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1350d90c
 for <wireguard@lists.zx2c4.com>; Thu, 5 Apr 2018 18:47:21 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id d5so31823585iob.9
 for <wireguard@lists.zx2c4.com>; Thu, 05 Apr 2018 12:00:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAK_h9uGko4XWco9UVi2nRj7vMSj3tSKHyPhpPW32fZ5qbb4g3Q@mail.gmail.com>
References: <CADX+UFjEBcWRsL3SRv5_b0ezU0adcURqOJf=MvDbQkSXg3JRHg@mail.gmail.com>
 <1a0ce6c1-4f62-509f-8d8e-9f0821d6f465@urlichs.de>
 <CAK_h9uGko4XWco9UVi2nRj7vMSj3tSKHyPhpPW32fZ5qbb4g3Q@mail.gmail.com>
From: Ximin Luo <ximin@dfinity.org>
Date: Thu, 5 Apr 2018 12:00:31 -0700
Message-ID: <CADX+UFhFXPYenUp=p+xUReR0ej4LRb43qZq=FLSfXjaYBgthjg@mail.gmail.com>
Subject: Re: Using WG for transport security in a p2p network
To: Tim Sedlmeyer <tim@sedlmeyer.org>
Content-Type: multipart/alternative; boundary="001a114441eebc94a605691e8d36"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a114441eebc94a605691e8d36
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 5, 2018 at 9:06 AM, Tim Sedlmeyer <tim@sedlmeyer.org> wrote:

> On Thu, Apr 5, 2018 at 3:13 AM, Matthias Urlichs <matthias@urlichs.de>
> wrote:
> >
> > Ideally we wouldn't need root
> >
> > If you go the netlink route, you do need one process that has the
> > appropriate privilege, which means root at install time (but not
> runtime).
>
> The process doesn't need full root permissions even at install time.
> Whatever process is going to create and manage
> the interfaces needs the CAP_NET_ADMIN capability.


Thanks, that's good to know. Though CAP_NET_ADMIN is "almost root" (e.g.
see [1]) so it would be more comfortable to not even require that. But I
guess a "next best thing" would be to put minimal logic inside a small
program and give only this program CAP_NET_ADMIN. Possibly wireguard-rs's
`wgrs` has both sufficient and not-too-much functionality that we could
directly `setcap` that, I'll have to look into it in more detail.
Unfortunately `wg-quick` is a shell script which is more annoying to try to
`setcap` on.

Another approach I was thinking of, was to extend wireguard to expose a
SOCKS5-UDP interface, or even simpler just a socket-wrapper API like
Python's `ssl.wrap_socket()`, and not use tunnel interfaces at all. Of
course this would run in userspace, but wireguard-rs already does that so I
hope there would be no "extra" performance penalty. Then one could run QUIC
through this, and I know that some SCTP implementations can run on top of
UDP too. Any further comments on this idea would be much appreciated.

X

[1] https://forums.grsecurity.net/viewtopic.php?f=7&t=2522

--001a114441eebc94a605691e8d36
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On T=
hu, Apr 5, 2018 at 9:06 AM, Tim Sedlmeyer <span dir=3D"ltr">&lt;<a href=3D"=
mailto:tim@sedlmeyer.org" target=3D"_blank">tim@sedlmeyer.org</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span class=
=3D"gmail-">On Thu, Apr 5, 2018 at 3:13 AM, Matthias Urlichs &lt;<a href=3D=
"mailto:matthias@urlichs.de">matthias@urlichs.de</a>&gt; wrote:<br>
&gt;<br>
&gt; Ideally we wouldn&#39;t need root<br>
&gt;<br>
&gt; If you go the netlink route, you do need one process that has the<br>
&gt; appropriate privilege, which means root at install time (but not runti=
me).<br>
<br>
</span>The process doesn&#39;t need full root permissions even at install t=
ime.<br>
Whatever process is going to create and manage<br>
the interfaces needs the CAP_NET_ADMIN capability.=C2=A0</blockquote><div><=
br></div><div>Thanks, that&#39;s good to know. Though CAP_NET_ADMIN is &quo=
t;almost root&quot; (e.g. see [1]) so it would be more comfortable to not e=
ven require that. But I guess a &quot;next best thing&quot; would be to put=
 minimal logic inside a small program and give only this program CAP_NET_AD=
MIN. Possibly wireguard-rs&#39;s `wgrs` has both sufficient and not-too-muc=
h functionality that we could directly `setcap` that, I&#39;ll have to look=
 into it in more detail. Unfortunately `wg-quick` is a shell script which i=
s more annoying to try to `setcap` on.<br><br></div><div>Another approach I=
 was thinking of, was to extend wireguard to expose a SOCKS5-UDP interface,=
 or even simpler just a socket-wrapper API like Python&#39;s `ssl.wrap_sock=
et()`, and not use tunnel interfaces at all. Of course this would run in us=
erspace, but wireguard-rs already does that so I hope there would be no &qu=
ot;extra&quot; performance penalty. Then one could run QUIC through this, a=
nd I know that some SCTP implementations can run on top of UDP too. Any fur=
ther comments on this idea would be much appreciated.<br><br></div><div>X<b=
r><br>[1] <a href=3D"https://forums.grsecurity.net/viewtopic.php?f=3D7&amp;=
t=3D2522">https://forums.grsecurity.net/viewtopic.php?f=3D7&amp;t=3D2522</a=
><br></div></div></div></div>

--001a114441eebc94a605691e8d36--
