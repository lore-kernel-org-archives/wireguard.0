Return-Path: <SRS0=ofmn=26=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEBCEC33CA1
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  9 Jan 2020 06:02:23 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7475720721
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  9 Jan 2020 06:02:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uy6e8yM4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7475720721
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bab8be26;
	Thu, 9 Jan 2020 06:02:23 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 49d705f5
 for <wireguard@lists.zx2c4.com>; Fri, 3 Jan 2020 18:05:27 +0000 (UTC)
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5cbe233f
 for <wireguard@lists.zx2c4.com>; Fri, 3 Jan 2020 18:05:27 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id l8so42278876edw.1
 for <wireguard@lists.zx2c4.com>; Fri, 03 Jan 2020 10:05:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6a46w+NrrJJznMpDDp2Nyl+id/d9GYtDhUbIcNCYX/0=;
 b=Uy6e8yM47I9HDO6mJEiAwtjZVoXsdUag5RAOoatzcDG0I95AX5ZRMAsqYJ1wOtV8ul
 svvNrgAy9Hya7wHUv3sfKHDzdvIFdkGcC3dq+6MhdB9s+bRk65Zx1EV6RVUcVc/BMJkX
 sjJkrOOx0M/D9qP62zs3LKXeOLuL1g5CzaKIU4UWuPEaNYvyRLvRXl4BbAVw1xb5pNQS
 khWcWC1HfRoCmp6iW4xjqkAowfa366ZQvppxPjb/Kn0ShzmZiAa8N7MTInebIOQHMbNo
 12pfrCDiiZ/HNu4SbJ74lheVdVDgK5zlrd9WeFJbx5ZyAgheqq2aXHWiiDP0blmwkrIl
 aLSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6a46w+NrrJJznMpDDp2Nyl+id/d9GYtDhUbIcNCYX/0=;
 b=uIs33wR8EiflFAHIcuTQahIWm0lodG+Ycr7deuf2O99veIoiYybQzGLZ3/nxSjAcVR
 ETT5kqBG2h3tsl8dQy5vA0mtrxEOEdXLzkjy23pyYEEEnPygTpFQRUeQu7REWn8azLBn
 WrpVkLBSTm1WLhWPRd3nn6e3Ko/zSPi1JuuxxJTQCOyVkqaj5y+NV/sdelHqUIGtLeB9
 t85xj8nd9aNWtUAKqfuEYKvx5w5HKj/ByJ5y4J5M3b4D4v42EYwgWhAJqJS/2PQFC6wV
 /4dzyzPARw/awz/9j4P8HkAOHzErU7QlIQn3FzvMxibTjsxk7MqIxD/c3KSBJzc6BQ+z
 9kSw==
X-Gm-Message-State: APjAAAUOgxilp0UP6gq45yS3TX3C3iFrSJK2tyQlyM428ikaWfhK1i/Z
 WxWkERmxjiCVmzzUBaWvI7SYfokiLnWLewbjwnc=
X-Google-Smtp-Source: APXvYqz6htWyRkTZN4vDPRVbuKhJ/hBqjAvzdr6k43SPd5az9LZUxbvO+x7N2TwA3GAj//OJPVbIxDWqt7+BeB4g+Kg=
X-Received: by 2002:a05:6402:1611:: with SMTP id
 f17mr93785034edv.266.1578074725856; 
 Fri, 03 Jan 2020 10:05:25 -0800 (PST)
MIME-Version: 1.0
References: <CAPRZce0Ruqyrei0OykZ-d-gK97TGTq4wMPy2OrrVeUEbvm=sjA@mail.gmail.com>
 <CAHmME9pNoKwUpWg1QhH9+EKYGXBT7MODbP-nD22cV3Nd7kZMjw@mail.gmail.com>
In-Reply-To: <CAHmME9pNoKwUpWg1QhH9+EKYGXBT7MODbP-nD22cV3Nd7kZMjw@mail.gmail.com>
From: Justin Guiao <justing6@gmail.com>
Date: Fri, 3 Jan 2020 10:05:13 -0800
Message-ID: <CAG7uUwKoafqVCvkX4uoC1k=G66k4HU=m=WmOc0Z1PV=287t7wA@mail.gmail.com>
Subject: Re: Installing Wireguard on Windows 10 on Arm; "wintun" device
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
X-Mailman-Approved-At: Thu, 09 Jan 2020 07:02:19 +0100
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
Content-Type: multipart/mixed; boundary="===============2677116317258321977=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============2677116317258321977==
Content-Type: multipart/alternative; boundary="00000000000076b8ef059b40277d"

--00000000000076b8ef059b40277d
Content-Type: text/plain; charset="UTF-8"

@Edward I've compiled wintun to arm64 and installed it on my Surface Pro X
without issue, although the driver is unsigned as it was just for testing.
However, as Jason mentioned the 32-bit WireGuard client cannot communicate
with it. I'm rather bullish on the windows on arm platform and hope to see
go on arm64 to enable it.

@Jason is go on arm64 to compile a 64-bit gui to communicate with the arm64
wintun drive a necessity? I know OpenVPN uses a 64bit win-tap driver with a
32-bit client (most likely x86 but could be arm32), although that is
probably comparing apples to oranges. The official Cisco AnyConnect client
for windows on arm also mixes an arm64 driver with a 32-bit gui.

Regards,


On Fri, Jan 3, 2020, 7:57 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> Wintun supports the arm64 kernel. Go supports an arm userland. Ideally
> these should match, but they don't right now. It should be possible to
> get arm userland talking to the arm64 kernel with some careful struct
> poking, but it doesn't sound too pleasant. The best thing to do would
> be to get Microsoft and/or Google to port Go to arm64.
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--00000000000076b8ef059b40277d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>@Edward I&#39;ve compiled wintun to arm64 and instal=
led it on my Surface Pro X without issue, although the driver is unsigned a=
s it was just for testing. However, as Jason mentioned the 32-bit WireGuard=
 client cannot communicate with it. I&#39;m rather bullish on the windows o=
n arm platform and hope to see go on arm64 to enable it.=C2=A0<div dir=3D"a=
uto"><br></div><div dir=3D"auto">@Jason is go on arm64 to compile a 64-bit =
gui to communicate with the arm64 wintun drive a necessity? I know OpenVPN =
uses a 64bit win-tap driver with a 32-bit client (most likely x86 but could=
 be arm32), although that is probably comparing apples to oranges. The offi=
cial Cisco AnyConnect client for windows on arm also mixes an arm64 driver =
with a 32-bit gui.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>Regards,=C2=A0</div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Fri, Jan 3, 2020, 7:57 AM Jason A. Donenfeld &lt;<a h=
ref=3D"mailto:Jason@zx2c4.com" rel=3D"noreferrer noreferrer" target=3D"_bla=
nk">Jason@zx2c4.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
Wintun supports the arm64 kernel. Go supports an arm userland. Ideally<br>
these should match, but they don&#39;t right now. It should be possible to<=
br>
get arm userland talking to the arm64 kernel with some careful struct<br>
poking, but it doesn&#39;t sound too pleasant. The best thing to do would<b=
r>
be to get Microsoft and/or Google to port Go to arm64.<br>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" rel=3D"noreferrer noreferrer n=
oreferrer" target=3D"_blank">WireGuard@lists.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer noreferrer noreferrer noreferrer" target=3D"_blank">https://lists.zx2=
c4.com/mailman/listinfo/wireguard</a><br>
</blockquote></div>
</div></div>

--00000000000076b8ef059b40277d--

--===============2677116317258321977==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============2677116317258321977==--
