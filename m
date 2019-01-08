Return-Path: <SRS0=MnxW=PQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7D5CC43387
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  8 Jan 2019 23:08:17 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 790AB2084D
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  8 Jan 2019 23:08:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=chmd-fr.20150623.gappssmtp.com header.i=@chmd-fr.20150623.gappssmtp.com header.b="e/yjKTsB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 790AB2084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chmd.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ba2c313a;
	Tue, 8 Jan 2019 23:04:47 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 61f01567
 for <wireguard@lists.zx2c4.com>; Tue, 8 Jan 2019 23:04:45 +0000 (UTC)
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d81c55ea
 for <wireguard@lists.zx2c4.com>; Tue, 8 Jan 2019 23:04:45 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id p6so5818535eds.0
 for <wireguard@lists.zx2c4.com>; Tue, 08 Jan 2019 15:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chmd-fr.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=McTfgEQQaz2E6b5U1GQlxkAcKNCD1UkiNp5yFnQNiZg=;
 b=e/yjKTsBVN4LuYK7WNaD20B6p9lPkticTh4mEO5TUB5f/PNhbh2duMHsh86AYKEUx7
 4Yiu5ZJS7eTHs2upoZBn8w4uOpVj9fV6QJSjYa17xmQPHtENtAoyP9qofpTOcugOzVuz
 livg/k6FzZ8vHor0OikrGENzoMttOi2ISNnKa8TCmj0C8o5RZ3437BWxsw2NSD1sGBiZ
 ecyviebt+IRLIpM/2xENJx+f+YY/WhBRv3wfDQDD2rx2FJMCSTsLsZqStfqc5eVgoacs
 IK2MWD+zHt6ifSYwRl74m1CQe52QuGDiO2AXte2VOWoYaQgw89Yto7uJ2s4zP33ymMlS
 fQgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=McTfgEQQaz2E6b5U1GQlxkAcKNCD1UkiNp5yFnQNiZg=;
 b=ERTAEbrJJC59tRJoQJco9BDAfjAycCALAAjD97FSmaHcajXbEnNcUwLV/gL04lM2iF
 klcAaHBIou9sOhG4mPrqAV8gqYT+fs2qS0LH02IWRZg0wgqVaQKqeVnkHrqK/HoFbKZa
 C8bV/9whpuyt/fkluYCIKCVrWMWVo6xOnz8KvoCOR5CWludxx0z/XxpAX+wE5XZPXUVW
 7O+bgvPw4wKaxAJfFdpLa8i1Vl8i+urZAg07aamHzkqin+piDj6t3IyLXHhb+WvhvoFs
 8ZLXNahVnuvCuFgRN169vJlGorzKSSsDWGiFtshbvRxfV0qGwIxhoRc39gu5CFztjOJv
 1Ylw==
X-Gm-Message-State: AJcUukelzg7sCWoFpPxt1kqEDF1mkG5qSQGwD9ktpGxgx1lnsxYJVCbQ
 EdSqT9u+2qPtWU3uje5dF8FUIObP/mw15T71DJQ=
X-Google-Smtp-Source: ALg8bN6jHEf6jnxiByf+Km3eDaxD3qn9I3DxA5olsH8CsFYkH62or1T73FPobRT8VvEATVTkRHx7FGgTgcwiuqBj9Pg=
X-Received: by 2002:a05:6402:796:: with SMTP id
 d22mr3931455edy.81.1546988874563; 
 Tue, 08 Jan 2019 15:07:54 -0800 (PST)
MIME-Version: 1.0
References: <CAHLp1Y=_RavxCeoV5nQ+R96GTiY+jF9gvNox25B2XO9CVU+jMQ@mail.gmail.com>
 <CAKXLc7f_aDxkasodm0YCBysd63we-L1FeTnsRoZbTvckzEUp0A@mail.gmail.com>
 <CAHLp1Ykc8mA=WCX+P_fmfUi8DLmSSUo1DpNx6XKnV7wLWwf9uw@mail.gmail.com>
In-Reply-To: <CAHLp1Ykc8mA=WCX+P_fmfUi8DLmSSUo1DpNx6XKnV7wLWwf9uw@mail.gmail.com>
From: Christophe-Marie Duquesne <chmd@chmd.fr>
Date: Wed, 9 Jan 2019 00:07:43 +0100
Message-ID: <CAHLp1Ym2RyhT_FoNrJQVZ8gVK=dPEJsZk0wDeOPvL_ibUSTLRw@mail.gmail.com>
Subject: Re: [Android] Wireguard on the Amazon FireTV stick
To: Kalin KOZHUHAROV <me.kalin@gmail.com>
Cc: wireguard <wireguard@lists.zx2c4.com>
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
Content-Type: multipart/mixed; boundary="===============4169207003755919865=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============4169207003755919865==
Content-Type: multipart/alternative; boundary="000000000000570675057efa6a71"

--000000000000570675057efa6a71
Content-Type: text/plain; charset="UTF-8"

Looks like the intent com.wireguard.android.action.SET_TUNNEL_UP does not
do much. I tried to start the tunnel like this:

am broadcast -a com.wireguard.android.action.SET_TUNNEL_UP -e tunnel wg0 -n
com.wireguard.android/.model.TunnelManager

After further investigation, the code to handle this intent is deactivated
[1]. Any help would be appreciated!

[1]:
https://git.zx2c4.com/wireguard-android/tree/app/src/main/java/com/wireguard/android/model/TunnelManager.java#n275

--000000000000570675057efa6a71
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Looks like the intent com.wireg=
uard.android.action.SET_TUNNEL_UP does not do much. I tried to start the tu=
nnel like this:<br></div><div dir=3D"ltr"><br></div><div dir=3D"ltr">am bro=
adcast -a com.wireguard.android.action.SET_TUNNEL_UP -e tunnel wg0 -n com.w=
ireguard.android/.model.TunnelManager</div><div dir=3D"ltr"><br></div><div>=
After further investigation, the code to handle this intent is deactivated =
[1]. Any help would be appreciated!</div><div><br></div><div>[1]: <a href=
=3D"https://git.zx2c4.com/wireguard-android/tree/app/src/main/java/com/wire=
guard/android/model/TunnelManager.java#n275">https://git.zx2c4.com/wireguar=
d-android/tree/app/src/main/java/com/wireguard/android/model/TunnelManager.=
java#n275</a><br></div></div></div></div></div></div></div>

--000000000000570675057efa6a71--

--===============4169207003755919865==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============4169207003755919865==--
