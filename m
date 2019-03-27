Return-Path: <SRS0=Yiz6=SI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F18CC282DA
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  6 Apr 2019 12:02:59 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7A162087F
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  6 Apr 2019 12:02:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sd9WPnLz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7A162087F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 32f4f555;
	Sat, 6 Apr 2019 12:00:30 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 985f2f53
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Mar 2019 17:46:11 +0000 (UTC)
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d81d6c84
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Mar 2019 17:46:10 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id 64so15692777otb.8
 for <wireguard@lists.zx2c4.com>; Wed, 27 Mar 2019 10:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=sDOW/mbSQlChPXuF11KbZjSPnBVL6gyWsTEtkg1OEAg=;
 b=sd9WPnLz1ivkRqILA39lQL9j2Ywp6nTHU1S+iDWR711SOkTODDatEIncPW32E16/3u
 E4WH2ZcgVY+dZvCgUZSD0hGeHDZJ/QnScBfoyWQAv5V+A8RbRSk1xFreGKiXbmU6v/vC
 0uhXywrf+aoVZwak3hobKfPN7kA1e00G728ziu/nWKwEiwiTJdwECI4VR7xxqw7MIabf
 yrEoErS3nQ9OqPCB2esN0WlSFRSWHhLs/wsKWAJ2yFFB/w5aKDrAO7T9NcUl468FUmlG
 YR181ARd/3kjHzpdpwLXtD8SpGGW9JhNQ/OQ0wgcOGGld2TyZO8epc3+KhAeIfUAYLjQ
 agPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=sDOW/mbSQlChPXuF11KbZjSPnBVL6gyWsTEtkg1OEAg=;
 b=bVQJ1FPyj8Z//FaErZxSNIzgjA3ocXQD/jTlz02e9nKKrGo1Ah4Qi7u1T2DLVnagSc
 cxiSjXGsUxzw3uWbkDscPnMoNBcctPirPt1/hDCW3UEVDbFqbgBfJI5CsNL7rCMPvwiG
 Z97GwyxZ1JsZm5juWEFIsuxkUPMRRMfHDqrg1GaZt3D4+AakfRHxS8Hq1YPYOd5r1Lja
 mnx+6YZ4vacKK2YwSDX+JFn9dfZCKA3RezOcOfIKnFXwtwEunSHitKMGmpFQeBiefOjc
 HyoStd2HfbZXruu87P8EgR1rFolXE90mS5p6+Y/GEDyRLdk2E6rCcPmCkQtd8IIVE7xD
 mqWw==
X-Gm-Message-State: APjAAAWDGbhf0l82VZDYqFv33BaGkXmga1AxB2EY5M+CFFx9FhJculYA
 afWDVXGWt6+ChTzeb17O/nXJf3GGpXEYSqP5Kc3i7CQG
X-Google-Smtp-Source: APXvYqx/TsyLZ5aF2RG6Iyj0cI3I1cJ4sU6YMcM3DPJ/8+2tKi0PHK0W8RafcA176J6WvFw2Je3sWinqovcNCc21wM4=
X-Received: by 2002:a05:6830:56:: with SMTP id
 d22mr27777728otp.294.1553708842141; 
 Wed, 27 Mar 2019 10:47:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAGGGmFFSDwPGrfdvBOR_toubEpZG6nrtUk4oMO+FjRWpWSX-aA@mail.gmail.com>
In-Reply-To: <CAGGGmFFSDwPGrfdvBOR_toubEpZG6nrtUk4oMO+FjRWpWSX-aA@mail.gmail.com>
From: Robert Ross <rpross3@gmail.com>
Date: Wed, 27 Mar 2019 12:47:10 -0500
Message-ID: <CAGGGmFFC7cZ6kQ2e+WwuDkKeSorbP5_zLYNxOszzSK2QoPVL1w@mail.gmail.com>
Subject: Re: Wireguard on PiZeroW
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Sat, 06 Apr 2019 14:00:28 +0200
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
Content-Type: multipart/mixed; boundary="===============0797366643662508512=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============0797366643662508512==
Content-Type: multipart/alternative; boundary="0000000000009ecead0585170722"

--0000000000009ecead0585170722
Content-Type: text/plain; charset="UTF-8"

Follow up

I reinstalled Raspian Stretch and kernel-headers for 4.14.79+ and got the
same error. I downloaded the previous release from here -->
https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20190123.zip

and the error did not occur.

Robert

On Tue, Mar 26, 2019 at 4:21 PM Robert Ross <rpross3@gmail.com> wrote:

> Details:
> PiZeroW
> Linux XXX 4.14.98+ #1200 Tue Feb 12 20:11:02 GMT 2019 armv6l GNU/Linux
> Latest kernel-headers
> Added rpi-source
>
> I get this error compiling on PiZeroW
>
> ~/WireGuard/src# make
>   CC [M]  /root/WireGuard/src/main.o
>   CC [M]  /root/WireGuard/src/noise.o
>   CC [M]  /root/WireGuard/src/device.o
> /root/WireGuard/src/device.c: In function 'wg_xmit':
> /root/WireGuard/src/device.c:165:3: error: implicit declaration of
> function 'skb_mark_not_on_list' [-Werror=implicit-function-declaration]
>    skb_mark_not_on_list(skb);
>    ^~~~~~~~~~~~~~~~~~~~
> cc1: some warnings being treated as errors
> scripts/Makefile.build:326: recipe for target
> '/root/WireGuard/src/device.o' failed
> make[2]: *** [/root/WireGuard/src/device.o] Error 1
> Makefile:1535: recipe for target '_module_/root/WireGuard/src' failed
> make[1]: *** [_module_/root/WireGuard/src] Error 2
> Makefile:37: recipe for target 'module' failed
> make: *** [module] Error 2
>
> TIA for any insights. Robert
>

--0000000000009ecead0585170722
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Follow up<div><br></div><div>I reinstalle=
d Raspian Stretch and kernel-headers for 4.14.79+ and got the same error. I=
 downloaded the previous release from here --&gt; <a href=3D"https://git.zx=
2c4.com/WireGuard/snapshot/WireGuard-0.0.20190123.zip">https://git.zx2c4.co=
m/WireGuard/snapshot/WireGuard-0.0.20190123.zip</a>=C2=A0</div><div><br></d=
iv><div>and the error did not occur.</div><div><br></div><div>Robert</div><=
/div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Tue, Mar 26, 2019 at 4:21 PM Robert Ross &lt;<a href=3D"mailto:rpro=
ss3@gmail.com">rpross3@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=
=3D"ltr">Details:</div><div>PiZeroW</div><div>Linux XXX 4.14.98+ #1200 Tue =
Feb 12 20:11:02 GMT 2019 armv6l GNU/Linux<br></div><div>Latest kernel-heade=
rs</div><div>Added rpi-source</div><div dir=3D"ltr"><br></div><div dir=3D"l=
tr">I get this error compiling on PiZeroW<div><br></div><div><div>~/WireGua=
rd/src# make</div><div>=C2=A0 CC [M]=C2=A0 /root/WireGuard/src/main.o</div>=
<div>=C2=A0 CC [M]=C2=A0 /root/WireGuard/src/noise.o</div><div>=C2=A0 CC [M=
]=C2=A0 /root/WireGuard/src/device.o</div><div>/root/WireGuard/src/device.c=
: In function &#39;wg_xmit&#39;:</div><div>/root/WireGuard/src/device.c:165=
:3: error: implicit declaration of function &#39;skb_mark_not_on_list&#39; =
[-Werror=3Dimplicit-function-declaration]</div><div>=C2=A0 =C2=A0skb_mark_n=
ot_on_list(skb);</div><div>=C2=A0 =C2=A0^~~~~~~~~~~~~~~~~~~~</div><div>cc1:=
 some warnings being treated as errors</div><div>scripts/Makefile.build:326=
: recipe for target &#39;/root/WireGuard/src/device.o&#39; failed</div><div=
>make[2]: *** [/root/WireGuard/src/device.o] Error 1</div><div>Makefile:153=
5: recipe for target &#39;_module_/root/WireGuard/src&#39; failed</div><div=
>make[1]: *** [_module_/root/WireGuard/src] Error 2</div><div>Makefile:37: =
recipe for target &#39;module&#39; failed</div><div>make: *** [module] Erro=
r 2</div></div><div><br></div><div>TIA for any insights. Robert</div></div>=
</div></div>
</blockquote></div>

--0000000000009ecead0585170722--

--===============0797366643662508512==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============0797366643662508512==--
