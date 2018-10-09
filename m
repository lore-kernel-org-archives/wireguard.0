Return-Path: <SRS0=TwOG=MV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 752F5C64EAD
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  9 Oct 2018 09:18:04 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEC3C2077C
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  9 Oct 2018 09:18:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=diyism.com header.i=@diyism.com header.b="ofUgjAd0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EEC3C2077C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=diyism.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fcfba780;
	Tue, 9 Oct 2018 09:17:09 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 987cf137
 for <wireguard@lists.zx2c4.com>; Tue, 9 Oct 2018 09:17:07 +0000 (UTC)
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com
 [IPv6:2607:f8b0:4864:20::e29])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cab3dc4c
 for <wireguard@lists.zx2c4.com>; Tue, 9 Oct 2018 09:17:07 +0000 (UTC)
Received: by mail-vs1-xe29.google.com with SMTP id w194so781522vsc.11
 for <wireguard@lists.zx2c4.com>; Tue, 09 Oct 2018 02:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=diyism.com; s=google;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=3KFt/NGfraeQUVhfRFtcsiiwURCHJLt02vUv+BHsjfE=;
 b=ofUgjAd0GbZALH2CsGIT8+Ph4V+R7FxMZymZiFGWOcS3jPw2OFj4IVxw+l2mWyNCMZ
 ZQZRYLTSthB453FJYe9Gt7EvDv0TY4wlOP9RHsjEmQiBnR/TR23TbRiFcJQjCWrf5oOO
 QA2yAIXQ3yCHK76ciew+K/dhZAya5HQUdrcVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=3KFt/NGfraeQUVhfRFtcsiiwURCHJLt02vUv+BHsjfE=;
 b=mksoidedlPXW7l/0sPDjr0wpDhuyIES1DV4i41XcRLDhJS+SeuwGSybubLNbfQcmL7
 TfmnAOhtzY2OtWiEY2ZtE1rGZ5wzVRzOqeYC3SL0yt70OdC3DyAp7EZov7qQ7soYevyf
 ZxM1WRJYGkpiMD/zDeGx7SfnxxX8Xw9OIJzVAV+14K+zzgcADgXJGTcbmrKYeXm8bEQt
 djuSZtLQTzGJGqwUVu3zZR5dcpJgqHTjui7UYR22ejeXfK3Z4NuJeH7ewR8EBOSdK/nc
 +RSn/M+RcdC3Aczo5RdEbzkz02yUOA023LtVk5C7KhnoT5GWKg1Kk5auOQYyZO9BKBIO
 zAwA==
X-Gm-Message-State: ABuFfoij/BDDJWgvzBLEA+KPCear2kJ0U/p7NkWj4w3jLKPnr6n552Tj
 1MyvcWAVW5BFg+hn2HmrmGv9U9Ciiywwgi/m+NQ1dw==
X-Google-Smtp-Source: ACcGV63TyHPPwvY1p/dDft5jgKKHRuGj20nl6csKwVxyeIUzfTipawmzVBhWtAU6pW96wWKodqEQEFg3353iZhtM0Go=
X-Received: by 2002:a67:f804:: with SMTP id l4mr8654497vso.200.1539076677872; 
 Tue, 09 Oct 2018 02:17:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:4522:0:0:0:0:0 with HTTP;
 Tue, 9 Oct 2018 02:17:37 -0700 (PDT)
X-Originating-IP: [162.243.142.163]
In-Reply-To: <CADdae-jYmx4Um14LK0S0Ay+14CjM8qvh-jmBMFCtXFqWMzCr4A@mail.gmail.com>
References: <CADdae-jYmx4Um14LK0S0Ay+14CjM8qvh-jmBMFCtXFqWMzCr4A@mail.gmail.com>
From: "KeXianbin(http://diyism.com)" <kexianbin@diyism.com>
Date: Tue, 9 Oct 2018 17:17:37 +0800
Message-ID: <CAKVinOWVa7YHMs_M=bmjJfE28Yh1Jr1Rtm7PCrdt9DOywoidhA@mail.gmail.com>
Subject: Re: about wireguard-go
To: nicolas prochazka <prochazka.nicolas@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============5956882113800124712=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============5956882113800124712==
Content-Type: multipart/alternative; boundary="000000000000aac8280577c836f6"

--000000000000aac8280577c836f6
Content-Type: text/plain; charset="UTF-8"

Some hint here:
https://gist.github.com/diyism/60aa6ca24df772a4928f1aced65e72ee#file-bargeos-on-digitalocean-L40

On Tue, Oct 9, 2018 at 5:14 PM, nicolas prochazka <
prochazka.nicolas@gmail.com> wrote:

> Hello,
> We need to compile wireguard-go on linux, because we are using a closed
> linux, under we cannot compile module,
> how can we do ? make on wireguard-go tells us that is not recommend on
> linux
>
> Regards,
> Nicolas Prochazka
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>
>

--000000000000aac8280577c836f6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Some hint here: <a href=3D"https://gist.g=
ithub.com/diyism/60aa6ca24df772a4928f1aced65e72ee#file-bargeos-on-digitaloc=
ean-L40">https://gist.github.com/diyism/60aa6ca24df772a4928f1aced65e72ee#fi=
le-bargeos-on-digitalocean-L40</a><br></div></div><div class=3D"gmail_extra=
"><br><div class=3D"gmail_quote">On Tue, Oct 9, 2018 at 5:14 PM, nicolas pr=
ochazka <span dir=3D"ltr">&lt;<a href=3D"mailto:prochazka.nicolas@gmail.com=
" target=3D"_blank">prochazka.nicolas@gmail.com</a>&gt;</span> wrote:<br><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex"><div dir=3D"ltr"><div>Hello, <br></div><div>We=
 need to compile wireguard-go on linux, because we are using a closed linux=
, under we cannot compile module, <br></div><div>how can we do ? make on wi=
reguard-go tells us that is not recommend on linux</div><div><br></div><div=
>Regards, <br></div><div>Nicolas Prochazka<br></div></div>
<br>______________________________<wbr>_________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com">WireGuard@lists.zx2c4.com</a><=
br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/<wbr>mailman/listinfo/wire=
guard</a><br>
<br></blockquote></div><br></div>

--000000000000aac8280577c836f6--

--===============5956882113800124712==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============5956882113800124712==--
