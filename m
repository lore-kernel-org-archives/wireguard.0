Return-Path: <SRS0=Q0ZK=WW=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98C85C3A59F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 26 Aug 2019 14:34:46 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13D652173E
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 26 Aug 2019 14:34:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13D652173E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=proxel.se
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 740ea7b4;
	Mon, 26 Aug 2019 14:34:29 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1895b342
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Aug 2019 14:34:26 +0000 (UTC)
Received: from kilimanjaro.scorpionshops.com (kilimanjaro.scorpionshops.com
 [82.118.24.81])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8c6dec6d
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Aug 2019 14:34:26 +0000 (UTC)
Received: from [192.168.1.168] (c-8352e253.143-1-64736c10.bbcust.telenor.se
 [83.226.82.131])
 by kilimanjaro.scorpionshops.com (Postfix) with ESMTPSA id 6F3ED7BC81F;
 Mon, 26 Aug 2019 16:34:25 +0200 (CEST)
Subject: Re: Support FIDO2/CTAP2 security tokens as keystore
To: Derrick Lyndon Pallas <derrick@pallas.us>
References: <9ecf3b0f-a73f-52a3-b7b8-3b96a7e67eab@bartschnet.de>
 <20190818170928.ps2fymkisd4giefv@feather.localdomain>
 <c8accebb-1a7f-7b3e-26b5-2d0b13347fb3@bartschnet.de>
 <8cd089e7-0da9-b69a-2fbb-f961c4803936@urlichs.de>
 <9e7fce79-f7ae-6018-551c-02727e21a03a@proxel.se>
 <1A226EFF-39DF-4D64-A7D2-3D8B78F7F7FE@pallas.us>
From: Andreas Karlsson <andreas@proxel.se>
Message-ID: <9a6c02ee-ee31-fb34-bbd6-2fc6c5827f90@proxel.se>
Date: Mon, 26 Aug 2019 16:34:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1A226EFF-39DF-4D64-A7D2-3D8B78F7F7FE@pallas.us>
Content-Language: en-US
Cc: wireguard@lists.zx2c4.com
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

On 8/25/19 9:30 PM, Derrick Lyndon Pallas wrote:
> The private key is in kernel memory and is available via netlink and cli.

Obviously, but my assumption was that the reason Rene wanted FIDO 
support was to move the private key out from the kernel memory and into 
an external device. Otherwise there would not be any real benefit from 
using FIDO.

Personally I doubt the benefit you get from moving the private key out 
to an external device would be worth to effort, but then I have no 
interest in FIDO support myself.

Andreas
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
