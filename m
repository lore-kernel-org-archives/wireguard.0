Return-Path: <SRS0=/nf9=RE=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13B8BC43381
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  1 Mar 2019 10:09:05 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64E612186A
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  1 Mar 2019 10:09:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nord-west.org header.i=@nord-west.org header.b="D8b0dtL7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64E612186A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nord-west.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 77d5ba53;
	Fri, 1 Mar 2019 09:59:15 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 56cd250f
 for <wireguard@lists.zx2c4.com>; Fri, 1 Mar 2019 09:26:07 +0000 (UTC)
Received: from mail.schafweide.org (mail.schafweide.org
 [IPv6:2a03:4000:34:19b::1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 578c8c30
 for <wireguard@lists.zx2c4.com>; Fri, 1 Mar 2019 09:26:06 +0000 (UTC)
Received: from [IPv6:2001:67c:18e8:2:3e97:eff:fed0:2655] (unknown
 [IPv6:2001:67c:18e8:2:3e97:eff:fed0:2655])
 by mail.schafweide.org (Postfix) with ESMTPSA id C5B451300C9A
 for <wireguard@lists.zx2c4.com>; Fri,  1 Mar 2019 10:35:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nord-west.org;
 s=default; t=1551432950; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fW5V5/q0mfQX5wxt3zaF1MTvW/2GWagAXF8CmGCSBkY=;
 b=D8b0dtL72Tusb/MSir4F5HR2TQRAElrbXJm0Za7B/xXQN9cbwOD+jzNqBrS5KHam85zfdE
 bHFYMgQvVUejzJZFEyc2dJ2F/LKTB7tZIl4yXnSOZr1VKwRdl2mr1N4bhwvxanSknsJqYi
 5IgKqfvBqJfaspOfVkjzGQFRQzHjYng=
Subject: Re: Openresolv package is a requirement and should be added to
 install docs
References: <304c3849-35d1-3312-1670-e7a8469a01fe@post.com>
 <CALJ2VGZo9HYKyJt1=Or+DOhJgbOs1gs=XMECCLdfxN-dS325-Q@mail.gmail.com>
To: wireguard@lists.zx2c4.com
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
Message-ID: <7ce0835e-4d0e-8c33-55c0-b8ff648af380@nord-west.org>
Date: Fri, 1 Mar 2019 10:35:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <CALJ2VGZo9HYKyJt1=Or+DOhJgbOs1gs=XMECCLdfxN-dS325-Q@mail.gmail.com>
Content-Language: de-DE
X-Mailman-Approved-At: Fri, 01 Mar 2019 10:59:11 +0100
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

On 28.02.19 19:45, Reuben Martin wrote:

> 
> 
> That may be a requirement in the context that document was written for.
> But that is not a requirement for wireguard.

wg-quick is also a part of wireguard.





_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
