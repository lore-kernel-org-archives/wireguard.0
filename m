Return-Path: <SRS0=9kqO=ON=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA3BAC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 23 Sep 2021 15:56:09 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B118861050
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 23 Sep 2021 15:56:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B118861050
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7a893989;
	Thu, 23 Sep 2021 15:55:15 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c6c2d345
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 23 Sep 2021 15:55:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D74A06109E
 for <wireguard@lists.zx2c4.com>; Thu, 23 Sep 2021 15:55:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="bz/LlFAZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1632412510;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qWL+chHdHvpo/pOAzQc7dr3yvN38lZreDhR2TNkPiUA=;
 b=bz/LlFAZR2DKKAkeX1U8YviryI6puF3zJhrz/34SGiFnl3MB5HP2G+FdzjEIEEQ5BIGeiQ
 EmqjM3O9o/d2REIRJh/vwjHBW1JIyiPvEpcKWYa5vzpnH1KKXY5UFeJ1b36CthPkVn5An9
 pIpiGffeYfjuX69d1ltZ4yiCidrHSWM=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 2bdd9e07
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 23 Sep 2021 15:55:10 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id b65so23255492qkc.13
 for <wireguard@lists.zx2c4.com>; Thu, 23 Sep 2021 08:55:10 -0700 (PDT)
X-Gm-Message-State: AOAM530e9wk3S4pRZhqA7pzwicBMCUmFc/XSy3xLz/eBDIjzyHTNQLLC
 RS3DFCBAyA7GL1ljV+KftdUPC3WWF6DQXxH444o=
X-Google-Smtp-Source: ABdhPJyenWACW8COgk0Q8YONzxXAQI1q2+uMLbGJQaN+MeWSigppobxRX7e5uFY+OCFof4i3o4WnumQ3Mg5LKPzF3kw=
X-Received: by 2002:a25:ad97:: with SMTP id z23mr6384208ybi.412.1632412510154; 
 Thu, 23 Sep 2021 08:55:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210923100719.2083-1-tklauser@distanz.ch>
In-Reply-To: <20210923100719.2083-1-tklauser@distanz.ch>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 23 Sep 2021 09:54:59 -0600
X-Gmail-Original-Message-ID: <CAHmME9rgdnbs7JWtDkmjRwDQwX33_fF2s8-AqPxx3nwsPOQRUg@mail.gmail.com>
Message-ID: <CAHmME9rgdnbs7JWtDkmjRwDQwX33_fF2s8-AqPxx3nwsPOQRUg@mail.gmail.com>
Subject: Re: [PATCH wireguard-go] tun: make operateonfd.go build tags more
 specific
To: Tobias Klauser <tklauser@distanz.ch>
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

I've applied this. Thanks for the patch. Though I do wonder: it's
functionally the same as before, right? What instances lead to this
being an issue? Or did this way just seem more correct?
