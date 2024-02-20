Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D1CD49221
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Nov 2024 13:24:07 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9f25a3bb;
	Mon, 18 Nov 2024 12:38:19 +0000 (UTC)
Received: from mail-40132.protonmail.ch (mail-40132.protonmail.ch
 [185.70.40.132])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8e3a9130
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 Feb 2024 14:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=protonmail; t=1708441195; x=1708700395;
 bh=iDxNL12fmKeOwn7uXsVUy3p2U8V0jaHyGEgldjIC2pQ=;
 h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=jS9NA0rbzU3/dtcYnaiOKTMp8t7HV+VbK1O0tew7X6iwUKiy0enr2R7c9kVRgaUKL
 n36hpnJUMfmoHiEIl9wRp83LWCEBVskEzhC0Cm7qtdzHb24w9EeyELWHc5PROirIjk
 Aouau+1+Bl5Ss4NeQljos1z6I18AZ75vz1LK6+WPoOPyNun7tWOWfeyavOShalqOve
 jYqjNefeoflyQQlTA0UR0LSzUYd5o4+v0c/HAQwlDElEzkxVopWqYmOZs9gnCPlkGC
 KxNj5n0sHeJgTer48URM5Ez6VYNmJgIYkWy5+iD5UycPGhihceheghe8KsGU5A6NHa
 6Y/wlfyDrbu/w==
Date: Tue, 20 Feb 2024 14:59:40 +0000
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
From: Douglas Silva <doug.hs@proton.me>
Subject: Update OpenWrt installation docs
Message-ID: <2EU6Fv6JDoUS4rpBKpZjSutSECTwhB2Sm1njWMbve6fQTGQNYCx7vwWp4tVuqp7kSjnTvPlTlapp3IrIYSSkcmXOaqOERrCgHOymnHkGaVA=@proton.me>
Feedback-ID: 47597204:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 18 Nov 2024 12:38:13 +0000
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

The OpenWrt package name is currently `wireguard`, which does not exist. Th=
e correct package is `wireguard-tools`.

https://www.wireguard.com/install/#openwrt-tools
