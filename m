Return-Path: <SRS0=Sp06=U3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EAB5C4321A
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 28 Jun 2019 14:42:22 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC2E12086D
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 28 Jun 2019 14:42:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wea3NsDZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC2E12086D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 58996735;
	Fri, 28 Jun 2019 14:42:04 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e0fefbc9
 for <wireguard@lists.zx2c4.com>;
 Fri, 28 Jun 2019 14:42:03 +0000 (UTC)
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8515e76d
 for <wireguard@lists.zx2c4.com>;
 Fri, 28 Jun 2019 14:42:03 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id r6so6209788oti.3
 for <wireguard@lists.zx2c4.com>; Fri, 28 Jun 2019 07:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/M/J0g+Cx19t6RDBxVkYU72RySiWg3zQvaNn2JciXR8=;
 b=Wea3NsDZxkd/LyqG6RzbpzpNlYGpNLaeRtaSOk1SoGT0envsliEtTlotdqzU/RRDKO
 99RtMu0F47ervzOi9mohD09D00j9AvFpp8OSk54/JOXg+pn8wmBHbwh9iA6Jk1zpPNj2
 4wHdNB5PZXOfnGu1mqRwflo2K8F7Co9YEZvuQtwaVqq+WRC2PxldPPohIg5gD90DMPnZ
 piI/B44yBz+OYw/YKAV8ar8WTaCLt1/rH86aQ77GrE4VDCheGTknr62iXDLOk3uprhxW
 aTCtwXKI0npmRA10r4oJFZptRwydZdnJaC2su2T/Boc9xNFqllXMnWgbpglEafMxQiLV
 eQCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/M/J0g+Cx19t6RDBxVkYU72RySiWg3zQvaNn2JciXR8=;
 b=qJ9brpwhjWp/6nLYSz6hyyQqZx2I0FBx9bh36jRwNPhd93FtE/3HN0eDRIGilGR7tb
 YUpsvXa3DMFNMQKLL8EmyA6QjfFbbCZx82hsLoWAVpmn3g9ichPx8ZcLuDS5Ia9/Hnko
 sIoz8H8xnezR+a1+lF2x8yOlmE23AJmsBZey9e2cobkMkdYyA1mW8Hs/9vhU8+I+B9PE
 nowVpWafFctYupjByq2igzhCawjBsF9lGXZJtmYVQswjlKQvkbAHgWBwV93gF0Ah4Nfb
 wYPlc6ZQtfcA6ybDnK/meRVVCsOAF/8t2WTWKed6QDQYI8eJeZ+9GhtgcI5FR3quWKiH
 3xfQ==
X-Gm-Message-State: APjAAAWCqwjDZz7uFdWduviPAahF7fTro1Krj89I6hDL6q6K7Dn4R3rm
 KtWKfSJ7lFSHs05Ulsid0nw2fs98ycUYpB9hUgA=
X-Google-Smtp-Source: APXvYqyfCHFsa7k1ZUmNax6lyRUY7i1cYsah+EznME8UTNZFkyPvqP5htjhP3hBu/MNzDknJn+StgoXjwdFEgy2UVQg=
X-Received: by 2002:a9d:7dd9:: with SMTP id k25mr8652267otn.350.1561732922896; 
 Fri, 28 Jun 2019 07:42:02 -0700 (PDT)
MIME-Version: 1.0
References: <CADXv92b2P79-OJBzK+aXhKFr3k_VqZkkkAuZOg5dALui8aNTiA@mail.gmail.com>
 <CAHmME9qi6eb+YCKx8NdtN85ouTszDBrCsrshT1sYFTUXw8K_zQ@mail.gmail.com>
 <CAKJniYQ-YcFrYm8hz2Q8aWaJf2jLTsa_g2VGy_UaqfEx2yBUtQ@mail.gmail.com>
 <CAHmME9rT11fPmBuRxa_sSRjW01ZN6eSJuDEpKOpGVbH2e=SZew@mail.gmail.com>
 <CAHmME9rNis62NiBZTyuaOjcxRtu2N9=90GaLR03_zQOPmYwFhg@mail.gmail.com>
In-Reply-To: <CAHmME9rNis62NiBZTyuaOjcxRtu2N9=90GaLR03_zQOPmYwFhg@mail.gmail.com>
From: Michael <gravitygrazer@gmail.com>
Date: Fri, 28 Jun 2019 16:41:52 +0200
Message-ID: <CADXv92ZnXYbUYJOnA_xsr6Q4HCfSxFZaqLN0WXDLobCUjsJayg@mail.gmail.com>
Subject: Re: RHEL8 package install or build fail
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============5757362852765002631=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============5757362852765002631==
Content-Type: multipart/alternative; boundary="0000000000001a74a7058c634892"

--0000000000001a74a7058c634892
Content-Type: text/plain; charset="UTF-8"

Hello Jason,
applying the patch for compat.h resolves - compiling works fine. However
the Netlink headers libmnl.h were missing, seems there is no standard
RHEL8-dev package for the library, had to take it from netfilter.org/Fedora.
Then OK:

[ 9386.069776] wireguard: WireGuard 0.0.20190601-7-g44070b9-dirty loaded.
See www.wireguard.com for information.

[root@paris src]# wg show
interface: wg0

-- Mike


On Fri, Jun 28, 2019 at 2:32 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> This commit fixes it and will be included in the next snapshot:
>
> https://git.zx2c4.com/WireGuard/commit/?id=80f006d3656ce2858675020a23879e916ea8a4fc
>
> [ec2-user@ip-172-31-24-82 ~]$ cat /etc/redhat-release
> Red Hat Enterprise Linux release 8.0 (Ootpa)
> [ec2-user@ip-172-31-24-82 ~]$ uname -a
> Linux ip-172-31-24-82.eu-west-1.compute.internal
> 4.18.0-80.4.2.el8_0.x86_64 #1 SMP Fri Jun 14 13:20:24 UTC 2019 x86_64
> x86_64 x86_64 GNU/Linux
> [ec2-user@ip-172-31-24-82 ~]$ sudo ip link add wg0 type wireguard
> [ec2-user@ip-172-31-24-82 ~]$ sudo wg
> interface: wg0
> [ec2-user@ip-172-31-24-82 ~]$ dmesg | grep wireguard
> [  693.365784] wireguard: loading out-of-tree module taints kernel.
> [  693.382433] wireguard: module verification failed: signature and/or
> required key missing - tainting kernel
> [  693.390216] wireguard: WireGuard 0.0.20190601-8-g9e71cce-dirty
> loaded. See www.wireguard.com for information.
> [  693.397561] wireguard: Copyright (C) 2015-2019 Jason A. Donenfeld
> <Jason@zx2c4.com>. All Rights Reserved.
>

--0000000000001a74a7058c634892
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hello Jason,<div>applying the patch for c=
ompat.h resolves - compiling works fine. However the Netlink headers libmnl=
.h were missing, seems there is no standard RHEL8-dev package for the libra=
ry, had to take it from <a href=3D"http://netfilter.org/Fedora" target=3D"_=
blank">netfilter.org/Fedora</a>. Then OK:<br></div><div><br></div><div>[ 93=
86.069776] wireguard: WireGuard 0.0.20190601-7-g44070b9-dirty loaded. See <=
a href=3D"http://www.wireguard.com" target=3D"_blank">www.wireguard.com</a>=
 for information.<br></div><div><br></div><div>[root@paris src]# wg show<br=
>interface: wg0<br></div><div><br></div><div>-- Mike<br></div><div><br></di=
v></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Fri, Jun 28, 2019 at 2:32 PM Jason A. Donenfeld &lt;<a href=3D"mailto:=
Jason@zx2c4.com" target=3D"_blank">Jason@zx2c4.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">This commit fixes it and =
will be included in the next snapshot:<br>
<a href=3D"https://git.zx2c4.com/WireGuard/commit/?id=3D80f006d3656ce285867=
5020a23879e916ea8a4fc" rel=3D"noreferrer" target=3D"_blank">https://git.zx2=
c4.com/WireGuard/commit/?id=3D80f006d3656ce2858675020a23879e916ea8a4fc</a><=
br>
<br>
[ec2-user@ip-172-31-24-82 ~]$ cat /etc/redhat-release<br>
Red Hat Enterprise Linux release 8.0 (Ootpa)<br>
[ec2-user@ip-172-31-24-82 ~]$ uname -a<br>
Linux ip-172-31-24-82.eu-west-1.compute.internal<br>
4.18.0-80.4.2.el8_0.x86_64 #1 SMP Fri Jun 14 13:20:24 UTC 2019 x86_64<br>
x86_64 x86_64 GNU/Linux<br>
[ec2-user@ip-172-31-24-82 ~]$ sudo ip link add wg0 type wireguard<br>
[ec2-user@ip-172-31-24-82 ~]$ sudo wg<br>
interface: wg0<br>
[ec2-user@ip-172-31-24-82 ~]$ dmesg | grep wireguard<br>
[=C2=A0 693.365784] wireguard: loading out-of-tree module taints kernel.<br=
>
[=C2=A0 693.382433] wireguard: module verification failed: signature and/or=
<br>
required key missing - tainting kernel<br>
[=C2=A0 693.390216] wireguard: WireGuard 0.0.20190601-8-g9e71cce-dirty<br>
loaded. See <a href=3D"http://www.wireguard.com" rel=3D"noreferrer" target=
=3D"_blank">www.wireguard.com</a> for information.<br>
[=C2=A0 693.397561] wireguard: Copyright (C) 2015-2019 Jason A. Donenfeld<b=
r>
&lt;<a href=3D"mailto:Jason@zx2c4.com" target=3D"_blank">Jason@zx2c4.com</a=
>&gt;. All Rights Reserved.<br>
</blockquote></div></div>

--0000000000001a74a7058c634892--

--===============5757362852765002631==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============5757362852765002631==--
