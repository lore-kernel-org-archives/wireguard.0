Return-Path: <SRS0=OnWR=ZT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D09AC432C0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 09:49:58 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C91220678
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 09:49:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C91220678
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=lists.m7n.se
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6f073183;
	Wed, 27 Nov 2019 09:49:19 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f0ffdf53
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Sep 2019 11:16:33 +0000 (UTC)
Received: from bond.m7n.se (bond.m7n.se [IPv6:2a00:1a28:1251:46:246:28:121:1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ee46839a
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Sep 2019 11:16:33 +0000 (UTC)
Received: from [IPv6:2001:470:de6f:1301:e586:4e35:311d:a4e] (unknown
 [IPv6:2001:470:de6f:1301:e586:4e35:311d:a4e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by bond.m7n.se (Postfix) with ESMTPSA id 37BC1600A357;
 Mon, 30 Sep 2019 11:16:31 +0000 (UTC)
Subject: Re: IPv6 endpoint AND IPv4 fallback endpoint in roadwarrior scenario?
To: Nico Schottelius <nico.schottelius@ungleich.ch>,
 Henning Reich <henning.reich@gmail.com>
References: <71fa7444-07f7-d7da-9a0b-895a27be18bd@bartschnet.de>
 <72539641-4832-70d5-09b5-430a8ab2deae@noc23.de>
 <CAOAVeL0e4JP+T6Z1353UPRmEXL84ZX5MSe+pjTO6xzzn9TB83A@mail.gmail.com>
 <87eezyp6f1.fsf@line.ungleich.ch>
From: mikma.wg@lists.m7n.se
Message-ID: <079444e4-2d89-92d9-f3b3-245a073bb190@m7n.se>
Date: Mon, 30 Sep 2019 13:16:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87eezyp6f1.fsf@line.ungleich.ch>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 27 Nov 2019 10:49:18 +0100
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

On 2019-09-30 09:52, Nico Schottelius wrote:
> 
> At lookup time this works already. The problem is, if the underlying
> network topology changes and you need to reconnect via IPv4, when you
> had IPv6 underlying before.

It doesn't work for me at least not with the Android app. I have a DNS 
name with both AAAA and A records that I use but the app seems to prefer 
IPv4 instead of IPv6. And I also can't detect any fallback to IPv6 if 
ICMP unreachable are sent for the IPv4 handshake attempts.

/Mikma

> 
> This is the feature that is - afaik- not currently implemented in
> wireguard.
> 
> 
> Henning Reich <henning.reich@gmail.com> writes:
> 
>> Should a DNS entry Wirth one
>> AAAA record and one A record solve thus problem? So the OS decide the best
>> way to connect?
>>
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
