Return-Path: <SRS0=O1+2=M3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B9ECC4338F
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  4 Aug 2021 11:15:50 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D547E60FC4
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  4 Aug 2021 11:15:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D547E60FC4
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1e3a1fd9;
	Wed, 4 Aug 2021 11:15:48 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 9b5bfc61
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 4 Aug 2021 11:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1628075743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t1sCmQGZ2rteTH3YaRHb+unf1CYYwkDya1ccFSTEIic=;
 b=K1T3zWIdtghwyO4c87zitlAK9+SKXJTEJD3+34i/X6rd1nWZDgsLvKJYdknNNfztbh5/v/
 u5Cbhea2Qf049mX7n2HWtTCKBwljUULeFdv60V4rb8EvsUaoxZOCANnusBPmcee18fzhr+
 asNnd6sddMaxcfhqnc3FaaXMvih2ao4=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7dd9bd03
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 4 Aug 2021 11:15:43 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id z5so1673772ybj.2
 for <wireguard@lists.zx2c4.com>; Wed, 04 Aug 2021 04:15:43 -0700 (PDT)
X-Gm-Message-State: AOAM5327WLOQCMQBdu94Jb40e9pLR5qAobELj8g3eqFH0C6wjH/DWy22
 Y7p/qYCxkS3ve0mGJ0ZTB7sh7JddJ+aU9V7Ar7c=
X-Google-Smtp-Source: ABdhPJwuwD6yTLXs2vw4zc+hwLqLeIdCM2OKwjiMwV5quCqUXt/F92eeLCXKJ8hfKPJRRZH/5DDkxxwFnuQWlksTre8=
X-Received: by 2002:a05:6902:56f:: with SMTP id
 a15mr32939693ybt.456.1628075741889; 
 Wed, 04 Aug 2021 04:15:41 -0700 (PDT)
MIME-Version: 1.0
References: <cfb04d23-8e07-53e6-1fca-2db52693eb84@theoks.net>
In-Reply-To: <cfb04d23-8e07-53e6-1fca-2db52693eb84@theoks.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 4 Aug 2021 13:15:30 +0200
X-Gmail-Original-Message-ID: <CAHmME9p0y+5d4ezeiffgaAf1EC_KcZMdc2kKJ_-z1J9Fbh1WOw@mail.gmail.com>
Message-ID: <CAHmME9p0y+5d4ezeiffgaAf1EC_KcZMdc2kKJ_-z1J9Fbh1WOw@mail.gmail.com>
Subject: Re: WireGuardNT with a peer with a v6 endpoint address
To: Darren VanBuren <onekopaka@theoks.net>
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

Hi Darren,

Thanks very much for the report. Fixed here:
https://git.zx2c4.com/wireguard-nt/commit/?id=a48d8a6751e35b6a3bc30062f6021673fccae1c4
. This will be part of the next build.

Jason
