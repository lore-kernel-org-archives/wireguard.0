Return-Path: <SRS0=+MVo=SD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FA3AC43381
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  1 Apr 2019 22:17:47 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DE062082C
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  1 Apr 2019 22:17:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=eero.com header.i=@eero.com header.b="D0dgu/Eb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7DE062082C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=eero.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7cfcc90e;
	Mon, 1 Apr 2019 22:15:52 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c9ab1c21
 for <wireguard@lists.zx2c4.com>; Mon, 1 Apr 2019 22:15:50 +0000 (UTC)
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com
 [IPv6:2607:f8b0:4864:20::e32])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 49bda239
 for <wireguard@lists.zx2c4.com>; Mon, 1 Apr 2019 22:15:50 +0000 (UTC)
Received: by mail-vs1-xe32.google.com with SMTP id n4so6563811vsm.3
 for <wireguard@lists.zx2c4.com>; Mon, 01 Apr 2019 15:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eero.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jhYkQ8tVfj6uZ8kSbI3GJR2V4XORdsu5UJnd/i5ys/I=;
 b=D0dgu/EbhkzzPsykgSq0aBzS8bLCNZ4nPf8Fk2iG7JcIhG1Bf9GF4nswoU618E0r2D
 0bduMXS6oqjvI/Ehh44fx8ETIlfiupszIaK+hvU+OBEHrVw+1TA8Yt0aaKAxcuGcYhTU
 fMLbXEmooe0zNWENO8DRWIxFSCj6Zf2ZzmLmk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jhYkQ8tVfj6uZ8kSbI3GJR2V4XORdsu5UJnd/i5ys/I=;
 b=pyugP1UTh8QjcMOWZ0iJ7lsW8eRDFe7WmbaMA8G4mCZwI/Y7TzWep1cKADufxWc5qi
 3I7wS4gVXRpAlYogEiqzJhJns8xtOjUSwr1o3mMQPOGE7wna6fHoYDM9it+VbP6uFB0u
 NeLCt+9iaL7/PiigP06ApWF5ta84OGcQwlQ7Jd9P54arA7aevwskN90pF+oEW2gTMYAA
 LNWGoS5Bx3AcSW8XWrGIFan4lysLQ+fs0JOSKzk8k3STwWD6Ku/7lXf3uWr9VZMCbnSP
 Zn+B1qw7nGLHuzgeIj5Fsgvf0WAm6InMygTfz2nJ+9jayva5bN9bmEbdc+QiWTkYHSuO
 ubeA==
X-Gm-Message-State: APjAAAUuFiJtffb7Z5jL1ct6yjfaaapNsYtWor+kR6ygktTK/xQHdamB
 q07WTAIyaAoau0tUkax9jG6i/Ydds/0qtrNPXuD2YA==
X-Google-Smtp-Source: APXvYqz4Wb5X1PRs3iHO9kGTavME5W/ydF6JwsifRI+XTwdIsstcdqXyIkPyekPkheyBoHYbc1YH06qPZGnZ8ArP8nc=
X-Received: by 2002:a67:eed5:: with SMTP id o21mr394376vsp.4.1554157062573;
 Mon, 01 Apr 2019 15:17:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAGCGytK=5D=f_Cf9a-h1ukjTOD-eMNf5nV5OgfYfOufYEom0tw@mail.gmail.com>
In-Reply-To: <CAGCGytK=5D=f_Cf9a-h1ukjTOD-eMNf5nV5OgfYfOufYEom0tw@mail.gmail.com>
From: David Cowden <dcow@eero.com>
Date: Mon, 1 Apr 2019 15:17:31 -0700
Message-ID: <CACN7iOCc=chAMRY7Ta9rRNr-7hWN7cZiDQ+LqYdQPFgDaJfFQA@mail.gmail.com>
Subject: Re: any plans to bring the on demand feature to Android app?
To: Arpit Gupta <g.arpit@gmail.com>
Cc: wireguard@lists.zx2c4.com
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
Content-Type: multipart/mixed; boundary="===============8460022532654523956=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============8460022532654523956==
Content-Type: multipart/alternative; boundary="000000000000a3eaf105857f6380"

--000000000000a3eaf105857f6380
Content-Type: text/plain; charset="UTF-8"

I don't think Android supports on-demand VPN in the way iOS does. See:
https://developer.android.com/reference/android/net/VpnService

On Wed, Mar 27, 2019 at 9:15 AM Arpit Gupta <g.arpit@gmail.com> wrote:

> I am using this awesome feature on the Mac os app to enable wireguard
> tunnel on unknown wifi networks and was curious if there are plans to add
> this feature to Android app?
>
> Currently using Tasker to achieve the same on Android but native support
> would be awesome.
>
>
> --
> Arpit
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--000000000000a3eaf105857f6380
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">I don&#39;t think Android supports on-dem=
and VPN in the way iOS does. See: <a href=3D"https://developer.android.com/=
reference/android/net/VpnService">https://developer.android.com/reference/a=
ndroid/net/VpnService</a><br></div></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 27, 2019 at 9:15 AM Arpit Gu=
pta &lt;<a href=3D"mailto:g.arpit@gmail.com">g.arpit@gmail.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"a=
uto">I am using this awesome feature on the Mac os app to enable wireguard =
tunnel on unknown wifi networks and was curious if there are plans to add t=
his feature to Android app?<div dir=3D"auto"><br></div><div dir=3D"auto">Cu=
rrently using Tasker to achieve the same on Android but native support woul=
d be awesome.<br><br><div dir=3D"auto"><br>--<br>Arpit</div></div></div>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@li=
sts.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinfo/wireguard=
</a><br>
</blockquote></div>

--000000000000a3eaf105857f6380--

--===============8460022532654523956==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============8460022532654523956==--
