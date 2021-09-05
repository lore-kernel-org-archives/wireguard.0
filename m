Return-Path: <SRS0=TPXl=N3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 279F4C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  5 Sep 2021 12:26:18 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64B5B60724
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  5 Sep 2021 12:26:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 64B5B60724
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c9287a7d;
	Sun, 5 Sep 2021 12:23:49 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id bb8b277c
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 5 Sep 2021 12:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1630844623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Co3Q4I2h70kEFrpNsBKiMK+e+NUx7VGbYVf7NDLol6g=;
 b=fGFzETD7+pBmbLvu6URpxYXNr194dUtJ8O/dNqXrfXIEEevwIg8gaborbWYi8Ag7vYTb8h
 uQ+J50T+KN+t076ypFtg+RQyVKjly+56oTeOk8lkDIQZykSELaTaF9p6T/vATraPOktxgA
 dKnz3QJ/zhihpa2jp6/LaXTI87ZW4V0=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c3774e8f
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 5 Sep 2021 12:23:43 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id z5so7863886ybj.2
 for <wireguard@lists.zx2c4.com>; Sun, 05 Sep 2021 05:23:43 -0700 (PDT)
X-Gm-Message-State: AOAM533eAkogiofaJgD8gwIEtxz3Lk7WRJ5u+bPg10oi0b8m93PefgOO
 MkVK048mQhQQuBe1Ltu+SGfGym2qdEQ6mSNH8iA=
X-Google-Smtp-Source: ABdhPJzP7A2mLN+7JtU/wVyWIPk/nce1FsU9Vm/rbMGvSTFfawpJ/eCHeXm0G73Vo6VK7bFGaKynEoSDSwsYL7e7QaU=
X-Received: by 2002:a5b:783:: with SMTP id b3mr9912755ybq.328.1630844622726;
 Sun, 05 Sep 2021 05:23:42 -0700 (PDT)
MIME-Version: 1.0
References: <1126168D-D01E-48E8-B3F4-308F16666C61@z3ntu.xyz>
In-Reply-To: <1126168D-D01E-48E8-B3F4-308F16666C61@z3ntu.xyz>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 5 Sep 2021 14:23:32 +0200
X-Gmail-Original-Message-ID: <CAHmME9o3p-z+geceaHybP_RjUmotwddLCV5RQhdxTZBGf1fyiA@mail.gmail.com>
Message-ID: <CAHmME9o3p-z+geceaHybP_RjUmotwddLCV5RQhdxTZBGf1fyiA@mail.gmail.com>
Subject: Re: build.wireguard.com down
To: luca@z3ntu.xyz
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

Sorry for that.

We're all set now, though I don't yet understand root cause.
Apparently it shutdown on Sept 2 and returned with different NICs (I
think?), which had a different stable identifier and so an IP address
wasn't configured on them. Going to begin analyzing the situation now
that connectivity is restored.

Jason
