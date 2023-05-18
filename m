Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFDAFC77B7F
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 18 May 2023 01:18:03 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2454a1e0;
	Thu, 18 May 2023 01:18:01 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 99773387
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 May 2023 01:17:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E8BB064B76
 for <wireguard@lists.zx2c4.com>; Thu, 18 May 2023 01:17:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BEF9C433D2
 for <wireguard@lists.zx2c4.com>; Thu, 18 May 2023 01:17:56 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="FcEbJrV2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1684372674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Zj6csr/nKAXGH4MU6Px+ljsZJucQXTGvY2cgrXQHiCU=;
 b=FcEbJrV2/RemsuFCgtGZI/hABDFKw131MjAPmbbxZDj0hWYE916JiV88ZardJzfHCuBIvY
 4U/recn1SwbRnQIhjl7AsvxSljz1+FNukiFE3Trg4Vr6r/ILRDLFbURap54e1KxJj6/7Mg
 h2svfGS5n4WiavFj1hRTiTxCIL5tfI8=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id bba1e3d4
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 May 2023 01:17:54 +0000 (UTC)
Received: by mail-ua1-f43.google.com with SMTP id
 a1e0cc1a2514c-76d846a4b85so523188241.1
 for <wireguard@lists.zx2c4.com>; Wed, 17 May 2023 18:17:54 -0700 (PDT)
X-Gm-Message-State: AC+VfDwu3yRfDaqChuccrjwEX9oyfij2zwOKQNNyRhMWBrK7/dnfGIYS
 eBo+7qwSIXyx2UA1eKJiDoMtZUCH4C2bLLOj1jI=
X-Google-Smtp-Source: ACHHUZ4dtkuu4cUl27mKfgd+91ZN58o4G3HPLef7l16FyZIqWngjDW4WYnqea2PXp6G2o+i7s1fjH3Oh89bp0bqYeXM=
X-Received: by 2002:a67:f5d2:0:b0:436:fc1:2a63 with SMTP id
 t18-20020a67f5d2000000b004360fc12a63mr14551419vso.28.1684372673482; Wed, 17
 May 2023 18:17:53 -0700 (PDT)
MIME-Version: 1.0
References: <87fs7xtqrv.fsf@gmail.com>
In-Reply-To: <87fs7xtqrv.fsf@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 18 May 2023 03:17:42 +0200
X-Gmail-Original-Message-ID: <CAHmME9rEKX_8s=WxoeBg5xf-5FLVxTm6q8Wo=-FrwRCuT7FX6Q@mail.gmail.com>
Message-ID: <CAHmME9rEKX_8s=WxoeBg5xf-5FLVxTm6q8Wo=-FrwRCuT7FX6Q@mail.gmail.com>
Subject: Re: [bug] No keep-alives sent when private is set via PostUp
To: Maxim Cournoyer <maxim.cournoyer@gmail.com>
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

Hi Maxim,

Thanks for the bug report! I think indeed you're right about this. Can
you test if this commit fixes the issue for you?

https://git.zx2c4.com/wireguard-linux/commit/?id=3ac1bf099766f1e9735883d5127148054cd5b30a

It at least satisfies the test case I added.

Until this patch hits stable kernels, you can probably work around
this by changing your PostUp into a PreUp. I adjusted the man page
here:

https://git.zx2c4.com/wireguard-tools/commit/?id=9d42bd1ab9d707f7a72162d36c9b37cc9bdf480e

Jason
