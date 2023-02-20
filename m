Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C111C636CC
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 20 Feb 2023 09:33:42 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 10d02243;
	Mon, 20 Feb 2023 09:33:40 +0000 (UTC)
Received: from tootai.net (mail1.tootai.net [2a01:4f8:a0:821b::58:14])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7218504f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Feb 2023 09:33:37 +0000 (UTC)
Received: from tootai.net (localhost [127.0.0.1])
 by mail1.tootai.net (Postfix) with ESMTP id 61B556081887
 for <wireguard@lists.zx2c4.com>; Mon, 20 Feb 2023 10:33:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
 t=1676885617; bh=rRqXhVssOrZ5xwSS//v3GNponmkgnjiGRPd0xuqEUzg=;
 h=Date:To:From:Subject:From;
 b=v6sXcELCLS6hF7PyqdlHCaDa3AHb1q9a6YeZiQuYikl8+iyv5twcMtUp8GVw82Mt+
 er2CfcGj5dpGi+KIzB+g1pgRIRPv+ylhIuf3817F+kJ7k8wBfWsDb3dr1G4wl9Ff/P
 On4YGTReBb+cxOKNK3lxDtK0X4NjCg74LuWBWPuk=
Received: from [IPV6:fd99:1234:beef:cafe::24] (unknown
 [IPv6:fd99:1234:beef:cafe::24])
 by mail1.tootai.net (Postfix) with ESMTPA id 282C76081883
 for <wireguard@lists.zx2c4.com>; Mon, 20 Feb 2023 10:33:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
 t=1676885617; bh=rRqXhVssOrZ5xwSS//v3GNponmkgnjiGRPd0xuqEUzg=;
 h=Date:To:From:Subject:From;
 b=v6sXcELCLS6hF7PyqdlHCaDa3AHb1q9a6YeZiQuYikl8+iyv5twcMtUp8GVw82Mt+
 er2CfcGj5dpGi+KIzB+g1pgRIRPv+ylhIuf3817F+kJ7k8wBfWsDb3dr1G4wl9Ff/P
 On4YGTReBb+cxOKNK3lxDtK0X4NjCg74LuWBWPuk=
Message-ID: <ce7c0c0c-f1a8-f4f1-bde3-184ad66b48cb@tootai.net>
Date: Mon, 20 Feb 2023 10:33:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
To: wireguard@lists.zx2c4.com
Content-Language: fr-FR
From: Daniel <tech@tootai.net>
Subject: Wish - Add PostUp/PostDown per peer section
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP
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

Hello. Would it be possible to add the PostUp and PostDown commands in 
peer section ?

Ex. of use case: dynamically add route when a peer connect

Have a nice day
-- 
Daniel
