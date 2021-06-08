Return-Path: <SRS0=oHCC=LC=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C7D8C47082
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  8 Jun 2021 13:20:53 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4DE26100A
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  8 Jun 2021 13:20:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4DE26100A
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 888d27e1;
	Tue, 8 Jun 2021 13:20:50 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3cc5fb33
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 8 Jun 2021 13:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1623158445;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gx0Cab40nvsSTHh3Dx49RGeVaBrPq2MT30oPuWOVyZc=;
 b=BTeVs3191MrP8RF8xI64tsqyo/nf71GKCHmE+M5MA/HqcCa+y0063HNQOLAnGCLuCPTpRL
 7FIjDzjzu0Rntke95PqE44IvqdhVq4EavvMOGvc83IEd/8ZoEBb2qXAv7Gx4CQ0CFQkVN+
 YOvYOv9ttCrPzcpWl/Pw1ojM7WrPSH4=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id bbcc6c9b
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 8 Jun 2021 13:20:44 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id f84so30209029ybg.0
 for <wireguard@lists.zx2c4.com>; Tue, 08 Jun 2021 06:20:44 -0700 (PDT)
X-Gm-Message-State: AOAM531wkkEj9TwCVLogdR/4rTYxdWfMY4vm+va85Yt4X232KsS/Yn0M
 heQoZRYtUP+d8gHhk1YSxzU7aj4scxVhSV++39Q=
X-Google-Smtp-Source: ABdhPJzr90BM6yxPmwuerv7dWoDJTPAaLlmoXP8XekNlYB4LFuhJsaZ6N4PTDbY6TCBCEtrd2FDhnbGcRNmBBZUBESw=
X-Received: by 2002:a25:af82:: with SMTP id g2mr31464783ybh.456.1623158443658; 
 Tue, 08 Jun 2021 06:20:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAHmME9o6RhPmojbA4nTRA4GqFXVstEsmmfUj8SqmaJSvGsmmWQ@mail.gmail.com>
 <e8baa2e1-78e4-1b02-940a-b8058f86a6cc@gmail.com>
In-Reply-To: <e8baa2e1-78e4-1b02-940a-b8058f86a6cc@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 8 Jun 2021 15:20:32 +0200
X-Gmail-Original-Message-ID: <CAHmME9qcQBojyk6HaWTG38WLdtA-nh9D80FTYTy3yHCKdkoWOQ@mail.gmail.com>
Message-ID: <CAHmME9qcQBojyk6HaWTG38WLdtA-nh9D80FTYTy3yHCKdkoWOQ@mail.gmail.com>
Subject: Re: Certain private keys being mangled by wg on FreeBSD
To: ben edmunds <tigger2014g@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

On Tue, Jun 8, 2021 at 1:00 PM ben edmunds <tigger2014g@gmail.com> wrote:
> By not showing this to the user to avoid confusion we actually would
> create confusion in this scenario as the kernel module is performing the
> clamping but the user would have no knowledge of this and leads to
> issues being opened that are a non issue. The aim is not to show the
> users anything about clamping unless the key needs to be clamped as it
> was not clamped already.

I think you are making a mistake, and introducing users to the concept
of clamping will just breed confusion.

> I belive it is key to remember that pfSense is not an end user
> application/tool and designed to be used by admins & network engineers

You made that same point on some Github bug report; it's not news to
me, and it still doesn't change my point of view. Introducing
excessive complexity and superfluous technical information results in
problematic decisions, configurations, and decision calculuses, even
for the most powerful of power users. In particular, here, I think
it's only going to sow confusion and bad information to expose users
to contingent details about "valid private keys" and "less valid
private keys" with weird nerdy language like "unclamped". Because the
fact is, any 256-bit bitstring generated from a csprng is a fine
private key.
