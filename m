Return-Path: rcwhelan@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cbbe8721
 for <wireguard@lists.zx2c4.com>; Wed, 6 Dec 2017 12:33:10 +0000 (UTC)
Received: from mail-qt0-f176.google.com (mail-qt0-f176.google.com
 [209.85.216.176])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a6f6ec2e
 for <wireguard@lists.zx2c4.com>; Wed, 6 Dec 2017 12:33:10 +0000 (UTC)
Received: by mail-qt0-f176.google.com with SMTP id d4so8568252qtj.5
 for <wireguard@lists.zx2c4.com>; Wed, 06 Dec 2017 04:40:04 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <BF2C7924-EBFC-480C-AA52-D92CB818F3D3@toke.dk>
References: <CAM3m09QrRs=20aTOdDXtWg3dgCVemRgAXZ91=WTWTf_+d-ax4A@mail.gmail.com>
 <BF2C7924-EBFC-480C-AA52-D92CB818F3D3@toke.dk>
From: Ryan Whelan <rcwhelan@gmail.com>
Date: Wed, 6 Dec 2017 07:40:03 -0500
Message-ID: <CAM3m09T_GA3-AdFkZuEf4P5sG0=wNi4FN_79Da6cd4q6un+oDw@mail.gmail.com>
Subject: Re: Babel over wireguard
To: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@toke.dk>
Content-Type: multipart/alternative; boundary="94eb2c06f3da210989055fab40ff"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--94eb2c06f3da210989055fab40ff
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Are there any routing protocol implementations that do not depend on
multicast?  In my setup, 2 hosts will be able to route to one another over
2 different wg interfaces and I just need something to select whichever
interface has the least latency.  Anything like that exist? :D

On Wed, Dec 6, 2017 at 7:33 AM, Toke H=C3=B8iland-J=C3=B8rgensen <toke@toke=
.dk> wrote:

>
>
> On 6 December 2017 13:07:56 CET, Ryan Whelan <rcwhelan@gmail.com> wrote:
> >I'm looking to run babel over wireguard links and running into issues.
> >I
> >seem to be unable to get Bird or the reference implementation of Babel
> >to
> >bind to any wireguard interfaces.  Is this a known issue? or has anyone
> >found a config that works?
>
> You need to manually add link-local IPs (fe80:: something) to the
> wireguard interface. Also, since wireguard doesn't support multicast it i=
s
> only likely to work on point-to-point links with AllowedIPs set to ::/0 (=
or
> something else that includes the Babel multicast address).
>
> -Toke
>

--94eb2c06f3da210989055fab40ff
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Are there any routing protocol implementations that do not=
 depend on multicast?=C2=A0 In my setup, 2 hosts will be able to route to o=
ne another over 2 different wg interfaces and I just need something to sele=
ct whichever interface has the least latency.=C2=A0 Anything like that exis=
t? :D</div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Wed=
, Dec 6, 2017 at 7:33 AM, Toke H=C3=B8iland-J=C3=B8rgensen <span dir=3D"ltr=
">&lt;<a href=3D"mailto:toke@toke.dk" target=3D"_blank">toke@toke.dk</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D""><br>
<br>
On 6 December 2017 13:07:56 CET, Ryan Whelan &lt;<a href=3D"mailto:rcwhelan=
@gmail.com">rcwhelan@gmail.com</a>&gt; wrote:<br>
&gt;I&#39;m looking to run babel over wireguard links and running into issu=
es.<br>
&gt;I<br>
&gt;seem to be unable to get Bird or the reference implementation of Babel<=
br>
&gt;to<br>
&gt;bind to any wireguard interfaces.=C2=A0 Is this a known issue? or has a=
nyone<br>
&gt;found a config that works?<br>
<br>
</span>You need to manually add link-local IPs (fe80:: something) to the wi=
reguard interface. Also, since wireguard doesn&#39;t support multicast it i=
s only likely to work on point-to-point links with AllowedIPs set to ::/0 (=
or something else that includes the Babel multicast address).<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
-Toke<br>
</font></span></blockquote></div><br></div>

--94eb2c06f3da210989055fab40ff--
