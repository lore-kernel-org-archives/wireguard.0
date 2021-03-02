Return-Path: <SRS0=upWG=IA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 625EAC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  2 Mar 2021 14:31:45 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA30560295
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  2 Mar 2021 14:31:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA30560295
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=lists.m7n.se
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4558a187;
	Tue, 2 Mar 2021 14:31:41 +0000 (UTC)
Received: from smtp2.m7n.se (smtp2.m7n.se [2a07:4580:b0d:1e7::73c8])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id bcaba41b
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 2 Mar 2021 14:31:39 +0000 (UTC)
Received: from [IPv6:2001:470:de17:1200:4887:ded6:c8dc:ac03] (unknown
 [IPv6:2001:470:de17:1200:4887:ded6:c8dc:ac03])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp2.m7n.se (Postfix) with ESMTPSA id BF7ACBD62B;
 Tue,  2 Mar 2021 14:31:58 +0000 (UTC)
Subject: Re: Nested Wireguard tunnels not working on Android and Windows
To: i iordanov <iiordanov@gmail.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <CAMS0tn2Pq65UAVWqjV6mNd1hGqvUxVhVgmR3s2h+kh=XF8jyKA@mail.gmail.com>
 <E8F8664E-3C8A-45B9-B9B8-1A1E2873289B@carmickle.com>
 <65365aa6-cdd0-f9dc-f894-3a040ca596ae@aaronmdjones.net>
 <CAMS0tn0k=7aVstO7Nnn1zZDUypuE2sWidS3uT+04=7rs6+YjGQ@mail.gmail.com>
 <43EFA67E-34E0-4E33-A2FB-EBD42002F1AB@carmickle.com>
 <CAMS0tn2FXkzFHgMgkDwYvD2Fhrxb_PjMNDuV54sL9-ZhTijS7A@mail.gmail.com>
From: mikma.wg@lists.m7n.se
Message-ID: <11abae81-4a87-9016-69a8-e62351a0deba@fox.m7n.se>
Date: Tue, 2 Mar 2021 15:31:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMS0tn2FXkzFHgMgkDwYvD2Fhrxb_PjMNDuV54sL9-ZhTijS7A@mail.gmail.com>
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

On 2021-03-01 21:09, i iordanov wrote:

> Hi Frank,
>
> On Mon, Mar 1, 2021 at 9:42 AM Frank Carmickle <frank@carmickle.com> wrote:
>> Maybe it's a bug and not a feature? It seems to me that you would have no way of setting the MTU on the inner tunnel.
> That's true - other than inefficient packet fragmentation, is there
> anything else that would be an issue?
It's possible to configure the MTU for each route on Linux. (Obviously 
you can't use the extremely simple wg-quick script for this.)
>
>> Is there a reason why you can't try multiple interfaces?
> I cannot bring up more than a single interface on Android. I am not
> sure about interface management on Windows with wg.exe, but
> wireguard.exe certainly does not permit multiple interfaces to be
> brought up.

The WireGuard app on Android also can't use a VPN address as the source 
of WireGuard packets. Only non-VPN addresses are supported.

Which means currently the WireGuard app on Android can't be used for 
nested tunnels.


