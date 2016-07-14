Return-Path: norman.shulman@n-dimension.com
Received: from mail-vk0-f43.google.com (mail-vk0-f43.google.com
 [209.85.213.43])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 53adcf7d
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Jul 2016 21:15:15 +0000 (UTC)
Received: by mail-vk0-f43.google.com with SMTP id x130so129632934vkc.0
 for <wireguard@lists.zx2c4.com>; Thu, 14 Jul 2016 14:16:22 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9oo1WJqt=RKxOWwko2nZ3o-BWooL3P9abcCV8hMENLZgQ@mail.gmail.com>
References: <CAHmME9rXYm3yV0j5pW3yH59j-C9S=6X8-6OY+b=dkuRq7Vpzvw@mail.gmail.com>
 <CANQAqMX8Bf9taS+VgRYnGwuOoJcG3PL8PNmyOK66O3pHjP6VBw@mail.gmail.com>
 <CAHmME9rRHgEtsJ8F-4UrzZMwOs43T24Jq+mUHO91-oimQXXjwg@mail.gmail.com>
 <CANQAqMV=QeCG9BPvPpaCAu56a+mNi_7sNvhDL=_i4N7WFY1=Ng@mail.gmail.com>
 <CAHmME9qr2H=4Qdzx9Kz4=op-O-yzum0+hJWvazHZ_K7ex05ncQ@mail.gmail.com>
 <CANQAqMVT1UkM3uNQbHUKKysHv-tix-Ds9+KaRw62HVHUK5XC+Q@mail.gmail.com>
 <CAHmME9rh8wCLV3jaqyDBm8ZDuVUC__XZOuzbX1haonO2C_ZCEQ@mail.gmail.com>
 <CANQAqMWY=8WRbz9+bw11oUO2OAi-SFnHv=f+z5jQ0F1MYf5Ruw@mail.gmail.com>
 <CAHmME9pFhJoW+kFmJE7-acmb2q4=EqN+U+dJQ8GDEvBzN_=dRg@mail.gmail.com>
 <CANQAqMX-1MrYW+Yfn6g7BGPwn2qCDWOCoMWkLyM5W9KZgm52tQ@mail.gmail.com>
 <20160706154834.GH2040@lud.polynome.dn42>
 <CANQAqMW6=tBgOL67UHkjt79xUUcRzx51weE3Lj+8RpX6MkEK+g@mail.gmail.com>
 <CAHmME9oo1WJqt=RKxOWwko2nZ3o-BWooL3P9abcCV8hMENLZgQ@mail.gmail.com>
From: Norman Shulman <norman.shulman@n-dimension.com>
Date: Thu, 14 Jul 2016 17:16:19 -0400
Message-ID: <CANQAqMX0ywXN0vTxmeZXLYL7kuB0By-18yN9Kj4=_sHGRuSooA@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: multipart/alternative; boundary=94eb2c05631670df0c05379f03be
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] WireGuard cryptokey routing
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--94eb2c05631670df0c05379f03be
Content-Type: text/plain; charset=UTF-8

Hi Jason,

Sorry if this sounds too theoretical. I'm just trying to understand the
cryptokey routing well enough to determine if it's suitable for our use.
The main problem I have is understanding how you can base routing on
non-routable addresses, which are not unique.

Thanks.

Norm


On Thu, Jul 7, 2016 at 12:18 PM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> On Thu, Jul 7, 2016 at 6:15 PM, Norman Shulman
> <norman.shulman@n-dimension.com> wrote:
> > Look at it from the server side. There are millions of clients on
> millions
> > of 192.168.1.0/24 networks, yet a server can communicate with no more
> than
> > 254 of them.
>
> Voila, this is where you are most certainly mistaken.
>
> While a client might have 192.168.1.8 as their IP address for eth0,
> their IP address for wg0 can be something completely different. Want a
> million clients? Use a /20 as your wireguard device inner IP.
>
> Anyway, why don't you tell us all what you actually want to do, rather
> than these meandering theoretical questions? Then maybe we can help
> you effectively.
>



-- 
Norman Shulman
Sr. Developer/Architect
N-Dimension Solutions Inc.
9030 Leslie St, Unit 300
Richmond Hill, ON L4B 1G2
Canada

Tel: 905 707-8884 x 226
Fax: 905 707-0886

This email and any files transmitted with it are solely intended for the
use of the named recipient(s) and may contain information that is
privileged and confidential. If you receive this email in error, please
immediately notify the sender and delete this message in all its forms.

--94eb2c05631670df0c05379f03be
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Jason,<div><br></div><div>Sorry if this sounds too theo=
retical. I&#39;m just trying to understand the cryptokey routing well enoug=
h to determine if it&#39;s suitable for our use. The main problem I have is=
 understanding how you can base routing on non-routable addresses, which ar=
e not unique.</div><div><br></div><div>Thanks.</div><div><br></div><div>Nor=
m</div><div><br></div></div><div class=3D"gmail_extra"><br><div class=3D"gm=
ail_quote">On Thu, Jul 7, 2016 at 12:18 PM, Jason A. Donenfeld <span dir=3D=
"ltr">&lt;<a href=3D"mailto:Jason@zx2c4.com" target=3D"_blank">Jason@zx2c4.=
com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"=
">On Thu, Jul 7, 2016 at 6:15 PM, Norman Shulman<br>
&lt;<a href=3D"mailto:norman.shulman@n-dimension.com">norman.shulman@n-dime=
nsion.com</a>&gt; wrote:<br>
&gt; Look at it from the server side. There are millions of clients on mill=
ions<br>
&gt; of <a href=3D"http://192.168.1.0/24" rel=3D"noreferrer" target=3D"_bla=
nk">192.168.1.0/24</a> networks, yet a server can communicate with no more =
than<br>
&gt; 254 of them.<br>
<br>
</span>Voila, this is where you are most certainly mistaken.<br>
<br>
While a client might have 192.168.1.8 as their IP address for eth0,<br>
their IP address for wg0 can be something completely different. Want a<br>
million clients? Use a /20 as your wireguard device inner IP.<br>
<br>
Anyway, why don&#39;t you tell us all what you actually want to do, rather<=
br>
than these meandering theoretical questions? Then maybe we can help<br>
you effectively.<br>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature">Norman Shulman<br>S=
r. Developer/Architect<br>N-Dimension Solutions Inc.<br>9030 Leslie St, Uni=
t 300<br>Richmond Hill, ON L4B 1G2<br>Canada<br><br>Tel: 905 707-8884 x 226=
<br>Fax: 905 707-0886<br><br>This email and any files transmitted with it a=
re solely intended for the use of the named recipient(s) and may contain in=
formation that is privileged and confidential. If you receive this email in=
 error, please immediately notify the sender and delete this message in all=
 its forms.</div>
</div>

--94eb2c05631670df0c05379f03be--
