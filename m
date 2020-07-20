Return-Path: <SRS0=i2uS=A7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60B08C433F1
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 20 Jul 2020 15:05:20 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18A0620656
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 20 Jul 2020 15:05:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lindenberg.one header.i=@lindenberg.one header.b="ch7UqSFj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18A0620656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=lindenberg.one
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5095068e;
	Mon, 20 Jul 2020 14:42:27 +0000 (UTC)
Received: from mailarchive.lindenberg.one (mailarchive.lindenberg.one
 [62.113.211.160])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 1ae022f7
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Jul 2020 14:42:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9ECE228220F; Mon, 20 Jul 2020 17:04:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lindenberg.one;
 s=dkim180429; t=1595257486;
 h=from:sender:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=m5IHhGtdxZ5kx2iLmhhN0bsNog5Cn6l0bEQF1Auz2NE=;
 b=ch7UqSFjwD6ExB21EyXTXGfee9AA/qlMfZdLHJ8D6s2BL4DK1x1N5kxfRpjCj1kb4nH4di
 MDnYO8QLwfDciUESkGd/Mk/ALAIdK5X858MYtLgfYKI7HlgGn3a49y+b7u0TbDZz4ko0uN
 w+FqH5WVxru0suj5XAgSuUUH8Ak0h4oTVDd0mOZdhSWvdkKBZ+LfIGUzutAl8XqWsqH8cZ
 CVST6bzsUi3NhNFxyRcbJn4+oW+GHJ2b7zvaq75P/jzkVXz/buLDYD5oiubdmGmApzVK05
 fLSudOIVsSbY5jYmHGJqkVYWXv3zRYj34tFqqN3CPBdV6znXAbUvd14Hf0MeHw==
From: <wireguard@lindenberg.one>
To: "'Jason A. Donenfeld'" <Jason@zx2c4.com>
Cc: "'WireGuard mailing list'" <wireguard@lists.zx2c4.com>
References: <065501d65ea2$3e652fe0$bb2f8fa0$@lindenberg.one>
 <CAHmME9qr_ZPyhK1V5ENDdNtfk0cn0pb=Ne2T_FEYwaFHtuwWCw@mail.gmail.com>
In-Reply-To: <CAHmME9qr_ZPyhK1V5ENDdNtfk0cn0pb=Ne2T_FEYwaFHtuwWCw@mail.gmail.com>
Subject: AW: Wireguard on Ubuntu 18.04.4 (LTS)?
Date: Mon, 20 Jul 2020 17:04:46 +0200
Message-ID: <067601d65ea7$1b71a3b0$5254eb10$@lindenberg.one>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Thread-Index: AQKY2nKwJ6yFlKQf3qBRm4OkrK0J7gHAlXLYp32UewA=
Content-Language: en-de
X-Last-TLS-Session-Version: TLSv1.2
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

Yes, it is up to date.
Joachim

-----Urspr=C3=BCngliche Nachricht-----
Von: Jason A. Donenfeld <Jason@zx2c4.com>=20
Gesendet: Monday, 20 July 2020 16:49
An: Joachim Lindenberg <wireguard@lindenberg.one>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Betreff: Re: Wireguard on Ubuntu 18.04.4 (LTS)?

Is your system fully up to date? `apt update && apt upgrade`?

