Return-Path: me.kalin@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a65b4108
 for <wireguard@lists.zx2c4.com>;
 Thu, 22 Mar 2018 19:07:43 +0000 (UTC)
Received: from mail-oi0-f47.google.com (mail-oi0-f47.google.com
 [209.85.218.47])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9e75cf64
 for <wireguard@lists.zx2c4.com>;
 Thu, 22 Mar 2018 19:07:43 +0000 (UTC)
Received: by mail-oi0-f47.google.com with SMTP id 126-v6so2366790oig.0
 for <wireguard@lists.zx2c4.com>; Thu, 22 Mar 2018 12:19:08 -0700 (PDT)
MIME-Version: 1.0
References: <1521743208.1840.55.camel@gmail.com>
In-Reply-To: <1521743208.1840.55.camel@gmail.com>
From: Kalin KOZHUHAROV <me.kalin@gmail.com>
Date: Thu, 22 Mar 2018 19:18:56 +0000
Message-ID: <CAKXLc7eF4c_x-FcDT=_xoUCi2BQiU2faNkiJDFiSqDHYUi9AwQ@mail.gmail.com>
Subject: Re: link disappears
To: ST <smntov@gmail.com>
Content-Type: multipart/alternative; boundary="001a1137314083f6730568052eda"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a1137314083f6730568052eda
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 22, 2018, 19:27 ST <smntov@gmail.com> wrote:

> Hello,
>
> I'm new to networking in general and VPN in particular but need to setup
> infrastructure to be able to SSH easily to several people who are behind
> routers (NAT). After reading that WireGuard is super simple - I decided
> to give it try.
>
> It indeed turned out to be simple till now. I setup a Debian virtual
> server with a public IP and configure it as follows:
>
> Server:
>
> # wg
> interface: wg0
>   public key: QMwhCacViCKcTrkevg5NxLnTEJDU1bTNgQp43rp7BHM=
>   private key: (hidden)
>   listening port: 12000
>
> peer: hiUdjmCK+iZf8wGEB+rYxMYYBF8QoOsm3nkF3asllRY=
>   endpoint: 37.X.Y.Z:4488
>   allowed ips: 10.8.8.9/32


Where is that port from?


Is everything OK here?... At the beginning everything worked as expected
> - I could ping/SSH in both directions via the private 10.8.8.8 and
> 10.8.8.9 addresses. Later I put my desktop into "hibernate mode" and
> after turning it on again could no longer use the link...
>

I guess the NAT router in between dropped your connection by timeout.
You either need to ping from behind-NAT first, to re-establish the tunnel,
or if you want to do it both-ways setup portforwarding on the NAT.

Check the keepalive opions in wg, in case your NAT has only short memory.

Cheers,
Kalin.

--001a1137314083f6730568052eda
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">=
On Thu, Mar 22, 2018, 19:27 ST &lt;<a href=3D"mailto:smntov@gmail.com">smnt=
ov@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hello,<=
br>
<br>
I&#39;m new to networking in general and VPN in particular but need to setu=
p<br>
infrastructure to be able to SSH easily to several people who are behind<br=
>
routers (NAT). After reading that WireGuard is super simple - I decided<br>
to give it try.<br>
<br>
It indeed turned out to be simple till now. I setup a Debian virtual<br>
server with a public IP and configure it as follows:<br>
<br>
Server:<br>
<br>
# wg<br>
interface: wg0<br>
=C2=A0 public key: QMwhCacViCKcTrkevg5NxLnTEJDU1bTNgQp43rp7BHM=3D<br>
=C2=A0 private key: (hidden)<br>
=C2=A0 listening port: 12000<br>
<br>
peer: hiUdjmCK+iZf8wGEB+rYxMYYBF8QoOsm3nkF3asllRY=3D<br>
=C2=A0 endpoint: 37.X.Y.Z:4488<br>
=C2=A0 allowed ips: <a href=3D"http://10.8.8.9/32" rel=3D"noreferrer norefe=
rrer" target=3D"_blank">10.8.8.9/32</a></blockquote></div></div><div dir=3D=
"auto"><br></div><div dir=3D"auto"></div><div dir=3D"auto">Where is that po=
rt from?</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div =
dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
Is everything OK here?... At the beginning everything worked as expected<br=
>
- I could ping/SSH in both directions via the private 10.8.8.8 and<br>
10.8.8.9 addresses. Later I put my desktop into &quot;hibernate mode&quot; =
and<br>
after turning it on again could no longer use the link...<br></blockquote><=
/div></div><div dir=3D"auto"><br></div><div dir=3D"auto">I guess the NAT ro=
uter in between dropped your connection by timeout.</div><div dir=3D"auto">=
You either need to ping from behind-NAT first, to re-establish the tunnel, =
or if you want to do it both-ways setup portforwarding on the NAT.</div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">Check the keepalive opions in wg=
, in case your NAT has only short memory.</div><div dir=3D"auto"><br></div>=
<div dir=3D"auto">Cheers,</div><div dir=3D"auto">Kalin.</div></div>

--001a1137314083f6730568052eda--
