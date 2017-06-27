Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2ed4198a
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Jun 2017 21:53:20 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4bc8d244
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Jun 2017 21:53:20 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e8a430ea
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Jun 2017 22:06:54 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id fb52ac56
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Jun 2017 22:06:52 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id 62so36923645wmw.1
 for <wireguard@lists.zx2c4.com>; Tue, 27 Jun 2017 15:09:52 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.20.1706272226190.17486@bcny.fcbq.bet>
References: <alpine.LRH.2.20.1706260917250.14074@bcny.fcbq.bet>
 <CAHmME9p++Q0v6Ypt2Y5AFZO36hHnTKv7KBnWNnSk84V8YK+oJw@mail.gmail.com>
 <alpine.LRH.2.20.1706261023540.14074@bcny.fcbq.bet>
 <CAHmME9oHG6a1==KzrrfuvmkKoVJHhTtToP00qYtcKXEGDCnm8Q@mail.gmail.com>
 <CAHmME9ph1LQ0kufpf2RMDsMRpz7txWJGvr=d=Jr5Z1kxqqOWfQ@mail.gmail.com>
 <alpine.LRH.2.20.1706262144070.17486@bcny.fcbq.bet>
 <20170627110530.GC3026@zx2c4.com>
 <alpine.LRH.2.20.1706271237180.17486@bcny.fcbq.bet>
 <CAHmME9q8+Y_x8fDZ4n-EmU_NB6+vfBttFQ3S58h+B-j-j8e2Kg@mail.gmail.com>
 <alpine.LRH.2.20.1706272042170.17486@bcny.fcbq.bet>
 <20170627195904.GA14889@zx2c4.com>
 <CAHmME9ocHgYQe1gXRrYjJP89Ko+bFs_pt6oZtse7TaL-0KCaJA@mail.gmail.com>
 <CAHmME9ph732BdGn=COGF4b2Q-7fs_XY1WWgE+o6zjRdLDYYZFA@mail.gmail.com>
 <alpine.LRH.2.20.1706272226190.17486@bcny.fcbq.bet>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 28 Jun 2017 00:09:49 +0200
Message-ID: <CAHmME9r-g-=vEGnSksbw5iP1dn5MtsuxbnaOBVDQ=kwVqxyRjQ@mail.gmail.com>
Subject: Re: making wireguard work on RHEL7/etc.
To: wireguard@wut.to
Content-Type: multipart/alternative; boundary="94eb2c1b53b69761350552f853a4"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--94eb2c1b53b69761350552f853a4
Content-Type: text/plain; charset="UTF-8"

Great, any warnings when compiling?

On Jun 27, 2017 23:30, <wireguard@wut.to> wrote:

> Jason A. Donenfeld wrote:
>
> > Okay, and for the kernel, please give this commit a try:
> >
> > https://git.zx2c4.com/WireGuard/commit/?id=
> 32e20ef627048ffa7f8cb3567e6b4c639cd42607
> >
> > Or just run the latest git master.
> >
>
> after a quick wg-quick stop / rmmod / insmod / wg-quick start / ping this
> seems to work.
>

--94eb2c1b53b69761350552f853a4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Great, any warnings when compiling?</div><div class=3D"gm=
ail_extra"><br><div class=3D"gmail_quote">On Jun 27, 2017 23:30,  &lt;<a hr=
ef=3D"mailto:wireguard@wut.to">wireguard@wut.to</a>&gt; wrote:<br type=3D"a=
ttribution"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">Jason A. Donenfeld wrote:<br>
<br>
&gt; Okay, and for the kernel, please give this commit a try:<br>
&gt;<br>
&gt; <a href=3D"https://git.zx2c4.com/WireGuard/commit/?id=3D32e20ef627048f=
fa7f8cb3567e6b4c639cd42607" rel=3D"noreferrer" target=3D"_blank">https://gi=
t.zx2c4.com/<wbr>WireGuard/commit/?id=3D<wbr>32e20ef627048ffa7f8cb3567e6b4c=
<wbr>639cd42607</a><br>
&gt;<br>
&gt; Or just run the latest git master.<br>
&gt;<br>
<br>
after a quick wg-quick stop / rmmod / insmod / wg-quick start / ping this<b=
r>
seems to work.<br>
</blockquote></div></div>

--94eb2c1b53b69761350552f853a4--
