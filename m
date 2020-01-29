Return-Path: <SRS0=qOIe=3S=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A18EC33C9E
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 29 Jan 2020 01:47:06 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AC9A207FF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 29 Jan 2020 01:47:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=coryfields.com header.i=@coryfields.com header.b="YJxNh6y/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7AC9A207FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=coryfields.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1fa78c01;
	Wed, 29 Jan 2020 01:47:04 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3a97b6c6
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Jan 2020 01:47:02 +0000 (UTC)
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eb67ba7a
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Jan 2020 01:47:02 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id e9so1934881pjr.4
 for <wireguard@lists.zx2c4.com>; Tue, 28 Jan 2020 17:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=coryfields.com; s=google;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=mDtCJXRtsqECXPFdHCgbhZFmVC8RnlQ0uzCJazu4TNM=;
 b=YJxNh6y/x+HuXAT8By4x9MaS8GryiSMKKETHYqnciSik8N6FQGLo5VrJmw9QsyWtgJ
 Wxkup49fCMKp67jSB4AST6Ol7w6ZUDbEdHhjGlsZ1kHKH3lXJ1GP9p1giHIPa+TQsAzN
 z5sq6Z4RhT8/HnCpUT2uGQ0CViBAGs+VlGR1UlP7GPkq9Lk0ICSyhyhbwYgUNHS2D10R
 KyDt9kaVcH9HvNxN8ytya9t97htV0CpiTKeZqlpl6t0l+qOf9G6VO/ud8b90kCqWV0UN
 hrpSALJ+le1SwufnxqQqPPnFgpcGGrT/aSjgyK/BTQNGgzypxzHPhtdDxpqgxa9nJPrY
 9WAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=mDtCJXRtsqECXPFdHCgbhZFmVC8RnlQ0uzCJazu4TNM=;
 b=PVtBGMF5U/eQl3a5XDdPz+znwCkySFc6uijsxG/zHeYjpyFfw3J3yPSnwfBzhT6Lnw
 mNfOBhT2T6MNb3mx9Lz4psWVm7c3YCsqoutWRQB/2H2hbKKprhLSg5RrNorv3RZ47mIC
 W8ezM32REpMp/jUcPDTEQ7ShHqUWKO7mHEDow2yxJAZtleL/o3lUeZQHoVHZDaDbvSQf
 pkWopBHoxRrr5O1N8KSPZ9UXhdbsucZW4uv0ZPeh5TlGr+GUXULWBZhbOe1PT2xKrERK
 PJtnBbOXmHiBvduBPj08mGUJO4rfVB8icIDwxXmlpmENpr4STjpylEaHVY28FNDjqymG
 S6UQ==
X-Gm-Message-State: APjAAAUDZhtqglMLDuFxX9StCcIS3gV+/cpvC23/PQDd1ICLqPCjGAgy
 Qn0tOYQ2TUYYWYYPssQ8LNoLIk4O9/tyAbPMrg1MZz8e
X-Google-Smtp-Source: APXvYqzUrD1pBI506M2Dn7mCEdaTBHzhU8zejgc3iS5RAJLUQcj6oKYHKO9bBJOo3JTEK+SLauTQ7oQ3t8f0DJGr60A=
X-Received: by 2002:a17:902:7442:: with SMTP id
 e2mr13661863plt.158.1580262421610; 
 Tue, 28 Jan 2020 17:47:01 -0800 (PST)
MIME-Version: 1.0
References: <20200129002159.GA9104@wolff.to>
In-Reply-To: <20200129002159.GA9104@wolff.to>
From: Cory Fields <lists@coryfields.com>
Date: Tue, 28 Jan 2020 20:46:49 -0500
Message-ID: <CAApLimij+hsSCMmE+6367jnVkJ4mLYSmvpvq9U7Q4ncLXV-KUw@mail.gmail.com>
Subject: Re: Wireguard is now in Linus' tree
To: Bruno Wolff III <bruno@wolff.to>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
Reply-To: lists@coryfields.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============8312677575972597851=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============8312677575972597851==
Content-Type: multipart/alternative; boundary="0000000000004ad6c8059d3d8495"

--0000000000004ad6c8059d3d8495
Content-Type: text/plain; charset="UTF-8"

Congratulations Jason, and everyone who has contributed.

I can't imagine how much work this took. Thank you for seeing it through!

Regards,
Cory Fields

On Tue, Jan 28, 2020, 7:40 PM Bruno Wolff III <bruno@wolff.to> wrote:

> Linus pulled in net-next about a half hour ago. So WireGuard is now
> officially upstream. Yeah!
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--0000000000004ad6c8059d3d8495
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div dir=3D"auto">Congratulations Jason, and everyone who=
 has contributed.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I can&=
#39;t imagine how much work this took. Thank you for seeing it through!</di=
v><div dir=3D"auto"><br></div><div dir=3D"auto">Regards,</div><div dir=3D"a=
uto">Cory Fields=C2=A0</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, Jan 28, 2020, 7:40 PM Bruno Wolff III=
 &lt;<a href=3D"mailto:bruno@wolff.to">bruno@wolff.to</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">Linus pulled in net-next about a half hou=
r ago. So WireGuard is now <br>
officially upstream. Yeah!<br>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank" rel=3D"noref=
errer">WireGuard@lists.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer noreferrer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinf=
o/wireguard</a><br>
</blockquote></div>

--0000000000004ad6c8059d3d8495--

--===============8312677575972597851==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============8312677575972597851==--
