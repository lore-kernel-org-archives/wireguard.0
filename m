Return-Path: <SRS0=dNI2=CI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MISSING_HEADERS,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 204C5C433E6
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 30 Aug 2020 19:08:54 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C104206F0
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 30 Aug 2020 19:08:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C104206F0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=attglobal.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 50cffc1c;
	Sun, 30 Aug 2020 18:41:07 +0000 (UTC)
Received: from p-impout009.msg.pkvw.co.charter.net
 (p-impout009aa.msg.pkvw.co.charter.net [47.43.26.140])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7a42e9ca
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 30 Aug 2020 18:41:04 +0000 (UTC)
Received: from [192.168.0.2] ([76.91.204.161]) by cmsmtp with ESMTP
 id CSh6ksI5xUue7CSh6k1W2a; Sun, 30 Aug 2020 19:08:48 +0000
X-Authority-Analysis: v=2.3 cv=L+tjvNb8 c=1 sm=1 tr=0
 a=rO8gbEbqGp3jIVlhlq3uIg==:117 a=rO8gbEbqGp3jIVlhlq3uIg==:17
 a=9cW_t1CCXrUA:10 a=IkcTkHD0fZMA:10 a=WLa_mtXEAAAA:8 a=ixSCtzIcAAAA:8
 a=9cmSncGCmKH7UDkAqL0A:9 a=QEXdDO2ut3YA:10 a=EV0Lc5ytfEaUyLVsVcpp:22
 a=oQ0gnUCo5Tw1gEWM_Cpr:22
Subject: Re: AllowedIPs
Cc: wireguard@lists.zx2c4.com
References: <f4484f4c-d744-48ad-b78f-c6005936d60e@www.fastmail.com>
 <CA+oXxS0r9iMFC32SHweKEiersLVxNQrxopQs+EEsomwGyNGZgw@mail.gmail.com>
From: Eddie <stunnel@attglobal.net>
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <7522bb20-c067-0bed-2d55-5bfa08d5b205@attglobal.net>
Date: Sun, 30 Aug 2020 12:08:46 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CA+oXxS0r9iMFC32SHweKEiersLVxNQrxopQs+EEsomwGyNGZgw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CMAE-Envelope: MS4wfA0aGABlWOCFnpqE6qwra+B5wADilKqQ1zeuohAN0cYcHeIVxuExpezr6IU+dVpfhA/4G2wZnD867R3X9kInUL4aHxr842j+bwmRKa0mCK8iM0DlVj9L
 /ax3DsnuHJmCX9GSMsETcw5gxReDRm/KY7NzBx9MYZUcnbWUG84KYHyjiXJC9xtdMlhiSBoCD4CVvw==
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
Reply-To: stunnel@attglobal.net
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Wouldn't using Table = off do everything you need, without touching the 
routing.

Cheers.

On 8/30/2020 1:56 AM, Aaron Bolton wrote:
> Yes, this does thanks
>
> I plan on using Quagga for BGP over WireGuard tunnels so I guess I
> need to avoid wg-quick if that makes changes to the routing table and
> firewall as I want to manage those my self
>
>> On 30 Aug 2020, at 00:16, Eric Light <eric@ericlight.com> wrote:
>>
>> ﻿I believe it's both, in a way.
>>
>> As far as wg is concerned, the AllowedIPs is effectively an ACL.  Any traffic hitting your wireguard interface from an IP not within the AllowedIPs will either be dropped on decryption, or won't even be decrypted.  (It's one of these, but I can't remember which)
>>
>> On top of that, wg-quick interprets the AllowedIPs string and does other things, such as adding appropriate network routing (the second part of your guess), as well as modifying any client firewall rules to permit the traffic.
>>
>> Hope this helps  :)
>>
>> E
>>
>> --------------------------------------------
>> Q: Why is this email five sentences or less?
>> A: http://five.sentenc.es
>>
>>> On Sun, 30 Aug 2020, at 04:07, Aaron Bolton wrote:
>>> I’m trying to understand AllowedIPs better is it effectively a ACL
>>> that day what is allowed down the tunnel or is it mechanism to
>>> configure what addresses get routed down the tunnel?
>>>
>>> Thanks in advance
>>>

