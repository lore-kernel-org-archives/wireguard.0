Return-Path: <SRS0=D9u6=QF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E7ADC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 18 Nov 2021 17:10:44 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 333F560295
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 18 Nov 2021 17:10:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 333F560295
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=tschumacher.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id f57294c0;
	Thu, 18 Nov 2021 17:10:41 +0000 (UTC)
Received: from tschumacher.net (tschumacher.net [2a01:4f8:c2c:ef29::2])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7b1fcc73
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Nov 2021 20:49:52 +0000 (UTC)
Received: from [10.68.33.52] (unknown [185.209.196.142])
 by tschumacher.net (Postfix) with ESMTPSA id C8FD690AFF
 for <wireguard@lists.zx2c4.com>; Wed, 17 Nov 2021 21:49:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tschumacher.net;
 s=dkim; t=1637182192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=W284Bkod3OefO+MwkdsD8X7Z5DZS8gTSE/cEz6Y6YXg=;
 b=DBRrOU4EKK0we8jxs+CwIN2+QanQEnZvumB9ZwqgAl2Z8dZSTlF3vpsEnuGQWIeJ2LM/ts
 +mC3TvknEDHpTVSe+ec68ZhhlrpdOO/Xh+iZoWX6RRMJkDgRUdKNpEtLzTRsxwUm9RGi+J
 1W52gdZ0w5OmRn0uPuK+0ZqZgP1SS2k=
Message-ID: <fbb34b62-8227-6106-2101-f7f1398b2143@tschumacher.net>
Date: Wed, 17 Nov 2021 21:49:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
From: Tim Schumacher <tim@tschumacher.net>
Subject: wg-quick's Ethernet unplug problem
To: wireguard@lists.zx2c4.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 18 Nov 2021 17:10:39 +0000
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

there is this annoying problem with the way wg-quick sets up the 
routing, that when you unplug the Ethernet cable the routing rule (see 
ip rule) that checks the fwmark gets lost. So let's say you move to 
another location with your laptop and plug in an Ethernet cable again, 
it essentially disables your VPN. You're lucky if you have the popular 
kill switch in place blocking all your traffic instead of silently 
disabling your VPN.

PostUp = iptables -I OUTPUT ! -o %i -m mark ! --mark $(wg show %i 
fwmark) -m addrtype ! --dst-type LOCAL -j REJECT
PreDown = iptables -D OUTPUT ! -o %i -m mark ! --mark $(wg show %i 
fwmark) -m addrtype ! --dst-type LOCAL -j REJECT

I have no idea why the rule gets lost. It might be the kernel removing 
it for whatever reason. But it makes no sense to me because I don't see 
how the kernel would make a connection between that rule and the 
Ethernet link that goes down. Any ideas on the issue? Is this a known 
problem? Are there workarounds?

Greetings,
Tim

