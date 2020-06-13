Return-Path: <SRS0=qqbH=72=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF2C7C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 13 Jun 2020 05:47:46 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E29820739
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 13 Jun 2020 05:47:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="O0s3NSQU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E29820739
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 49b25df3;
	Sat, 13 Jun 2020 05:29:46 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id fcfd0b98
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 13 Jun 2020 05:29:43 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a5c25f1b
 for <wireguard@lists.zx2c4.com>;
 Sat, 13 Jun 2020 05:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=wHA5AE0TGQQn4YQAAcAwHe+v7aw=; b=O0s3NS
 QUpuZQw0fYVyHRAyKeF3UyGXbDTJTeHmLpOEaDZjVihbnyjUPrqrwVade5O5SJxF
 Eysn6hkfsCBgZw4sMJhGXiDO7mmjPltIlhyngMrYa90yWie7cH8B1YwgAbuEOPAY
 lEdkJysIstdawLOCQtd4GnWiyMvWuG4ZyXK9JUiOb7ek/8TIuvrBTQHBRXkZhXJH
 0gbv/DmiDKwjqyZ/BVOFGM8MJk+RD8Ta1Z1Ulk8OrMrQUvOVatXGO8BLeR5+uOEk
 wvk3fZ7k2OEb9mCEEj2cluE27WPjhW/8q01agI2mGDBxWJ2AxmAWqeuDxnD72oAK
 hiBcbdiCtthFpu5g==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 1da3a1ba
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 13 Jun 2020 05:29:43 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id t9so12487684ioj.13
 for <wireguard@lists.zx2c4.com>; Fri, 12 Jun 2020 22:47:15 -0700 (PDT)
X-Gm-Message-State: AOAM532OUPCAdH37D2cyYEOtCYG4Dix83Ot8SiBygCyRjsX3PvM7zutj
 2i7e9nRlwJ4jn6+KCJqcw4nLpnw299MNs4ysNJU=
X-Google-Smtp-Source: ABdhPJyuyL5K1JO/2Xp5eBONCjUvixaD9xjf3I+aQzg8RcrMfwsaeJw/IupaatAZe9Go0YjQsfnLkTE0NgZeJmP6/O8=
X-Received: by 2002:a6b:5a07:: with SMTP id o7mr17134837iob.67.1592027235115; 
 Fri, 12 Jun 2020 22:47:15 -0700 (PDT)
MIME-Version: 1.0
References: <etPan.5ee21f64.7c09ac86.1105b@gmx.de>
 <trinity-bcc1ea44-937b-4b1f-a979-acf971aac3ac-1591986145982@3c-app-gmx-bs62>
In-Reply-To: <trinity-bcc1ea44-937b-4b1f-a979-acf971aac3ac-1591986145982@3c-app-gmx-bs62>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 12 Jun 2020 23:47:04 -0600
X-Gmail-Original-Message-ID: <CAHmME9rvznrXSDNY5VdTzX5CtcPwUumTAsT4Y+tqMNfOraTo+w@mail.gmail.com>
Message-ID: <CAHmME9rvznrXSDNY5VdTzX5CtcPwUumTAsT4Y+tqMNfOraTo+w@mail.gmail.com>
Subject: Re: Re: Ubuntu 18.04 kernel 4.15.0-106-generic breaks
 wireguard-1.0.20200520
To: Martin Jurasik <martin.jurasik@gmx.de>
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

Remove the 4.15.0-101-generic kernel, and then try again.
