Return-Path: cedrickienzler1@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4ac80924
 for <wireguard@lists.zx2c4.com>;
 Mon, 16 Apr 2018 10:19:11 +0000 (UTC)
Received: from mail-ua0-f169.google.com (mail-ua0-f169.google.com
 [209.85.217.169])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1af8d6dc
 for <wireguard@lists.zx2c4.com>;
 Mon, 16 Apr 2018 10:19:11 +0000 (UTC)
Received: by mail-ua0-f169.google.com with SMTP id a17so9731555uaf.13
 for <wireguard@lists.zx2c4.com>; Mon, 16 Apr 2018 03:33:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAApANAYEwJfsopDUvDOHv5jZ62oz88wHsggVPLPgjzUMzaWCkA@mail.gmail.com>
 <CAJqFBzx2=aQox=RhtK-L0FsLZ+xKL19v4jQ0WGO6hxwubBYuGQ@mail.gmail.com>
In-Reply-To: <CAJqFBzx2=aQox=RhtK-L0FsLZ+xKL19v4jQ0WGO6hxwubBYuGQ@mail.gmail.com>
From: cedric Kienzler <cedrickienzler1@gmail.com>
Date: Mon, 16 Apr 2018 10:33:31 +0000
Message-ID: <CAApANAZun3dERe-+QP1CcKuPg-Jpk_Uo=QjfD-kSiyhQ8O052g@mail.gmail.com>
Subject: Re: Bird OSPF Problems
To: Zsolt Hegyi <hegyi.mokka@gmail.com>
Content-Type: multipart/alternative; boundary="001a113b3b0e7086c30569f4c1f9"
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a113b3b0e7086c30569f4c1f9
Content-Type: text/plain; charset="UTF-8"

Thanks, I'll check it out.

Best regards,
Cedi

On Mon, Apr 16, 2018, 12:32 Zsolt Hegyi <hegyi.mokka@gmail.com> wrote:

> Hi Cedric,
>
> As far as I know, wireguard doesn't support multicasts yet, which OSPF
> uses for neighbor discovery. The reason why BGP works is because it uses
> unicast TCP packets as means of communication.
>
> To get around this, try telling BIRD that your wireguard interface is an
> NBMA network (or a point-to-point link).
>
> vista
>
> On Mon, 16 Apr 2018, 11:27 cedric Kienzler, <cedrickienzler1@gmail.com>
> wrote:
>
>> Hey List,
>>
>> i'm currently facing issues with OSPF over the wireguard tunnel.
>>
>> I use both, IPv4 and IPv6 and everything works fine. I can ping through
>> the tunnel, traffic flows perfectly, but when i try to configure OSPF using
>> the Bird routing daemon, i didn't even see a HELLO message. Also when
>> trying to list the interface using 'show ospf interfaces' i didn't even see
>> the Interface.
>>
>> For IPv6 i use 2a03.... as prefix.
>> Should i configure multicast IPv6 (fe80::) on the interface too to get
>> OSPF working?
>>
>> Interesting fact: BGB using Bird works just fine.
>>
>> Anyone here that could help me?
>>
>>
>> Thanks a lot.
>>
>> Best regards,
>> Cedi
>> _______________________________________________
>> WireGuard mailing list
>> WireGuard@lists.zx2c4.com
>> https://lists.zx2c4.com/mailman/listinfo/wireguard
>>
>

--001a113b3b0e7086c30569f4c1f9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thanks, I&#39;ll check it out.<div dir=3D"auto"><br></div=
><div dir=3D"auto">Best regards,=C2=A0</div><div dir=3D"auto">Cedi</div></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Mon, Apr 16, 2018, 12=
:32 Zsolt Hegyi &lt;<a href=3D"mailto:hegyi.mokka@gmail.com">hegyi.mokka@gm=
ail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Cedric,<d=
iv><br></div><div>As far as I know, wireguard doesn&#39;t support multicast=
s yet, which OSPF uses for neighbor discovery. The reason why BGP works is =
because it uses unicast TCP packets as means of communication.</div><div><b=
r></div><div>To get around this, try telling BIRD that your wireguard inter=
face is an NBMA network (or a point-to-point link).</div><div><br></div><di=
v>vista<br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Mon, 16 Apr 2=
018, 11:27 cedric Kienzler, &lt;<a href=3D"mailto:cedrickienzler1@gmail.com=
" target=3D"_blank" rel=3D"noreferrer">cedrickienzler1@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div><div><di=
v><div><div><div><div><div><div>Hey List,<br><br></div>i&#39;m currently fa=
cing issues with OSPF over the wireguard tunnel.<br><br></div>I use both, I=
Pv4 and IPv6 and everything works fine. I can ping through the tunnel, traf=
fic flows perfectly, but when i try to configure OSPF using the Bird routin=
g daemon, i didn&#39;t even see a HELLO message. Also when trying to list t=
he interface using &#39;show ospf interfaces&#39; i didn&#39;t even see the=
 Interface.<br><br></div>For IPv6 i use 2a03.... as prefix.<br></div>Should=
 i configure multicast IPv6 (fe80::) on the interface too to get OSPF worki=
ng?<br><br></div>Interesting fact: BGB using Bird works just fine.<br><br><=
/div>Anyone here that could help me?<br><br><br></div>Thanks a lot.<br><br>=
</div>Best regards,<br></div>Cedi<br></div>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank" rel=3D"noref=
errer">WireGuard@lists.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer noreferrer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinf=
o/wireguard</a><br>
</blockquote></div></div>
</blockquote></div>

--001a113b3b0e7086c30569f4c1f9--
