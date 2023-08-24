Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7242EC6FA8F
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 24 Aug 2023 13:23:33 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3f59b329;
	Thu, 24 Aug 2023 13:21:15 +0000 (UTC)
Received: from len.romanrm.net (len.romanrm.net [2001:41d0:1:8b3b::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 40631ede
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 24 Aug 2023 13:21:13 +0000 (UTC)
Received: from nvm (nvm2.home.romanrm.net [IPv6:fd39::4a:3cff:fe57:d6b5])
 by len.romanrm.net (Postfix) with SMTP id 353F2401AD;
 Thu, 24 Aug 2023 13:21:12 +0000 (UTC)
Date: Thu, 24 Aug 2023 18:21:11 +0500
From: Roman Mamedov <rm@romanrm.net>
To: Saint Michael <venefax@gmail.com>
Cc: blurt_overkill882@simplelogin.com, wireguard@lists.zx2c4.com
Subject: Re: [WireGuard] Header / MTU sizes for Wireguard
Message-ID: <20230824182111.4f92fdca@nvm>
In-Reply-To: <CAC9cSOA4-NDcVNs6s_mMT8kp3J8apnCMEXFGx4_XokipABhmAQ@mail.gmail.com>
References: <169230331253.7.2936868369217934671.167170975@simplelogin.com>
 <20230823211544.7f3252ec@nvm>
 <CAC9cSOA4-NDcVNs6s_mMT8kp3J8apnCMEXFGx4_XokipABhmAQ@mail.gmail.com>
X-Mailer: Claws Mail 3.11.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Thu, 24 Aug 2023 08:50:20 -0400
Saint Michael <venefax@gmail.com> wrote:

> This is the Achiles' heel of Wireguard. It reduces the MTU too much. Other
> tunneling techniques use a much larger MTU. I use Mikotik routers and one
> of the supported tunnels goes up to 1472. Some apps requiere a large MTU.
> Why Wireguard requieres so much space, so to speak?

Because it uses encryption, and each packet is also cryptographically signed.

I believe the other tunnels you have in mind will transfer data in plaintext
(unencrypted).

-- 
With respect,
Roman
