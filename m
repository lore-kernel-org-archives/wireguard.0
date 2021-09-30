Return-Path: <SRS0=sRyP=OU=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20684C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Sep 2021 11:11:11 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58B886124C
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Sep 2021 11:11:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 58B886124C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=stdmail.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e9004371;
	Thu, 30 Sep 2021 11:09:11 +0000 (UTC)
Received: from mx1.simplelogin.co (mx1.simplelogin.co [94.237.111.15])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4fb8bc48
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Sep 2021 11:09:10 +0000 (UTC)
X-SimpleLogin-Client-IP: 94.237.111.15
Received: from [172.17.0.3] (mx1.simplelogin.co [94.237.111.15])
 by mx1.simplelogin.co (Postfix) with ESMTP id 33A5A5F814
 for <wireguard@lists.zx2c4.com>; Thu, 30 Sep 2021 11:09:10 +0000 (UTC)
Subject: Feature request - Number of tunnel entries in root of tray icon
 context menu
In-Reply-To: <163287098886.7.7062947333110889290.14414570@simplelogin.co>
References: <163277858699.7.10950010429724590941.14337061@stdmail.de>
 <163287098886.7.7062947333110889290.14414570@simplelogin.co>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
From: wireguard_mailing_list_user@stdmail.de
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Message-ID: <163300015018.6.7640455085114865179.14515199@stdmail.de>
Date: Thu, 30 Sep 2021 11:09:10 -0000
X-SimpleLogin-Type: Reply
X-SimpleLogin-EmailLog-ID: 14515199
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=stdmail.de;
 i=@stdmail.de; q=dns/txt; s=dkim; t=1633000150;
 h=message-id : date :  subject : from : to;
 bh=NHYMx4LNhPzXFo3wfKjyNUKmJb54TpjASKjPBcTcLQs=;
 b=c1fSCX0z1bhnofMxuqW3ee7xckxvGB0CZ27RUsdcLVk/ViuUT86wpzCTxWkBlgtJxkuAz
 zXcvo3oxeCGm5O7CsRihSPZZFeULE5cYhfQGY9goXiRKQyRO5sSEP8ulNAAkIAg/VbZQu2i
 EDZ7OrQxCo13/ayqk3pMIebk7OyM+RQ= 
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

Apart from the problem that I'm not that much into go(lang) that I could=20
provide such a patch myself...

I just don't see the gain that this way would yield because that would=20
just replace one knob with another:
A registry value for a fixed amount of maximum entries or a ratio value=20
(e.g.: 0.33 or 0.4). The ratio would require a knob as well, otherwise=20
the next person comes and asks how to change it because it doesn't fit=20
his needs...

Regards,
Ulf


