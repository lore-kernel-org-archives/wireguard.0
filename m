Return-Path: <SRS0=pGg3=E7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5A05C56202
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 25 Nov 2020 12:30:19 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B77E8206E5
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 25 Nov 2020 12:30:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B77E8206E5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bestov.io
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 018ab186;
	Wed, 25 Nov 2020 12:24:21 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8eae2e09
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 24 Nov 2020 23:39:55 +0000 (UTC)
X-Originating-IP: 79.52.27.94
Received: from localhost (host-79-52-27-94.retail.telecomitalia.it
 [79.52.27.94]) (Authenticated sender: pbl@bestov.io)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 998E340013;
 Tue, 24 Nov 2020 23:45:28 +0000 (UTC)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
From: "Riccardo Paolo Bestetti" <pbl@bestov.io>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
Subject: Re: Using WireGuard on Windows as non-admin - proper solution?
Date: Wed, 25 Nov 2020 00:42:54 +0100
Message-Id: <C7BW4WL2LWMH.1A1WYJLENDO9Q@enhorning>
In-Reply-To: <CAHmME9riWVidRXjORFebv+UF3GyG1Hv+OrDhf4njvhGyQNw=4A@mail.gmail.com>
X-Mailman-Approved-At: Wed, 25 Nov 2020 13:24:18 +0100
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

On Sat Nov 21, 2020 at 11:05 AM CET, Jason A. Donenfeld wrote:
> Hi,
>
> Check out the recent changes in git master, still under development,
> but functional at this point:
>
> https://git.zx2c4.com/wireguard-windows/about/adminregistry.md
Please note that unfortunately the S-1-5-32-556 group doesn't exist in
all Windows editions. For example, it does not exist in Windows 10 Home.

The general idea is fine, and that group could very well be the default
one; however it might be useful to also have a registry key to pick a
different SID.

Riccardo P. Bestetti

