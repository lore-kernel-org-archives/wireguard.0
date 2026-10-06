Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C18CA5FFC
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  6 Oct 2026 16:03:07 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id b7ae0122;
	Tue, 6 Oct 2026 16:03:05 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id c309e0cb
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 6 Oct 2026 16:02:59 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id E07DA44509
 for <wireguard@lists.zx2c4.com>; Tue,  6 Oct 2026 16:02:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ABE81F0089B
 for <wireguard@lists.zx2c4.com>; Tue,  6 Oct 2026 16:02:57 +0000 (UTC)
Authentication-Results: smtp.kernel.org; dkim=pass (1024-bit key,
 unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256
 header.s=20210105 header.b=H/qY7KI+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1791302571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5loow0bAols1Ly7/B4w0DtH5qLR1eVGXgEIrPg8gpNc=;
 b=H/qY7KI+09Gp9DjWx0nke8Ee8s2cKkU4BUmyiQjzW1hjK+Z3Z14ANLLKPdzlrgujr5FTZR
 tQjmUVuJrZ6xmqca59XXsZSfA+FBjp84o5GfP4YgUzU8xMgS2JuH49Bb7/YkhyYtnPKfBi
 fpV4yxPWWZ8YKWhijUeh1Ubd22I1d18=
Received: by mail.zx2c4.com (OpenSMTPD) with ESMTPSA id 2af8da3c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 6 Oct 2026 16:02:49 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-c1670dad7a8so572163466b.3
 for <wireguard@lists.zx2c4.com>; Tue, 06 Oct 2026 09:02:49 -0700 (PDT)
X-Gm-Message-State: AFq9FYJWLjDXWeocEBcTHAiKHj0DpjGY9TmjocymI6VSpEqX39ttg8KF
 sTOtR0kh2IV76NcFTGgrRioA5hCmDtpT8a5ev03Nyo2o2Af4l37jQLar+BMiHoCa9cVONfS3uBE
 ORpLSRQO0hdx3VueIXtDn2KaXRSRF/6I=
X-Received: by 2002:a17:906:dc90:b0:c2e:2baa:a642 with SMTP id
 a640c23a62f3a-c2e6ed908e2mr1095247766b.30.1791302568376; Tue, 06 Oct 2026
 09:02:48 -0700 (PDT)
MIME-Version: 1.0
References: <188dc861-f452-4830-9b47-e51c15faf41d@philomathiclife.com>
 <CAHmME9pKeQK46EKALjX7NgH3Qc_HTWw6aZi_crRe7Tf6WDHR4w@mail.gmail.com>
 <e1255116-a94f-45a6-9450-f873c0c69ac4@philomathiclife.com>
In-Reply-To: <e1255116-a94f-45a6-9450-f873c0c69ac4@philomathiclife.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 6 Oct 2026 18:02:36 +0200
X-Gmail-Original-Message-ID: <CAHmME9qb8739vLozr56Tzb6R6Cf+heTZNCCu66XSFPMgAc6Z1A@mail.gmail.com>
X-Gm-Features: AclHuK-NPXQ-GJwToj7y8d2KN5JMNIkbvFAUvPvxKwbopACOzgpfLjlaP0EL5-E
Message-ID: <CAHmME9qb8739vLozr56Tzb6R6Cf+heTZNCCu66XSFPMgAc6Z1A@mail.gmail.com>
Subject: Re: OpenBSD collaboration/peer-review request
To: Zack Newman <zack@philomathiclife.com>
Cc: wireguard@lists.zx2c4.com, Matt Dunwoodie <ncon@noconroy.net>
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

Hi Zack,

Oh, darn, that's really too bad. I'm CC'ing Matt on the thread; he was
supposed to be in charge of keeping things sane. I don't like
throw-it-over-the-fence coding.

Have you witness insane things happening in the code base? Or are you
just worried about the churn, in theory, going bad?

Jason
