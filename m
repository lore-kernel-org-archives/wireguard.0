Return-Path: <SRS0=2DBL=OO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6656FC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Sep 2021 06:17:13 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 755856124C
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Sep 2021 06:17:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 755856124C
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 85e2e84d;
	Fri, 24 Sep 2021 06:14:44 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id bb312090
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Sep 2021 06:14:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6537061241
 for <wireguard@lists.zx2c4.com>; Fri, 24 Sep 2021 06:14:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="pDISSvAC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1632464077;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Zw/UURRmC56Tiy/Ib7UX78cHBhYi5S+6vl/K+J6cKx4=;
 b=pDISSvACB05nvbWok9K1XfGtWtEfe7a8ghuMe3WhJ8diqzrL/lyPyzHgf/2We5EBls520Q
 v17uSqQJMNc1JsMPwIIg4bnza2vtoHr9TAJedEAbr5o0nCRrlU3UIjaejSsneZ9Ia20iDg
 sr9/f8D77xii6QFy0lBw4ZQqlTUYkHk=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3f9c3df0
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Sep 2021 06:14:37 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id z5so3475571ybj.2
 for <wireguard@lists.zx2c4.com>; Thu, 23 Sep 2021 23:14:37 -0700 (PDT)
X-Gm-Message-State: AOAM530mN+GMxg73mPM5yGHrsesSFJxFqirL5dd0qwxajd9UZrqT79Yl
 3a7A8RrS3D8T3C8ESv3Dkar0qVsxon2OcdpUOek=
X-Google-Smtp-Source: ABdhPJy7K433QwUJJQ4K1Tvdrbt0yL8GaEGgT0zFPoqNYka1S35J1aifrPxcy86MYHAMbjsx/ZjJNwGCUvDl0s7fysY=
X-Received: by 2002:a25:d442:: with SMTP id m63mr10351588ybf.79.1632464076492; 
 Thu, 23 Sep 2021 23:14:36 -0700 (PDT)
MIME-Version: 1.0
References: <e0d4dcbb-b0c8-1214-ff0c-c856d168d67f@physik.uni-bonn.de>
In-Reply-To: <e0d4dcbb-b0c8-1214-ff0c-c856d168d67f@physik.uni-bonn.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 24 Sep 2021 00:14:25 -0600
X-Gmail-Original-Message-ID: <CAHmME9o_490d9W85=A6xUFktvKuvCAsmqb2T80BNsVY8BRfd0w@mail.gmail.com>
Message-ID: <CAHmME9o_490d9W85=A6xUFktvKuvCAsmqb2T80BNsVY8BRfd0w@mail.gmail.com>
Subject: Re: Windows stuck in boot after WireGuard update (switch to
 WireGuardNT?)
To: Oliver Freyermuth <freyermuth@physik.uni-bonn.de>
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

Hi Oliver,

These came out on Tuesday, which might correspond with your timeline:
https://support.microsoft.com/en-us/topic/september-21-2021-kb5005624-os-build-18363-1830-preview-b2a3af81-696b-4d59-8d7b-a05389407bb8
https://support.microsoft.com/en-us/topic/september-21-2021-kb5005625-os-build-17763-2210-preview-5ae2f63d-a9ce-49dd-a5e6-e05b90dc1cd8

Is it possible that you installed either of these immediately before
the problem began? Post hoc ergo propter hoc, of course, but if you,
Joshua, and a third private reporter of this bug all have the same
correlation, that's interesting...

Thanks,
Jason
