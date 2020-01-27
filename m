Return-Path: <SRS0=F0uL=3T=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF945C33CB2
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Jan 2020 01:57:17 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FA9C206D5
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Jan 2020 01:57:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e8wSFwgY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3FA9C206D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 54ab85cb;
	Thu, 30 Jan 2020 01:53:24 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cadcb39c
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Jan 2020 07:38:26 +0000 (UTC)
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com
 [IPv6:2607:f8b0:4864:20::e30])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9af3135b
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Jan 2020 07:38:26 +0000 (UTC)
Received: by mail-vs1-xe30.google.com with SMTP id g23so5015419vsr.7
 for <wireguard@lists.zx2c4.com>; Sun, 26 Jan 2020 23:38:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=yw3xgR38lL/U3lLOUmiRW6XUbS6JuppgmmGr5crrljs=;
 b=e8wSFwgY5QWDQP7R/85yxAtrzi+K9/TWSrkGakfLAxOx6DuuEdR7McgIKCUppbvmy6
 ut4UhuZ2JeBBK10a7uuAKXQZo27I9f0ndbq4O7v49nfgLD0rEG9PjyuakwV0YFww5Sp0
 vDXa+nxwE0h+krG4M7uwWpTK6AiZ+BZmBXlTFgEbDsH/lILSYTQEXkuwc/EAhm9kO7Ik
 S2F43BK3op6JBWrjrdQNNXnTCLLHgY2akLOnT+q6ggVQwqj+S4pJhPz9ybELZVBYmfGc
 unJW8OfzeOfBZHLY7YbDMSlu7SKsbCpoqmJLZtMg4S44G6V+5TkDgZCsf66tqU3p9xAG
 T4Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=yw3xgR38lL/U3lLOUmiRW6XUbS6JuppgmmGr5crrljs=;
 b=EUulnvrp7KCVNA3X6MLmZ/mQAH7TDp5pdR91CT6FMo+hJ5GeNdrWIecb5JGZHbYK8b
 XbpaPulzzjgwmINKMH29JVLQkg04DW1aT8iYJhASHM/VLEJeGa1YaXbbaaiJDQ7dsKKI
 l5d2g1Bef+X3thDJj+n0+fzzCH9uU3daTEOklVUi3kmivBNgCHsL+cwNG96Cpv8fxzoS
 sen4WObC8BKnr0yKXS0NTdCw2NxaNpXaDh/z65Wr4D5hH1oyvP9nNPlMlA/IOk9K6Ajt
 NjuIGyc1Fd/qDQnmjENJsnUyh7sI2kwrHXSnjkObNe9aolQhbXbryXM0Q8ZYUn2+4kOz
 4UNw==
X-Gm-Message-State: APjAAAXTjogYh3Uv/PSQqcwVKK38FrzFuXgNT4JpZLgIi7bEBvejW597
 mra9orJY0ebYnk82uSkEZL8NCPvWGo0dFyn9znzRkcMxMWTVfQ==
X-Google-Smtp-Source: APXvYqzP3mjTQMdkElo3yfSJ4H2ycRBk16DA0f39FSlI4BG/sCTB5PLwQuZKTW46ndgZFCnt2zA3VxfS9t5Wpwf21xU=
X-Received: by 2002:a67:ed0a:: with SMTP id l10mr9315615vsp.239.1580110705587; 
 Sun, 26 Jan 2020 23:38:25 -0800 (PST)
MIME-Version: 1.0
From: Abner Zhang <light.tsing@gmail.com>
Date: Mon, 27 Jan 2020 15:38:14 +0800
Message-ID: <CAAm9GF3Rsd-YP6hrer8puSK7TxNZPb98iAC+GLtWrwrHmKm+uA@mail.gmail.com>
Subject: Problem with iOS WireGuard Client
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Thu, 30 Jan 2020 02:53:15 +0100
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
Content-Type: multipart/mixed; boundary="===============4268196696086747097=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============4268196696086747097==
Content-Type: multipart/alternative; boundary="0000000000004ffaf8059d1a310c"

--0000000000004ffaf8059d1a310c
Content-Type: text/plain; charset="UTF-8"

Hi,

I tried to install it on a chinese iPhone but it seems that the client
fails to connect the Internet.
The app doesn't request the permission for Internet connection.
And it doesn't show up in the list of "cellular data usage".

CoreTelephony.framework might be needed for this.

Thanks!

--0000000000004ffaf8059d1a310c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I tried to install it on a chinese =
iPhone but it seems that the client fails to connect the Internet.</div><di=
v>The app doesn&#39;t request the permission=C2=A0for Internet connection.<=
/div><div>And it doesn&#39;t show up in the list of &quot;cellular data usa=
ge&quot;.</div><div><br></div><div><span style=3D"color:rgb(199,37,78);font=
-family:Consolas,Monaco,&quot;Andale Mono&quot;,&quot;Ubuntu Mono&quot;,mon=
ospace;font-size:12px;white-space:pre-wrap;background-color:rgb(242,242,242=
)">CoreTelephony.framework</span>=C2=A0might be needed for this.</div><div>=
<br></div><div>Thanks!=C2=A0<br></div></div>

--0000000000004ffaf8059d1a310c--

--===============4268196696086747097==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============4268196696086747097==--
