Return-Path: jan@incubaid.com
Received: from mail-lf0-f45.google.com (mail-lf0-f45.google.com
 [209.85.215.45])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2e2c3aae
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 Jul 2016 12:15:33 +0000 (UTC)
Received: by mail-lf0-f45.google.com with SMTP id q132so70887057lfe.3
 for <wireguard@lists.zx2c4.com>; Mon, 11 Jul 2016 05:16:14 -0700 (PDT)
MIME-Version: 1.0
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
In-Reply-To: <CAHmME9omS1O=oTpm8Pq9D_i0XUj+sW+VU8jLur78tREYzBk__A@mail.gmail.com>
From: Jan De Landtsheer <jan@incubaid.com>
Date: Mon, 11 Jul 2016 12:16:03 +0000
Message-ID: <CAA5ikowje2HMCXz6dTR4RohHUJOszXbO9Efiinw9bXRaUOq=TA@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: multipart/alternative; boundary=001a11401264443a4d05375b1e72
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Client changes endpoint port, why?
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a11401264443a4d05375b1e72
Content-Type: text/plain; charset=UTF-8

\o/ A LOT better now :-)
Great!

I'll dig in deeper... Is there a way that the kernel module logs
connection/disconnection/ip migration ?

Jan

On Sat, Jul 9, 2016 at 4:47 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> On Sat, Jul 9, 2016 at 4:36 PM, Jan De Landtsheer <jan@incubaid.com>
> wrote:
> > I'll check it out. I'm traveling now, will check tomorrow.
> > Jan
>
> No problem. There are further improvements to that right now in the
> authenticated-persistent-keepalive branch. If you wait til next week,
> I'll have an even better snapshot then.
>

--001a11401264443a4d05375b1e72
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">\o/ A LOT better now :-)<div>Great!=C2=A0</div><div><br></=
div><div>I&#39;ll dig in deeper... Is there a way that the kernel module lo=
gs connection/disconnection/ip migration ?</div><div><br></div><div>Jan</di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Sat, Jul 9, 2016 at 4:=
47 PM Jason A. Donenfeld &lt;<a href=3D"mailto:Jason@zx2c4.com" target=3D"_=
blank">Jason@zx2c4.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">On Sat, Jul 9, 2016 at 4:36 PM, Jan De Landtsheer &lt;<a href=3D"mailto:=
jan@incubaid.com" target=3D"_blank">jan@incubaid.com</a>&gt; wrote:<br>
&gt; I&#39;ll check it out. I&#39;m traveling now, will check tomorrow.<br>
&gt; Jan<br>
<br>
No problem. There are further improvements to that right now in the<br>
authenticated-persistent-keepalive branch. If you wait til next week,<br>
I&#39;ll have an even better snapshot then.<br>
</blockquote></div></div>

--001a11401264443a4d05375b1e72--
