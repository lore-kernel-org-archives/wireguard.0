Return-Path: <SRS0=vJ13=EZ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C963EC63697
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 19 Nov 2020 16:56:34 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F29324199
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 19 Nov 2020 16:56:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="rIQit856"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F29324199
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 267c1f49;
	Thu, 19 Nov 2020 16:51:38 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 170f5509
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 19 Nov 2020 16:51:36 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dd534551
 for <wireguard@lists.zx2c4.com>;
 Thu, 19 Nov 2020 16:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=ZdfddO0xAGNAXzdawuTp6LgalLI=; b=rIQit8
 561EnYq89CV9gykuNJLTzGC3MEtV5JC1JJ59WXbCtnMRRl7EF/V2SPSRFwHgcM0U
 3GgSMdV0yOQ2hil4mZRI9J2BRm2LDQiPx3yDbAlBBI+Vh5dsnd9x3h1QletLf3bU
 Fr27rfm7W2kL+DRkBtJ2M9BPL09lv4c6sCBT2Q5zsEs8cO0FRAgeKPIy2k+tbPCG
 13mA15smHeji8b6uah2y9nHdFkRaPvQYdqshOznFh3Jcnppffp7OETY3aRKirq35
 kA2ls6gV8CYHRj5ymyxB/g5IwVhyiWjhvxBIwfLmD8Km4oXkxI3LKvMbHZa+kp6R
 X67HZqnOl9/e9sSA==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 73a52ff0
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 19 Nov 2020 16:52:22 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id 10so5817591ybx.9
 for <wireguard@lists.zx2c4.com>; Thu, 19 Nov 2020 08:56:29 -0800 (PST)
X-Gm-Message-State: AOAM533wbLh0S08OT5l9gy96/NeqTDSQSunV1npFhE8adnUpSl1gZe4z
 7P52bBmQ6lB6PalrQWA/FfN1k9wND6JNOxjR5Ks=
X-Google-Smtp-Source: ABdhPJyyfpZf5qWTFLdlTUweo3ktphyk30XCac8MWOlT4NsVM1BZ2MB+id44TOuRmkWh29g5IpEqQUZfOG4kUHDvlu4=
X-Received: by 2002:a25:16c6:: with SMTP id 189mr12942252ybw.306.1605804989279; 
 Thu, 19 Nov 2020 08:56:29 -0800 (PST)
MIME-Version: 1.0
References: <3415567b-5441-f3b1-7a38-f0bae3a14cfc@werehub.org>
 <CAHmME9p6FoUsFou0LkeUZt4Ba1K4ycuA6f8X4c6Kt8-jzkAH7A@mail.gmail.com>
 <665e0a8610984d938ab013ec2aac8517@su.se>
In-Reply-To: <665e0a8610984d938ab013ec2aac8517@su.se>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 19 Nov 2020 17:56:18 +0100
X-Gmail-Original-Message-ID: <CAHmME9rRY-+kdWLnJGsGvZJHDDAChuv2fDSDWOV9_w6=if6tmA@mail.gmail.com>
Message-ID: <CAHmME9rRY-+kdWLnJGsGvZJHDDAChuv2fDSDWOV9_w6=if6tmA@mail.gmail.com>
Subject: Re: Using WireGuard on Windows as non-admin - proper solution?
To: Patrik Holmqvist <patrik.holmqvist@su.se>
Cc: "vh217@werehub.org" <vh217@werehub.org>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
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

Hi Patrik,

Thanks for the patch. I think we'll probably take a route similar to
that, with S-1-5-32-556, but will gate it behind a registry knob and
and will allow only for starting/stopping/viewingstatus of tunnels,
but not editing or extracting private keys.

Would that be passable for you?

Jason
