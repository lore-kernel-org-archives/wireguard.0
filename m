Return-Path: <SRS0=a6UP=IR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A8E7C433C1
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 19 Mar 2021 17:24:43 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61A0D61974
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 19 Mar 2021 17:24:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61A0D61974
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6cb70271;
	Fri, 19 Mar 2021 17:22:50 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b3439385
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 19 Mar 2021 17:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1616173592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5/tCUHJbnVVsmloAGRKIbWbbBqwq11lYRY1IgBo1ur0=;
 b=if9t8FEsm+DThQJSk60hw9WvZE7hGgXbYIoZd2IdLlFDG8STTNMuCwTXdrpdjSbis2XF9A
 7R4xW/dXiEwYQLmHWjHU/iBlKAU4PIQHsi3zH3eV5v6BKaOpDm9k90ujQtbFbzTFLe+ppW
 bXjnu1hYESPxDnuGVv6namqYMNTAfCg=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id cf2f9686
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 19 Mar 2021 17:06:32 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id y133so6950974ybe.12
 for <wireguard@lists.zx2c4.com>; Fri, 19 Mar 2021 10:06:32 -0700 (PDT)
X-Gm-Message-State: AOAM533oofOZCRhfPhgvtcXS8JZlIpvpwvUrjUh03hdWCabD9/iGSOkP
 4zPc0uFzWEgwN3L359tBIvPCsXFQDzPQWTnKux0=
X-Google-Smtp-Source: ABdhPJwP4b8CgGhbu16xC39KFIkJCEWPUX43HvUChqOBZejrXZPvlG52tV+Fir8rR+ro46Swc4EJB1LeuuUBs+VFdEo=
X-Received: by 2002:a25:8712:: with SMTP id a18mr7848093ybl.306.1616173591823; 
 Fri, 19 Mar 2021 10:06:31 -0700 (PDT)
MIME-Version: 1.0
References: <75ddd07a-8d31-4938-8480-540f1996c9ad@yggdrasil.evilham.com>
In-Reply-To: <75ddd07a-8d31-4938-8480-540f1996c9ad@yggdrasil.evilham.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 19 Mar 2021 11:06:21 -0600
X-Gmail-Original-Message-ID: <CAHmME9rrBuK1oFwmrFtfhwsM95-MRKzW8L3DysCGS3xCnOFb1w@mail.gmail.com>
Message-ID: <CAHmME9rrBuK1oFwmrFtfhwsM95-MRKzW8L3DysCGS3xCnOFb1w@mail.gmail.com>
Subject: Re: [PATCH] Fix build on FreeBSD 13 after removal from base
To: Evilham <contact@evilham.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 19 Mar 2021 17:22:46 +0000
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

Thanks for the patch. I addressed this slightly differently here:

https://git.zx2c4.com/wireguard-freebsd/commit/?id=519e70d5fe88f1ae3c6d2318b22ecf927953fd02

I also trimmed those structs down a bit, as the latter members differ
between 13 and 14.
