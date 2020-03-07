Return-Path: <SRS0=ZUZz=4Z=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44DDDC10F25
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Mar 2020 00:58:30 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 818D1206D5
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Mar 2020 00:58:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 818D1206D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mail.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5c3f4b24;
	Sun, 8 Mar 2020 00:53:28 +0000 (UTC)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.142])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7004b85c
 for <wireguard@lists.zx2c4.com>; Sat, 7 Mar 2020 16:58:22 +0000 (UTC)
Received: from submission (posteo.de [89.146.220.130]) 
 by mout02.posteo.de (Postfix) with ESMTPS id 7124F2400FD
 for <wireguard@lists.zx2c4.com>; Sat,  7 Mar 2020 18:03:18 +0100 (CET)
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 48ZW5d4Px6z9ryQ;
 Sat,  7 Mar 2020 18:03:17 +0100 (CET)
From: tormen@mail.ch
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: WireGuard for macOS
Date: Sat, 7 Mar 2020 18:03:17 +0100
To: wireguard@lists.zx2c4.com
Message-Id: <F77DB7FE-175E-48E4-A071-FF86D290B494@mail.ch>
X-Mailer: Apple Mail (2.3608.60.0.2.5)
X-Mailman-Approved-At: Sun, 08 Mar 2020 01:53:26 +0100
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
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Dear Wireguard Team,

First off, thanks a lot for the client for macOS !!

Is there a possibility to issue a "Connect" / "Disconnect" command from =
the command line=20
instead of using the buttons in the GUI ?=20

I would love to use both (GUI + CLI): No automatic connect in the GUI, =
but rather automatically connect / reconnect via script (so via =
command-line interface, CLI).
And I don't like the idea of not using the GUI and switching to the cli =
version as then I don't have the icon.

Thanks a lot in advance for any hint or feedback!

Tormen=
