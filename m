Return-Path: <SRS0=93XJ=IF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 201C8C433E6
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Mar 2021 15:53:35 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45D13650CC
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Mar 2021 15:53:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45D13650CC
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ae490887;
	Sun, 7 Mar 2021 15:52:34 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 07560571
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 7 Mar 2021 15:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1615132349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KyqQfrqII1e78aS2/m+b58mylQnUmca+a9tu2qZj2z8=;
 b=DHhGx6Cz5eaR8IeVCPTmTGso7Ovd+pUav3JJsAJtcXpKzLq6bzvt9EP7KTaNRDXQIso20r
 Wn9KHtpPHpdImVlSO2fJth5cbRDnJHOZaypjwlIba+LjKRiXWAdctBHqUeNLSNbOnj0ARx
 C/Ay/Y4XWD8q7Jtw0xGkTJzGVDGK99M=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 0d566453
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 7 Mar 2021 15:52:28 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id u3so7544312ybk.6
 for <wireguard@lists.zx2c4.com>; Sun, 07 Mar 2021 07:52:28 -0800 (PST)
X-Gm-Message-State: AOAM530wKHiFNfYfxdOb2kWuPeToY0m3Lpb4dwbeqSy/m40Mvn50GrXo
 EX25qNOWV8yl5erlUcPXkqn2ZtT+zcBRqNs/iHg=
X-Google-Smtp-Source: ABdhPJxrgQF3oC2khY8+Rh1xNOg/q1jms1BnOxsIDr/cmeUcaSMsHhVYaZk9KIepUCP7sWEjNuowoBU/nFyzeDuD138=
X-Received: by 2002:a25:2d1f:: with SMTP id t31mr28470391ybt.239.1615132348399; 
 Sun, 07 Mar 2021 07:52:28 -0800 (PST)
MIME-Version: 1.0
References: <20210306100053.1039719-1-kay.diam@gmail.com>
In-Reply-To: <20210306100053.1039719-1-kay.diam@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 7 Mar 2021 08:52:17 -0700
X-Gmail-Original-Message-ID: <CAHmME9rkaUbNUmQpOevRSCNbY4tfWWNVAMk9PSMGEi7-D_L0uA@mail.gmail.com>
Message-ID: <CAHmME9rkaUbNUmQpOevRSCNbY4tfWWNVAMk9PSMGEi7-D_L0uA@mail.gmail.com>
Subject: Re: [PATCH] Windows: add convertInterfaceIndexToLUID syscall
To: kayrus <kay.diam@gmail.com>
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

Can you resubmit your patches with a proper `Signed-off-by:` line,
using `git commit -s --amend`?
