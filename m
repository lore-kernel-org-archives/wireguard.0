Return-Path: <SRS0=ZLx+=WB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8857AC433FF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Aug 2019 18:47:23 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02111214C6
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Aug 2019 18:47:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="Go3Orhf9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02111214C6
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 35226565;
	Mon, 5 Aug 2019 18:47:10 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f72b89cb
 for <wireguard@lists.zx2c4.com>; Mon, 5 Aug 2019 18:47:09 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 990dd83d
 for <wireguard@lists.zx2c4.com>; Mon, 5 Aug 2019 18:47:08 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8ea96706
 for <wireguard@lists.zx2c4.com>; Mon, 5 Aug 2019 18:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=9wZ2syohha715FO9FACcSDIP2YI=; b=Go3Orh
 f9DslVzw/WEHPSfz+NzkkFnNpWpX9R71MuWwCP3qG8lQBkccR7uMy92X6ciddVsk
 FXNsWatpUSkEjGIaRWIHdSMUJUCOzrQdSp321jdXJxyRRt06Z91giJ5Ur+hCklzU
 nWULazMYBJj47xd+b+kXX2gOGbtPvoAgPrVwIoV57h+KoCghQBiZwFNe8LkbWi4E
 Uf6rZKyGdnPzZMIsPRFWNrVKnabT9LyW7i8K4avJVk1c1meQ2jSoIK9bydClBu0s
 xUwRyoQ8XvPTKk0QMMZwntNpH0SVB0zxsSA/DSdPIWogXyjOQ9R5N1uo/q69o1kv
 5Gf7dGQvCyj0Cqgg==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d1f16be0
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 5 Aug 2019 18:07:54 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id q20so86190572otl.0
 for <wireguard@lists.zx2c4.com>; Mon, 05 Aug 2019 11:47:08 -0700 (PDT)
X-Gm-Message-State: APjAAAXzBnIbqTAPGB8zY6MvDrOdsxMQHebFkfCMa+UQU2byps8UW8lO
 hIhlHh3qDxLkYX4f4kaMBRPMSBIR/UMTm6Vaev4=
X-Google-Smtp-Source: APXvYqzVr2Ceq/mp0b36BIJgYahb0MhbLlxjQ46NxfsXee8lEZbPK53Kk1bKM7Go4OCOb4cnkJO2FlBeJPe56cXc/uM=
X-Received: by 2002:a9d:4f0f:: with SMTP id d15mr116772057otl.52.1565030828116; 
 Mon, 05 Aug 2019 11:47:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190720122016.57765-1-ankur@lipidity.com>
In-Reply-To: <20190720122016.57765-1-ankur@lipidity.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 5 Aug 2019 20:46:57 +0200
X-Gmail-Original-Message-ID: <CAHmME9pGLM9a3Ww-MNy7mNT6JEQQXv4qLF0LDrAqVFUbDDPrsg@mail.gmail.com>
Message-ID: <CAHmME9pGLM9a3Ww-MNy7mNT6JEQQXv4qLF0LDrAqVFUbDDPrsg@mail.gmail.com>
Subject: Re: [PATCH] wg-quick: Fix alternate routing table syntax on OpenBSD
To: Ankur Kothari <ankur@lipidity.com>
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

Hi Ankur,

Thanks for this. Could you provide your Signed-off-by line? Also, why
is this required? Is this a recent change in syntax? A new syntax? Was
the syntax always wrong? What's the deal?

Thanks,
Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
