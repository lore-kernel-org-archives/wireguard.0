Return-Path: <SRS0=+otM=PW=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF752C433FE
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  3 Nov 2021 10:57:13 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CEAD61076
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  3 Nov 2021 10:57:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0CEAD61076
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5b5387bb;
	Wed, 3 Nov 2021 10:56:37 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 14585192
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 3 Nov 2021 10:56:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 675126109F
 for <wireguard@lists.zx2c4.com>; Wed,  3 Nov 2021 10:56:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="ijE04G5D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1635936990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+jcEx6OX0M6e+cPy/UeyqJcmnY/cekCsZdaY3JLaG4I=;
 b=ijE04G5D9yZvAZMIfqG7lQdK8oMknWyFS7xj+uHLb5XW0sfNBqRI7dg0hbYyosWzSxxsIt
 1+wI0oRsqmYPgYJaJpXDcz6RexNVpIShYkdQHZH1EC/m8WUkAM0e3E/onubAgAxaEN0w0r
 1MFMcb91HoQngP87GC9qLECI4cQ2HZQ=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 360df070
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 3 Nov 2021 10:56:30 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id d10so5332097ybe.3
 for <wireguard@lists.zx2c4.com>; Wed, 03 Nov 2021 03:56:30 -0700 (PDT)
X-Gm-Message-State: AOAM531ItSEPJ4RzMEakeDvnK9tDzdWiZB4W7sk0GpPDd9pZXl/wxu6c
 Q8iuutefR8iTROtJ6kUQc1+PFE0uuySy/6MbA5Y=
X-Google-Smtp-Source: ABdhPJyw6hdxfTZejYUfZHv/ZypZbkjDoraRQJy8dF9QmOOpKR5/+wvYUMs8FLDCfZ0uF/mmOALdFczo7XgAQ8U8NTw=
X-Received: by 2002:a05:6902:568:: with SMTP id
 a8mr28234675ybt.472.1635936989350; 
 Wed, 03 Nov 2021 03:56:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7110:2047:b0:fa:da35:6920 with HTTP; Wed, 3 Nov 2021
 03:56:28 -0700 (PDT)
In-Reply-To: <CAHFBhibg_LDeUZ=96d2u=7kh2py0zC5Abp_L0S7Krd2xptZOyQ@mail.gmail.com>
References: <CAHFBhiah1NgozmGWtTgvZEfhyxDNA0EySiZao+fsK-Z9_1QLpQ@mail.gmail.com>
 <CAHFBhibg_LDeUZ=96d2u=7kh2py0zC5Abp_L0S7Krd2xptZOyQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 3 Nov 2021 11:56:28 +0100
X-Gmail-Original-Message-ID: <CAHmME9q0GHUHPrWuN-0s3X0kCN7QN9Ur0Y9naHko7o83DMbccg@mail.gmail.com>
Message-ID: <CAHmME9q0GHUHPrWuN-0s3X0kCN7QN9Ur0Y9naHko7o83DMbccg@mail.gmail.com>
Subject: Re: the format of the specified network name is invalid
To: am2@rcsnetwork.com
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

Could you send:
- Your complete log file that shows the problem.
- The redacted config that causes the problem.
- The last version number that worked. (Don't tell me "the last one";
I need the actual version.)

If you send these, I can likely fix the issue. Without it, I'm in the dark.

Thanks,
Jason
