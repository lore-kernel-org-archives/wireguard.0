Return-Path: <SRS0=QHSY=WV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD61BC3A5A1
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:30:25 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0814206DD
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:30:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F0814206DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=proxel.se
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d3f12ec7;
	Sun, 25 Aug 2019 15:29:31 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a03793d6
 for <wireguard@lists.zx2c4.com>;
 Sat, 24 Aug 2019 19:01:08 +0000 (UTC)
Received: from kilimanjaro.scorpionshops.com (kilimanjaro.scorpionshops.com
 [82.118.24.81])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 801d2f0e
 for <wireguard@lists.zx2c4.com>;
 Sat, 24 Aug 2019 19:01:08 +0000 (UTC)
Received: from [192.168.1.168] (c-8352e253.143-1-64736c10.bbcust.telenor.se
 [83.226.82.131])
 by kilimanjaro.scorpionshops.com (Postfix) with ESMTPSA id 296157BC80B;
 Sat, 24 Aug 2019 21:01:07 +0200 (CEST)
Subject: Re: Support FIDO2/CTAP2 security tokens as keystore
To: Matthias Urlichs <matthias@urlichs.de>, wireguard@lists.zx2c4.com
References: <9ecf3b0f-a73f-52a3-b7b8-3b96a7e67eab@bartschnet.de>
 <20190818170928.ps2fymkisd4giefv@feather.localdomain>
 <c8accebb-1a7f-7b3e-26b5-2d0b13347fb3@bartschnet.de>
 <8cd089e7-0da9-b69a-2fbb-f961c4803936@urlichs.de>
From: Andreas Karlsson <andreas@proxel.se>
Message-ID: <9e7fce79-f7ae-6018-551c-02727e21a03a@proxel.se>
Date: Sat, 24 Aug 2019 21:01:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <8cd089e7-0da9-b69a-2fbb-f961c4803936@urlichs.de>
Content-Language: en-US
X-Mailman-Approved-At: Sun, 25 Aug 2019 17:29:25 +0200
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On 8/24/19 4:08 PM, Matthias Urlichs wrote:
> Anyone with *root* access to the running machine can do that. They also
> can trivially read the kernel memory (if nothing else, by installing a
> module) and walk the kernel data structures to find the private and/or
> shared key.

No, anyone with root access can only get the shared key used for 
encrypting data, not the actual private key. The private key does never 
leave the device.

Does this add enough extra security to be worth it? No idea. I haven't 
worked much with systems like this, only a little bit with SSL and 
SmartCards.

Andreas
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
