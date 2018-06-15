Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ddb89aaa
 for <wireguard@lists.zx2c4.com>;
 Fri, 15 Jun 2018 17:00:58 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 375f47a5
 for <wireguard@lists.zx2c4.com>;
 Fri, 15 Jun 2018 17:00:58 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d90de2c1
 for <wireguard@lists.zx2c4.com>;
 Fri, 15 Jun 2018 16:59:43 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 2548bd0d
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 15 Jun 2018 16:59:42 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id c128-v6so9392450oig.11
 for <wireguard@lists.zx2c4.com>; Fri, 15 Jun 2018 10:05:05 -0700 (PDT)
MIME-Version: 1.0
References: <46bd903565f6b1114b1d9f6bafa7db77bf3b5090.camel@mjr.org>
 <CAHmME9rtHVwfSdy4DDFYmgw06zVerbN8oP88ZZ5ahoJB3PPTFw@mail.gmail.com>
 <CAHmME9qqBFU44wBQ2r3bWk8e7BpGQhY_U6oBg14SJA3Y05aC=A@mail.gmail.com>
 <CAHmME9qW8udKYrcdwgFK6qcabAJ8vDqijek0UcRmFTGTcUdznw@mail.gmail.com>
 <ae8cd01fb2f30682efbae8b2f8b9cd98aaaa9353.camel@mjr.org>
 <CAHmME9qU1OWW72PJ1q1=7pf+EYiPe8vdQX1V2f96Vi6WRmi9Ow@mail.gmail.com>
 <CAHmME9okF00z8-9xPU=dm_vOrdf5gv4D+CpWtVXdu2oW+N-7zw@mail.gmail.com>
 <9d824fde3e070d0d1264a09425a3c4b5cd455560.camel@mjr.org>
In-Reply-To: <9d824fde3e070d0d1264a09425a3c4b5cd455560.camel@mjr.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 15 Jun 2018 19:04:52 +0200
Message-ID: <CAHmME9pkqA7_4zaC_u14O0FX1_9pV25MhnB-SBgnWgsi+gr0uA@mail.gmail.com>
Subject: Re: Kernel lockup with (debian) 4.16.0-2-rt-amd64
To: Paul Hedderly <paul@mjr.org>
Content-Type: multipart/alternative; boundary="0000000000009a1890056eb13767"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--0000000000009a1890056eb13767
Content-Type: text/plain; charset="UTF-8"

Happy to hear it's working for you. I went asking for deeper answers, and
this thread might interest you:

https://marc.info/?l=linux-rt-users&m=152906766629953&w=2
https://marc.info/?l=linux-rt-users&m=152907896201090&w=2

On Thu, Jun 14, 2018, 21:50 Paul Hedderly <paul@mjr.org> wrote:

> On Wed, 2018-06-13 at 15:52 +0200, Jason A. Donenfeld wrote:
> > Hi Paul,
> >
> > I got an -rt kernel up and running, enabled a bunch of nice debugging
> > options, and found a handful of problems, all of which were fixed by:
> > https://git.zx2c4.com/WireGuard/commit/?id=0f05452d043d8d047cf5d7987f
> > c2732b97d676e6
>
> Well just some feedback - I ran overnight on the -rt- kernel with no
> wireguard... and it was clean and normal in the morning. Worked for a
> couple of hours with and then fired up wireguard compiled from the
> above commit - and its been running 10 hours now with no issues
> whatsoever. dmesg nice and empty!
>
> So many thanks - I think you nailed that one!
>
> > I realize the solution in that patch is a bit of a bummer, but at the
> > very least it keeps things from breaking now. I'll see if I can
> > improve it somewhere down the line.
>
> Its great to get a stable system again - brilliant work.
>
> I love wg - and having it on android (user-space only because its a new
> unrooted phone :( ) and Ubiquiti and LEDE... I'm sorted!
>
> The GSOC projects are also very exciting prospects...
>

--0000000000009a1890056eb13767
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div data-smartmail=3D"gmail_signature">Happy to hear it&=
#39;s working for you. I went asking for deeper answers, and this thread mi=
ght interest you:</div><div data-smartmail=3D"gmail_signature" dir=3D"auto"=
><br></div><div data-smartmail=3D"gmail_signature" dir=3D"auto"><a href=3D"=
https://marc.info/?l=3Dlinux-rt-users&amp;m=3D152906766629953&amp;w=3D2">ht=
tps://marc.info/?l=3Dlinux-rt-users&amp;m=3D152906766629953&amp;w=3D2</a><b=
r></div><div data-smartmail=3D"gmail_signature" dir=3D"auto"><a href=3D"htt=
ps://marc.info/?l=3Dlinux-rt-users&amp;m=3D152907896201090&amp;w=3D2">https=
://marc.info/?l=3Dlinux-rt-users&amp;m=3D152907896201090&amp;w=3D2</a><br><=
/div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Thu, Jun 14, =
2018, 21:50 Paul Hedderly &lt;<a href=3D"mailto:paul@mjr.org">paul@mjr.org<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Wed, 2018-06-13 a=
t 15:52 +0200, Jason A. Donenfeld wrote:<br>
&gt; Hi Paul,<br>
&gt; <br>
&gt; I got an -rt kernel up and running, enabled a bunch of nice debugging<=
br>
&gt; options, and found a handful of problems, all of which were fixed by:<=
br>
&gt; <a href=3D"https://git.zx2c4.com/WireGuard/commit/?id=3D0f05452d043d8d=
047cf5d7987f" rel=3D"noreferrer noreferrer" target=3D"_blank">https://git.z=
x2c4.com/WireGuard/commit/?id=3D0f05452d043d8d047cf5d7987f</a><br>
&gt; c2732b97d676e6<br>
<br>
Well just some feedback - I ran overnight on the -rt- kernel with no<br>
wireguard... and it was clean and normal in the morning. Worked for a<br>
couple of hours with and then fired up wireguard compiled from the<br>
above commit - and its been running 10 hours now with no issues<br>
whatsoever. dmesg nice and empty!<br>
<br>
So many thanks - I think you nailed that one!<br>
<br>
&gt; I realize the solution in that patch is a bit of a bummer, but at the<=
br>
&gt; very least it keeps things from breaking now. I&#39;ll see if I can<br=
>
&gt; improve it somewhere down the line.<br>
<br>
Its great to get a stable system again - brilliant work.<br>
<br>
I love wg - and having it on android (user-space only because its a new<br>
unrooted phone :( ) and Ubiquiti and LEDE... I&#39;m sorted!<br>
<br>
The GSOC projects are also very exciting prospects... <br>
</blockquote></div>

--0000000000009a1890056eb13767--
