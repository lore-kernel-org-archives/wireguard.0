Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cac1bc52
 for <wireguard@lists.zx2c4.com>; Sat, 2 Jul 2016 16:35:28 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7b6d0003
 for <wireguard@lists.zx2c4.com>; Sat, 2 Jul 2016 16:35:28 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 8e2d583f
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 2 Jul 2016 16:35:27 +0000 (UTC)
Received: by mail-lf0-f41.google.com with SMTP id l188so94551944lfe.2
 for <wireguard@lists.zx2c4.com>; Sat, 02 Jul 2016 09:38:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <6C4F7C30-175F-49DF-9E35-761B8D0FBCD1@tiernanotoole.net>
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
 <CAHmME9on6aFzYRu9HPK_DG12w-z+w5m33BaGrqTsfE_qHLDojA@mail.gmail.com>
 <6C4F7C30-175F-49DF-9E35-761B8D0FBCD1@tiernanotoole.net>
Date: Sat, 2 Jul 2016 18:38:27 +0200
Message-ID: <CAHmME9pdSkTbLJGymfG7hbE=QNjPSuWd8QQnbGaM=Dv2QRc7+A@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: tiernan@tiernanotoole.net
Content-Type: multipart/alternative; boundary=001a113db060bae6880536a9bb91
Cc: wireguard@lists.zx2c4.com
Subject: Re: [WireGuard] Single client connecting to server multiple times
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a113db060bae6880536a9bb91
Content-Type: text/plain; charset=UTF-8

Probably the best thing to do at this point would be to send over your
config and some commands for setting it up, so I can replicate your setup
myself and debug it til perfection. Seems like you could have a use case
worth optimizing for.
On Jul 2, 2016 5:53 PM, <tiernan@tiernanotoole.net> wrote:

> It shouldn't be, but will double check... I did generate two new keys, but
> will check again.
>
> --Tiernan
>
> Sent from my iPhone
>
> On Jul 2, 2016, at 12:43 PM, Jason A. Donenfeld <jason.donenfeld@gmail.com>
> wrote:
>
> Is it possible that you're using the same private key for two wireguard
> devices connecting to the same peer? This misusage could explain the ~0
> performance.
> On Jul 2, 2016 1:13 PM, <tiernan@tiernanotoole.net> wrote:
>
>> Its not wireguard thats the problem... Only the performance issue is
>> wireguard...
>> --Tiernan
>>
>> Get Outlook for iOS
>>
>>
>>
>>
>> On Fri, Jul 1, 2016 at 10:18 PM +0100, "Jason A. Donenfeld" <
>> Jason@zx2c4.com> wrote:
>>
>>
>>
>>
>>
>>
>> >
>> > Just to clarify: does ECMP *without wireguard* work for you on 4.6?
>> >
>> > In other words, is this a wireguard problem, or a 4.6 problem?
>> >
>
>

--001a113db060bae6880536a9bb91
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Probably the best thing to do at this point would be to send=
 over your config and some commands for setting it up, so I can replicate y=
our setup myself and debug it til perfection. Seems like you could have a u=
se case worth optimizing for.</p>
<div class=3D"gmail_quote">On Jul 2, 2016 5:53 PM,  &lt;<a href=3D"mailto:t=
iernan@tiernanotoole.net">tiernan@tiernanotoole.net</a>&gt; wrote:<br type=
=3D"attribution"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"auto"><div>It s=
houldn&#39;t be, but will double check... I did generate two new keys, but =
will check again.</div><div><br></div><div>--Tiernan<br><br>Sent from my iP=
hone</div><div><br>On Jul 2, 2016, at 12:43 PM, Jason A. Donenfeld &lt;<a h=
ref=3D"mailto:jason.donenfeld@gmail.com" target=3D"_blank">jason.donenfeld@=
gmail.com</a>&gt; wrote:<br><br></div><blockquote type=3D"cite"><div><p dir=
=3D"ltr">Is it possible that you&#39;re using the same private key for two =
wireguard devices connecting to the same peer? This misusage could explain =
the ~0 performance.</p>
<div class=3D"gmail_quote">On Jul 2, 2016 1:13 PM,  &lt;<a href=3D"mailto:t=
iernan@tiernanotoole.net" target=3D"_blank">tiernan@tiernanotoole.net</a>&g=
t; wrote:<br type=3D"attribution"><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Its not =
wireguard thats the problem... Only the performance issue is wireguard...<b=
r>
--Tiernan<br>
<br>
Get Outlook for iOS<br>
<br>
<br>
<br>
<br>
On Fri, Jul 1, 2016 at 10:18 PM +0100, &quot;Jason A. Donenfeld&quot; &lt;<=
a href=3D"mailto:Jason@zx2c4.com" target=3D"_blank">Jason@zx2c4.com</a>&gt;=
 wrote:<br>
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

</div></blockquote></div>
</blockquote></div>

--001a113db060bae6880536a9bb91--
