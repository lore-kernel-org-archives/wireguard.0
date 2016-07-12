Return-Path: quanzhou822@gmail.com
Received: from mail-yw0-f175.google.com (mail-yw0-f175.google.com
 [209.85.161.175])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6d727173
 for <wireguard@lists.zx2c4.com>;
 Tue, 12 Jul 2016 03:27:16 +0000 (UTC)
Received: by mail-yw0-f175.google.com with SMTP id j17so3137249ywg.0
 for <wireguard@lists.zx2c4.com>; Mon, 11 Jul 2016 20:28:02 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9q7-0+gwPOgy3f+JcBOsgXshhKsmj9Nu61y0NXa=zuCOg@mail.gmail.com>
References: <CAA5ikozfeQAFGx8Yi9d=1r5gkHNnq6e0yHFVLXHdVYD_V_Wwfg@mail.gmail.com>
 <CAHmME9oN9NU8fHTjfW6ougLf4u9ZfUHJ11MxDf3RhbC5n64g3g@mail.gmail.com>
 <CAA5ikozn+uj+FPG1eLAR9uS+Lxqiab4+dMUhmBmyg9oBiWFQEg@mail.gmail.com>
 <20160707131324.GA18014@lud.polynome.dn42>
 <CAA5ikoypGoMip+DS=Ud-dNRZOf-8m+MDtV5JobLr1MBmAdRS=A@mail.gmail.com>
 <20160707150059.GA679@wolff.to>
 <CAHmME9pcKkjmYgdgH6i3vGbd8iFxOaJDUsbczCU068sZk_pTuQ@mail.gmail.com>
 <CAA5ikozCC91ZtVPyh5Z7tEc6pZ+AktguYc9qTn6bnZPSqEpK0A@mail.gmail.com>
 <CAHmME9oy5OqRFF4b2uRtTf3JLTD-3Y6pG7hTKDpouSyVdJDfzw@mail.gmail.com>
 <CAA5ikoya6SSKbzncBf4_uHP17Rt-D=d-B5opBxniFX_MupoHRQ@mail.gmail.com>
 <CAHmME9omS1O=oTpm8Pq9D_i0XUj+sW+VU8jLur78tREYzBk__A@mail.gmail.com>
 <CAA5ikowje2HMCXz6dTR4RohHUJOszXbO9Efiinw9bXRaUOq=TA@mail.gmail.com>
 <CAHmME9q7-0+gwPOgy3f+JcBOsgXshhKsmj9Nu61y0NXa=zuCOg@mail.gmail.com>
From: Quan Zhou <quanzhou822@gmail.com>
Date: Tue, 12 Jul 2016 11:27:42 +0800
Message-ID: <CAMRLKH_9aSVs5csiw=UAzDVdVLfzOAu3zV0kRbWTH7nE2osMMQ@mail.gmail.com>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: multipart/alternative; boundary=94eb2c06437231290e053767dbde
Subject: Re: [WireGuard] Client changes endpoint port, why?
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--94eb2c06437231290e053767dbde
Content-Type: text/plain; charset=UTF-8

The logs didn't show up immediately after `make debug; sudo make install'.
Is there easier way to reload wg than rebooting, or deleting the interface?

On Mon, Jul 11, 2016 at 11:40 PM, Jason A. Donenfeld <Jason@zx2c4.com>
wrote:

> On Mon, Jul 11, 2016 at 2:16 PM, Jan De Landtsheer <jan@incubaid.com>
> wrote:
> > \o/ A LOT better now :-)
> > Great!
>
> Good to hear. I assume you tested with the snapshot I published this
> morning?
>
>
> >
> > I'll dig in deeper... Is there a way that the kernel module logs
> > connection/disconnection/ip migration ?
>
> You can get lots of junk in your dmesg if you compile with `make debug`.
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

--94eb2c06437231290e053767dbde
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The logs didn&#39;t show=C2=A0up immediately after `make d=
ebug; sudo make install&#39;. Is there easier way to reload wg than rebooti=
ng, or deleting the interface?</div><div class=3D"gmail_extra"><br><div cla=
ss=3D"gmail_quote">On Mon, Jul 11, 2016 at 11:40 PM, Jason A. Donenfeld <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:Jason@zx2c4.com" target=3D"_blank">Jas=
on@zx2c4.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span =
class=3D"">On Mon, Jul 11, 2016 at 2:16 PM, Jan De Landtsheer &lt;<a href=
=3D"mailto:jan@incubaid.com">jan@incubaid.com</a>&gt; wrote:<br>
&gt; \o/ A LOT better now :-)<br>
&gt; Great!<br>
<br>
</span>Good to hear. I assume you tested with the snapshot I published this=
 morning?<br>
<span class=3D""><br>
<br>
&gt;<br>
&gt; I&#39;ll dig in deeper... Is there a way that the kernel module logs<b=
r>
&gt; connection/disconnection/ip migration ?<br>
<br>
</span>You can get lots of junk in your dmesg if you compile with `make deb=
ug`.<br>
<div class=3D"HOEnZb"><div class=3D"h5">___________________________________=
____________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com">WireGuard@lists.zx2c4.com</a><=
br>
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

--94eb2c06437231290e053767dbde--
