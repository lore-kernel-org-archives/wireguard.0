Return-Path: <SRS0=yrS1=SY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94E6AC10F11
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 22 Apr 2019 23:36:05 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D786520674
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 22 Apr 2019 23:36:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UBtz+QK+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D786520674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fc3c4619;
	Mon, 22 Apr 2019 23:35:47 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ceeadebc
 for <wireguard@lists.zx2c4.com>;
 Mon, 22 Apr 2019 23:35:44 +0000 (UTC)
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ad012b5f
 for <wireguard@lists.zx2c4.com>;
 Mon, 22 Apr 2019 23:35:44 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id k2so14114800qtm.1
 for <wireguard@lists.zx2c4.com>; Mon, 22 Apr 2019 16:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d8eMeiTZZw+0TjZrh5nJS72AkkKbQt4V4n9ePNJBwcY=;
 b=UBtz+QK+6fC+AfnES5zy0t0Rqy9eim/Mnu7btp6gNWchL0/Wz7GzXFtKyWHwAxz3Tb
 2J9Xm/BYfMLVWgQJacnGWWRA7yEpP1SmzB8dnuN6y3ii7pUJwIegIdRG7NQyog6J0bY5
 lQrqe8Don4KspAiVW5cz/vjvMoL7RY/+/PcnwSCF3GqOndHyiEszH0kecgBfcYRNybJs
 Yuai5TmFDcF1JV68lO3ilq/d5El3mnDAnZAD4EsJRa+VS72D1nbyC55OXuVwy12eH+58
 we9lu1T4lQ9gclY0gjxNQ2MuFlZuoIc4lnywl8cEMxkQBv5UGYGtPc2+JxSrOj4Mnx+o
 HCVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d8eMeiTZZw+0TjZrh5nJS72AkkKbQt4V4n9ePNJBwcY=;
 b=Ldolo67zhRhm741W2awsU4Sr07Qw84kG5qXnRJQg+jlhslNh4oZ5HW1Y3wkew6ybQX
 +lYhPs5afLJZ+Vy6sh6PqUFyw/0GZQ/Brf8VYqwhnLUO/jpY5YxZPqJ4vQfPjfWZF3GN
 YrOtdiDlc98gp9B1NY7WGCY1hGcQ7wwLg2ZFE07gDxYuRr3ffJLBcMhijVv0fCUTUzQV
 wARvekm/IZbiqhtPzyaUii0dbHJTbUn72pBhwT/xMReLlkq7leqe9vpvS4nWFArMMz+Q
 bc9EJPrazmrBhZTPxDY4dqg7FQjEEPTUes28JESZlg4EPRO22sxCoJylY92yUQi3L9Cr
 T7EQ==
X-Gm-Message-State: APjAAAWfc1eG4okhM4vmGzTKAj0D30NeQMB6mi9suzRJ6jMa0KGicMIo
 sZIyDcD1JV8TbUQIlMnVp7dwj2ZxlBgXNf1PzPHte2TE
X-Google-Smtp-Source: APXvYqw0awrtjQAhHj8dBgzRXwgwSkPBKOGAhmqRNZIWBUbPWWS3O6U8cxcGs0guj/BIxB0PzYGcSDj9eH8li7y+Mj8=
X-Received: by 2002:aed:3427:: with SMTP id w36mr17599053qtd.54.1555976143979; 
 Mon, 22 Apr 2019 16:35:43 -0700 (PDT)
MIME-Version: 1.0
References: <f87c87a0-c5b4-9ee8-ba28-9ff575987f72@gmail.com>
 <20190422181350.GA26003@xultrabook>
In-Reply-To: <20190422181350.GA26003@xultrabook>
From: Ryan Whelan <rcwhelan@gmail.com>
Date: Mon, 22 Apr 2019 19:35:33 -0400
Message-ID: <CAM3m09SB7mhS2jqPaDWPZXg1qm65=xh=yOGQQKqx9Th833QeWQ@mail.gmail.com>
Subject: Re: Use of __kernel_timespec in userspace genetlink API
To: Tharre <tharre3@gmail.com>
Cc: Matt Layher <mdlayher@gmail.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
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
Content-Type: multipart/mixed; boundary="===============1029865297228996761=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============1029865297228996761==
Content-Type: multipart/alternative; boundary="0000000000005748f0058726ede8"

--0000000000005748f0058726ede8
Content-Type: text/plain; charset="UTF-8"

Sorry to be dense, but given commit c870c7a; the timespec struct will be 16
bytes in size, regardless of the arch? 32/64bit x86 and 32/64bit ARM?



On Mon, Apr 22, 2019 at 2:15 PM Tharre <tharre3@gmail.com> wrote:

> On 04/18, Matt Layher wrote:
> > My C experience is very limited, and I have no experience working on C
> > within the kernel, but is exposing a "__kernel*" type to userspace a
> normal
> > procedure? I would have expected to see a regular timespec from
> > linux/time.h, or perhaps a timespec64 in its place.
>
> There is no timespec64 defined anywhere in include/linux, and it can't
> be a normal timespec because of the Year 2038 problem. And despite it's
> prefix, __kernel_timespec is defined in include/linux/time.h.
>
> > I can do some slightly more intelligent checking to fix the current issue
> > with my library, but I wanted to check in and confirm that this API
> contract
> > is correct.
>
> The change from struct timespec to struct __kernel_timespec happened in
> commit c870c7a[0] so I'm guessing it's intentional.
>
> Hope that helps.
>
> [0] http://git.zx2c4.com/WireGuard/commit/?id=c870c7a
>
> --
> PGP fingerprint: 42CE 7698 D6A0 6129 AA16  EF5C 5431 BDE2 C8F0 B2F4
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--0000000000005748f0058726ede8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sorry to be dense, but given commit c870c7a; the timespec =
struct will be 16 bytes in size, regardless of the arch? 32/64bit x86 and 3=
2/64bit ARM?<div><br></div><div><br></div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Apr 22, 2019 at 2:15 PM T=
harre &lt;<a href=3D"mailto:tharre3@gmail.com">tharre3@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 04/18, M=
att Layher wrote:<br>
&gt; My C experience is very limited, and I have no experience working on C=
<br>
&gt; within the kernel, but is exposing a &quot;__kernel*&quot; type to use=
rspace a normal<br>
&gt; procedure? I would have expected to see a regular timespec from<br>
&gt; linux/time.h, or perhaps a timespec64 in its place.<br>
<br>
There is no timespec64 defined anywhere in include/linux, and it can&#39;t<=
br>
be a normal timespec because of the Year 2038 problem. And despite it&#39;s=
<br>
prefix, __kernel_timespec is defined in include/linux/time.h.<br>
<br>
&gt; I can do some slightly more intelligent checking to fix the current is=
sue<br>
&gt; with my library, but I wanted to check in and confirm that this API co=
ntract<br>
&gt; is correct.<br>
<br>
The change from struct timespec to struct __kernel_timespec happened in<br>
commit c870c7a[0] so I&#39;m guessing it&#39;s intentional.<br>
<br>
Hope that helps.<br>
<br>
[0] <a href=3D"http://git.zx2c4.com/WireGuard/commit/?id=3Dc870c7a" rel=3D"=
noreferrer" target=3D"_blank">http://git.zx2c4.com/WireGuard/commit/?id=3Dc=
870c7a</a><br>
<br>
-- <br>
PGP fingerprint: 42CE 7698 D6A0 6129 AA16=C2=A0 EF5C 5431 BDE2 C8F0 B2F4<br=
>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@li=
sts.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinfo/wireguard=
</a><br>
</blockquote></div>

--0000000000005748f0058726ede8--

--===============1029865297228996761==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============1029865297228996761==--
