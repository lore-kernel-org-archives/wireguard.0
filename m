Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7058AC54FB9
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 19 Nov 2023 13:45:23 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0417adc6;
	Sun, 19 Nov 2023 13:34:45 +0000 (UTC)
Received: from mail-4318.protonmail.ch (mail-4318.protonmail.ch [185.70.43.18])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e4fa79ac
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 1 Nov 2023 21:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=protonmail; t=1698875179; x=1699134379;
 bh=etgcMH5Pzv13+hs0OXyUhU5mb1FFQIZ88RzeHeu8QzY=;
 h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=BbT8tL2laKkEfMMEzP1FH6OuQzyIHos5M60YQtcnchM4yeqTHyf1DBtcHwI9iFsDT
 jVWwJhB0xLj0MRJL9VVE/zqepRgK7poqpzB1KAzBLL4arMGPpVRvR6DODytnf9NAXw
 vJVtHGI9oBK1+1U+vy5ltmHMPclnVv6kRhYUtzOapxzmNf9XadBVdR+TyzXqSrtnRl
 IwYuYva6U6iwERq6ir2C/ZEwmBUUJDhMHNpQvLtL8OvKkNZaSCstDmY/y3sEsxq/6b
 RlQDalUq8B57gaoVp/QVY85yQLLcYWz+TpzYVV8p2Q7Tgu2D4Qbsm+TzQFq8lAtfhs
 1zXVyZsScWB6g==
Date: Wed, 01 Nov 2023 21:46:08 +0000
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
From: mabived <mabived@proton.me>
Subject: Reduce height of macOS menu bar icon
Message-ID: <mkwucWACaH3mPaSldxGMiryrMCpwgKsYONuxf25E1jZJP7lt8YNBjRCSQIOoKOIcwU8MbmOkEQ5GIPFPUoJP9FIgaRThmDiODms_Xltj1k4=@proton.me>
Feedback-ID: 91122943:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sun, 19 Nov 2023 13:34:33 +0000
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

The menu bar extra icon for macOS looks out of place. Can the icon be resiz=
ed to match system icons?

Screenshot: https://ibb.co/1Gxtz7P

https://developer.apple.com/design/human-interface-guidelines/the-menu-bar#=
Menu-bar-extras
https://bjango.com/articles/designingmenubarextras/
