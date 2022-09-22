Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83AC9ECAAD8
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 22 Sep 2022 20:55:04 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 0ab6570f;
	Thu, 22 Sep 2022 20:55:02 +0000 (UTC)
Received: from mail.onetrix.net (eleanor.onetrix.net [86.59.13.171])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 8b246c12
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 22 Sep 2022 20:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=chil.at;
 s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=s9cFtR4l5HbAOKAa3IcQCFCL4ELPBUq27eUX8kn/MRo=; b=c1o8GAJx7K+3eiH4CDJGK1Amj/
 A+gC3xbZNcpn7208WHYk/kvG/AmP5wNoIP1f4sZIx0H+8XotFvwCuIX4cdYAKMr4gFTkWnBveInFN
 Vv1eeAiIEUVWHKtFZMxJihWFtFataoZ1Hgle+J/e5HJ6G2hGoZ/DMs702VBswO1GzGmY=;
Received: from [10.5.44.225] (port=33723 helo=mail.onetrix.net)
 by mail.onetrix.net with esmtps (TLS1) tls TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA
 (Exim 4.95) (envelope-from <mail@chil.at>) id 1obTDS-0008QL-0H;
 Thu, 22 Sep 2022 22:54:58 +0200
Received: from [172.22.0.123] (193.238.156.229) by mail.onetrix.net
 (10.5.44.225) with Microsoft SMTP Server (TLS) id 14.1.438.0; Thu, 22 Sep
 2022 22:54:20 +0200
Message-ID: <2bcbfaf2-5fb0-af88-8417-a90b5fe57a08@chil.at>
Date: Thu, 22 Sep 2022 22:54:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: WireGuard App on Android allows only one connection simultaneously
To: Simon Rozman <simon@rozman.si>, WireGuard mailing list
 <wireguard@lists.zx2c4.com>
References: <62cc526e-7b02-3529-d575-87434af15bd3@chil.at>
 <30014af580cd42edba0121c0d6b99add@rozman.si>
From: Christoph Loesch <wireguard-mail@chil.at>
In-Reply-To: <30014af580cd42edba0121c0d6b99add@rozman.si>
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

(thanks to mohammad who pointed me in the right direction)

Am 21.09.2022 um 10:29 schrieb Simon Rozman:
> Unfortunately, this is a limitation of Android OS supporting only 1 (one) VPN connection at a time.

Note: Limitation of not rooted devices. The app works with userspace backend until you root your device.

Once rooted you need to allow root-access to the app (it asks for root if your device is rooted) and then you can enable the use of kernel module/backend in advanced settings.
Then enable option for multiple tunnels at the same time.
Maybe it's worth to put hint for that in the app?

Works great so far.
(Sure, you have to keep an eye on used IP-ranges/routes that could be same on different tunnels what could result in unexpected behaviour when used simultaneously.)

Thank you very much and kind regards!
Christoph

