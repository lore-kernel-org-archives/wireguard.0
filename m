Return-Path: <SRS0=a6UP=IR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F5F1C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 19 Mar 2021 17:38:48 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FBDD6192A
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 19 Mar 2021 17:38:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6FBDD6192A
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 778fa517;
	Fri, 19 Mar 2021 17:38:46 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d8f25061
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 19 Mar 2021 17:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1616175517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6vPV1pPvqYyOnKrSV/KAbcGM6t//yxO9TU7z0dVWjKc=;
 b=dalO+Wu5ZcClzFYNtKgaMHagy+PbM00L0Vxo6pka51Zaka+vJd/XwIs7fYNxJFV/139p38
 912Kvh3tI30ZRO6JsJ7/9uNTG0CXVV6lvXRSxEvLIC8YwizlayoGxaWWglsoL40grS3gfK
 uaJsraZB1fWAHJlPML5gpTLUIGHomlA=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 77b37b88
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 19 Mar 2021 17:38:36 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id 133so7080750ybd.5
 for <wireguard@lists.zx2c4.com>; Fri, 19 Mar 2021 10:38:36 -0700 (PDT)
X-Gm-Message-State: AOAM531bX7glRbySps2s8TO3UxSnUxSYxZNO0LR0R3I3H348Y5WsOt8t
 9wnrfCqXSBZLjZNUIsjPLD4HE317crP+NU5NyC0=
X-Google-Smtp-Source: ABdhPJxsNKGcAg8T8GtyrKGxKlv0WajB2e7OMTqKSb8kIDO35uSfPP6s5fC5F8Veiv5L+n003j86ZsniP02L7KYEHdw=
X-Received: by 2002:a25:8712:: with SMTP id a18mr8046750ybl.306.1616175516581; 
 Fri, 19 Mar 2021 10:38:36 -0700 (PDT)
MIME-Version: 1.0
References: <6aa0fd33-4c0d-557f-f7f5-5f5406b3a273@harz.behrens.de>
In-Reply-To: <6aa0fd33-4c0d-557f-f7f5-5f5406b3a273@harz.behrens.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 19 Mar 2021 11:38:25 -0600
X-Gmail-Original-Message-ID: <CAHmME9qB6SSuLagNV3gvVscxLJm=TuFoqk9eb1E0iFhHtohigw@mail.gmail.com>
Message-ID: <CAHmME9qB6SSuLagNV3gvVscxLJm=TuFoqk9eb1E0iFhHtohigw@mail.gmail.com>
Subject: Re: [PATCH] freebsd: Implement selection of FIB (routing table) for
 tunneled packets
To: Frank Behrens <frank@harz.behrens.de>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 19 Mar 2021 17:38:45 +0000
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

Hi again,

As well, you can now do:

git push git@git.zx2c4.com:wireguard-freebsd master:fb/whatever-you-want

In other words, you have push access to all branches beginning with fb/ .

Poke me on IRC (I'm zx2c4) there if you want to chat about dev.

Jason
