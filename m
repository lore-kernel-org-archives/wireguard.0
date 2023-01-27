Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA0A8C38142
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 27 Jan 2023 23:35:25 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bd42a6bb;
	Fri, 27 Jan 2023 23:35:23 +0000 (UTC)
Received: from mail.onetrix.net (eleanor.onetrix.net [86.59.13.171])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3b202144
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 27 Jan 2023 23:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=chil.at;
 s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bX3rajYrXnRy3LYJ7J6ccAn17VxmopJsY91TXpkG+Aw=; b=JDR/amw+sWV4byledJjwlYZkAN
 wMrls4Xp0OoUb7SpmHwXtofqg4WBgyz6gFvMu1/TBrgVns7lNrJAjkcHYaB34xlGW17z6w6R6N3cj
 mPiaGkH0qxGPX+fYiIYZSkYsjvPSDhBVhm1A5o0fa7YYPUmKSb/uoy2ZfjJEhZ8Y2a+g=;
Received: from [10.5.44.225] (port=30154 helo=mail.onetrix.net)
 by mail.onetrix.net with esmtps (TLS1) tls TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA
 (Exim 4.96) (envelope-from <mail@chil.at>) id 1pLYFB-0002VX-2B
 for wireguard@lists.zx2c4.com; Sat, 28 Jan 2023 00:35:13 +0100
Received: from [172.27.0.87] (10.5.44.244) by mail.onetrix.net (10.5.44.225)
 with Microsoft SMTP Server (TLS) id 14.1.438.0; Sat, 28 Jan 2023 00:34:53
 +0100
Message-ID: <373d9237-1b23-93cd-fa4e-b5fc14e6007b@chil.at>
Date: Sat, 28 Jan 2023 00:34:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: User on mailinglist that collects addresses to send spam?
To: <wireguard@lists.zx2c4.com>
References: <5d0d60df-ee8c-87ab-379b-31ed33675668@chil.at>
 <Y8Zr+l4j2oqjLqLP@mail.kent-dobias.com>
 <f982e6d1-902f-d698-892d-54c5bb041844@chil.at>
From: Christoph Loesch <wireguard-mail@chil.at>
In-Reply-To: <f982e6d1-902f-d698-892d-54c5bb041844@chil.at>
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

wouldn't it be a consideration worth to hide or at least obfuscate mail addresses a bit more in mailman on this list here?
Mailman is able to obfuscate this better, see for example on lists.funkfeuer.at

Since I wrote the first time here about the "offer" I got, I'm getting more and more "spam" in the last weeks on the address I registered here on this list.

How do you work with this situation? Update/add rules in Mailfilter until the next mail comes through? Cat and mouse game? ;)

Kind regards,

Am 17.01.2023 um 19:42 schrieb Christoph Loesch:
> Hi,
>
> thank you for the for explanation.
>
> Interesting, some months ago I wanted to lookup something in the archive and couldn't access it, so I assumed since then that the archive is not publicly available.
> Was maybe some hickup or temporary issue...
>
> Well, that explains it then..
>
> Thanks and kind regards!
>
> Am 17.01.2023 um 10:35 schrieb Jaron Kent-Dobias:
>> Hello,
>>
>> On Tuesday, 17 January 2023 at 00:45 (+0100), Christoph Loesch wrote:
>>> I use a separate mail-address for every site/contact who wants my mail-address. Just checked my spam-folder and what do I see? a mail from janisa@onertronics.com to my wireguard mail-address which I use only for this mailinglist. So I guess janisa@onertronics.com is collecting mail-addresses here and then sending unwanted spam-mails.
>>
>> It's nothing so complicated: the wireguard list is publicly archived online, addresses included (with minor obfuscation).
>>
>> An example: https://lists.zx2c4.com/pipermail/wireguard/2019-July/004276.html
>>
>> Jaron
