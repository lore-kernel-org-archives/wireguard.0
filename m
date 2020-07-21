Return-Path: <SRS0=dVqJ=BD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5960FC433E3
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Jul 2020 08:27:30 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 003A9206EB
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Jul 2020 08:27:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=petergarner.net header.i=@petergarner.net header.b="lWtGIReq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 003A9206EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=petergarner.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2077711b;
	Fri, 24 Jul 2020 08:04:09 +0000 (UTC)
Received: from mail.petergarner.net (82-71-1-246.dsl.in-addr.zen.co.uk
 [82.71.1.246])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e44f357a
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Jul 2020 14:35:56 +0000 (UTC)
Received: from peterg.petergarner.net (peter [192.168.1.55])
 by mail.petergarner.net (Postfix) with ESMTPSA id 2C7D7601194
 for <wireguard@lists.zx2c4.com>; Tue, 21 Jul 2020 15:58:28 +0100 (BST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.petergarner.net 2C7D7601194
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=petergarner.net;
 s=mail; t=1595343508;
 bh=6LaXaSrO3NowIvNX7+emzkiUvpKKLzw1Htolj3jqcV4=;
 h=Date:From:To:Subject:From;
 b=lWtGIReqvSCPavmu2EtQJhDYwdRnBFnE1z0+Zge7sVXU3PklPxMBKmdwpra8kTlKX
 2Ix6/X/STEA+i5jkLoQ5idYSqg5L/lJWTJwNHVwbeec1gOHe3/SzIOR1FWAXXTI3qr
 5jPXwLLR/4besfbPM5D31A/AzUl4qTQ6mC5nHVMciMLxPFfeR4BZ4gHTn9jALyS2wD
 BzEI67API77m791LlIPr5z1DNZMYQ/2D6i+aTUoVLdBfGfos0pDMsjDfJPmciwWGIV
 lzD1vDCcVknUHNfQgr5g4W+7iKLUOKJlvGETTktRkA0oYMJN04k1uvpvShWYoDVb/M
 u6FYjtLkUrgoQ==
Date: Tue, 21 Jul 2020 15:58:26 +0100
From: peter garner <peter@petergarner.net>
To: wireguard@lists.zx2c4.com
Subject: Using OneRNG hardware RNG can I get wireguard to use /dev/random
Message-ID: <20200721155826.29f29036.peter@petergarner.net>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 24 Jul 2020 10:04:06 +0200
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

Hi List,=20

Platform: Raspberry Pi4B, Raspbian Buster 10.  This device dedicated to
wireguard. uname -a: Linux wireguard 4.19.118-v7l+ #1311 SMP Mon Apr 27
14:26:42 BST 2020 armv7l GNU/Linux. wg-quick is dated May 22 08:11
=20
I've used my OneRNG v3.0 external device to recreate my SSH moduli and
am now looking to recreate my wireguard keys.

According to the Wireguard docs it uses /dev/urandom:
https://gist.github.com=E2=80=8B/rmoriz=E2=80=8B/58f1768218a4fbc4b318615bfb=
85111d
=20
fd =3D open("/dev/urandom", O_RDONLY);
	if (fd < 0)
		return fd;
	ret =3D read(fd, out, len);
	close(fd);
=20
The OneRNG utilises /dev/random though - is there any way I can get
wireguard to use /dev/random instead (without recompiling) ?

