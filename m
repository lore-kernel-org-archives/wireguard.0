Return-Path: quanzhou822@gmail.com
Received: from mail-yw0-f169.google.com (mail-yw0-f169.google.com
 [209.85.161.169])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cff377c8
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Jul 2016 15:33:18 +0000 (UTC)
Received: by mail-yw0-f169.google.com with SMTP id j12so99468425ywb.2
 for <wireguard@lists.zx2c4.com>; Fri, 22 Jul 2016 08:35:22 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160722151458.GA14212@wolff.to>
References: <20160721205742.GA10312@wolff.to>
 <20160722081821.GA11505@lud.polynome.dn42>
 <20160722090913.GA8383@wolff.to> <20160722093211.GA12311@lud.polynome.dn42>
 <20160722113212.GA17578@wolff.to>
 <CAHmME9rX828zTOjCvcHAQgNxofmDxU0WpZcgqPTTMX2v-ZKmgA@mail.gmail.com>
 <20160722151458.GA14212@wolff.to>
From: Quan Zhou <quanzhou822@gmail.com>
Date: Fri, 22 Jul 2016 23:35:02 +0800
Message-ID: <CAMRLKH-wHk+nbvxuqDzYxOHXZVop6yqRf26CbFsWzWrnB=yy3g@mail.gmail.com>
To: wireguard@lists.zx2c4.com
Content-Type: multipart/alternative; boundary=94eb2c115f44b828bd05383b2ee2
Subject: Re: [WireGuard] Using wireguard link as a proxy?
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--94eb2c115f44b828bd05383b2ee2
Content-Type: text/plain; charset=UTF-8

I happen to have a similar problem, using `AllowedIPs = 0.0.0.0/0` on both
sides of a wireguard link works, but when I try to add more peers, all but
one gets `(none)`. I know this is by design, but it would be sweet if I can
manually set gateways within a wireguarded network.

On Fri, Jul 22, 2016 at 11:14 PM, Bruno Wolff III <bruno@wolff.to> wrote:

> On Fri, Jul 22, 2016 at 14:42:52 +0200,
>  "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:
>
>> I usually do something like:
>>
>> wg set wg0 peer ABCD allowed-ips 0.0.0.0/0
>> ip route add 0/1 dev wg0
>> ip route add 128/1 dev wg0
>>
>
> The idea I am working on now is to use policy writing and rules, so that
> packets sent to the proxy server are routed using the normal routing table
> which includes the default route supplied by dhcp, but eveything else (well
> not 127/8) uses an alternate routing table that has a default route through
> wg0. This way I can use a fixed set up and not have to parse the routing
> info setup after a wireless connection is made.
>
> I need to do some reading to get the details for creating routing tables
> and rules for picking them, but expect this will work.
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> http://lists.zx2c4.com/mailman/listinfo/wireguard
>



-- 
Regards,

Quan Zhou
+------------------------+
|pub [expires 2019-05-04]|
|2C0C 4D88 E631 4C73 4C44|
|CDE0 C0E 5470 1D2D 3F3EE|
+------------------------+
|pub [revoked 2016-04-16]|
|44D2 0307 1643 E80F 2E31|
|F081 FAFA 6643 7F9F D46F|
+------------------------+
|quanzhou822@gmail.com   |
|https://keybase.io/qzhou|
+------------------------+

--94eb2c115f44b828bd05383b2ee2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I happen to have a similar problem, using `AllowedIPs =3D =
<a href=3D"http://0.0.0.0/0`">0.0.0.0/0`</a> on both sides of a wireguard l=
ink works, but when I try to add more peers, all but one gets `(none)`. I k=
now this is by design, but it would be sweet if I can manually set gateways=
 within a wireguarded=C2=A0network.</div><div class=3D"gmail_extra"><br><di=
v class=3D"gmail_quote">On Fri, Jul 22, 2016 at 11:14 PM, Bruno Wolff III <=
span dir=3D"ltr">&lt;<a href=3D"mailto:bruno@wolff.to" target=3D"_blank">br=
uno@wolff.to</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span =
class=3D"">On Fri, Jul 22, 2016 at 14:42:52 +0200,<br>
=C2=A0&quot;Jason A. Donenfeld&quot; &lt;<a href=3D"mailto:Jason@zx2c4.com"=
 target=3D"_blank">Jason@zx2c4.com</a>&gt; wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
I usually do something like:<br>
<br>
wg set wg0 peer ABCD allowed-ips <a href=3D"http://0.0.0.0/0" rel=3D"norefe=
rrer" target=3D"_blank">0.0.0.0/0</a><br>
ip route add 0/1 dev wg0<br>
ip route add 128/1 dev wg0<br>
</blockquote>
<br></span>
The idea I am working on now is to use policy writing and rules, so that pa=
ckets sent to the proxy server are routed using the normal routing table wh=
ich includes the default route supplied by dhcp, but eveything else (well n=
ot 127/8) uses an alternate routing table that has a default route through =
wg0. This way I can use a fixed set up and not have to parse the routing in=
fo setup after a wireless connection is made.<br>
<br>
I need to do some reading to get the details for creating routing tables an=
d rules for picking them, but expect this will work.<div class=3D"HOEnZb"><=
div class=3D"h5"><br>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@li=
sts.zx2c4.com</a><br>
<a href=3D"http://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"norefe=
rrer" target=3D"_blank">http://lists.zx2c4.com/mailman/listinfo/wireguard</=
a><br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=
=3D"ltr"><div><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=
=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><font face=3D"monospace, monospa=
ce">Regards,<br><br>Quan Zhou<br></font><span style=3D"font-family:monospac=
e,monospace;font-size:12.8px">+------------------------+</span></div><div d=
ir=3D"ltr"><font face=3D"monospace, monospace">|pub [expires 2019-05-04]|</=
font><br style=3D"font-family:monospace,monospace;font-size:12.8px"><font f=
ace=3D"monospace, monospace">|2C0C 4D88 E631 4C73 4C44|<br>|CDE0 C0E 5470 1=
D2D 3F3EE|</font></div><div dir=3D"ltr"><font face=3D"monospace, monospace"=
>+------------------------+<br>|pub [revoked 2016-04-16]|<br>|44D2 0307 164=
3 E80F 2E31|<br>|F081 FAFA 6643 7F9F D46F|<br>+------------------------+<br=
>|<a href=3D"mailto:quanzhou822@gmail.com" target=3D"_blank">quanzhou822@gm=
ail.com</a>=C2=A0 =C2=A0|<br>|<a href=3D"https://keybase.io/qzhou" target=
=3D"_blank">https://keybase.io/qzhou</a>|<br>+------------------------+</fo=
nt></div></div></div></div></div></div></div></div></div>
</div>

--94eb2c115f44b828bd05383b2ee2--
