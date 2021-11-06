Return-Path: <SRS0=+cFr=P5=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEDD1C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 10 Nov 2021 00:56:08 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7FF8610A5
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 10 Nov 2021 00:56:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D7FF8610A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=tschumacher.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 635ae906;
	Wed, 10 Nov 2021 00:53:40 +0000 (UTC)
Received: from tschumacher.net (tschumacher.net [157.90.113.29])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0bc951e7
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 6 Nov 2021 12:40:04 +0000 (UTC)
Received: from impa (unknown [185.209.196.142])
 by tschumacher.net (Postfix) with ESMTPSA id C797F82B37
 for <wireguard@lists.zx2c4.com>; Sat,  6 Nov 2021 13:40:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tschumacher.net;
 s=dkim; t=1636202403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=A4f3XiM8l/1wxNTM9VsehLPUpV0YZPSa832gkewxy3I=;
 b=n4OBPiKqseFm39aPp7hdStX9UN2sZs7Puh/qXvkhhWBYNSCg/1mmrwGyJjSXy7zRgrO5Oh
 VpF6PT5C0f1YvbuE+zDGAKibhAmhS2k1uMTOXJPQ0krkQoomZxwUrHg0+9tQZZLJ4kbWpx
 UjFMBdGhXB+GAkmNPgu046j4vuJ82Lg=
Date: Sat, 6 Nov 2021 13:40:02 +0100
From: Tim Schumacher <tim@tschumacher.net>
To: wireguard@lists.zx2c4.com
Subject: wg-quick's Ethernet unplug problem
Message-ID: <20211106134002.68a3ade2@impa>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 10 Nov 2021 00:53:39 +0000
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

Hi,

there is this annoying problem with the way wg-quick sets up the routing, that when you unplug the Ethernet cable the routing rule (see ip rule) that checks the fwmark gets lost. So let's say you move to another location with your laptop and plug in an Ethernet cable again, it essentially disables your VPN. You're lucky if you have the popular kill switch in place blocking all your traffic instead of silently disabling your VPN.

PostUp = iptables -I OUTPUT ! -o %i -m mark ! --mark $(wg show %i fwmark) -m addrtype ! --dst-type LOCAL -j REJECT
PreDown = iptables -D OUTPUT ! -o %i -m mark ! --mark $(wg show %i fwmark) -m addrtype ! --dst-type LOCAL -j REJECT

I have no idea why the rule gets lost. It might be the kernel removing it for whatever reason. But it makes no sense to me because I don't see how the kernel would make a connection between that rule and the Ethernet link that goes down. Any ideas on the issue? Is this a known problem? Are there workarounds?

Greetings,
Tim
