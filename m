Return-Path: <SRS0=QZLZ=PK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE1A3C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 22 Oct 2021 19:24:28 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D447610A4
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 22 Oct 2021 19:24:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0D447610A4
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9feef646;
	Fri, 22 Oct 2021 19:24:26 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2a8a5c1f
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Oct 2021 19:24:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AD6356109D
 for <wireguard@lists.zx2c4.com>; Fri, 22 Oct 2021 19:24:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="GMdyJDx5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1634930661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lHuXjtnGIwA8Zzr3bT7RPQh03xIe4TvMRJ0gk9Qtcas=;
 b=GMdyJDx5k8VBg3ZcpH5lCSbI71SNZiz5zakwCyZIFoGflLMnvFTdqwDxmj3sXdopOxkmAl
 BX7gJyQp8jerQeuA9qzdJgb6UbgYJ+2Mn20V3HlhRtGDGLDhwM0fBfjA0v/i9+lHR+BxJn
 AgKPBKbhZEc6nzd9CrA/w03luK7VBwM=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 712aaed8
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Oct 2021 19:24:21 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id v200so9194708ybe.11
 for <wireguard@lists.zx2c4.com>; Fri, 22 Oct 2021 12:24:21 -0700 (PDT)
X-Gm-Message-State: AOAM530pi6sT6Ip9zchSzVLh8qL0EjPXs4Xw5gaJkaL2otleVU+59tqv
 mYj3012TRVY/QnGF6bXRMJTpNCpRDeHZIv2sMc8=
X-Google-Smtp-Source: ABdhPJwjgw8DynXfHGcEvYkYFltYY4ouvLNN3G5zZDi7WOfm3Y/HLjdio2Iz9lTWfLvzZf+pAgyPtdiOz7wMrhb2ePI=
X-Received: by 2002:a25:81c6:: with SMTP id n6mr1759100ybm.412.1634930660763; 
 Fri, 22 Oct 2021 12:24:20 -0700 (PDT)
MIME-Version: 1.0
References: <20211021220420.168820-1-mikma.wg@lists.m7n.se>
In-Reply-To: <20211021220420.168820-1-mikma.wg@lists.m7n.se>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 22 Oct 2021 13:24:09 -0600
X-Gmail-Original-Message-ID: <CAHmME9rFG2_xRxrqpeMJScFrLKvnCRCw_LtAUwRsuZm4WhHLfA@mail.gmail.com>
Message-ID: <CAHmME9rFG2_xRxrqpeMJScFrLKvnCRCw_LtAUwRsuZm4WhHLfA@mail.gmail.com>
Subject: Re: [PATCH wireguard-go] tun/netstack: update gvisor
To: mikma.wg@lists.m7n.se
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

Applied, thanks.
