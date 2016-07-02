Return-Path: jason.donenfeld@gmail.com
Received: from mail-lf0-f47.google.com (mail-lf0-f47.google.com
 [209.85.215.47])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 618f6e3e
 for <wireguard@lists.zx2c4.com>; Sat, 2 Jul 2016 11:40:58 +0000 (UTC)
Received: by mail-lf0-f47.google.com with SMTP id h129so91981750lfh.1
 for <wireguard@lists.zx2c4.com>; Sat, 02 Jul 2016 04:44:02 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <34EBEFA02A9AAB1F.D01CDA37-F08A-44BF-802A-5DBAB6BF3EC1@mail.outlook.com>
References: <34EBEFA02A9AAB1F.1117239f-f3e4-4320-907d-9a9edbb083c6@mail.outlook.com>
 <CAHmME9rL4jdWQV66hGOSbY5yymVXatq67bMjEJwVBFTxNRB-uA@mail.gmail.com>
 <045201d1d2b3$3eaa6b70$bbff4250$@tiernanotoole.net>
 <CAHmME9oa+k0h9s62ts5DpqqWiSnf6zQRfCZyeOCXNsObOHyVDA@mail.gmail.com>
 <FE551DD9-28B0-4B3D-89F3-EB0F142AB48B@tiernanotoole.net>
 <20160701093751.GA28109@lud.polynome.dn42>
 <CAHmME9oAU2GBjTw8Aschv=-ey1nvCbcoof5C+Hdchx+cvJitQw@mail.gmail.com>
 <0bb801d1d3da$bf361960$3da24c20$@tiernanotoole.net>
 <CAHmME9rzfr38ek74v4Giz1HaBPOAS=qMTwkHoOr3cQKV-jgncw@mail.gmail.com>
 <0bbe01d1d3dd$544d4bc0$fce7e340$@tiernanotoole.net>
 <CAHmME9qojwH-Ehc_fh3D68dMKF4jdBRTVqVb09RyW-tEgZbU8A@mail.gmail.com>
 <34EBEFA02A9AAB1F.D01CDA37-F08A-44BF-802A-5DBAB6BF3EC1@mail.outlook.com>
Date: Sat, 2 Jul 2016 13:43:59 +0200
Message-ID: <CAHmME9on6aFzYRu9HPK_DG12w-z+w5m33BaGrqTsfE_qHLDojA@mail.gmail.com>
From: "Jason A. Donenfeld" <jason.donenfeld@gmail.com>
To: tiernan@tiernanotoole.net
Content-Type: multipart/alternative; boundary=001a1142c1269342130536a59eea
Cc: wireguard@lists.zx2c4.com
Subject: Re: [WireGuard] Single client connecting to server multiple times
Reply-To: Jason@zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a1142c1269342130536a59eea
Content-Type: text/plain; charset=UTF-8

Is it possible that you're using the same private key for two wireguard
devices connecting to the same peer? This misusage could explain the ~0
performance.
On Jul 2, 2016 1:13 PM, <tiernan@tiernanotoole.net> wrote:

> Its not wireguard thats the problem... Only the performance issue is
> wireguard...
> --Tiernan
>
> Get Outlook for iOS
>
>
>
>
> On Fri, Jul 1, 2016 at 10:18 PM +0100, "Jason A. Donenfeld" <
> Jason@zx2c4.com> wrote:
>
>
>
>
>
>
> >
> > Just to clarify: does ECMP *without wireguard* work for you on 4.6?
> >
> > In other words, is this a wireguard problem, or a 4.6 problem?
> >

--001a1142c1269342130536a59eea
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Is it possible that you&#39;re using the same private key fo=
r two wireguard devices connecting to the same peer? This misusage could ex=
plain the ~0 performance.</p>
<div class=3D"gmail_quote">On Jul 2, 2016 1:13 PM,  &lt;<a href=3D"mailto:t=
iernan@tiernanotoole.net">tiernan@tiernanotoole.net</a>&gt; wrote:<br type=
=3D"attribution"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">Its not wireguard thats the=
 problem... Only the performance issue is wireguard...<br>
--Tiernan<br>
<br>
Get Outlook for iOS<br>
<br>
<br>
<br>
<br>
On Fri, Jul 1, 2016 at 10:18 PM +0100, &quot;Jason A. Donenfeld&quot; &lt;<=
a href=3D"mailto:Jason@zx2c4.com">Jason@zx2c4.com</a>&gt; wrote:<br>
<br>
<br>
<br>
<br>
<br>
<br>
&gt;<br>
&gt; Just to clarify: does ECMP *without wireguard* work for you on 4.6?<br=
>
&gt;<br>
&gt; In other words, is this a wireguard problem, or a 4.6 problem?<br>
&gt; </blockquote></div>

--001a1142c1269342130536a59eea--
