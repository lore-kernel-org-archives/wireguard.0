Return-Path: jan@incubaid.com
Received: from mail-lf0-f49.google.com (mail-lf0-f49.google.com
 [209.85.215.49])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3e43264e
 for <wireguard@lists.zx2c4.com>; Sat, 9 Jul 2016 14:36:08 +0000 (UTC)
Received: by mail-lf0-f49.google.com with SMTP id q132so44326590lfe.3
 for <wireguard@lists.zx2c4.com>; Sat, 09 Jul 2016 07:36:35 -0700 (PDT)
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
In-Reply-To: <CAHmME9oy5OqRFF4b2uRtTf3JLTD-3Y6pG7hTKDpouSyVdJDfzw@mail.gmail.com>
From: Jan De Landtsheer <jan@incubaid.com>
Date: Sat, 09 Jul 2016 14:36:25 +0000
Message-ID: <CAA5ikoya6SSKbzncBf4_uHP17Rt-D=d-B5opBxniFX_MupoHRQ@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: multipart/alternative; boundary=001a113e5634910177053734d8ae
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

--001a113e5634910177053734d8ae
Content-Type: text/plain; charset=UTF-8

I'll check it out. I'm traveling now, will check tomorrow.
Jan

On Fri, Jul 8, 2016, 7:47 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> Hi Jan,
>
> Have you tried this with the latest snapshot I published today? It
> should fix your problem. For the boxes that are behind NAT, set
> 'PersistentKeepAlive = 25'. See the new manpage and the /quickstart/
> blurb on the website. Alternatively, check out the [ANNOUNCE] release
> notes on the mailing list from today.
>
> Regards,
> Jason
>

--001a113e5634910177053734d8ae
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">I&#39;ll check it out. I&#39;m traveling now, will check tom=
orrow.<br>
Jan</p>
<br><div class=3D"gmail_quote"><div dir=3D"ltr">On Fri, Jul 8, 2016, 7:47 P=
M Jason A. Donenfeld &lt;<a href=3D"mailto:Jason@zx2c4.com">Jason@zx2c4.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Jan,<br>
<br>
Have you tried this with the latest snapshot I published today? It<br>
should fix your problem. For the boxes that are behind NAT, set<br>
&#39;PersistentKeepAlive =3D 25&#39;. See the new manpage and the /quicksta=
rt/<br>
blurb on the website. Alternatively, check out the [ANNOUNCE] release<br>
notes on the mailing list from today.<br>
<br>
Regards,<br>
Jason<br>
</blockquote></div>

--001a113e5634910177053734d8ae--
