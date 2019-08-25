Return-Path: <SRS0=QHSY=WV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F103C3A5A1
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:58:18 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6C592070B
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:58:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="jOpnazAf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6C592070B
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9bfeda77;
	Sun, 25 Aug 2019 15:53:42 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9dfd4305
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 15:53:41 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a37abae2
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 15:51:03 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 985f1f04
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 15:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=VOwKfheyejoJlvDW87V5xGLX6JM=; b=jOpnaz
 Afn9n+/BwF1RY/JmbnpjAXMaDFK7VPBy9kiixZbh23tmAbdrcECqRnGLI60zJFd2
 bZSr9AKLolHQ8nkpVc9NkqgeuLTdBi+VfRPWEn7bIbREoMixyI85bkvZ6tNOep5C
 ULlF+bYi4yWyurUtbsOLO8URnK++7SatxinqToxwS3vdVseMCVD/Wpy11seB+gQs
 +JCXapIZ79Y/4/Cm3T+0tusKi0hOtoC52d6S40qi7gJ8/glsVOMEWC/dsx+Zoyn/
 amNNYSkU/SCs52lymtFof8MUo/Lc8DEp4kX4vQx/d5iNKVutgiOYDVgINI+3VQHO
 E5rTmJFoVgrr7WkA==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 20a6c57a
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 15:09:15 +0000 (UTC)
Received: by mail-ua1-f54.google.com with SMTP id f9so4917308uaj.4
 for <wireguard@lists.zx2c4.com>; Sun, 25 Aug 2019 08:51:03 -0700 (PDT)
X-Gm-Message-State: APjAAAVN2tzbXRrm8U0yEwyJEsrisvtav7vT0n0KfaEOugaSGjENwIFf
 MitRXWlA8qlOBcPVvEfVDxCIfXDgkci14TOLCFI=
X-Google-Smtp-Source: APXvYqwGwl6lhhyz4NOp34kubjdsKHyfdHSpTqdtrTVsnkZItxDI+goZ3rjXRFyc2yHNeN5NHcVVCXeMN1udoMaPO9Q=
X-Received: by 2002:ab0:7252:: with SMTP id d18mr2830270uap.62.1566748262743; 
 Sun, 25 Aug 2019 08:51:02 -0700 (PDT)
MIME-Version: 1.0
References: <CABPqyTY-KfjFenwKMWK7VHw_Kqv8ax8aW8tfjgJv8iHbX-vgYw@mail.gmail.com>
In-Reply-To: <CABPqyTY-KfjFenwKMWK7VHw_Kqv8ax8aW8tfjgJv8iHbX-vgYw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 25 Aug 2019 09:50:51 -0600
X-Gmail-Original-Message-ID: <CAHmME9oqFzDF1YRuXiOybYFuG8mRZy7Wvy6dCQr+et5qqXfCJg@mail.gmail.com>
Message-ID: <CAHmME9oqFzDF1YRuXiOybYFuG8mRZy7Wvy6dCQr+et5qqXfCJg@mail.gmail.com>
Subject: Re: Wireguard causes system to hang
To: Nicolas Chan <nicolas@nicolaschan.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

WireGuard uses get_random_u32 which uses rdrand. AMD shipped with a
broken rdrand. Update your CPU's microcode or your motherboard's BIOS
and all should be good.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
