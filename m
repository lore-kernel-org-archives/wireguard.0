Return-Path: <SRS0=S5mX=JM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2170C433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 15 Apr 2021 17:11:37 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DAF0B6117A
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 15 Apr 2021 17:11:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DAF0B6117A
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ddf856a9;
	Thu, 15 Apr 2021 17:11:34 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2cedd2e3
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 15 Apr 2021 17:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1618506689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1lKblAVQhTveJkIISiDq3hHf/ZU3GH6Gi2QYEc5tH8s=;
 b=EoADaw+h1XPM3s74aQnmtsETS1dQlpLmJ0WwkS6y4Ep2wDMNXbsizxH2k2sd5QSGIRtbZB
 CPKF8bkwFLrkMeVvZwpowd+aov+V/KTyUnWdU8jySjE0CqlFs8JLVCdtk4ARg2Jf2ys38c
 nn4GdMBvIHjVFQRVlOMpnUSPC8jOjQ4=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id df717d7a
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 15 Apr 2021 17:11:29 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id k73so20668717ybf.3
 for <wireguard@lists.zx2c4.com>; Thu, 15 Apr 2021 10:11:29 -0700 (PDT)
X-Gm-Message-State: AOAM530BK5VixSSrvZlbItY1jMMh3KobicB1117xZInjj4/2ZNpCW0kq
 JEBK3BDcf7EzPv2xUVZnbrbS1uxXHNJFctWTvmg=
X-Google-Smtp-Source: ABdhPJwXk2SsGKv1YuyovO627vTLnh4/gYTg0WNULf6JCUmSZKRoo2tqOyYY01+V75TLHJLAYgryBHaV/jfthaiP/40=
X-Received: by 2002:a25:c985:: with SMTP id z127mr6265025ybf.20.1618506688680; 
 Thu, 15 Apr 2021 10:11:28 -0700 (PDT)
MIME-Version: 1.0
References: <7a8e0f8f25c43effb17b01e6344678ba9c6462a6.camel@ewol.com>
In-Reply-To: <7a8e0f8f25c43effb17b01e6344678ba9c6462a6.camel@ewol.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 15 Apr 2021 11:11:17 -0600
X-Gmail-Original-Message-ID: <CAHmME9p0j36JgbDA3yo3e9qW+rLgneCzqST2uqQx7ZJaycxsqg@mail.gmail.com>
Message-ID: <CAHmME9p0j36JgbDA3yo3e9qW+rLgneCzqST2uqQx7ZJaycxsqg@mail.gmail.com>
Subject: Re: Keep alive being sent when PersistentKeepalive = 0
To: sbrown@ewol.com
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

Keepalives are sent sometimes in response to protocol events. The
difference is that these types aren't "persistent". So likely there's
nothing to worry about here.

Jason
