Return-Path: <SRS0=i2uS=A7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A92A5C433F1
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 20 Jul 2020 15:52:29 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20D032064B
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 20 Jul 2020 15:52:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lindenberg.one header.i=@lindenberg.one header.b="GNorQGeR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20D032064B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=lindenberg.one
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3e747ca7;
	Mon, 20 Jul 2020 15:29:45 +0000 (UTC)
Received: from mailarchive.lindenberg.one (mailarchive.lindenberg.one
 [62.113.211.160])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0bfeab68
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Jul 2020 15:29:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A2DEC28F0CA; Mon, 20 Jul 2020 17:51:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lindenberg.one;
 s=dkim180429; t=1595260319;
 h=from:sender:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=sSrwKtF6jcVvcUQVJpJD3LEKggPIzzYGtj9o5Gdhv1Y=;
 b=GNorQGeRYYVELTlG32C9Xw6CWPOUnroBmbTRJVyYYXG9duL/l8/Pie7sto0/lVvCkqqcsm
 sdCA9eWQbFuhEITBgX9SgeZ0WUdiFt8rHL6Jr+1q3iGqJ5vA63AIFzOBZGnSRSSJnpDtvP
 VxYHY3nWvCmyBtst5+Ui77fUK9DZbUV2bQT9v3hEmagNnRJD4cGFLXnELCEM/xwlMXTtro
 ESbIKeYeUFiOo/KZSVqLDtTvG+xdOqRlUQDVZtC2d5ekUFjCob+qngyzaq7B2pk0HXcTBO
 15HcvoNz0ap2ZanurJ6VIlH77Wpksf4zer9V61XN7csspONIKABFCUc3EskeRg==
From: "Joachim Lindenberg" <wireguard@lindenberg.one>
To: "'Jason A. Donenfeld'" <Jason@zx2c4.com>,
 "'Joachim Lindenberg'" <wireguard@lindenberg.one>
Cc: "'WireGuard mailing list'" <wireguard@lists.zx2c4.com>,
 "'Andy Whitcroft'" <apw@canonical.com>
References: <065501d65ea2$3e652fe0$bb2f8fa0$@lindenberg.one>
 <CAHmME9qr_ZPyhK1V5ENDdNtfk0cn0pb=Ne2T_FEYwaFHtuwWCw@mail.gmail.com>
 <067601d65ea7$1b71a3b0$5254eb10$@lindenberg.one>
 <CAHmME9pyp7z7043ZwvRv0huy9n1zL3x6O7o4w5EsQdg5WsOsdQ@mail.gmail.com>
In-Reply-To: <CAHmME9pyp7z7043ZwvRv0huy9n1zL3x6O7o4w5EsQdg5WsOsdQ@mail.gmail.com>
Subject: AW: Wireguard on Ubuntu 18.04.4 (LTS)?
Date: Mon, 20 Jul 2020 17:51:59 +0200
Message-ID: <076601d65ead$b4094d70$1c1be850$@lindenberg.one>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Thread-Index: AQKY2nKwJ6yFlKQf3qBRm4OkrK0J7gHAlXLYAhHPtncDFEyNa6dUcBpg
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

Would be great to have the truth at https://www.wireguard.com/install/.=20
With the addition of bionic-proposed wireguard installs, but wg-quick =
fails because of "/usr/bin/wg-quick: line 32: resolvconf: command not =
found". Looks like a dependency is not set.
Which of  openresolv or resolvconf is the recommended path?
Thanks, Joachim

-----Urspr=C3=BCngliche Nachricht-----
Von: Jason A. Donenfeld <Jason@zx2c4.com>=20
Gesendet: Monday, 20 July 2020 17:22
An: Joachim Lindenberg <wireguard@lindenberg.one>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>; Andy Whitcroft =
<apw@canonical.com>
Betreff: Re: Wireguard on Ubuntu 18.04.4 (LTS)?

Looks like at the moment (July 20, 2020; ignore this email if you're =
reading this >1 month from now) wireguard is still stuck in -proposed on =
Bionic.

echo 'deb http://us.archive.ubuntu.com/ubuntu bionic-proposed main =
restricted universe multiverse' >> /etc/apt/sources.list apt update apt =
install wireguard

That's annoying and odd. I'm CCing Canonical's Andy Whitcroft who can =
fix this inside of Ubuntu.

