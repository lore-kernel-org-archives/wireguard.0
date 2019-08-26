Return-Path: <SRS0=Q0ZK=WW=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 117C9C3A5A4
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 26 Aug 2019 12:28:39 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9ECAD206B7
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 26 Aug 2019 12:28:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=varunpriolkar-com.20150623.gappssmtp.com header.i=@varunpriolkar-com.20150623.gappssmtp.com header.b="NxAehpuJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9ECAD206B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=varunpriolkar.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9c496609;
	Mon, 26 Aug 2019 12:28:38 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 726efad3
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Aug 2019 08:09:47 +0000 (UTC)
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 47da5b49
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Aug 2019 08:09:47 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id q27so1968330lfo.10
 for <wireguard@lists.zx2c4.com>; Mon, 26 Aug 2019 01:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=varunpriolkar-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/mpYqgXhS3Bb34fHrN7fSch9zebVaSlGn/rE24j5Dew=;
 b=NxAehpuJ4CBktbzXgmUAWzyAB1WOF1Cc/S6mkcfONF45uknq5lp9FRVrOuHFywvvrs
 QuGcn890a6feOowIpv3thToYHJdDXADQO3LCSsVEOsvxDjZ0oqaAfYopf5aV5Tm92b+d
 jh680bgb2OdeXkFYxgvp/BZPTPFT98/pRf7dhbwbptlV1kBUOBDCNDn9mbmo8KWtKKX2
 /o8Uw93cnGKx6tMy7zeyO2rJ2UVdDNnHICoIs4wxvqe3sYRAfw9s9pDt8rxQ6EsinJ1q
 AIhlrT65o9NjBBgHDb+eOHXSyxePu/IYwIk7BK2DWDRBO7NY/V+4Wddq9/DSGPaRk6GM
 Zqpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/mpYqgXhS3Bb34fHrN7fSch9zebVaSlGn/rE24j5Dew=;
 b=VgM3cNhEuIfvkHvCX99bYthtLzBH4cwXWKI+8cvQUZIiWRo58agEFLBro77PlG3alZ
 ITQJHxuJ4GrJ24AMddYEpJASvp2X8GzoEbBbD7QGo60I0+ydnJwnmMjWNCkUzI1eVkk6
 YJ113m5XINItWUmDuHpNQg9GNBBqO/rPRypF9XjduULI3dRIpAgJxB2Lrcn3/XVwarPh
 2ULHvryphPXNK7FWZHRxhErDPr7J0jcYRfCB2e0CD/C1aM3uOqgOYLaOyas8KUN/UiWV
 HKKvNs4BUiWqoTc2BwX+x1WJVUm1iRk5Czlz0bc6tJZhm09XXdURG2oWVgLy3OExdtx8
 /viw==
X-Gm-Message-State: APjAAAUyjiedN29oV6RVTK7VI+5swWWlmuBb3eAd7Eki3/AYDCw9+wAo
 9DW0dyQVOeHfH8H2UyobtJLBVKhR2elQFjmN+YnVJw==
X-Google-Smtp-Source: APXvYqymwgbRCh3VuLTXY9vevNtui+RpMIVGCb2ZoicKDT0GmZ4xWTqP/Sr/1G1K6x/swUPbl5Pum4sPwI62NMMxoUI=
X-Received: by 2002:ac2:51a3:: with SMTP id f3mr9752929lfk.94.1566806985067;
 Mon, 26 Aug 2019 01:09:45 -0700 (PDT)
MIME-Version: 1.0
References: <b660d135-4450-66d3-0254-a893f46ba9f7@spam-fetish.org>
 <CAHmME9qPAOLxz3CyHxq9tubzgzvksGS5iz55yL=eB2wFa23fXg@mail.gmail.com>
In-Reply-To: <CAHmME9qPAOLxz3CyHxq9tubzgzvksGS5iz55yL=eB2wFa23fXg@mail.gmail.com>
From: Varun Priolkar <me@varunpriolkar.com>
Date: Mon, 26 Aug 2019 13:39:35 +0530
Message-ID: <CALwBDFtP-QkGVZ6EncjtQxZ1--sGWKwzXwpNPaiLYymR5=+G6Q@mail.gmail.com>
Subject: Re: [ANNOUNCE] OPNsense 19.7 supports WireGuard
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
X-Mailman-Approved-At: Mon, 26 Aug 2019 14:28:33 +0200
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
Content-Type: multipart/mixed; boundary="===============4567064271693998896=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============4567064271693998896==
Content-Type: multipart/alternative; boundary="000000000000c6dce5059100ad30"

--000000000000c6dce5059100ad30
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Congratulations! :) I did test it out when it wasn=E2=80=99t stable and wel=
l things
weren=E2=80=99t stable(as expected). Hope to have an another crack at it.

On Sun, 25 Aug 2019 at 21:32, Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> Congratulations on the release. That's great news.
>
> Would you like me to add some blurb to https://www.wireguard.com/install/
> on it?
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>
--=20
Regards,

Varun Priolkar

--000000000000c6dce5059100ad30
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">Congratulations! :) I did test it out when it wasn=
=E2=80=99t stable and well things weren=E2=80=99t stable(as expected). Hope=
 to have an another crack at it.</div></div><div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, 25 Aug 2019 at 21:32, Ja=
son A. Donenfeld &lt;<a href=3D"mailto:Jason@zx2c4.com">Jason@zx2c4.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Congratulations on the =
release. That&#39;s great news.<br>
<br>
Would you like me to add some blurb to <a href=3D"https://www.wireguard.com=
/install/" rel=3D"noreferrer" target=3D"_blank">https://www.wireguard.com/i=
nstall/</a> on it?<br>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@li=
sts.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinfo/wireguard=
</a><br>
</blockquote></div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature" =
data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><=
div><div>Regards,<br><br></div>Varun Priolkar</div></div></div></div></div>

--000000000000c6dce5059100ad30--

--===============4567064271693998896==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============4567064271693998896==--
