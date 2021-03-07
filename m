Return-Path: <SRS0=93XJ=IF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98A32C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Mar 2021 20:57:27 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4966F64F65
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Mar 2021 20:57:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4966F64F65
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lotz.li
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9803c555;
	Sun, 7 Mar 2021 20:57:23 +0000 (UTC)
Received: from mail.dr-lotz.de (mail.dr-lotz.de [2a01:4f8:161:6ffe::5])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4323fa41
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 7 Mar 2021 20:57:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.dr-lotz.de (Postfix) with ESMTP id 92AE15C4AA
 for <wireguard@lists.zx2c4.com>; Sun,  7 Mar 2021 21:57:21 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dr-lotz.de
Received: from mail.dr-lotz.de ([127.0.0.1])
 by localhost (mail.dr-lotz.de [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uueezoWyr-_V for <wireguard@lists.zx2c4.com>;
 Sun,  7 Mar 2021 21:57:16 +0100 (CET)
Received: from [192.168.42.35] (ipb21b6623.dynamic.kabel-deutschland.de
 [178.27.102.35])
 by mail.dr-lotz.de (Postfix) with ESMTPSA id 8960B5C4A9
 for <wireguard@lists.zx2c4.com>; Sun,  7 Mar 2021 21:57:16 +0100 (CET)
To: wireguard@lists.zx2c4.com
References: <MUGMypO--3-2@tutanota.com>
From: Linus Lotz <linus@lotz.li>
Subject: Re: event for peer connection
Message-ID: <23c4b81c-dc38-bd9a-6e53-42f83f509c24@lotz.li>
Date: Sun, 7 Mar 2021 21:57:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <MUGMypO--3-2@tutanota.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

Hi Frank,
I have created a patch for the linux kernel[1], that notifies you about
changes of the endpoint address over netlink. If you could test it and
give some feedback if it works for you that would be great.


[1] https://lore.kernel.org/patchwork/patch/1366219/

Best Regards,
Linus


Am 24.02.21 um 01:11 schrieb frank.mosch@tutanota.com:
> Hello,
> 
> first thank you all for your great work on Wireguard! 
> 
> We would like to switch to wireguard at work but for our setup we need some automatic configuration based on the clients and their IP numbers. Is there a way to get notified when peers connect or send handshake packets? We'd like to avoid polling as the configuration needs to be done rather quickly on a connect for a pleasant user experience.
> A file in /sys or /proc that can be waited on would be best but listening for netlink events would be useful, too. 
> 
> Servus, Frank
> 
