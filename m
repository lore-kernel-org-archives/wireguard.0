Return-Path: <SRS0=byLw=NS=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9353FC432BE
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 27 Aug 2021 21:55:21 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2AB460C40
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 27 Aug 2021 21:55:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D2AB460C40
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pineview.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 47baa804;
	Fri, 27 Aug 2021 21:54:23 +0000 (UTC)
Received: from mail.pineview.net (mail.pineview.net [203.33.246.11])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6a6409b0
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 27 Aug 2021 21:54:19 +0000 (UTC)
Received: from airtime.pineview.net (airtime.pineview.net [203.33.246.51])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.pineview.net (Postfix) with ESMTPSA id 2A39D8002B;
 Sat, 28 Aug 2021 07:24:16 +0930 (ACST)
Subject: Re: [Warning: DMARC Fail Email] Re: ipv6 connexion fail - ipv4 OK
To: Roman Mamedov <rm@romanrm.net>
Cc: Daniel <tech@tootai.net>, wireguard@lists.zx2c4.com
References: <ec8fe61d-06a9-9544-ab2c-3dfc26905d74@tootai.net>
 <e4b50341-6f90-92fe-7728-a518768a1b51@tootai.net>
 <20210827211412.3ed5f170@natsu>
 <3ec547c6-c846-e5be-e276-ace7862f5cb7@tootai.net>
 <34d4341c-98be-b754-af8e-c7097bc21aac@pineview.net>
 <20210828024454.1766744f@natsu>
From: Mike O'Connor <mike@pineview.net>
Message-ID: <18028d40-be81-f80b-31a2-d9ba15486dff@pineview.net>
Date: Sat, 28 Aug 2021 07:24:16 +0930
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210828024454.1766744f@natsu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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

root@gw:~# ping -M do -s 1472 13.17.1.2
PING 103.127.123.217 (13.17.1.2) 1472(1500) bytes of data.
1480 bytes from 13.17.1.2: icmp_seq=1 ttl=60 time=7.93 ms

Link can transmit a max of 1500 bytes as seen above.

Pinging a LAN segment has the same limit. ie PC to PC has the same result.

Mike

On 28/8/21 7:14 am, Roman Mamedov wrote:
> On Sat, 28 Aug 2021 07:05:45 +0930
> Mike O'Connor <mike@pineview.net> wrote:
>
>> On a 1500 link I'm having to use 1280 to get ipv6 to successfully go
>> over a wireguard link.
> Then it is not a true 1500 MTU link, something in-between drops packets at a
> lower bar. Or maybe not all of them, but just UDP, for example.
>
> But yeah, 1280 is worth trying as well, maybe Daniel has a similar issue.
>
> As for me I am using MTU 1412 WG over IPv6 on a 1492 MTU underlying link just
> fine.
>
>> I really think wireguard should be able to fragment and send via
>> multiply UDP packets.
> It is able to, as long as the underlying link MTU is set to a correct value
> (i.e. where largest-sized packets actually go through, and not get silently
> dropped).
>

