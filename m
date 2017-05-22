Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6aa5c2b4
 for <wireguard@lists.zx2c4.com>;
 Mon, 22 May 2017 00:56:07 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b8faecb4
 for <wireguard@lists.zx2c4.com>;
 Mon, 22 May 2017 00:56:07 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f54c2bfd
 for <wireguard@lists.zx2c4.com>;
 Mon, 22 May 2017 01:07:32 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 8ede4e35
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 22 May 2017 01:07:32 +0000 (UTC)
Received: by mail-oi0-f45.google.com with SMTP id h4so143866206oib.3
 for <wireguard@lists.zx2c4.com>; Sun, 21 May 2017 18:08:04 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170522030211.6fb18de8@msi.defcon1>
References: <2fa3ef35-fde6-55d2-0872-52aa2bcb87d2@biot.com>
 <CAHmME9pJEXKRhz8dbY6hrg33Ey-j6zD6O2uu125bMqx_vCKovg@mail.gmail.com>
 <20170522030211.6fb18de8@msi.defcon1>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 22 May 2017 03:08:03 +0200
Message-ID: <CAHmME9pntk1UvFscCWsryW8eSCqzL66of0_F=H4KE0bmpZwA+Q@mail.gmail.com>
Subject: Re: openresolv dependency
To: Bzzzz <lazyvirus@gmx.com>
Content-Type: multipart/alternative; boundary="001a113e2b6ecc5a5d05501280cb"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a113e2b6ecc5a5d05501280cb
Content-Type: text/plain; charset="UTF-8"

On Mon, May 22, 2017 at 3:02 AM, Bzzzz <lazyvirus@gmx.com> wrote:

> On Mon, 22 May 2017 02:41:13 +0200
> "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:
>
> > https://github.com/EggieCode/wireguard-ppa/issues/19
>
> Following your comment, you could flip the resolvconf dependency from
> a mandatory one to a a recommand or even a suggest, with a few comment
> lines into the /usr/share/doc/README.Debian file.
>

The problem is that I would like to be able to use the -x and -m switches
of resolvconf, which only openresolv has. However, it appears that
openresolv does not work very well out of the box on Ubuntu.

So, I'm not quite sure what I can recommend to Ubuntu users as a reliable
way of setting a per-interface DNS override. Or even what command I could
put in wg-quick to encapsulate that kind of logic.

Any ideas?

--001a113e2b6ecc5a5d05501280cb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, May 22, 2017 at 3:02 AM, Bzzzz <span dir=3D"ltr">&lt;<a href=3D=
"mailto:lazyvirus@gmx.com" target=3D"_blank">lazyvirus@gmx.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">On Mon, 22 May 2017 02:41:13 +0=
200<br>
&quot;Jason A. Donenfeld&quot; &lt;<a href=3D"mailto:Jason@zx2c4.com">Jason=
@zx2c4.com</a>&gt; wrote:<br>
<br>
&gt; <a href=3D"https://github.com/EggieCode/wireguard-ppa/issues/19" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/EggieCode/<wbr>wiregua=
rd-ppa/issues/19</a><br>
<br>
Following your comment, you could flip the resolvconf dependency from<br>
a mandatory one to a a recommand or even a suggest, with a few comment<br>
lines into the /usr/share/doc/README.Debian file.<br></blockquote><div><br>=
</div><div>The problem is that I would like to be able to use the -x and -m=
 switches of resolvconf, which only openresolv has. However, it appears tha=
t openresolv does not work very well out of the box on Ubuntu.</div><div><b=
r></div><div>So, I&#39;m not quite sure what I can recommend to Ubuntu user=
s as a reliable way of setting a per-interface DNS override. Or even what c=
ommand I could put in wg-quick to encapsulate that kind of logic.</div><div=
><br></div><div>Any ideas?</div></div>
</div></div>

--001a113e2b6ecc5a5d05501280cb--
