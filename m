Return-Path: <SRS0=jywV=SH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C73F0C10F0F
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  5 Apr 2019 15:24:13 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26B6A2184B
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  5 Apr 2019 15:24:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=permerror (0-bit key) header.d=nord-west.org header.i=@nord-west.org header.b="rUcQ4WYH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nord-west.org header.i=@nord-west.org header.b="bNjlCeLR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26B6A2184B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nord-west.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 177eb9fa;
	Fri, 5 Apr 2019 15:21:50 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e8ec745e
 for <wireguard@lists.zx2c4.com>;
 Fri, 29 Mar 2019 09:31:49 +0000 (UTC)
Received: from mail.schafweide.org (mail.schafweide.org
 [IPv6:2a03:4000:34:19b::1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a7474541
 for <wireguard@lists.zx2c4.com>;
 Fri, 29 Mar 2019 09:31:49 +0000 (UTC)
Received: from [IPv6:2001:67c:18e8:2:b5f0:9c2d:9f23:fdb] (unknown
 [IPv6:2001:67c:18e8:2:b5f0:9c2d:9f23:fdb])
 by mail.schafweide.org (Postfix) with ESMTPSA id 522481300C02
 for <wireguard@lists.zx2c4.com>; Fri, 29 Mar 2019 10:33:13 +0100 (CET)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=nord-west.org;
 s=default; t=1553851993; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K/wMlMbeRwnUGf4vAGy2dQwyknHOrMyEl/yEJJ4z8dE=;
 b=rUcQ4WYHRLjEll55kCy0n6/mjGn32Aqat/koHoW+umfXs7orrrK3nQmOumic6YHP7UdU6U
 BzOT/8CiXt29myBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nord-west.org;
 s=rsa; t=1553851993; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K/wMlMbeRwnUGf4vAGy2dQwyknHOrMyEl/yEJJ4z8dE=;
 b=bNjlCeLRGS3LPlUAXUMPMvfqET7zUmZlRyHPPhownocMQT2yBUBEYRRXgYFnESk5puX/4m
 QQIDFPiOkCBabjI1YGvG1/i06+xt/6DWeAi8tOiwIRIgmfJlaVw+jVlhl9Eh8hBPZ1lbVT
 RG5kS1rQWdXXBlLdavPPUol0JYektGI=
Subject: Re: any plans to bring the on demand feature to Android app?
To: wireguard@lists.zx2c4.com
References: <CAGCGytK=5D=f_Cf9a-h1ukjTOD-eMNf5nV5OgfYfOufYEom0tw@mail.gmail.com>
From: Bjoern Franke <bjo@nord-west.org>
Openpgp: preference=signencrypt
Autocrypt: addr=bjo@nord-west.org; prefer-encrypt=mutual; keydata=
 mQENBFj8f44BCADSkS8pPGOlEr8kZwAxF1WD9+RbIs+owDMcXH9aBk4FhNuFvZ0I0/d2rl8h
 zINV+5u7LLSCUTi97c9n4UN747Jvbnn80ZrIvg3d7wDGIPeL9qFZ/vN6XK6p5h2cJOwA4cj6
 fUIZvODsj0nAuclylHJlrDuONue87BRR9UieDDhuQNjFWSXMiLPqN0rUAgntKCv2a7KNswJM
 bmvqwaR2/UxJVNW/Ez6FYlRn8N4zGMwHgS2/KHyJ0by0CGvY7XCR94+S4xKR4fdseWs1vs0S
 Nd641LaJ544zmuJYd/2NfFmqnXkwuY2qrUjMdt/OLXENChwUDCMevUZ2sm0ACJ9bv0t1ABEB
 AAG0IUJqb2VybiBGcmFua2UgPGJqb0Bub3JkLXdlc3Qub3JnPokBVwQTAQgAQQIbAwUJBaOa
 gAULCQgHAgYVCAkKCwIEFgIDAQIeAQIXgBYhBOdPquv6Ji+vRgIQqvz+YSc+9H1/BQJbM8fW
 AhkBAAoJEPz+YSc+9H1/PzEH/2cLGRR6UKyAzBtMV12btaAeXDgYPS8AgTwaJymtJeXriHOq
 KoHzUzipuAy+LaeO9ZXhiXSZ83IqTfv5MOd8O67VhB6ZbNH1JtRM1or9I+Mpzm+eKfyVwU4A
 OImP/ttNbkzTHNhcaws/d6jbuMPHFHyziSU96iedrPwwSqHXPkhjYQYjnJlIEFUVDGihRsFe
 ixpeKCKQs61YvgiBquElchuhmid9BrNi1P2wxD8/M3oYOfsIwvyj9EZSInT19eJR+JClvgVu
 fjhnOzRhiOJLnNQiLsyTBqiksD9Lodwsz837tpdxEKA/POOUn5Aa4ySCy4mcilDuSKNzYb2A
 UjCoJle5AQ0EWPx/jgEIAK9L7ZOOraHYnb4KuftIlSXwxJeezaqta2CEz1B48W3iKXUiKiVH
 EacdtFvk8q1UcxFxv27xZaMUygiKjwdxRtaqchKut+Az/9TimqHz/kx1eyBav4YtNZC2Krsp
 UozyKnj2707Jl1K85vxpt4BNg5VbBuv8WgjJxITTM/sJSH+QDs5yxumyAOZtyWzle//Bh21y
 jGoc1Cprl1pRpqo+2gYkFCWjuooNf1r+DYJm91EyurmU+mh00GCGDIwY/EFWSzQ6bjPWjoWy
 sretGhNiFyWt5CnkxMK+/XVA3UVLAq8IZDf2bv0vrrW6MkxvehPexZgW/AMNnFWdj7+WseR8
 kbsAEQEAAYkBPAQYAQgAJhYhBOdPquv6Ji+vRgIQqvz+YSc+9H1/BQJY/H+OAhsMBQkFo5qA
 AAoJEPz+YSc+9H1/29cIAJrSqoK2dpxcQy1d4RbrHrfeAmbllOUX8f9tGFKiF10AhqQjgiuc
 p+Q0xXHA1f62EDk/Xb+zxGScGJIQB/ViXKSZxpsMMIMCXWakUowh00TNj+oTVs1VLJtZKFc3
 eqWs13Gc5ThkvsIO5hobbkY5fEDQYBXdZKfRt73oNjwi0iy/oEHuC2eUWmeh2/iq0G38uLKZ
 tSMWv28PnkX3etOxJc4U0E0r7oTyGNRGc8+VHH8adoOccsEq4JLBg362laM7tcK4ILkgcgBe
 ZSq85EuLjjI9cD69S/siNv2lCBcB153OnjaG+5KzIz3v/Bf+jnVmIMIpmQeJuVM3chWzuagg qow=
Message-ID: <730512c4-b0c1-2b08-13b6-06b2419aebe6@nord-west.org>
Date: Fri, 29 Mar 2019 10:33:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.0
MIME-Version: 1.0
In-Reply-To: <CAGCGytK=5D=f_Cf9a-h1ukjTOD-eMNf5nV5OgfYfOufYEom0tw@mail.gmail.com>
Content-Language: de-DE
X-Mailman-Approved-At: Fri, 05 Apr 2019 17:21:48 +0200
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On 27.03.19 17:08, Arpit Gupta wrote:
> I am using this awesome feature on the Mac os app to enable wireguard
> tunnel on unknown wifi networks and was curious if there are plans to
> add this feature to Android app?
> 
> Currently using Tasker to achieve the same on Android but native support
> would be awesome.
> 

Great idea, I also wanted to ask for this feature :)

Kind Regards
Bjoern
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
