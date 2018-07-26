Return-Path: eric@bluelinelabs.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 249e5d67
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Jul 2018 23:16:42 +0000 (UTC)
Received: from mail-qk0-x229.google.com (mail-qk0-x229.google.com
 [IPv6:2607:f8b0:400d:c09::229])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5c70a2d0
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Jul 2018 23:16:42 +0000 (UTC)
Received: by mail-qk0-x229.google.com with SMTP id 26-v6so2171346qks.9
 for <wireguard@lists.zx2c4.com>; Thu, 26 Jul 2018 16:26:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAHjFYUJp3A3Q_Jdqcn8XOnnYfsnMsF6x2FUM=AiAV=j0g8BY9w@mail.gmail.com>
 <CAHmME9r8zh_X5JDSHy+wkAyeX3Kt-FuWzpcxFSgkBdo8o13Rnw@mail.gmail.com>
 <e4f3f09a-1281-7f79-9d80-a878f0dd8cbe@mib-infotech.co.nz>
 <CY4PR14MB1141B39996AC40980AB9CC01A22B0@CY4PR14MB1141.namprd14.prod.outlook.com>
 <CAHmME9p4Qd+TYYzpDxoUs2tpj9beLbFAQWiX-P98jZ5x0hpisg@mail.gmail.com>
In-Reply-To: <CAHmME9p4Qd+TYYzpDxoUs2tpj9beLbFAQWiX-P98jZ5x0hpisg@mail.gmail.com>
From: Eric Kuck <eric@bluelinelabs.com>
Date: Thu, 26 Jul 2018 18:25:52 -0500
Message-ID: <CAMj-8hTSTzABdMjQsS8t6P-JAS0BGQT_YAvhmGJx0rvj9u+wcA@mail.gmail.com>
Subject: Re: Android Update wants Camera Permissions
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: multipart/alternative; boundary="000000000000dab6610571ef515f"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--000000000000dab6610571ef515f
Content-Type: text/plain; charset="UTF-8"

Yes, that is correct. It's requested at time of first use only.

On Thu, Jul 26, 2018, 6:21 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> [adding Eric and Harsh to the CC]
>
> On Fri, Jul 27, 2018 at 1:15 AM Denis Kisselev <denis@dkisselev.net>
> wrote:
> > That permission should probably only be requested as-needed but I
> suspect that wg is targeting an older Android API that doesn't expose that
> capability.
>
> It was my understanding that only Android 4 would prompt at install
> time and Android 5+ would only prompt when actually used. Perhaps I'm
> mistaken?
>

--000000000000dab6610571ef515f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Yes, that is correct. It&#39;s requested at time of first=
 use only.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Thu, Jul=
 26, 2018, 6:21 PM Jason A. Donenfeld &lt;<a href=3D"mailto:Jason@zx2c4.com=
">Jason@zx2c4.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">[a=
dding Eric and Harsh to the CC]<br>
<br>
On Fri, Jul 27, 2018 at 1:15 AM Denis Kisselev &lt;<a href=3D"mailto:denis@=
dkisselev.net" target=3D"_blank" rel=3D"noreferrer">denis@dkisselev.net</a>=
&gt; wrote:<br>
&gt; That permission should probably only be requested as-needed but I susp=
ect that wg is targeting an older Android API that doesn&#39;t expose that =
capability.<br>
<br>
It was my understanding that only Android 4 would prompt at install<br>
time and Android 5+ would only prompt when actually used. Perhaps I&#39;m<b=
r>
mistaken?<br>
</blockquote></div>

--000000000000dab6610571ef515f--
