Return-Path: <SRS0=VRfM=UN=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38911C31E4B
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 14 Jun 2019 18:03:00 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD5DA20644
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 14 Jun 2019 18:02:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="adEFdlUy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD5DA20644
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b94d20bc;
	Fri, 14 Jun 2019 18:02:12 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4715a41b
 for <wireguard@lists.zx2c4.com>;
 Fri, 14 Jun 2019 18:02:10 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0c6eef9e
 for <wireguard@lists.zx2c4.com>;
 Fri, 14 Jun 2019 18:02:10 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7044c97e
 for <wireguard@lists.zx2c4.com>;
 Fri, 14 Jun 2019 17:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=IODefj5ZUuRaZ9397dXVgxS8ihs=; b=adEFdl
 Uyk3oi/irj/sIKTnq4algGOPFj4gN63WPBjVpgCU8V/Qi9dKr4C+bXveFHew5uxD
 teUz5gbD90vouG/PhpHgH4GbYhZSKDolF2jaUkYPwvzGYuRu3Ra9LZ3JYCPAcbFf
 08HqUf3Wf78MaphX9r07pG3IAX8bcp+ywfyFMSQUYo/WrMHKrMcQwmVe3eSQqf0h
 MPnXyu9dXdazgj4d9+7JzL3Xt2oA1nfy1PAMXyZTwcdpF7VCmtcd3bA8QP/E/AuJ
 x9VuqPGMPM8NTAlM2Fk/SOiWY4Zfyz5w472YSJr8yX0ivcfpdcjo+8/tgj2+F4vX
 zMO+eTulxJJfXzvw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 126e0815
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 14 Jun 2019 17:29:38 +0000 (UTC)
Received: by mail-vs1-f47.google.com with SMTP id g24so2302273vso.8
 for <wireguard@lists.zx2c4.com>; Fri, 14 Jun 2019 11:02:09 -0700 (PDT)
X-Gm-Message-State: APjAAAXIm0BNlgS3FGV+on0+dNucvEmtieQC1KrIRngcUzFBhKIbyOK/
 EG47Jvrpz4+fr1m9T/MRe5UFx8V+nMXUzi67FXQ=
X-Google-Smtp-Source: APXvYqwpDTrzw0T+NNPrMyXusyOwWwYiQV9mAmrSzLJNsNG0pzXJKtY1rRobd6+hURnL2VZ7fPsKk86hieW/az4EghQ=
X-Received: by 2002:a67:d00d:: with SMTP id r13mr6853808vsi.100.1560535329190; 
 Fri, 14 Jun 2019 11:02:09 -0700 (PDT)
MIME-Version: 1.0
References: <6BFBD58C-ACC2-45FD-9986-63CEA1143BA6@lonnie.abelbeck.com>
 <CAHmME9r3QVVWRu=36Yx6wmfuHm5CCA3Dg+JdZknpnNAmnj=ATQ@mail.gmail.com>
 <16a64aa0-924c-4497-8252-cc965a04a740@www.fastmail.com>
 <CACioZiuMHZRVxT+_aE9L3dDkn_fADrZCyC8MPgqZ_V5yECxNoQ@mail.gmail.com>
In-Reply-To: <CACioZiuMHZRVxT+_aE9L3dDkn_fADrZCyC8MPgqZ_V5yECxNoQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 14 Jun 2019 20:01:55 +0200
X-Gmail-Original-Message-ID: <CAHmME9qhuZrj8StZq_7ZbSagp8XGN5Q8U-b1hkcca3AwU2v7mA@mail.gmail.com>
Message-ID: <CAHmME9qhuZrj8StZq_7ZbSagp8XGN5Q8U-b1hkcca3AwU2v7mA@mail.gmail.com>
Subject: Re: RFC: wg syncpeers wg0 wireguard.conf
To: Marc Fawzi <marc.fawzi@gmail.com>
Cc: Steven Honson <steven@honson.id.au>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
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

On Fri, Jun 14, 2019 at 8:01 PM Marc Fawzi <marc.fawzi@gmail.com> wrote:
> p.s. does this overlap with similar planned in wg-dynamic?

No, the topics have no similarities.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
