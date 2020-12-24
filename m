Return-Path: <SRS0=IEsR=F5=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06957C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 25 Dec 2020 14:43:02 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2195C22255
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 25 Dec 2020 14:43:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2195C22255
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0c25fc10;
	Fri, 25 Dec 2020 14:33:25 +0000 (UTC)
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [2607:f8b0:4864:20::102f])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id cb5093ed
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 24 Dec 2020 23:32:43 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id hk16so1841588pjb.4
 for <wireguard@lists.zx2c4.com>; Thu, 24 Dec 2020 15:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ny4ppm3IuCSLd7xYoQTbxWNSPdZbi3nA8JNISqNrJd0=;
 b=uD9CEjGJuxNjmY+TOyI5l3k4hBNEvSSlRE6Q2g58pqKgrpL9JnLBfIRq8puieyjil4
 sIiE/pCO4qvu8kxlR/oLmVzX3u0C9O8fuMZbagJcwr4haPNRkYPuTja6osxGDkd6ub0l
 HV0cyCZE+S6Kw74EWqPRBRPkFaq3mdf7xkuaVGhOXZ/4hGl6aknvmrTp4wkFbYlddxkD
 DVbOPISsEijmxvXmhkipD+ResKfdXXA15A0ipjLVy1ynnIgsQV/YN7AWIRTzTLWCBnct
 cWt1qnH7Cj1kelGMkYxK8WFL8RMrJQNvMQduzVENeMsU7K5y9WZ+bFXS36eDExhL5OrK
 iY3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ny4ppm3IuCSLd7xYoQTbxWNSPdZbi3nA8JNISqNrJd0=;
 b=JZXNIfaN8I6BsU6A2K76JMKIT6sGYYbsQiT5ofvzlVl61QaDf/ZD18/HhMvqx3xpwS
 yUch12YRqnjMWlR0ziQxdG8KeNN0GJnsRypJRO9UCvoDZPZh6DGPuMvfo2MBy3/uuaD8
 DntrwXr+g3ds3ghiRl4+lk80nUbJ+9rX/k8grEmvAsc8j9k784mAU4gD0OQHZAx5orKy
 dz46emvvjTTJn0DiVY/YuUL0hlFNSV++/Kj8UBAAwNo3UvOc56YvsHVXrc12jnUZ2CY2
 iOos1cAgkyEHvfN8gM+B5YIbQtAJtn2Ny0QPIS2QB9XKSONWhgq7/7J1lPbKAmeZ1DgN
 fPNw==
X-Gm-Message-State: AOAM531WnPfBJomv0hatC98MVpbBUG7Et3QYvlgQCOh5QHh0bpGQ1azO
 4DWwd7Dt6R3Lbn3p9DULC5MSHdMT6oCjP+G5uxbL3Trwml7OLQ==
X-Google-Smtp-Source: ABdhPJyqvoc+dODVaVKCNc2PhTe0JKTNw6CkiP47JlTfirh2lakJESUCI1m+eVe6DjszQsbunyI4QgAvBdle9r5iREU=
X-Received: by 2002:a17:902:c144:b029:dc:292e:a8a1 with SMTP id
 4-20020a170902c144b02900dc292ea8a1mr31014012plj.13.1608853331007; Thu, 24 Dec
 2020 15:42:11 -0800 (PST)
MIME-Version: 1.0
References: <87k0t75h3e.fsf@ungleich.ch>
In-Reply-To: <87k0t75h3e.fsf@ungleich.ch>
From: Adam Stiles <ajstiles@gmail.com>
Date: Thu, 24 Dec 2020 15:42:00 -0800
Message-ID: <CAB5G8p9nCdxkikyubjfjJ4bB4+9LXNrEbCN+ONfZn28g26WE0Q@mail.gmail.com>
Subject: Re: How to verify a wireguard public key?
To: Nico Schottelius <nico.schottelius@ungleich.ch>
Cc: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 25 Dec 2020 15:33:24 +0100
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hi Nico,

WireGuard uses Curve25519 keys. A Curve25519 secret key is a random 32
byte value with a few special bits flipped, and a public key is
calculated from a secret key.

There's some good info here (https://cr.yp.to/ecdh.html), including
this questions and answer:

"How do I validate Curve25519 public keys?"

"Don't. The Curve25519 function was carefully designed to allow all
32-byte strings as Diffie-Hellman public keys."

I just saw Jason's response, and so this is a bit redundant, but the
reference above is a good one.

Best,

Adam


On Thu, Dec 24, 2020 at 3:21 PM Nico Schottelius
<nico.schottelius@ungleich.ch> wrote:
>
>
> Good morning,
>
> I am currently extending uncloud [0] to support wireguard tunnels and
> keys. At the moment it is not entirely clear how to verify that a
> certain string is a valid wireguard key.
>
> I first tried checking that it is valid base64, but not all base64
> strings are valid wireguard keys.
>
> Then I tried using `echo $key | wg pubkey && echo ok` - which seems to
> check the key format, however the intended behaviour here is misused.
>
> Does anyone have a pointer on how to reliably identify wireguard public
> keys?
>
> Is the wireguard key always 32 bytes when decoded from base64? Tests
> with a number of public keys seems to indicate that.
>
> Best regards,
>
> Nico
>
>
> [0] https://code.ungleich.ch/uncloud/uncloud
>
> --
> Modern, affordable, Swiss Virtual Machines. Visit www.datacenterlight.ch
