Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5b0df1e4
 for <wireguard@lists.zx2c4.com>; Wed, 6 Jul 2016 15:37:02 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d9ea2f68
 for <wireguard@lists.zx2c4.com>; Wed, 6 Jul 2016 15:37:02 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 504fc2e5
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 6 Jul 2016 15:37:01 +0000 (UTC)
Received: by mail-lf0-f47.google.com with SMTP id l188so157085912lfe.2
 for <wireguard@lists.zx2c4.com>; Wed, 06 Jul 2016 08:37:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CANQAqMX-1MrYW+Yfn6g7BGPwn2qCDWOCoMWkLyM5W9KZgm52tQ@mail.gmail.com>
References: <CANQAqMXqQv_MkEsLSuSHNVqHGJuy6yVHhVP4mM6v3x+5iVbVqA@mail.gmail.com>
 <CAHmME9rXYm3yV0j5pW3yH59j-C9S=6X8-6OY+b=dkuRq7Vpzvw@mail.gmail.com>
 <CANQAqMX8Bf9taS+VgRYnGwuOoJcG3PL8PNmyOK66O3pHjP6VBw@mail.gmail.com>
 <CAHmME9rRHgEtsJ8F-4UrzZMwOs43T24Jq+mUHO91-oimQXXjwg@mail.gmail.com>
 <CANQAqMV=QeCG9BPvPpaCAu56a+mNi_7sNvhDL=_i4N7WFY1=Ng@mail.gmail.com>
 <CAHmME9qr2H=4Qdzx9Kz4=op-O-yzum0+hJWvazHZ_K7ex05ncQ@mail.gmail.com>
 <CANQAqMVT1UkM3uNQbHUKKysHv-tix-Ds9+KaRw62HVHUK5XC+Q@mail.gmail.com>
 <CAHmME9rh8wCLV3jaqyDBm8ZDuVUC__XZOuzbX1haonO2C_ZCEQ@mail.gmail.com>
 <CANQAqMWY=8WRbz9+bw11oUO2OAi-SFnHv=f+z5jQ0F1MYf5Ruw@mail.gmail.com>
 <CAHmME9pFhJoW+kFmJE7-acmb2q4=EqN+U+dJQ8GDEvBzN_=dRg@mail.gmail.com>
 <CANQAqMX-1MrYW+Yfn6g7BGPwn2qCDWOCoMWkLyM5W9KZgm52tQ@mail.gmail.com>
Date: Wed, 6 Jul 2016 17:37:05 +0200
Message-ID: <CAHmME9o=2n_14e-A+M3sVX93CFGV79v0eTQ=QSuacxD2MLyUCA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Norman Shulman <norman.shulman@n-dimension.com>
Content-Type: multipart/alternative; boundary=001a11400fa47209810536f957ee
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

--001a11400fa47209810536f957ee
Content-Type: text/plain; charset=UTF-8

Hey Norman,

I'm not sure I follow here. Could you maybe describe a concrete example of
what your concern is, with as much detail as possible?

Jason
On Jul 6, 2016 5:31 PM, "Norman Shulman" <norman.shulman@n-dimension.com>
wrote:

> Ethernet networks don't scale; that's why we have IP networks.
>
> So in general a client needs one address for each server? Rather limiting
> for clients on small subnets, especially considering the case of n clients
> on a subnet, each connecting to m different servers.
>
>
>
>
> On Tue, Jul 5, 2016 at 3:11 PM, Jason A. Donenfeld <Jason@zx2c4.com>
> wrote:
>
>> On Tue, Jul 5, 2016 at 9:09 PM, Norman Shulman
>> <norman.shulman@n-dimension.com> wrote:
>> > How is this enforced?
>> Receiving, line 238 here:
>> https://git.zx2c4.com/WireGuard/tree/src/receive.c#n238
>> Sending, line 112 here:
>> https://git.zx2c4.com/WireGuard/tree/src/device.c#n112
>>
>> > How does this scale?
>> The same way in which an ethernet network scales? One ethernet device
>> can have multiple IPs, but separate (unbonded) ethernet devices
>> generally do not share IPs.
>>
>
>
>
> --
> Norman Shulman
> Sr. Developer/Architect
> N-Dimension Solutions Inc.
> 9030 Leslie St, Unit 300
> Richmond Hill, ON L4B 1G2
> Canada
>
> Tel: 905 707-8884 x 226
> Fax: 905 707-0886
>
> This email and any files transmitted with it are solely intended for the
> use of the named recipient(s) and may contain information that is
> privileged and confidential. If you receive this email in error, please
> immediately notify the sender and delete this message in all its forms.
>

--001a11400fa47209810536f957ee
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Hey Norman,</p>
<p dir=3D"ltr">I&#39;m not sure I follow here. Could you maybe describe a c=
oncrete example of what your concern is, with as much detail as possible?</=
p>
<p dir=3D"ltr">Jason</p>
<div class=3D"gmail_quote">On Jul 6, 2016 5:31 PM, &quot;Norman Shulman&quo=
t; &lt;<a href=3D"mailto:norman.shulman@n-dimension.com">norman.shulman@n-d=
imension.com</a>&gt; wrote:<br type=3D"attribution"><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex"><div dir=3D"ltr">Ethernet networks don&#39;t scale; that&#39;s why =
we have IP networks.<div><br></div><div>So in general a client needs one ad=
dress for each server? Rather limiting for clients on small subnets, especi=
ally considering the case of n clients on a subnet, each connecting to m di=
fferent servers.</div><div><br></div><div><br></div><div><br></div></div><d=
iv class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Tue, Jul 5, 2016=
 at 3:11 PM, Jason A. Donenfeld <span dir=3D"ltr">&lt;<a href=3D"mailto:Jas=
on@zx2c4.com" target=3D"_blank">Jason@zx2c4.com</a>&gt;</span> wrote:<br><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex">On Tue, Jul 5, 2016 at 9:09 PM, Norman Shulman=
<br>
&lt;<a href=3D"mailto:norman.shulman@n-dimension.com" target=3D"_blank">nor=
man.shulman@n-dimension.com</a>&gt; wrote:<br>
&gt; How is this enforced?<br>
Receiving, line 238 here:<br>
<a href=3D"https://git.zx2c4.com/WireGuard/tree/src/receive.c#n238" rel=3D"=
noreferrer" target=3D"_blank">https://git.zx2c4.com/WireGuard/tree/src/rece=
ive.c#n238</a><br>
Sending, line 112 here:<br>
<a href=3D"https://git.zx2c4.com/WireGuard/tree/src/device.c#n112" rel=3D"n=
oreferrer" target=3D"_blank">https://git.zx2c4.com/WireGuard/tree/src/devic=
e.c#n112</a><br>
<br>
&gt; How does this scale?<br>
The same way in which an ethernet network scales? One ethernet device<br>
can have multiple IPs, but separate (unbonded) ethernet devices<br>
generally do not share IPs.<br>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div data-sm=
artmail=3D"gmail_signature">Norman Shulman<br>Sr. Developer/Architect<br>N-=
Dimension Solutions Inc.<br>9030 Leslie St, Unit 300<br>Richmond Hill, ON L=
4B 1G2<br>Canada<br><br>Tel: <a href=3D"tel:905%20707-8884%20x%20226" value=
=3D"+19057078884" target=3D"_blank">905 707-8884 x 226</a><br>Fax: <a href=
=3D"tel:905%20707-0886" value=3D"+19057070886" target=3D"_blank">905 707-08=
86</a><br><br>This email and any files transmitted with it are solely inten=
ded for the use of the named recipient(s) and may contain information that =
is privileged and confidential. If you receive this email in error, please =
immediately notify the sender and delete this message in all its forms.</di=
v>
</div>
</blockquote></div>

--001a11400fa47209810536f957ee--
