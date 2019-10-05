Return-Path: <SRS0=SFG/=X6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7696EC4740A
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  5 Oct 2019 20:46:14 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7820520867
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  5 Oct 2019 20:46:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ungleich.ch header.i=@ungleich.ch header.b="LHvuMa+i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7820520867
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ungleich.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 911e5e4e;
	Sat, 5 Oct 2019 20:45:56 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f191bbe0
 for <wireguard@lists.zx2c4.com>; Sat, 5 Oct 2019 20:45:54 +0000 (UTC)
Received: from smtp.ungleich.ch (mx.ungleich.ch [185.203.112.16])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id af4c8373
 for <wireguard@lists.zx2c4.com>; Sat, 5 Oct 2019 20:45:53 +0000 (UTC)
Received: from diamond.localdomain (localhost [IPv6:::1])
 by smtp.ungleich.ch (Postfix) with ESMTP id 5E3D42036B
 for <wireguard@lists.zx2c4.com>; Sat,  5 Oct 2019 22:45:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ungleich.ch; s=mail;
 t=1570308352; bh=GlroztkmowU9JozyLofPf9ysoDO8qErL7nRfIlOtNEs=;
 h=From:To:Subject:Date:From;
 b=LHvuMa+iTpKo3vtW34DZbX2ruk6zGJewgfPU0uHLoeq4BXDu7jnkOIwbMUIUUzOHe
 6F3LIZ08AExiO8dy0FBDO6tHSbKcA2jN8COY/WIhQySAyk5xKTwnkdR0svOPao4LJC
 aVMPOu9xZg76BNrsVASO1ALaqkfs8a7qV0z37ozA=
Received: by diamond.localdomain (Postfix, from userid 1000)
 id 3FD8713E2AB5; Sat,  5 Oct 2019 22:45:52 +0200 (CEST)
User-agent: mu4e 1.3.5; emacs 26.3
From: Nico Schottelius <nico.schottelius@ungleich.ch>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Kernel panic on 5.3.1-arch1-1-ARCH
Date: Sat, 05 Oct 2019 22:45:52 +0200
Message-ID: <87v9t2c45b.fsf@ungleich.ch>
MIME-Version: 1.0
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


Hello,

loading the kernel module and starting wg-quick causes a kernel panic on
Arch Linux w/ the above mentioned kernel. I have uploaded a camera based
screen shot to

https://www.nico.schottelius.org/temp/IMG_20191005_221751.jpg

I tried both the wireguard-arch and wireguard-dkms approach, both led to
the same result.

Does this help anyone to debug the issue?

Best regards,

Nico


--
Modern, affordable, Swiss Virtual Machines. Visit www.datacenterlight.ch
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
