Return-Path: <SRS0=wRPw=EU=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B94C1C5519F
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 14 Nov 2020 15:16:23 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D17722067D
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 14 Nov 2020 15:16:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HF6+Bh7Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D17722067D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 52564840;
	Sat, 14 Nov 2020 15:11:01 +0000 (UTC)
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 046af544
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Nov 2020 15:10:58 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id x9so14509055ljc.7
 for <wireguard@lists.zx2c4.com>; Sat, 14 Nov 2020 07:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OayOysOykLiq1PhbP2H0i6qigcAlBSPdxtOgJ/SkiC8=;
 b=HF6+Bh7YLRy3wec+me+LLhaMC2iPbwDaPasAyIBfyYKusdqNDU8YXNASmAnwtUGUdC
 iEuhlm8j7Gg2vMO8Po/M6QXg9oEWxusFmtEm+shZyxo+3jxSGnJC/n+JnBH/l25g75W1
 oVr9Epi+8CmgfPuHwojanJxZmWDThUP7DgIbmCVNGRxrgZSXALMXhYRBIl6waYFcMdqv
 xS0OhvErvURzsdVgXvyUdUEX5MzZIcc4Hn4J6nOGL4Zyiha4oeCKrff9pzNZkLM9EvPh
 ASxHyw2NP0nSQtpSHlf8Vc2WY9e2jEN2RzJVRgf2rrpN1PpduopJGW40+0SuHSCP62Lu
 YtUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OayOysOykLiq1PhbP2H0i6qigcAlBSPdxtOgJ/SkiC8=;
 b=XFhq615Ai1IVrBe7QYReOwgbxIO7nq+Xgx/udgDQPxT4ZUQs+ict7ZUeQmDPhoA7wG
 U6m3KjyRDYjcf+0ZvwziYT/HiRgE3fSV9ThNmmp6Jp/QMJ3DRMXe/keC/mKM6VEoNK4F
 Fe/D3P3I77pLfbfLkQ3LEIila1NEA8wvYvk8F1Od5BOt6ZTK+it4ZEDnxd5CMvi0IGxa
 kx7hwJ3uJ2FOwf2hU5ngzhAmdBo7Y26nOyeHEEfZg0fGdIplBRIM6d/ipA+AzLzuoWl3
 F1DfdQ94gA2fqTd1XcsBYe7FxPQRfGtmKH+pkHX83H2v2EtFqA29EQ+O6MXx17hl7EnC
 N+iQ==
X-Gm-Message-State: AOAM533GbpB3i3xfBWzwBVNzYaiR75MDjemfxhdpIbodTQ63hKDSpf4b
 +kAiYYud+qfvPsZ9yoKwix+rpeZRbMzymyRGXsk=
X-Google-Smtp-Source: ABdhPJxsrTI6lZHvVY9OSdgGegzjF8UI4WBLVJ1g2X2sab+04sduX4oBpI4xhmqB/0bGUGcQKlNItVsLTPjeoLJnSLk=
X-Received: by 2002:a2e:2c14:: with SMTP id s20mr3374026ljs.398.1605366910244; 
 Sat, 14 Nov 2020 07:15:10 -0800 (PST)
MIME-Version: 1.0
References: <bc1cd9b4-daac-4877-65a6-3fcf2ceeb980@53c70r.de>
In-Reply-To: <bc1cd9b4-daac-4877-65a6-3fcf2ceeb980@53c70r.de>
From: Phillip McMahon <phillip.mcmahon@gmail.com>
Date: Sat, 14 Nov 2020 16:14:34 +0100
Message-ID: <CABtXGiBWGPgzH5dc2KGCJLv_howzsT4rpDKi9bQVN2CC7Ahaeg@mail.gmail.com>
Subject: Re: Progress on resolvectl DNS fail
To: Silvan Nagl <mail@53c70r.de>
Cc: wireguard@lists.zx2c4.com
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

Probably better if you ask via the links you posted.

This doesn't look to be directly a WG issue, but rather a more complex
situation on how networking is handled, specifically DNS.

On Sat, 14 Nov 2020 at 13:01, Silvan Nagl <mail@53c70r.de> wrote:
>
> Hi,
>
> since I use Fedora for daily use I would like to know if there is
> already some progress on this issues:
> https://github.com/systemd/systemd/issues/17529
> https://bugzilla.redhat.com/show_bug.cgi?id=1895518
>
> Regards,
>
> Silvan
>


-- 
Use this contact page to send me encrypted messages and files

https://flowcrypt.com/me/phillipmcmahon

P.S. Drowning in email? Try SaneBox and take back control:
http://sanebox.com/t/old3m. I love it.
