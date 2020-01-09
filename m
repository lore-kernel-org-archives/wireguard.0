Return-Path: <SRS0=e2pA=3E=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC74BC32771
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 15 Jan 2020 18:17:48 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C3F124656
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 15 Jan 2020 18:17:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TnpMLkVg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C3F124656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d2e0c38f;
	Wed, 15 Jan 2020 18:17:04 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 326f9179
 for <wireguard@lists.zx2c4.com>; Thu, 9 Jan 2020 08:18:11 +0000 (UTC)
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 87c46b64
 for <wireguard@lists.zx2c4.com>; Thu, 9 Jan 2020 08:18:11 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id a13so6187785ljm.10
 for <wireguard@lists.zx2c4.com>; Thu, 09 Jan 2020 00:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WGqdyhCehtkwDkgkvEoJXQz1hlQaRwFtn0jd9ID6jy4=;
 b=TnpMLkVg0DBu3pMclkMPUayK3GpgJ69DAKZrJrPncVa/GDVq05QXAARUIacbPycxFG
 dRBZGi/m8iu9rRgKFgpuoaONEDdmPE2FaBQChX1pOirScd+J/BKuaASoqoQhLVooE1m/
 onA+2PtcC4VxX3TlJb13sf///ogfi1RgwzZqArfKsXCmWG382OGAjf4uOoD6GKf4A5Lx
 NHhE9Qry65pwZEg1IVDDzrtnld2RGWX4hH3a+VHDLQjYRjmcXXsGpkkLBHy+yLe+LBwj
 avcL2tKDbRljcYJm7+IvX8Re9Gok520XI5A0IeXgKxbI55MCz+48Rp2nR/P3oGsQbXhu
 Z4VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WGqdyhCehtkwDkgkvEoJXQz1hlQaRwFtn0jd9ID6jy4=;
 b=I/W3JQCp2ms9ZifgVkz7K114Y8MqvvHsuZ6XXUfjhQ0n0quzGNYGiFTiB8RqV7ksVu
 Iz8drcQKwd0b6azRkh7bHmY5rgLZVewdCOMDSfBjCFCKUaaEeEAX8qwVw+X4Xqr6r/jZ
 SpYkI7/myo45chRMQsqE451J1g2PWz8ZS7OVT0L8gZroKdIU5NSfuTL8J5qo0LkX0wR2
 TOWdRILdvPTP8OuzaOQSpQqXGkV9Mdlfes2sOAY1CLtI26wJ2jZFBc7MVFEiTFecJtrx
 Vwkk0BdTUbVsLb+PQm74bqUBoE39/3MEMn93C4Z6O3Heenp3vR93aysfIE1JeEb5eKhw
 YgFQ==
X-Gm-Message-State: APjAAAXV+oaKGxQMF3gPnZY5AhUuVeF8Yj4aXSXstlOnSfTGUdzJnKdN
 J7tZMZG0QKtv1E4FooZC8b+mAweBDAdovZ7g2Zg=
X-Google-Smtp-Source: APXvYqx9cPQ1+ajddHsSMzIls5fm/lA9IcfbHuAmx01lLpyI+Z/xD11wCGecU7Vrgvfxn4Qb0OUwYFqNlc6hU6uhyTc=
X-Received: by 2002:a2e:8544:: with SMTP id u4mr5594037ljj.70.1578557890114;
 Thu, 09 Jan 2020 00:18:10 -0800 (PST)
MIME-Version: 1.0
References: <94a4b886-b7f1-ec54-c5ff-d2447ca08d3a@usask.ca>
In-Reply-To: <94a4b886-b7f1-ec54-c5ff-d2447ca08d3a@usask.ca>
From: Ilie Halip <ilie.halip@gmail.com>
Date: Thu, 9 Jan 2020 10:17:58 +0200
Message-ID: <CAHFW8PQ2oOSXVx87_1yoax5z+-=uEzYD-kNYn2Dp5knWPTnejg@mail.gmail.com>
Subject: Re: Cannot build Wireguard for ARM embedded Linux 32-bit Tinkerboard
To: Nicholas Kinar <n.kinar@usask.ca>
X-Mailman-Approved-At: Wed, 15 Jan 2020 19:17:04 +0100
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
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

You could just cd into /var/lib/dkms/wireguard/0.0.20191219 and run
"make V=1" manually in there as root. That should give more information.

I.H.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
