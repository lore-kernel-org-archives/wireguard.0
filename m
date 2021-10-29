Return-Path: <SRS0=4XTf=PR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF2A5C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 29 Oct 2021 15:24:48 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0765760187
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 29 Oct 2021 15:24:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0765760187
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=protonmail.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 164c9208;
	Fri, 29 Oct 2021 15:24:46 +0000 (UTC)
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6301f2d8
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 29 Oct 2021 15:24:44 +0000 (UTC)
Date: Fri, 29 Oct 2021 15:24:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.ch;
 s=protonmail; t=1635521082;
 bh=Q5gmokNkzvcV5V7dRWpwvYHgNrwCy4Ef6DYJf4RVhRo=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=QWfWYQQzIiZ0tEe5GBD+5bJ+0kNPyfKIH+EJMH2zUXCyA4XUcjlELVVqwzIPLrK/o
 YZflrXVnP/Il19gQkv0K5gJDoHbhsdvQH9vVuqILw0TDJccUsoAjnmC+YEb1ucFUAh
 SmKGSMsQlFRk6gg6V4BhrZWPj1XJw7OEaXEhNnE8=
To: Igor Bozin <igorbzin@gmail.com>
From: Neutron <dotneutron@protonmail.ch>
Cc: wireguard@lists.zx2c4.com
Subject: Re: Support for M1 MacBook Simulators
Message-ID: <re37dSyY_rXzrSL5DCMtppy1I37FlAT-pqCZjPdPpw8CHDxX3Nn3xeVECxTBMRFJBk-XEINrSbXY4KvWEtfii8GbwxZPNg7CZgCW-3asMus=@protonmail.ch>
In-Reply-To: <18206D0A-EA19-4230-AAEC-8D52BE66A1C7@gmail.com>
References: <18206D0A-EA19-4230-AAEC-8D52BE66A1C7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Reply-To: Neutron <dotneutron@protonmail.ch>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hey Igor,

I believe I encountered this in the past.
https://lists.zx2c4.com/pipermail/wireguard/2021-September/007001.html

I'm not sure what your exact setup is since you mentioned it's a separate p=
roject presumably depending on WireGuardKit, but I can build libwg-go for a=
rm64 just fine using the trick I mentioned in the linked thread. Just add t=
his flag to Sources/WireGuardKitGo/Makefile.
GOOS_iphonesimulator :=3D ios

Hope it helps.

