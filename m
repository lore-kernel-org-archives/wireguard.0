Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F0CFC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 25 Nov 2021 10:31:57 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id a4d53c3a;
	Thu, 25 Nov 2021 10:31:56 +0000 (UTC)
Received: from smtp.outgoing.loopia.se (smtp.outgoing.loopia.se [93.188.3.37])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 7d8726b9
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 25 Nov 2021 05:16:29 +0000 (UTC)
Received: from s807.loopia.se (localhost [127.0.0.1])
 by s807.loopia.se (Postfix) with ESMTP id 05E3D2EA612E
 for <wireguard@lists.zx2c4.com>; Thu, 25 Nov 2021 06:16:29 +0100 (CET)
Received: from s899.loopia.se (unknown [172.22.191.6])
 by s807.loopia.se (Postfix) with ESMTP id EB3232E27D59
 for <wireguard@lists.zx2c4.com>; Thu, 25 Nov 2021 06:16:28 +0100 (CET)
Received: from s898.loopia.se (unknown [172.22.191.5])
 by s899.loopia.se (Postfix) with ESMTP id E9E0C2C8D7DA
 for <wireguard@lists.zx2c4.com>; Thu, 25 Nov 2021 06:16:28 +0100 (CET)
X-Virus-Scanned: amavisd-new at amavis.loopia.se
Received: from s934.loopia.se ([172.22.191.6])
 by s898.loopia.se (s898.loopia.se [172.22.190.17]) (amavisd-new, port 10024)
 with LMTP id 6t_E6mqW-kzJ for <wireguard@lists.zx2c4.com>;
 Thu, 25 Nov 2021 06:16:28 +0100 (CET)
X-Loopia-Auth: user
X-Loopia-User: peter@libassi.se
X-Loopia-Originating-IP: 78.82.157.54
Received: from smtpclient.apple (c-369d524e.03-77-73746f30.bbcust.telenor.se
 [78.82.157.54]) (Authenticated sender: peter@libassi.se)
 by s934.loopia.se (Postfix) with ESMTPSA id 9468F7D3D8A
 for <wireguard@lists.zx2c4.com>; Thu, 25 Nov 2021 06:16:28 +0100 (CET)
From: Peter Libassi <peter@libassi.se>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.20.0.1.32\))
Subject: Re: [ANNOUNCE] wireguard-freebsd snapshot v0.0.20211105 is available
Message-Id: <EFAEC1BE-AC42-4656-9B0F-6B2FAE2FFBD4@libassi.se>
Date: Thu, 25 Nov 2021 06:16:28 +0100
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
X-Mailer: Apple Mail (2.3693.20.0.1.32)
X-Mailman-Approved-At: Thu, 25 Nov 2021 10:31:55 +0000
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


I've done some preliminary tests with the new if_wg kernel module on =
amd64 with freebsd 13-p4 and 14.

It works fine AFAICT. My previous issue's with wireguard-freebsd are =
also resolved.=20

Good work!

Thanks
Peter=
