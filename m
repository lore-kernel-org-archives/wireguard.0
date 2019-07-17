Return-Path: <SRS0=Af8f=VO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F17DC7618F
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jul 2019 21:05:05 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3624921743
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jul 2019 21:05:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="z5g40Tqw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3624921743
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1486be61;
	Wed, 17 Jul 2019 21:05:04 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cbeeb6d8
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Jul 2019 21:05:02 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c84ebb9f
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Jul 2019 21:05:01 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6f1248af
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Jul 2019 20:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=2EBfL9xV/S18ka40HtWaQ2tl0tM=; b=z5g40T
 qwtHnbBHdMC1SjMaF3vprU+8HUHDBN0fi5xRaJkVfM2YW+o7nFjUP44nlKcwvdbZ
 RkiHEB0CRPG0NBhbeuITe+eO1/wrcEFt7WoVPhx3bIgQeK0sdZtMkUN94SyTQyXg
 oU4FIqXrMdl5i8fsh+ZdGDiZMM8pZGlOEq6P62kxkQLTuuUBF2pEXbMSAAMwpFD9
 n+oythJl9J4P6rioWgLjC94fB6/otYeJKa82XyaVHhRaDLUkXsQr4lJ16jFcODAu
 iwqjvfCWEd4lk82E0IU9PGsd8IRix4ahio+5raA3FZdZ/pJwud7IBruTAbYkAO7z
 iXV8iSN6JvOq6fdQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a298d934
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Jul 2019 20:28:14 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id z23so26582730ote.13
 for <wireguard@lists.zx2c4.com>; Wed, 17 Jul 2019 14:05:01 -0700 (PDT)
X-Gm-Message-State: APjAAAW4OnEw9vUe+CHGJFr4GXv+XnzsUeqklyz1952pF6ufkrTTecK8
 FY4mlNv6wu3EyZNeL5NU6L0mNLojeF8O+i8dCIA=
X-Google-Smtp-Source: APXvYqyYZjZVlBy/VS9b/tJBYSy+T6mS+tZ+geQvySzlpCh61QtAO01rRzg6lApQtnIs0BZqtRvU7W1oiG5KC9K7FVI=
X-Received: by 2002:a9d:7a82:: with SMTP id l2mr31750704otn.120.1563397501230; 
 Wed, 17 Jul 2019 14:05:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190715234634.13018-1-m@niij.org>
In-Reply-To: <20190715234634.13018-1-m@niij.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 17 Jul 2019 23:04:50 +0200
X-Gmail-Original-Message-ID: <CAHmME9rmtzSQ83eUxHGxjJXU8tWU62PBWZL3-e7eOY6QmAnnSg@mail.gmail.com>
Message-ID: <CAHmME9rmtzSQ83eUxHGxjJXU8tWU62PBWZL3-e7eOY6QmAnnSg@mail.gmail.com>
Subject: Re: [PATCH] tun: openbsd: Don't change MTU when it's already the
 expected size
To: Michael Zeltner <m@niij.org>
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

Thanks! I rewrote and merged a variant of this.

Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
