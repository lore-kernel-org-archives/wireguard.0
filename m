Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A39C63797
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 17 Jan 2023 09:36:42 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f50c5086;
	Tue, 17 Jan 2023 09:36:40 +0000 (UTC)
Received: from mail.kent-dobias.com (mail.kent-dobias.com [71.19.144.184])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 788aacac
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Jan 2023 09:36:32 +0000 (UTC)
Date: Tue, 17 Jan 2023 10:35:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=kent-dobias.com;
 s=dkim; t=1673948188;
 bh=z4hm8Bh6FV8Sjd48oaVnIdxhtFeHYpvhitkiE4D8ov8=;
 h=Date:From:To:Subject:References:In-Reply-To;
 b=GhjKucgsTYcE2I2awLyHrFkMqXBwbF0vysXhmf+mSEwbZ7sItYdHfhb4KL7KBaKwT
 SqGQ0q4mllIzHXTqyGGhxHRpHIj5vYN6+SprvDKmqptlVphxsrpjRvYqZQFDAMFi5b
 r8qfzwtTxyVPYn2Dz5KF4EhPos8EmRgdDcFAT7Wg=
From: Jaron Kent-Dobias <jaron-wg@kent-dobias.com>
To: wireguard@lists.zx2c4.com
Subject: Re: User on mailinglist that collects addresses to send spam?
Message-ID: <Y8Zr+l4j2oqjLqLP@mail.kent-dobias.com>
References: <5d0d60df-ee8c-87ab-379b-31ed33675668@chil.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <5d0d60df-ee8c-87ab-379b-31ed33675668@chil.at>
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

Hello,

On Tuesday, 17 January 2023 at 00:45 (+0100), Christoph Loesch wrote:
>I use a separate mail-address for every site/contact who wants my 
>mail-address. Just checked my spam-folder and what do I see? a mail 
>from janisa@onertronics.com to my wireguard mail-address which I use 
>only for this mailinglist. So I guess janisa@onertronics.com is 
>collecting mail-addresses here and then sending unwanted spam-mails.

It's nothing so complicated: the wireguard list is publicly archived 
online, addresses included (with minor obfuscation).

An example: 
https://lists.zx2c4.com/pipermail/wireguard/2019-July/004276.html

Jaron
