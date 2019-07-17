Return-Path: <SRS0=Af8f=VO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B58DC7618F
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jul 2019 20:50:58 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97AFA21872
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jul 2019 20:50:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97AFA21872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=romanrm.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2e923882;
	Wed, 17 Jul 2019 20:50:30 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6c202735
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Jul 2019 20:50:28 +0000 (UTC)
Received: from len.romanrm.net (len.romanrm.net [91.121.75.85])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bb7e1574
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Jul 2019 20:50:28 +0000 (UTC)
Received: from natsu (unknown [IPv6:fd39::e99e:8f1b:cfc9:ccb8])
 by len.romanrm.net (Postfix) with SMTP id CCD3520283;
 Wed, 17 Jul 2019 20:50:27 +0000 (UTC)
Date: Thu, 18 Jul 2019 01:50:27 +0500
From: Roman Mamedov <rm@romanrm.net>
To: Christopher Bachner <hello@chrisbox.org>
Subject: Re: Speed on Raspberry Pi 4
Message-ID: <20190718015027.00e6010f@natsu>
In-Reply-To: <CAKJniYRn7ZkV9tGOpK=mZoDb24TfMyq44zgE0c5uPo+Ac-sZsA@mail.gmail.com>
References: <CAKJniYRn7ZkV9tGOpK=mZoDb24TfMyq44zgE0c5uPo+Ac-sZsA@mail.gmail.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On Sat, 29 Jun 2019 12:38:01 +0200
Christopher Bachner <hello@chrisbox.org> wrote:

> In htop I can see that one of the 4 cores is running at 99%. So I assume
> that is the bottleneck.
> 
> Is there a way to improve this? I assume it does not matter which side is
> the server and which is the client?

You can see that the load from WireGuard encryption is about 42-43% per each
core. But the thing is, one of them (the 1st) also gets to process interrupt
load from the NIC, and that consumes the rest of it, causing the bottleneck. In
theory, if you could limit WG to run encryption on all cores EXCEPT the first
one, then maaaaybe...

Another way would be to use a NIC which is capable of splitting interrupt load
across multiple CPU cores. But I believe the RPi one can't do that, and no USB
NICs can.

-- 
With respect,
Roman
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
