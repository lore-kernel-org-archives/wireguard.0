Return-Path: <SRS0=tjuz=QY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	URI_HEX autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90534C43381
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 17 Feb 2019 01:34:27 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1F7C21B69
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 17 Feb 2019 01:34:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ungleich.ch header.i=@ungleich.ch header.b="bdZ/8JJn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1F7C21B69
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ungleich.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2e6ee797;
	Sun, 17 Feb 2019 01:26:12 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cc265db5
 for <wireguard@lists.zx2c4.com>; Sat, 9 Feb 2019 17:40:35 +0000 (UTC)
Received: from mx.ungleich.ch (mx.ungleich.ch [185.203.112.16])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5430df15
 for <wireguard@lists.zx2c4.com>; Sat, 9 Feb 2019 17:40:35 +0000 (UTC)
Received: from nico-notebook.schottelius.org (localhost [IPv6:::1])
 by mx.ungleich.ch (Postfix) with ESMTP id ED3D920B7D
 for <wireguard@lists.zx2c4.com>; Sat,  9 Feb 2019 18:47:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ungleich.ch; s=mail;
 t=1549734471; bh=zvGYfboUBgeIxKbBWu3+3Rwwob9N6yZ0CddplIzug3g=;
 h=From:To:Subject:Date:From;
 b=bdZ/8JJnuNKNbszz2jcPpMwjJ4MftIUSvLrKBiYcdsS2LFiYu5l4BK9wlfgKJgtt2
 i6e+0qs7LYj/UGLreJ8WWL4LwfBiyMh2nV3cM3vce3PwOfdrE++AY51pc/ZRLLEPMx
 JXW6RZmMA/LRxbgjsayvnv0ZtU2t9SvlDu1sFZ80=
Received: from line (localhost [IPv6:::1])
 by nico-notebook.schottelius.org (Postfix) with ESMTPS id D0B3A1A00F76
 for <wireguard@lists.zx2c4.com>; Sat,  9 Feb 2019 18:47:51 +0100 (CET)
User-agent: mu4e 0.9.18; emacs 25.1.1
From: Nico Schottelius <nico.schottelius@ungleich.ch>
To: wireguard@lists.zx2c4.com
Subject: Android / IPv6 Tunnel / Application connection problems
Date: Sat, 09 Feb 2019 18:47:51 +0100
Message-ID: <87tvhcn9a0.fsf@line.ungleich.ch>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 17 Feb 2019 02:26:10 +0100
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

when trying to route ::/0 (only; no IPv4) on Android 9 using
latest wireguard app on mobile network I experience the following
behaviour:

* chrome works
* nextcloud works
* hangouts works
* mattermost works
* whatsapp works
* instagram works
* roundcube works

* analytics gets stuck shortly, then works

* sbb app cannot establish a connection
* skype does not load
* mystrom app does not work ("check your internet connection")
* twitter says "cannot retrieve activity at this time"

Has anyone seen this kind of split behaviour before?

The apps *do* work with native IPv6 on WiFi.

If required, I can provide access to the same VPN for testing.


Best,

Nico

p.s.: The configuration file I used on the phone is

[Interface]
PrivateKey = ....
ListenPort = 51280
Address = 2a0a:e5c1:110::/48

[Peer]
PublicKey = hi60lGP+xEUQ+kVnqA7PlJAO1SVqTS1W36g0LhFP0xQ=
Endpoint = vpn-2a0ae5c1.ungleich.ch:51820
AllowedIPs = ::/0


--
Your Swiss, Open Source and IPv6 Virtual Machine. Now on www.datacenterlight.ch.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
