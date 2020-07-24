Return-Path: <SRS0=dVqJ=BD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA7E4C433E1
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Jul 2020 09:09:56 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4629B2074F
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Jul 2020 09:09:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="itXxMlcl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4629B2074F
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9b70a188;
	Fri, 24 Jul 2020 08:46:35 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 42253019
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Jul 2020 08:46:32 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d9e8bef7
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Jul 2020 08:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=gxP8Z3c8sEDGDX1zFfsF+i3keB8=; b=itXxMl
 clu2cB8WKn+oN97V3TXRz1ZjIseXq+kRdtooIRvbcua6mcGdFMNChgh8JGfEF188
 pOzU6gu+KjVZLafX7mHUotVZk5fE+8C2ZNaeNQByy04jm+cHtcQn943i5EoQ1K1H
 UvGNSjbjGFpV5a1uZ9Z48hcuRjXwDPefh/5y63iJWlKmAwvjNn4gmestw60Py0Is
 QgFPSmk32GkOtuayIv33BiEXm1hBPX5qaYdZa12Zhw6bptWRadixs/eMi2UewJMK
 l+FWfZqtQzspoVSEhcoHOu1wZ3kNOlInSCCv0fo0kJyoAEexAjSvlbdgnxIK2Cun
 HYErtEORJ4zbgoQg==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9bf479ea
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Jul 2020 08:46:32 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id s189so1864128iod.2
 for <wireguard@lists.zx2c4.com>; Fri, 24 Jul 2020 02:09:26 -0700 (PDT)
X-Gm-Message-State: AOAM531jzEePEAyfVc0RgPE+JtxX6YUlC/yo25qUaQX26oB+Rgb+Ss1G
 Lj7P+jEneV8PfaETW+dSyFLac1n1u8Tu25XGUr8=
X-Google-Smtp-Source: ABdhPJwARWrRahuyax8NtSa8Zo5zLAtnvWrH1OFIS1Hg2cM+LI1YikgjWBDtaJJLpLLjvMUYRz5HdEv893pHyxDBwiU=
X-Received: by 2002:a05:6638:210c:: with SMTP id
 n12mr9747622jaj.95.1595581765801; 
 Fri, 24 Jul 2020 02:09:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200722114051.1919-1-mendoza.ricardo@gmail.com>
In-Reply-To: <20200722114051.1919-1-mendoza.ricardo@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 24 Jul 2020 11:09:14 +0200
X-Gmail-Original-Message-ID: <CAHmME9q8Xrm0RK8d45xBDGe4=0dOyeMJFnMHX8h=KbFUYw1GEA@mail.gmail.com>
Message-ID: <CAHmME9q8Xrm0RK8d45xBDGe4=0dOyeMJFnMHX8h=KbFUYw1GEA@mail.gmail.com>
Subject: Re: [PATCH] compat: allow override of depmod basedir
To: mendoza.ricardo@gmail.com
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Ricardo Mendoza <ricmm@pantacor.com>
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

Thanks for figuring this out. It looks like '/' as the default is
indeed safe, as this value is only used in this expression:

       cfg.dirnamelen = snprintf(cfg.dirname, PATH_MAX,
                                 "%s/lib/modules/%s",
                                 root == NULL ? "" : root, cfg.kversion);

and // and / are equivalent.

I've applied this with slight modifications here:
https://git.zx2c4.com/wireguard-linux-compat/commit/?id=6028795b4415d7f467acc01c5292f8e4703a6b39


Jason
