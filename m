Return-Path: <SRS0=nQDx=PZ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7AFDC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  6 Nov 2021 13:22:45 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C7D0601FA
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  6 Nov 2021 13:22:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0C7D0601FA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chil.at
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c2afa4e8;
	Sat, 6 Nov 2021 13:22:43 +0000 (UTC)
Received: from mail.onetrix.net (eleanor.onetrix.net [86.59.13.171])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c917f219
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 6 Nov 2021 13:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=chil.at;
 s=default; 
 h=Content-Transfer-Encoding:Content-Type:Subject:From:To:MIME-Version:Date:Message-ID;
 bh=ySR0LAzOzBBBdH259ORn+4wUiRrWa2H/inEHLwbmcU4=; 
 b=KMXQ3cUdCxb4Ykf8ef3teAxF4UJ67o43qDXm+naDE7Bwkk1GNV8yA04G9GQCJxH/27Ho8pU+WInm9bk1lg+S5GjYSJb5By5V6YRHAQ2XoPpR7ydzymM2NP0TotrIwhgpLcrI0bZpvlnRaGK9CMiTye/PHpEugu8nSPlTssFLjTI=;
Received: from [10.5.44.225] (port=29933 helo=mail.onetrix.net)
 by mail.onetrix.net with esmtps (TLSv1:DHE-RSA-AES256-SHA:256)
 (Exim 4.82_1-5b7a7c0-XX) (envelope-from <mail@chil.at>)
 id 1mjLeY-0008Af-0q
 for wireguard@lists.zx2c4.com; Sat, 06 Nov 2021 14:22:38 +0100
Received: from [172.22.0.123] (193.238.156.229) by mail.onetrix.net
 (10.5.44.225) with Microsoft SMTP Server (TLS) id 14.1.438.0; Sat, 6 Nov 2021
 14:22:37 +0100
X-CTCH-RefID: str=0001.0A682F21.6186819E.0030, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Message-ID: <6b07934f-f0ce-5909-0595-3d50bc2a7c3a@chil.at>
Date: Sat, 6 Nov 2021 14:22:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Content-Language: de-AT
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
From: Christoph Loesch <wireguard-mail@chil.at>
Subject: Android app: length of name
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [193.238.156.229]
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

in the android app the name is limited to 15 characters.

Does that have a specific reason?
Is it possible to allow a longer name like e.g. 32 characters?

On importing a file the error "Invalid name" could be more specific to that.
Because I had to struggle with the file name until I found out it is just a limitation of the length.

Kind regards,
Christoph

