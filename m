Return-Path: <SRS0=F0uL=3T=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A201C2D0DB
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Jan 2020 13:54:41 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD941206F0
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Jan 2020 13:54:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="H/zh96A5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD941206F0
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4202806d;
	Thu, 30 Jan 2020 13:54:29 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9ccd3d91
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Jan 2020 13:54:27 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 762d3ab2
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Jan 2020 13:54:27 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0287ddbc
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Jan 2020 13:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=EgF3jQZAA0Odj5CieOGpy5s8ZQs=; b=H/zh96
 A5+DwQmdrQmOyyFpUM870UoVrx+mgHGh2ShpCDWqIHu4KUqM8UzVQ+YUALV8ApY9
 13ib4N8Ca/x/Vplwk/+bx3jic1FbZXt0zJPjT9vsGsDmXp+HUF+x6HKkV6hwslwm
 0UVGwkFrXnW+UF2zLAygH0s7ZcXLelVIGIl1c9uEg6BZfceitcTfwzfy8PIhrkDE
 9f2S3j7Axa25bEA3lJzAhPRGba6D1o8Bi2uvUDWS2QUUwPEO9fKLX59+3UFJ+Lpb
 qR8jxAAcxUZeEoRIAE/Buk7XzNpSirfSBRVk3ZdmvmR/XmVsvAQhs/YEqxxcWcsy
 mfdSVJCMwDHl3gtw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e0252945
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Jan 2020 13:54:27 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id a15so3202766otf.1
 for <wireguard@lists.zx2c4.com>; Thu, 30 Jan 2020 05:54:37 -0800 (PST)
X-Gm-Message-State: APjAAAXbgKeJPeMqkVIZ+R8UkdePbarD7enn29RVnjRlPBbyEJXyLefa
 4wSHl4lNrAY6Razz0BGSmzsT/v46T5IRZq7eQ/U=
X-Google-Smtp-Source: APXvYqw5OlfBy7dWERdnlrn4gU8DyTHOhSCyyXHacWR69iy7nIL8pCfUzlaCClsb05R4CyjYqgI3o/+emv4hNadm9mU=
X-Received: by 2002:a9d:7a47:: with SMTP id z7mr3660900otm.179.1580392476657; 
 Thu, 30 Jan 2020 05:54:36 -0800 (PST)
MIME-Version: 1.0
References: <20200123111825.17435-1-ilie.halip@gmail.com>
 <CAHmME9rTD=zCpw5fkw-baUHBuutWzg18aJ-8KvnPHzNpJDTNHw@mail.gmail.com>
In-Reply-To: <CAHmME9rTD=zCpw5fkw-baUHBuutWzg18aJ-8KvnPHzNpJDTNHw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 30 Jan 2020 14:54:23 +0100
X-Gmail-Original-Message-ID: <CAHmME9pcSBi6XJn0AUHg6YPD+nBCm8pnhS6QC-Dz4Md5YX_dxQ@mail.gmail.com>
Message-ID: <CAHmME9pcSBi6XJn0AUHg6YPD+nBCm8pnhS6QC-Dz4Md5YX_dxQ@mail.gmail.com>
Subject: Re: [PATCH] compat: support building for RHEL-8.2
To: Ilie Halip <ilie.halip@gmail.com>
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

I would up merging this anyway with a justification in the git commit for it:

https://git.zx2c4.com/wireguard-linux-compat/commit/?id=003fb6ee9502741f41cb2563d2916172d98f5fd1

Thanks for the patch.

Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
