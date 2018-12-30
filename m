Return-Path: <SRS0=y9CJ=PH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 182D0C43387
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 30 Dec 2018 19:10:53 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00B9C20836
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 30 Dec 2018 19:10:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=chmd-fr.20150623.gappssmtp.com header.i=@chmd-fr.20150623.gappssmtp.com header.b="g2JYIT33"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00B9C20836
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chmd.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 03b89eda;
	Sun, 30 Dec 2018 19:08:33 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 53d3cd0e
 for <wireguard@lists.zx2c4.com>;
 Sun, 30 Dec 2018 19:08:31 +0000 (UTC)
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c99d7313
 for <wireguard@lists.zx2c4.com>;
 Sun, 30 Dec 2018 19:08:30 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id d39so21276952edb.12
 for <wireguard@lists.zx2c4.com>; Sun, 30 Dec 2018 11:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chmd-fr.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=cOW+Fh36kIOICD4waXNCa8VjOaQFdzP6fqanoz/xS6Y=;
 b=g2JYIT33D0apoi8dRXsfbdls+/nSqQnkAtuhVxPmTA5UkR4pXySBbbP6sA2QlKybke
 U9JTbfz1tLhBfvLk1wcgHeuS+DSr2CGQInj7Y+HPej9EVynbsub2d45BngKMHI2zbhXD
 fgB8pXVWg1iXQuuAjdV9WEksvsoa/6AOTumImc9jNPSeBacv7B20yCJu68Nf6NG/cReB
 boph2CfTIqI/xQbr+mywayZ+LaQDiMjt1llE8poVUqnDCFkPyqIdY60NuuGfAliDk/qA
 zhl8uWn0vQ59TROTW6nGUYVdF+3vl0sq0Hv8M1ZNYTP3EzXh/miyx/1O1T2dgV2xjva+
 RYGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=cOW+Fh36kIOICD4waXNCa8VjOaQFdzP6fqanoz/xS6Y=;
 b=MCPD76GTCEU+49VRPPP+NeXrXJx8b25mGLcxsm+HHkSLSuKjDpcVrquwbxL0MYdjVj
 jije22xaKuWc/g7AedpAJ6uNwf4Z8/AOXANSpfhVdMjJNeOKcA+OLbzEYoI9YBv10zEk
 sicuijJ02ZJ0FEr4QQAyJ0FWy72qaA7c+k4zNL9o2om5cF3hDLgdUaiX9x/50nusKz1J
 PCX8G0aKTMeFlG5V30rngVLE50pxO+yxx+9oBIlaA4DNuqmDirLrxiEl/10yORU52inL
 f/uo0iCiMR9yEBpRNwP1H/ZkcB7wkNFNX5fOHu2pT0tO0si9F6PqRi0yQzaim5M9YJIE
 Xm1w==
X-Gm-Message-State: AA+aEWbhd3wotpDmm6jsS7CNSMfMgthjNXiJMdAwCxd5Ruljj2hIK1JE
 WFe+WXuIO4HOtOOJbzP5gmZ/CxWd1RzcfEcedTIVofIk2Vw=
X-Google-Smtp-Source: AFSGD/UzCP8V5jtUeRg/MxHRo13Hm8uASerwcOKaosohmVBFXDeS16MHGwUHNwN6IwiIZIYjgIcHhgSQwPQY5vrB0Bk=
X-Received: by 2002:a17:906:4e14:: with SMTP id
 z20-v6mr24116264eju.187.1546197031346; 
 Sun, 30 Dec 2018 11:10:31 -0800 (PST)
MIME-Version: 1.0
References: <CAHLp1YkibRSvohY9FJ5G+FXaEw4tFU52rLsbWLSP8oiL0K=rhQ@mail.gmail.com>
In-Reply-To: <CAHLp1YkibRSvohY9FJ5G+FXaEw4tFU52rLsbWLSP8oiL0K=rhQ@mail.gmail.com>
From: Christophe-Marie Duquesne <chmd@chmd.fr>
Date: Sun, 30 Dec 2018 20:10:20 +0100
Message-ID: <CAHLp1YmoZV-T+d_U_GDhSpgbK1099x+xVEUX=T24q5u=SKCnJA@mail.gmail.com>
Subject: Re: [Android app] Can't connect to a chromecast when wireguard is
 running
To: wireguard <wireguard@lists.zx2c4.com>
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
Content-Type: multipart/mixed; boundary="===============8396277570785494661=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============8396277570785494661==
Content-Type: multipart/alternative; boundary="000000000000ce658b057e420cde"

--000000000000ce658b057e420cde
Content-Type: text/plain; charset="UTF-8"

Hi again,

Thinking about my former setup with Openvpn, I realized it had a setting
"bypass VPN for local networks" (under "routing"). Is there such a thing in
the Wireguard app? (In the peer config, there is a checkbox "Exclude
private IPs". In doubt, I tried to enable it, but then the wireguard
interface stopped working with the message "Error bringing up tunnel: Bad
address")

Generally, the app which I believe would solve my chromecast problem is
probably "Google play services" (com.google.android.gms). It is
unfortunately not part of the list of applications one can exclude from the
UI. Is there a way to do one of these two things?
- Implement a feature similar to "bypass VPN for local networks"
- Make it possible to exclude an application by string input (directly
typing "com.google.android.gms" in some text area)

Thanks,
Christophe-Marie

--000000000000ce658b057e420cde
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div>Hi=
 again,</div><div><br></div><div>Thinking about my former setup with Openvp=
n, I realized it had a setting &quot;bypass VPN for local networks&quot; (u=
nder &quot;routing&quot;). Is there such a thing in the Wireguard app? (In =
the peer config, there is a checkbox &quot;Exclude private IPs&quot;. In do=
ubt, I tried to enable it, but then the wireguard interface stopped working=
 with the message &quot;Error bringing up tunnel: Bad address&quot;)</div><=
div><br></div><div>Generally, the app which I believe would solve my chrome=
cast problem is probably &quot;Google play services&quot; (com.google.andro=
id.gms). It is unfortunately not part of the list of applications one can e=
xclude from the UI. Is there a way to do one of these two things?</div><div=
>- Implement a feature similar to &quot;bypass VPN for local networks&quot;=
</div><div>- Make it possible to exclude an application by string input (di=
rectly typing &quot;com.google.android.gms&quot; in some text area)<br></di=
v><div><br></div><div>Thanks,</div><div>Christophe-Marie<br></div></div></d=
iv></div></div>

--000000000000ce658b057e420cde--

--===============8396277570785494661==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============8396277570785494661==--
