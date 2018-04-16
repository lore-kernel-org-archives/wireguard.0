Return-Path: luizluca@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c14e9768
 for <wireguard@lists.zx2c4.com>;
 Mon, 16 Apr 2018 01:32:44 +0000 (UTC)
Received: from mail-oi0-f45.google.com (mail-oi0-f45.google.com
 [209.85.218.45])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2dcf4522
 for <wireguard@lists.zx2c4.com>;
 Mon, 16 Apr 2018 01:32:44 +0000 (UTC)
Received: by mail-oi0-f45.google.com with SMTP id h11-v6so3764282oic.3
 for <wireguard@lists.zx2c4.com>; Sun, 15 Apr 2018 18:47:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAJq09z7tm6Cz7RyiO0GTTS7V6oXTVGpdF_ss3eYJT_qMPE=GwA@mail.gmail.com>
 <CAHmME9qpEVW3AwDPCUSUA_A4DJi+oTGoMX4V3fVyHk7aXsAZ6Q@mail.gmail.com>
 <1523786895.1990.5.camel@gmail.com>
In-Reply-To: <1523786895.1990.5.camel@gmail.com>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Mon, 16 Apr 2018 01:47:01 +0000
Message-ID: <CAJq09z6sHzLPkcCMmwOm0dyA2yS1CY0z-Mqgs9px04L8gMfdxA@mail.gmail.com>
Subject: Re: Sharing peer data
To: ST <smntov@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000008ad6850569ed665c"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--0000000000008ad6850569ed665c
Content-Type: text/plain; charset="UTF-8"

>
> Just one question: let's assume B and C got the required information
> about each other's IPs/public keys from A. Will they now communicate
> directly without relying on A in whatever way?... It is important to
> know for the case when A is a server with metered paid traffic... Will
> the communication between B and C affect the traffic of A or not?


In my point of view, it is something that all nodes must agree to accept (a
non-default option). Of course, if node A wants to measure traffic, it
ahould not allow it, forcing all traffic from B to C to pass through it.

I imagine something like:

Node A: hey node B, I noticed that you are sending traffic to another
remote node (node C). You can continue to send traffic through me but, in
parallel, could you please try to contact node C directly? It is currently
using ip x.x.x.x and its pubkey is aaaaaa.
-- 

Luiz Angelo Daros de Luca
luizluca@gmail.com

--0000000000008ad6850569ed665c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Just one question=
: let&#39;s assume B and C got the required information<br>
about each other&#39;s IPs/public keys from A. Will they now communicate<br=
>
directly without relying on A in whatever way?... It is important to<br>
know for the case when A is a server with metered paid traffic... Will<br>
the communication between B and C affect the traffic of A or not?</blockquo=
te></div><div><br></div><div>In my point of view, it is something that all =
nodes must agree to accept (a non-default option). Of course, if node A wan=
ts to measure traffic, it ahould not allow it, forcing all traffic from B t=
o C to pass through it.</div><div><br></div><div>I imagine something like:<=
/div><div><br></div><div>Node A: hey node B, I noticed that you are sending=
 traffic to another remote node (node C). You can continue to send traffic =
through me but, in parallel, could you please try to contact node C directl=
y? It is currently using ip x.x.x.x and its pubkey is aaaaaa.</div><div cla=
ss=3D"gmail_quote"></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature" =
data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><p dir=3D"ltr">Luiz Ang=
elo Daros de Luca<br>
<a href=3D"mailto:luizluca@gmail.com">luizluca@gmail.com</a></p>
</div></div>

--0000000000008ad6850569ed665c--
