Return-Path: <SRS0=i3vs=XD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6953C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Sep 2019 21:25:19 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0151216C8
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Sep 2019 21:25:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="GcBrMEio"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0151216C8
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d3853b18;
	Sun, 8 Sep 2019 21:25:06 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 037ac215
 for <wireguard@lists.zx2c4.com>; Sun, 8 Sep 2019 21:25:05 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4b581472
 for <wireguard@lists.zx2c4.com>; Sun, 8 Sep 2019 21:25:05 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 08ad56bf
 for <wireguard@lists.zx2c4.com>; Sun, 8 Sep 2019 20:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=ej4aEyICIJtbVjz0lqUWdvmzT+M=; b=GcBrME
 ioJPLsVBAGhR8r0ZnD8oKyjMyFfKhNKjpzWIR3yOjaayj5CYvXrkZtkWDPy7Gshk
 //31nULoLBssDCOH6UOlQ+tVSBP8MU2UCVE7wPKD15wyUwoAoBYYxykuYwJuRkAN
 60PwZpJ3op5FPXztHIU23fmkMK0Rp5S78kCSzrlXIVneMGkM3r/Z5G4zv2lfreQn
 VMWrAigAmpKIxFgB3xxYYUzsUQO5+Lbo/+gOlhK+h6xkY9nF+mm59l9kl4fEJu8b
 905m46UYEj9uPJxxprpwxpFYp5ckeAQRbfRtrkoo1WNy7jR0cfOdNr2c24VANQ3H
 NybgObM5S/7jiKdQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id eba94683
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 8 Sep 2019 20:41:27 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id c10so10580465otd.9
 for <wireguard@lists.zx2c4.com>; Sun, 08 Sep 2019 14:25:04 -0700 (PDT)
X-Gm-Message-State: APjAAAUqT8xMBDD37ZbaprHB09sJGfGHnR0ZhBkdRXHyw3S4LuyE/CnB
 /fbmPCsIk1nm5ywdZQ/DNIC6MQeoTlrwmB3H+k0=
X-Google-Smtp-Source: APXvYqwK4LxnoZ/NC21PAS2NPOAISaXr2mGQjdhtQnOu3gTi1BgoDQzHIC8a1Nf2p1lWS7h/fOmQcnBK/Kfut9Y/O0k=
X-Received: by 2002:a9d:73c4:: with SMTP id m4mr8003272otk.369.1567977903192; 
 Sun, 08 Sep 2019 14:25:03 -0700 (PDT)
MIME-Version: 1.0
References: <CADdae-jaGWC=HxVpU7Gc6QD=mCgq6O2jTXdmzeKXyKvLq6QVmw@mail.gmail.com>
In-Reply-To: <CADdae-jaGWC=HxVpU7Gc6QD=mCgq6O2jTXdmzeKXyKvLq6QVmw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 8 Sep 2019 16:24:51 -0500
X-Gmail-Original-Message-ID: <CAHmME9qbO37Cs9gMOLxaTqdu2KLTeOm6vtpvWKPe4tJZ6mFB+g@mail.gmail.com>
Message-ID: <CAHmME9qbO37Cs9gMOLxaTqdu2KLTeOm6vtpvWKPe4tJZ6mFB+g@mail.gmail.com>
Subject: Re: Using openssl to generate private Key
To: nicolas prochazka <prochazka.nicolas@gmail.com>
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

This seems to work, maybe:

openssl genpkey -algorithm X25519 -outform der | tail -c 32 | base64

openssl genpkey -algorithm X25519 -outform der | tail -c 32 | base64 | wg pubkey

I haven't verified what's happening in the code though, so use at your
own risk. wg(8) is the best way to generate wireguard private keys for
use with wireguard.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
