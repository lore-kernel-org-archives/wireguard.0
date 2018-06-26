Return-Path: kumarkarthikn@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 44c8d5ba
 for <wireguard@lists.zx2c4.com>;
 Tue, 26 Jun 2018 02:52:35 +0000 (UTC)
Received: from mail-qk0-x22d.google.com (mail-qk0-x22d.google.com
 [IPv6:2607:f8b0:400d:c09::22d])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c1c39839
 for <wireguard@lists.zx2c4.com>;
 Tue, 26 Jun 2018 02:52:35 +0000 (UTC)
Received: by mail-qk0-x22d.google.com with SMTP id y4-v6so8749247qka.5
 for <wireguard@lists.zx2c4.com>; Mon, 25 Jun 2018 19:58:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAK+ZqRryNNWq1yhAQKbzOxTKrzRmO_gfM47F18YCGOiYcdumdg@mail.gmail.com>
 <CAHmME9ooS8c-QmB6X_ySTZiYsK98vFQ-bpws6TJUUJ3sE-aCLQ@mail.gmail.com>
In-Reply-To: <CAHmME9ooS8c-QmB6X_ySTZiYsK98vFQ-bpws6TJUUJ3sE-aCLQ@mail.gmail.com>
From: karthik kumar <kumarkarthikn@gmail.com>
Date: Tue, 26 Jun 2018 08:27:52 +0530
Message-ID: <CAK+ZqRqA4BkCLmxnuNfRtNByXaDYv1MpZB44PZrCM_Mx_ncNRw@mail.gmail.com>
Subject: Re: src/crypto/curve25519-x86_64.h:1319: Error: no such instruction
 while compiling in centos 6
To: Jason@zx2c4.com
Content-Type: multipart/alternative; boundary="000000000000b5f7f2056f82aa23"
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--000000000000b5f7f2056f82aa23
Content-Type: text/plain; charset="UTF-8"

Hi,
  I did see the yum repo already being there RPMs available. But we use
only centos 6 and are desperately looking for alternate of strongswan :(
Is there any other suggestion for me, other than Centos 7 ? Is it worth
trying to rebuild the kernel with 8.1 gcc ? Is there an option like
*--without-elliptic-curve* that I can use ?

Thanks

On Tue, Jun 26, 2018 at 5:58 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> Hello,
>
> Please use CentOS 7.
>
> Jason
>

--000000000000b5f7f2056f82aa23
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,=C2=A0<div>=C2=A0 I did see the yum repo already being =
there RPMs available. But we use only centos 6 and are desperately looking =
for alternate of strongswan :(</div><div>Is there any other suggestion for =
me, other than Centos 7 ? Is it worth trying to rebuild the kernel with 8.1=
 gcc ? Is there an option like <i>--without-elliptic-curve</i>=C2=A0that I =
can use ?<br><div><div><br></div><div>Thanks</div></div></div></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr">On Tue, Jun 26, 2018 at 5:58 AM Ja=
son A. Donenfeld &lt;<a href=3D"mailto:Jason@zx2c4.com" target=3D"_blank">J=
ason@zx2c4.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hello=
,<br>
<br>
Please use CentOS 7.<br>
<br>
Jason<br>
</blockquote></div>

--000000000000b5f7f2056f82aa23--
