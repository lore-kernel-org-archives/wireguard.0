Return-Path: <SRS0=e2pA=3E=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA3F7C32771
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 15 Jan 2020 18:13:19 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D77152187F
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 15 Jan 2020 18:13:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=quickfox.ru header.i=@quickfox.ru header.b="U5UJwoOC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D77152187F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=quickfox.ru
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 222e517d;
	Wed, 15 Jan 2020 18:13:03 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7d900e97
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Jan 2020 05:00:24 +0000 (UTC)
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0ed18619
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Jan 2020 05:00:24 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id r19so8523042ljg.3
 for <wireguard@lists.zx2c4.com>; Sun, 12 Jan 2020 21:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quickfox.ru; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=mIbIJegNjznTKGGhwLrbsbOsuWf7Ij62M4M52p0LCUE=;
 b=U5UJwoOCTOidMMM22rkeOPGUWOZIZizwCP7ZKommI07OraQEKxNZ7j8NrykhXOyi1I
 B13ESI9oT9EK1ioD3lPTeR1zxgj4UEaD/Hsy5LAudPdfcl88rQKrauj0J3eIeRWEX4nQ
 cnhSqTN5LeXedaglXVg3lYkMlNjK8xBxWO3tY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=mIbIJegNjznTKGGhwLrbsbOsuWf7Ij62M4M52p0LCUE=;
 b=lsYUpVyr3MLdMZ7sUnYD8DMHIE0Nc/svd4wb+/USmZEv+Z8vjBaxnBlGkjh/BvgQ4P
 BgciTsH+xZ6HMKL6QLtj+c6ecK9LSxObEOPFDsnEGbelJR3cfjAPIXpL03ZakN3hfUR4
 f2zohl8HsYtpPqhqD70PXAr0PUC81bxRCKAWOUHDVb3ASPzCX/seZSnL+zVTSQmN7JBg
 B7rcwi3OTvScTVs+CU+QGwBh6GCcNshkPB/RKrRs1cped7sCaMwd5N3JK8NGuYX9KQnm
 IEC46+RfYXXOY8wI5ITY9rrT4bkjxr3+0IYMJGGJmFGQBV1UawIjuG9GhI45fFLrXqcm
 czJQ==
X-Gm-Message-State: APjAAAWS7HdUJOxyhkqnoVRnL6i+G9XzLi+t+712F3oDWF0cjiwhcAPw
 rfp/eQjEF2fjj+sQAz4WKyVzLB634VtF2EXSUWP6B565DvI=
X-Google-Smtp-Source: APXvYqxjzYDlJ8Cdy3Czw3NlBNzaz0pzBK92ARlGhCKQdLG8DtvA5x4EqlISw9uJXnoC7p74PtygbjPXTppl1iwttds=
X-Received: by 2002:a2e:7a13:: with SMTP id v19mr9392834ljc.43.1578891621881; 
 Sun, 12 Jan 2020 21:00:21 -0800 (PST)
MIME-Version: 1.0
From: Andrey Kupreychik <foxel@quickfox.ru>
Date: Mon, 13 Jan 2020 12:00:11 +0700
Message-ID: <CA+hAYV=67S+3d0g+eQ9AZHok=AdvmBsd2XpOFSEcJ=aozjK9PA@mail.gmail.com>
Subject: Bug report: WireGuard client not setting underlying network on
 Android Pie
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Wed, 15 Jan 2020 19:12:59 +0100
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
Content-Type: multipart/mixed; boundary="===============5171734695302722317=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============5171734695302722317==
Content-Type: multipart/alternative; boundary="00000000000042e8d9059bfe5a25"

--00000000000042e8d9059bfe5a25
Content-Type: text/plain; charset="UTF-8"

My Android phone running wireguard VPN threats it as a metered connection
and does not do anything it should do on Wi-Fi only

What I found is this discussion
https://issuetracker.google.com/issues/114309459
I've looked thru the GitHub mirror code and found no evidance of
setUnderlyingNetworks called in WireGuard client code.

As seen in the issue tracker link above, it's needed in order to take
advantage of this (
https://developer.android.com/about/versions/pie/android-9.0-changes-all#network-capabilities-vpn)
behavior change. As described in the issue tracker link, this prevents Pie
devices from properly using unmetered WiFi networks.

-- 
Andrey Kupreychik <foxel@quickfox.ru>
http://foxel.quickfox.ru

--00000000000042e8d9059bfe5a25
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p class=3D"gmail-_1qeIAgB0cPwnLhDF9XSiJM" style=3D"margin=
:0px;padding:0px 0px 0.25em;border:0px;font-variant-numeric:inherit;font-va=
riant-east-asian:inherit;font-stretch:inherit;font-size:14px;line-height:in=
herit;font-family:&quot;Noto Sans&quot;,Arial,sans-serif;vertical-align:bas=
eline;color:rgb(26,26,27)">My Android phone running wireguard VPN threats i=
t as a metered connection and does not do anything it should do on Wi-Fi on=
ly</p><p class=3D"gmail-_1qeIAgB0cPwnLhDF9XSiJM" style=3D"margin:0px;paddin=
g:0px 0px 0.25em;border:0px;font-variant-numeric:inherit;font-variant-east-=
asian:inherit;font-stretch:inherit;font-size:14px;line-height:inherit;font-=
family:&quot;Noto Sans&quot;,Arial,sans-serif;vertical-align:baseline;color=
:rgb(26,26,27)">What I found is this discussion=C2=A0<a href=3D"https://iss=
uetracker.google.com/issues/114309459" class=3D"gmail-_3t5uN8xUmg0TOwRCOGQE=
cU" rel=3D"noopener noreferrer" target=3D"_blank" style=3D"font:inherit;mar=
gin:0px;padding:0px;border:0px;vertical-align:baseline">https://issuetracke=
r.google.com/issues/114309459</a><br>I&#39;ve looked thru the GitHub mirror=
 code and found no evidance of setUnderlyingNetworks called in WireGuard cl=
ient code.=C2=A0</p><p class=3D"gmail-_1qeIAgB0cPwnLhDF9XSiJM" style=3D"mar=
gin:0px;padding:0px 0px 0.25em;border:0px;font-variant-numeric:inherit;font=
-variant-east-asian:inherit;font-stretch:inherit;font-size:14px;line-height=
:inherit;font-family:&quot;Noto Sans&quot;,Arial,sans-serif;vertical-align:=
baseline;color:rgb(26,26,27)">As seen in the issue tracker link above, it&#=
39;s needed in order to take advantage of this (<a href=3D"https://develope=
r.android.com/about/versions/pie/android-9.0-changes-all#network-capabiliti=
es-vpn" class=3D"gmail-_3t5uN8xUmg0TOwRCOGQEcU" rel=3D"noopener noreferrer"=
 target=3D"_blank" style=3D"font:inherit;margin:0px;padding:0px;border:0px;=
vertical-align:baseline">https://developer.android.com/about/versions/pie/a=
ndroid-9.0-changes-all#network-capabilities-vpn</a>) behavior change. As de=
scribed in the issue tracker link, this prevents Pie devices from properly =
using unmetered WiFi networks.</p><div><br></div>-- <br><div dir=3D"ltr" cl=
ass=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"=
>Andrey Kupreychik &lt;<a href=3D"mailto:foxel@quickfox.ru" target=3D"_blan=
k">foxel@quickfox.ru</a>&gt;<br><a href=3D"http://foxel.quickfox.ru" target=
=3D"_blank">http://foxel.quickfox.ru</a></div></div></div>

--00000000000042e8d9059bfe5a25--

--===============5171734695302722317==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============5171734695302722317==--
