Return-Path: <SRS0=5+V/=5V=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31F66C2BA1B
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  5 Apr 2020 21:51:44 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55ED920659
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  5 Apr 2020 21:51:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=tuta.io header.i=@tuta.io header.b="v7x2OB/x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55ED920659
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=tuta.io
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2178bd2a;
	Sun, 5 Apr 2020 21:38:21 +0000 (UTC)
Received: from w4.tutanota.de (w4.tutanota.de [81.3.6.165])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 95e3df38
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 5 Apr 2020 17:28:38 +0000 (UTC)
Received: from w3.tutanota.de (unknown [192.168.1.164])
 by w4.tutanota.de (Postfix) with ESMTP id F26C610602E5
 for <wireguard@lists.zx2c4.com>; Sun,  5 Apr 2020 17:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1586108238; 
 s=s1; d=tuta.io;
 h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Date:Date:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:Sender;
 bh=ZmYyMpfLk3MyZIzyeNtfhzA/wEvfylik7HyHlve5aCs=;
 b=v7x2OB/xqdt8rnWINnQQHmKPMcMfeap0j3EROjEysMlZqcQMpgD2iIO1PU7zaZz8
 JiHes7V1FAouUKQmMuAsfgLTSTiGHheQlJMY/pycw93eq3CXUCnpOEkUZYGpr09EE0I
 O/BzjBoQoGaM4vH61nKK/AVqNJiV+m1eYlOGnU8dCKZ6Mlu6DmyfNtDdcz1RenA8xZg
 K6A2uKj6IbxuCPVw7A8FpuySCRTurOYpVs3trP+5AaGLs/Bc+i0O5BYkkxjrvjK3ZcE
 kxTxOCFRG77Hj/v6hXzBVMw+8dL+Ohf+ECuo+Ja8VUFv5yEtkiTuUAtL8zhQ7qNqNJm
 VlJYm/Y4Hg==
Date: Sun, 5 Apr 2020 19:37:18 +0200 (CEST)
From: vrein@tuta.io
To: Wireguard <wireguard@lists.zx2c4.com>
Message-ID: <M4APSeK--3-2@tuta.io>
Subject: [PROPOSAL] wg-quick ip rule priority
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sun, 05 Apr 2020 23:38:13 +0200
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

Hi everyone!
I have some tiny proposal for wg-quick utility: adding priority for iproute=
2 routing rules

For linux.bash this should be as easy as this:
https://gitea.tort.icu/vrein/wireguard-tools/commit/0947dc76770a5d81ba39340=
ebe9189b80a92584c

My personal use case:
=C2=A0 I have two peers: A, B

A: allowed ips: 0.0.0.0/0, ::/0
B: allowed ips: 10.5.0.0/24

And I need have connection to every peer.
If those peers are added to the single interface - wg0,
=C2=A0 then all traffic would be intercepted with A peer "allowed ips" mask=
.


Quick fix for this, which I implemented on my pc
=C2=A0 is to add `ip rule` with priority lower than 32766 but higher than 0
=C2=A0 and higher than other wg interface for peer B.

So there is two interfaces:
=C2=A0 wg0 - which intercepts all traffic
=C2=A0 wg1 - routes all traffic for 10.5.0.0/24 subnet

Here what I have on my PC:
0:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from all lookup local
125:=C2=A0=C2=A0=C2=A0 from all fwmark 0xca58 lookup main
125:=C2=A0=C2=A0=C2=A0 from all to 10.5.0.0/24 lookup 51800
10000:=C2=A0 not from all fwmark 0xca6c lookup 51820
10000:=C2=A0 from all lookup main suppress_prefixlength 0
32766:=C2=A0 from all lookup main
32767:=C2=A0 from all lookup default

Routing rules for wg1 could be added with `(Post|Pre)Up' directive.


PS:
Somehow, connectivity with both A and B peers were worked in single wg0 int=
erface some time ago,
=C2=A0 but after few updates this feature stopped working.

Thank you for attention!


