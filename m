Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C07DC3DA78
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 17 Jan 2023 18:45:56 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 87589787;
	Tue, 17 Jan 2023 18:43:13 +0000 (UTC)
Received: from mail.onetrix.net (eleanor.onetrix.net [86.59.13.171])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 9ca8f485
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Jan 2023 18:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=chil.at;
 s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wtEAZCDCxCDogX6eCpYb4VnI+4zpai51YaC+XphUEXU=; b=dbE2sMxmwe0ZKIEOH3Mr78vyv4
 M+04xPmxTBx3hOhxqWU4fmIxWaTmxT+ESXefcFagEprIRuGvxgo63llehCybN0Fe9+/yU2P3J2CXj
 qAfwAvU3rZdVHGREDal+3bTqcPHdk/rCWdR5vOSdl9Erlxei7ncLsyOD/FkLuCA9ODno=;
Received: from [10.5.44.225] (port=33890 helo=mail.onetrix.net)
 by mail.onetrix.net with esmtps (TLS1) tls TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA
 (Exim 4.96) (envelope-from <mail@chil.at>) id 1pHquy-000716-1Q
 for wireguard@lists.zx2c4.com; Tue, 17 Jan 2023 19:43:04 +0100
Received: from [172.27.0.87] (10.5.44.244) by mail.onetrix.net (10.5.44.225)
 with Microsoft SMTP Server (TLS) id 14.1.438.0; Tue, 17 Jan 2023 19:42:44
 +0100
Message-ID: <f982e6d1-902f-d698-892d-54c5bb041844@chil.at>
Date: Tue, 17 Jan 2023 19:42:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: User on mailinglist that collects addresses to send spam?
To: <wireguard@lists.zx2c4.com>
References: <5d0d60df-ee8c-87ab-379b-31ed33675668@chil.at>
 <Y8Zr+l4j2oqjLqLP@mail.kent-dobias.com>
From: Christoph Loesch <wireguard-mail@chil.at>
In-Reply-To: <Y8Zr+l4j2oqjLqLP@mail.kent-dobias.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.5.44.244]
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

thank you for the for explanation.

Interesting, some months ago I wanted to lookup something in the archive and couldn't access it, so I assumed since then that the archive is not publicly available.
Was maybe some hickup or temporary issue...

Well, that explains it then..

Thanks and kind regards!

Am 17.01.2023 um 10:35 schrieb Jaron Kent-Dobias:
> Hello,
>
> On Tuesday, 17 January 2023 at 00:45 (+0100), Christoph Loesch wrote:
>> I use a separate mail-address for every site/contact who wants my mail-address. Just checked my spam-folder and what do I see? a mail from janisa@onertronics.com to my wireguard mail-address which I use only for this mailinglist. So I guess janisa@onertronics.com is collecting mail-addresses here and then sending unwanted spam-mails.
>
> It's nothing so complicated: the wireguard list is publicly archived online, addresses included (with minor obfuscation).
>
> An example: https://lists.zx2c4.com/pipermail/wireguard/2019-July/004276.html
>
> Jaron
