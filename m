Return-Path: <SRS0=sRyP=OU=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0EF6C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Sep 2021 10:40:59 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD67061994
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Sep 2021 10:40:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DD67061994
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=coppint.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b66ffde4;
	Thu, 30 Sep 2021 10:40:57 +0000 (UTC)
Received: from mail01.coppint.com (mail01.coppint.com [212.129.15.236])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0eaaae63
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Sep 2021 10:40:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail01.coppint.com (Mail server) with ESMTP id A93E51C710F
 for <wireguard@lists.zx2c4.com>; Thu, 30 Sep 2021 12:40:55 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail01.coppint.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=coppint.com; s=dkim;
 t=1632998446; bh=zqqH7eMmVCO5emCKBUs7qByQV7UGMsuGYwvYV8MK2dI=;
 h=To:From:Subject:Message-ID:Date:MIME-Version:
 Content-Transfer-Encoding;
 b=GSVFKPlRtijMRh50a7Lf9KfYD5xpBFaz80GhwjD6ASqJ00zKLpdsXNYmPF9Q8GNJy
 r3gjZy3Nd23nc2Dxkzkx8mbx6XLFNn5Z7KWDGKIXxdJEC9XL5kj/EJBxuFGRhruQ4d
 /GohZMBDgDeYn7ykdfHLQ4q/lKjdlsTRFdxqg9wNllvz5uMAAvAO4QI6aW/zih+VHY
 bAHoquMlN39vspgxFUXx0Pd9y+NuO/pgURe2TMyzeVUIs006PW3885T1wRyXT7bZ74
 cXBWLo11lkGFBSR1FCup9906XNdtfK6rClZ0W3vsHhdp7m1x/Hynk/L1jExQbD2oP5
 JgrpnhaJV0VVw==
To: wireguard <wireguard@lists.zx2c4.com>
From: "Florent B." <florent@coppint.com>
Subject: Enable Wireguard only for specific user
Message-ID: <0fd0ed22-732c-0ea5-5067-538dc0842869@coppint.com>
Date: Thu, 30 Sep 2021 12:40:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: fr
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

Hi list,

On a Linux system (Ubuntu), I would like to enable Wireguard VPN only 
for a single user on my system.

Currently by default, every packet of every user is getting though 
Wireguard.

How can I do to route packets only for 1 user ?

I think I have to play with packets marking (wg show wg0 fwmark / 
iptables owner/mark module), I tried some commands but was unable to 
success.

Can someone help please ?

Thank you.

Florent

