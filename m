Return-Path: <SRS0=bXv+=VQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A179C7618F
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 19 Jul 2019 15:26:03 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45A392184E
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 19 Jul 2019 15:26:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="dtXAIJjd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45A392184E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 04096f86;
	Fri, 19 Jul 2019 15:26:00 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7da8a427
 for <wireguard@lists.zx2c4.com>;
 Fri, 19 Jul 2019 15:25:59 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 11885e23
 for <wireguard@lists.zx2c4.com>;
 Fri, 19 Jul 2019 15:25:59 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e8f2f7ca
 for <wireguard@lists.zx2c4.com>;
 Fri, 19 Jul 2019 14:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=LqXw0myVLX16f0p9OTnw3zPtKRQ=; b=dtXAIJ
 jdqw5q23Jlf6OSZkbKcQR6bvkSiZbLEWzvLdIxXhglt5VkO82b9HF8u3DaKzO6AQ
 OmEU3ghRq7Lmu7LPWVQWQ74kxnyZs8wMlrj/w4kTQUo6+G+Gv3wr9UTVJs4Vi/pW
 WbV5gvIon8nYu+5pnPYfQlTK1vPR+TYjrZbQJ2YT/I8Iv28Pacg9skEWh9/+5Pir
 Om7mJfxDbfc2LqXOA41bDCo7IgKsgpcmKPXOUTFuwyoQB4AIEtvDC9zWx9loUr3H
 vSa0ay4cdNrqfR2yw0Bqxm3b1jpY7rG5HqPlEHF0/GpZzZSuo6scJZjA7SEy8Nh9
 w7T+OkjLBpMuLXyQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 370b88e1
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 19 Jul 2019 14:48:57 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id w7so24512151oic.3
 for <wireguard@lists.zx2c4.com>; Fri, 19 Jul 2019 08:25:58 -0700 (PDT)
X-Gm-Message-State: APjAAAUAj9FFjn5tXAJfr2QkJNYnl2L9Kwhgw979+/hmZCB9RmXOV3Lg
 rRWzvYdwD0lWyfi0wnC+5Q2rzSgrPaAqc9J+pfQ=
X-Google-Smtp-Source: APXvYqyj9SjvKoGSUw5tPTY1Z5QKCrwiLyEpPV+WELp0MKcqfJrOjIvvqGt+YcHHYRVFEDmQX40oOodHwGdh6+v/LUk=
X-Received: by 2002:aca:4711:: with SMTP id u17mr28011955oia.115.1563549957960; 
 Fri, 19 Jul 2019 08:25:57 -0700 (PDT)
MIME-Version: 1.0
References: <e332179c-68e7-46f4-1f4c-7c6b899b0864@syseleven.de>
 <CAHmME9pYWcA_AJ6-UFqq-hUVdXfSadkBWQpg68ee=_R-ttgthA@mail.gmail.com>
 <CAHmME9qATuY5us=Tb9rDXpDqM2yC-14os1=_26q3zfXv0RvJ2g@mail.gmail.com>
 <fc83f1a4-2523-5e6a-1647-d5e5535074ae@syseleven.de>
In-Reply-To: <fc83f1a4-2523-5e6a-1647-d5e5535074ae@syseleven.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 19 Jul 2019 17:25:47 +0200
X-Gmail-Original-Message-ID: <CAHmME9q4kfAkrt=t65Y2cpUTmabFVmUPh2ughjy=+zb4WnAoqA@mail.gmail.com>
Message-ID: <CAHmME9q4kfAkrt=t65Y2cpUTmabFVmUPh2ughjy=+zb4WnAoqA@mail.gmail.com>
Subject: Re: Wireguard in OpenVZ with NETIF_F_VIRTUAL feature
To: Benedikt Braunger <b.braunger@syseleven.de>
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

How's this look?
https://git.zx2c4.com/WireGuard/commit/?id=08f1bfe29a08d9f10f9fa4c47e07a3501a4a8c8a
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
