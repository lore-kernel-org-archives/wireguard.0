Return-Path: <SRS0=iDgY=II=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AD1CC433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 10 Mar 2021 14:03:08 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F29464FE2
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 10 Mar 2021 14:03:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F29464FE2
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 748d772a;
	Wed, 10 Mar 2021 14:03:05 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 77cf90d6
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 10 Mar 2021 14:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1615384980;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=h5PcymUGBEWfT9TOc2MdNQ5d3XrWMwcnCmLtVFrfTsI=;
 b=Y6HMO1nrivj4QD3QS3QdvjL20sUYpmJrEM9aJgInltl4tEZTLdClvUEeW6uJks4L5tw+Qw
 7DCMqjKyF1OjFUDOe5GNimC3NEWpxYppo3CpNfgM1BIFm8UngcDlSqs7rn6cvf9xEclWKO
 2SmqnmK3ltSPgEzgbG+WppKmbN3/fQ4=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 89b74d96
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 10 Mar 2021 14:03:00 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id x19so17981413ybe.0
 for <wireguard@lists.zx2c4.com>; Wed, 10 Mar 2021 06:02:59 -0800 (PST)
X-Gm-Message-State: AOAM530frLAckhbfIJkI2LtEGCLrZC/lgIRbclOKsrGFB0j9iFKbTWWG
 mr62OtKdavUMOWC9wEJ6OMIDkqMPka85KQx5wzw=
X-Google-Smtp-Source: ABdhPJyLnKUC5fImd/p1tcnF1BiP1wudGJ/+aOSSl5uHqHXSLS4ojBgKawSwl9wsg8wZFOnVLedpjunQJbDa5JGbn7g=
X-Received: by 2002:a25:2d1f:: with SMTP id t31mr4549360ybt.239.1615384979263; 
 Wed, 10 Mar 2021 06:02:59 -0800 (PST)
MIME-Version: 1.0
References: <CANaOhea6dQ6Y5A22B4dO2VEYbk4754rGEi=hw4vfMgvaBo1CAA@mail.gmail.com>
In-Reply-To: <CANaOhea6dQ6Y5A22B4dO2VEYbk4754rGEi=hw4vfMgvaBo1CAA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 10 Mar 2021 07:02:48 -0700
X-Gmail-Original-Message-ID: <CAHmME9o96vy1bo=V+p0C0a5LXuG_6Cw2onoJfTL=5MDg6g=h3A@mail.gmail.com>
Message-ID: <CAHmME9o96vy1bo=V+p0C0a5LXuG_6Cw2onoJfTL=5MDg6g=h3A@mail.gmail.com>
Subject: Re: Windows: wintun MTU is not set
To: kay <kay.diam@gmail.com>
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

Try using the object returned by luid.IPInterface(windows.AF_INET). Or
in your example, use AF_INET instead of AF_UNSPEC.
