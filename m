Return-Path: <SRS0=QHSY=WV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43A62C3A5A4
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:51:12 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBDD92080C
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:51:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ungleich.ch header.i=@ungleich.ch header.b="ZWm5oCsW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EBDD92080C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ungleich.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8c56dd99;
	Sun, 25 Aug 2019 15:41:31 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2df78bd6
 for <wireguard@lists.zx2c4.com>;
 Sat, 17 Aug 2019 13:55:28 +0000 (UTC)
Received: from smtp.ungleich.ch (smtp.ungleich.ch
 [IPv6:2a0a:e5c0:0:2:400:b3ff:fe39:7956])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 90c849a5
 for <wireguard@lists.zx2c4.com>;
 Sat, 17 Aug 2019 13:55:28 +0000 (UTC)
Received: from nico.schottelius.org (localhost [IPv6:::1])
 by smtp.ungleich.ch (Postfix) with ESMTP id 331A91FD75
 for <wireguard@lists.zx2c4.com>; Sat, 17 Aug 2019 15:55:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ungleich.ch; s=mail;
 t=1566050127; bh=/jkzcZalkdzNMgmUQFHhRkNeHEp75ajrzZ4v1JKixV4=;
 h=From:To:Subject:Date:From;
 b=ZWm5oCsWu4JkgvrD8l/h4SbfgB3+f2E3gi9rs2of+7K3Xe0v6JY/h+DwpOlKbUoLB
 3lZAneMizQHd3wB6AbNhbf0LV00xxsnOZ4MOz2nnI8Yh+CCmdPJSb+dDi0QSo6kNlE
 zSMin9PHgUKIT2IBWifs32NwCPSJ2O5w7XdtWx2k=
Received: by nico.schottelius.org (Postfix, from userid 1000)
 id 28B911A01027; Sat, 17 Aug 2019 15:55:27 +0200 (CEST)
User-agent: mu4e 1.0; emacs 26.1
From: Nico Schottelius <nico.schottelius@ungleich.ch>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Status of Bird<->wireguard integration
Date: Sat, 17 Aug 2019 15:55:27 +0200
Message-ID: <87ftlzq4kw.fsf@line.ungleich.ch>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 25 Aug 2019 17:41:26 +0200
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


Hello again,

I was wondering what the status is of the integration of wireguard into
bird and whether there is any help needed?

I am wondering, because integrating wireguard into bird would easily
allow to create wireguard server clusters that would announce only the
connected clients via BGP:

client
  | \               |
  | --------------- |
server1              server2
[wireguard+bird]     [wireguard+bird]
  \                   /
  BGP               BGP
   -------- | -------
            |
     upstream router

This would not only to easily create any number of failover VPN
endpoints, but also allowing to easily implement load balancing.

Best regards,

Nico

--
Your Swiss, Open Source and IPv6 Virtual Machine. Now on www.datacenterlight.ch.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
