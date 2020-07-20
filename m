Return-Path: <SRS0=i2uS=A7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85170C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 20 Jul 2020 14:30:02 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 299962065E
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 20 Jul 2020 14:30:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lindenberg.one header.i=@lindenberg.one header.b="fcVIUOrn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 299962065E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=lindenberg.one
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9166e5d1;
	Mon, 20 Jul 2020 14:07:36 +0000 (UTC)
Received: from mailarchive.lindenberg.one (mailarchive.lindenberg.one
 [62.113.211.160])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f8de6fb9
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Jul 2020 14:07:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D332828F0CA
 for <wireguard@lists.zx2c4.com>; Mon, 20 Jul 2020 16:29:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lindenberg.one;
 s=dkim180429; t=1595255397;
 h=from:sender:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding; bh=RWPEa1sJlR3FWctEYcTs1BzMwpH79bK3GDq+ps/J5nk=;
 b=fcVIUOrnCLCgSNc2nAPpuEfkN102x59lwlifGzn4+ZyzvKJsXcEo8P954yhMcOjQ8nzL1R
 WUH72e9kj+vsd/YH1uzddRAO7Dx2D2t3f0rkHfg/CITD6wMQ8WJIivupa1uf3goORu0Xcr
 UV1jg61BEjgdYGagDn60TxExiBrOMznW2wV6+UMBNgHQGNpd5Y25pPZ4Lu4vyg+PXcJ8e3
 P8YcMeo9u5oDnBquvtONpM1I28JJdJixqzkLd0DX8evkVuwD97niLbRUWCRHlCi8aYRoTI
 +CdGH4/pTP/qIOCFv3u/ZM0Gu/4IvZApeePDieDUpr8a/+HegiknjpI6BPdItg==
From: <wireguard@lindenberg.one>
To: <wireguard@lists.zx2c4.com>
Subject: Wireguard on Ubuntu 18.04.4 (LTS)?
Date: Mon, 20 Jul 2020 16:29:57 +0200
Message-ID: <065501d65ea2$3e652fe0$bb2f8fa0$@lindenberg.one>
MIME-Version: 1.0
Content-Type: text/plain; boundary="----=_NextPart_000_064F_01D65EB2.E43868A0";
 charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Thread-Index: AQGwsPhqBx3/QHTCxnGQdkwT2A3Vzw==
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

Hello all,
I just tried to set up a new (virtual) machine with Ubuntu 18.04.4 (LTS) =
and wireguard, but apt install wireguard reports =E2=80=9CE: Unable to =
locate package wireguard=E2=80=9D. This is not really what I expect =
after looking at https://www.wireguard.com/install/.=20
Any idea?
Thanks, Joachim

