Return-Path: <SRS0=+2x1=QC=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 128E8C282C7
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 26 Jan 2019 09:31:06 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 623B1218F0
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 26 Jan 2019 09:31:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 623B1218F0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=biot.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6636b737;
	Sat, 26 Jan 2019 09:25:36 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7abed620
 for <wireguard@lists.zx2c4.com>;
 Sat, 26 Jan 2019 09:25:34 +0000 (UTC)
Received: from yawp.biot.com (yawp.biot.com [IPv6:2a01:4f8:10a:8e::fce2])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ee027005
 for <wireguard@lists.zx2c4.com>;
 Sat, 26 Jan 2019 09:25:34 +0000 (UTC)
Received: from debian-spamd by yawp.biot.com with sa-checked (Exim 4.90_1)
 (envelope-from <bert@biot.com>) id 1gnKIk-0003UE-21
 for wireguard@lists.zx2c4.com; Sat, 26 Jan 2019 10:30:58 +0100
Received: from [2a02:578:460c:1:1202:b5ff:fe34:d938]
 by yawp.biot.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bert@biot.com>) id 1gnKIj-0003UA-Ss
 for wireguard@lists.zx2c4.com; Sat, 26 Jan 2019 10:30:57 +0100
Subject: Re: WireGuard @ FOSDEM -- Meetup
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <CAHmME9oWcFMquF4TuaQ3o1KVN2pBwr4+uyJx4=ujGVtzexzqzw@mail.gmail.com>
From: Bert Vermeulen <bert@biot.com>
Message-ID: <d9fb0c7a-b74f-a4e0-2daa-557adc09c990@biot.com>
Date: Sat, 26 Jan 2019 10:30:57 +0100
MIME-Version: 1.0
In-Reply-To: <CAHmME9oWcFMquF4TuaQ3o1KVN2pBwr4+uyJx4=ujGVtzexzqzw@mail.gmail.com>
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

On 01/25/2019 07:28 PM, Jason A. Donenfeld wrote:
> Hey folks,
> 
> I think I'll head to FOSDEM next weekend. Is there interest on the
> list in some sort of meetup and discussion there? If so, is somebody
> who's familiar with the FODEM ins-and-outs willing to work out finding
> a room and scheduling?

Jason,

You're several months too late for that. However, it's not uncommon for 
"unofficial" developer teams to just occupy a table in one of the 
cafetarias, and just meet up there for however long they want.


-- 
Bert Vermeulen
bert@biot.com
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
