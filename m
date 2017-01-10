Return-Path: jftucker@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1f4c3937
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Jan 2017 04:24:02 +0000 (UTC)
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
 [209.85.223.175])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 98404288
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Jan 2017 04:24:02 +0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id f103so98740696ioi.1
 for <wireguard@lists.zx2c4.com>; Mon, 09 Jan 2017 20:33:43 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAHmME9or-Xd+w8Hu2+7yC8bFY2fcvrsU_EKAOj6ftPJP-nf3kQ@mail.gmail.com>
References: <20170110034729.40733-1-jftucker@gmail.com>
 <CAHmME9or-Xd+w8Hu2+7yC8bFY2fcvrsU_EKAOj6ftPJP-nf3kQ@mail.gmail.com>
From: James Tucker <jftucker@gmail.com>
Date: Mon, 9 Jan 2017 20:33:42 -0800
Message-ID: <CABGa_T_RnVtNukW=3z_wJ3Uf2nri1SFddoPpDkEve0bu3vhEbQ@mail.gmail.com>
Subject: Re: [PATCH] uapi: add bit-field padding for field alignment
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: multipart/alternative; boundary=001a113f99ac3b5c1e0545b5fd4f
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a113f99ac3b5c1e0545b5fd4f
Content-Type: text/plain; charset=UTF-8

Thanks Jason!

On Mon, Jan 9, 2017 at 8:22 PM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> I think I'm going to roll with a flags fix instead, like this:
> https://git.zx2c4.com/WireGuard/commit/?id=45bd499f15debb0e2443b15f7ff1d0
> ef93950acc
>
> This should eliminate all portability issues.
>

--001a113f99ac3b5c1e0545b5fd4f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Jason!<div class=3D"gmail_extra"><br><div class=3D"=
gmail_quote">On Mon, Jan 9, 2017 at 8:22 PM, Jason A. Donenfeld <span dir=
=3D"ltr">&lt;<a href=3D"mailto:Jason@zx2c4.com" target=3D"_blank">Jason@zx2=
c4.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">I think I&#3=
9;m going to roll with a flags fix instead, like this:<br>
<a href=3D"https://git.zx2c4.com/WireGuard/commit/?id=3D45bd499f15debb0e244=
3b15f7ff1d0ef93950acc" rel=3D"noreferrer" target=3D"_blank">https://git.zx2=
c4.com/<wbr>WireGuard/commit/?id=3D<wbr>45bd499f15debb0e2443b15f7ff1d0<wbr>=
ef93950acc</a><br>
<br>
This should eliminate all portability issues.<br>
</blockquote></div><br></div></div>

--001a113f99ac3b5c1e0545b5fd4f--
