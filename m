Return-Path: <SRS0=Af8f=VO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD19DC7618F
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jul 2019 20:43:12 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F6C32184E
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jul 2019 20:43:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chrisbox.org header.i=@chrisbox.org header.b="OZfdkAkk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F6C32184E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chrisbox.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a1aa05d6;
	Wed, 17 Jul 2019 20:41:50 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 101f9124
 for <wireguard@lists.zx2c4.com>;
 Fri, 28 Jun 2019 12:06:08 +0000 (UTC)
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bb2ee215
 for <wireguard@lists.zx2c4.com>;
 Fri, 28 Jun 2019 12:06:08 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id d126so2884455pfd.2
 for <wireguard@lists.zx2c4.com>; Fri, 28 Jun 2019 05:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chrisbox.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=af09xcwnCLFMbYqWMiL38akUEHi632MNznBAAXVcQkA=;
 b=OZfdkAkkYF42kQBtHTKp5bBAh5D97OSQ8EqRryKRbo3MVz9sOJy2JbVijizwAF1mhC
 IF4K/9iRuul2iVP3bmgIgIHp7+JSKMlSO8vjNvBHGEo/aZiS39pfsu7yd2VqifvUx1WQ
 odvduKf/BDP5I6orFxkemOEsiM8QHL7zpRrzk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=af09xcwnCLFMbYqWMiL38akUEHi632MNznBAAXVcQkA=;
 b=VNl1n0Lx1Xu7X/2ZIrC3Dq9J9gs5qHFmVCi7e42VKAMmZpsv7gfL/hkDQRwMHwYFhS
 J/TQpZ4Rjl252KMvz0/YqcJ9fho6JJ3my/eu9tdTDKF1Tr+QAhJVsa6A3C5qtQrxqFsH
 pS49bXFpzRYL10pVLOJeScqX3rlNqbi6HMYX10mo5T0HC2tIbOjVMdLHZVB6ZN+b7G6B
 sHwXsF+jGEpDIljPO3PPoG9hw/QgRmcr0ofGuBfFFapWyBfFeOEZ/by3JFCBosSpHeDQ
 INjsWRxP5YhDYXAHz4AclM2Lw0HIkgAQFWI3SyX1ObPoyPyB7SyusNv7wX+Y+BHq0rJq
 WeKA==
X-Gm-Message-State: APjAAAUVlgpgf+CyxzFXczlvsaPYj8u7kXfFXqsQx4yrrOxdzIjO+cy2
 yMJ3VGYEa+tYpIY6JZUX5rPuS2+kR08opWi/q6lDKw==
X-Google-Smtp-Source: APXvYqzZ7dePXQoYRPfPjWdGDu3HLIDkt8xkstsbtNp0wAmYwt5RwxPUC/rIGs6Vxhk3ejQtGW87Q3qxHOFgx2wUlBg=
X-Received: by 2002:a63:2259:: with SMTP id t25mr8326792pgm.298.1561723567212; 
 Fri, 28 Jun 2019 05:06:07 -0700 (PDT)
MIME-Version: 1.0
References: <CADXv92b2P79-OJBzK+aXhKFr3k_VqZkkkAuZOg5dALui8aNTiA@mail.gmail.com>
 <CAHmME9qi6eb+YCKx8NdtN85ouTszDBrCsrshT1sYFTUXw8K_zQ@mail.gmail.com>
In-Reply-To: <CAHmME9qi6eb+YCKx8NdtN85ouTszDBrCsrshT1sYFTUXw8K_zQ@mail.gmail.com>
From: Christopher Bachner <hello@chrisbox.org>
Date: Fri, 28 Jun 2019 14:05:55 +0200
Message-ID: <CAKJniYQ-YcFrYm8hz2Q8aWaJf2jLTsa_g2VGy_UaqfEx2yBUtQ@mail.gmail.com>
Subject: Re: RHEL8 package install or build fail
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
X-Mailman-Approved-At: Wed, 17 Jul 2019 22:41:49 +0200
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
Content-Type: multipart/mixed; boundary="===============4365519441812426594=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============4365519441812426594==
Content-Type: multipart/alternative; boundary="000000000000762253058c611a30"

--000000000000762253058c611a30
Content-Type: text/plain; charset="UTF-8"

Hi Jason,

You can get free developer access to RHEL.

https://developers.redhat.com/blog/2018/01/19/command-line-heros-podcast/

Greetings,

Christopher


On Fri, 28 Jun 2019 at 14:03 Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> Hi Mike,
>
> While RHEL8 is out, it looks like CentOS 8 is not yet, so I don't have
> much of a way to make sure our compat layer works well for RHEL8. Do
> you have any suggestions on how I could obtain access to a running
> RHEL8 box and its kernel sources?
>
> Jason
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--000000000000762253058c611a30
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">Hi Jason,</div></div><div dir=3D"auto"><br></div><di=
v dir=3D"auto">You can get free developer access to RHEL.=C2=A0</div><div d=
ir=3D"auto"><br><div dir=3D"auto"><a href=3D"https://developers.redhat.com/=
blog/2018/01/19/command-line-heros-podcast/">https://developers.redhat.com/=
blog/2018/01/19/command-line-heros-podcast/</a></div><div dir=3D"auto"><br>=
</div><div dir=3D"auto">Greetings,</div><div dir=3D"auto"><br></div><div di=
r=3D"auto">Christopher=C2=A0</div><div dir=3D"auto"><br></div></div><div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, =
28 Jun 2019 at 14:03 Jason A. Donenfeld &lt;<a href=3D"mailto:Jason@zx2c4.c=
om">Jason@zx2c4.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
Hi Mike,<br>
<br>
While RHEL8 is out, it looks like CentOS 8 is not yet, so I don&#39;t have<=
br>
much of a way to make sure our compat layer works well for RHEL8. Do<br>
you have any suggestions on how I could obtain access to a running<br>
RHEL8 box and its kernel sources?<br>
<br>
Jason<br>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@li=
sts.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinfo/wireguard=
</a><br>
</blockquote></div></div>

--000000000000762253058c611a30--

--===============4365519441812426594==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============4365519441812426594==--
