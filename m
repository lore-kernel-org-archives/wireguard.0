Return-Path: <SRS0=z0pY=WI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CE21C31E40
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 12 Aug 2019 19:40:39 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AB0A20663
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 12 Aug 2019 19:40:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9AB0A20663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=powerneth.ro
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6e34b580;
	Mon, 12 Aug 2019 19:40:21 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6f6ea17e
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Aug 2019 19:40:18 +0000 (UTC)
Received: from mail.insteeldesign.ro (mail.crimel.ro [109.166.220.71])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 36fb56bb
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Aug 2019 19:40:17 +0000 (UTC)
Received: from [10.160.20.20] (unknown [188.24.49.215])
 by mail.insteeldesign.ro (Postfix) with ESMTPSA id 146932218C52
 for <wireguard@lists.zx2c4.com>; Mon, 12 Aug 2019 22:40:15 +0300 (EEST)
Subject: Re: IS-IS routing protocol
To: wireguard@lists.zx2c4.com
References: <37fac6bc-b751-02b3-06f5-61b4823b2a17@powerneth.ro>
 <87mugep5ro.fsf@czerwinskis.de>
From: Lucian Cristian <luci@powerneth.ro>
Message-ID: <2d5555dc-0a78-5556-569a-2accd2cf625a@powerneth.ro>
Date: Mon, 12 Aug 2019 22:40:15 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87mugep5ro.fsf@czerwinskis.de>
Content-Language: en-US
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

On 12.08.2019 22:01, Rouven Czerwinski wrote:
> Hi,
>
> Lucian Cristian <luci@powerneth.ro> writes:
>
>> Has anyone managed to configure IS-IS routing with wireguard interfaces ?
>>
>> I've added multicast address to AllowedIPs (AllowedIPs=224.0.0.0/24) but
>> when I activate ip router isis on the wireguard interface, tcpdump only
>> shows: unknown ip 8
>>
>> expecting to see something like L1 Lan IIH, hlen: 27, v: 1, pdu-v: 1,
>> sys-id-len: 6 (0), max-area: 3 (0)
>>
>> or
>>
>> L2 Lan IIH, hlen: 27, v: 1, pdu-v: 1, sys-id-len: 6 (0), max-area: 3 (0)
> IS-IS uses layer 2 while wireguard only provides layer 3 connectivity.
> IS-IS will not work over wireguard.
>
> Regards,
> Emantor
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard

Is what I feared, thank you !

Lucian

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
