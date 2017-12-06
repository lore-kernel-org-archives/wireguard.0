Return-Path: rcwhelan@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f3f97e26
 for <wireguard@lists.zx2c4.com>; Wed, 6 Dec 2017 13:15:08 +0000 (UTC)
Received: from mail-qt0-f175.google.com (mail-qt0-f175.google.com
 [209.85.216.175])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 15290690
 for <wireguard@lists.zx2c4.com>; Wed, 6 Dec 2017 13:15:08 +0000 (UTC)
Received: by mail-qt0-f175.google.com with SMTP id u42so8835631qte.7
 for <wireguard@lists.zx2c4.com>; Wed, 06 Dec 2017 05:22:02 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87a7yw0zmp.fsf@toke.dk>
References: <CAM3m09QrRs=20aTOdDXtWg3dgCVemRgAXZ91=WTWTf_+d-ax4A@mail.gmail.com>
 <BF2C7924-EBFC-480C-AA52-D92CB818F3D3@toke.dk>
 <CAM3m09T_GA3-AdFkZuEf4P5sG0=wNi4FN_79Da6cd4q6un+oDw@mail.gmail.com>
 <87a7yw0zmp.fsf@toke.dk>
From: Ryan Whelan <rcwhelan@gmail.com>
Date: Wed, 6 Dec 2017 08:22:01 -0500
Message-ID: <CAM3m09Sqdmw9Pkp+VYaveXeHkjVFiYJcfsVMjfxbXO=1N895jw@mail.gmail.com>
Subject: Re: Babel over wireguard
To: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@toke.dk>
Content-Type: multipart/alternative; boundary="001a1140f3e63b192b055fabd6ed"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a1140f3e63b192b055fabd6ed
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

If you're gauging interest, I would be very interested in using unicast
atop Wireguard for routing selection

Thank you for the explanation; very helpful.


On Wed, Dec 6, 2017 at 8:11 AM, Toke H=C3=B8iland-J=C3=B8rgensen <toke@toke=
.dk> wrote:

> Ryan Whelan <rcwhelan@gmail.com> writes:
>
> > Are there any routing protocol implementations that do not depend on
> > multicast?
>
> We are in the process of standardising Babel, and one of the things we
> are adding is the ability to run entirely over unicast. So in the
> future, Babel will be able to do this (and integration with Wireguard is
> one of the things I want to achieve with this). But for now, no
> implementation exists.
>
> Other than that, maybe BGP? But you'd still need integration with
> Wireguard if you don't want to just set AllowedIPs to ::/0
>
> > In my setup, 2 hosts will be able to route to one another over 2
> > different wg interfaces and I just need something to select whichever
> > interface has the least latency. Anything like that exist? :D
>
> You can do this with point-to-point wireguard links. I.e., as long as
> the wireguard link only has two peers, you can set AllowedIPs to
> 0.0.0.0/0, ::/0 on both sides, assign manual link-local addresses
> (anything in fe80::/64 will work, so you could just assign fe80::1/64 to
> one side and fe80::2/64 to the other side; they don't need to be
> globally unique either). Then you can run babeld on top, which will
> instruct the kernel to send appropriate packets to the wireguard
> interface, and wireguard will forward it to the other side.
>
> It's not currently possible to run a routing daemon on a multi-peer
> wireguard interface. The routing daemon would need to reconfigure
> wireguard in the kernel when it adds routes. I am planning to add this
> to Bird at some point, but have not gotten around to it yet...
>
> -Toke
>

--001a1140f3e63b192b055fabd6ed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">If you&#39;re gauging interest, I would be very interested=
 in using unicast atop Wireguard for routing selection<div><br></div><div>T=
hank you for the explanation; very helpful.=C2=A0=C2=A0<br></div><div><br><=
/div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Wed=
, Dec 6, 2017 at 8:11 AM, Toke H=C3=B8iland-J=C3=B8rgensen <span dir=3D"ltr=
">&lt;<a href=3D"mailto:toke@toke.dk" target=3D"_blank">toke@toke.dk</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">Ryan Whe=
lan &lt;<a href=3D"mailto:rcwhelan@gmail.com">rcwhelan@gmail.com</a>&gt; wr=
ites:<br>
<br>
&gt; Are there any routing protocol implementations that do not depend on<b=
r>
&gt; multicast?<br>
<br>
</span>We are in the process of standardising Babel, and one of the things =
we<br>
are adding is the ability to run entirely over unicast. So in the<br>
future, Babel will be able to do this (and integration with Wireguard is<br=
>
one of the things I want to achieve with this). But for now, no<br>
implementation exists.<br>
<br>
Other than that, maybe BGP? But you&#39;d still need integration with<br>
Wireguard if you don&#39;t want to just set AllowedIPs to ::/0<br>
<span class=3D""><br>
&gt; In my setup, 2 hosts will be able to route to one another over 2<br>
&gt; different wg interfaces and I just need something to select whichever<=
br>
&gt; interface has the least latency. Anything like that exist? :D<br>
<br>
</span>You can do this with point-to-point wireguard links. I.e., as long a=
s<br>
the wireguard link only has two peers, you can set AllowedIPs to<br>
<a href=3D"http://0.0.0.0/0" rel=3D"noreferrer" target=3D"_blank">0.0.0.0/0=
</a>, ::/0 on both sides, assign manual link-local addresses<br>
(anything in fe80::/64 will work, so you could just assign fe80::1/64 to<br=
>
one side and fe80::2/64 to the other side; they don&#39;t need to be<br>
globally unique either). Then you can run babeld on top, which will<br>
instruct the kernel to send appropriate packets to the wireguard<br>
interface, and wireguard will forward it to the other side.<br>
<br>
It&#39;s not currently possible to run a routing daemon on a multi-peer<br>
wireguard interface. The routing daemon would need to reconfigure<br>
wireguard in the kernel when it adds routes. I am planning to add this<br>
to Bird at some point, but have not gotten around to it yet...<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
-Toke<br>
</font></span></blockquote></div><br></div>

--001a1140f3e63b192b055fabd6ed--
