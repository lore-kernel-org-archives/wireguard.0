Return-Path: <SRS0=0coH=VP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9230DC76191
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 18 Jul 2019 06:56:46 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2439E21019
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 18 Jul 2019 06:56:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2439E21019
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=romanrm.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 65b49a94;
	Thu, 18 Jul 2019 06:56:18 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7f483347
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jul 2019 06:56:17 +0000 (UTC)
Received: from len.romanrm.net (len.romanrm.net [IPv6:2001:41d0:1:8055::1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 35085941
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jul 2019 06:56:17 +0000 (UTC)
Received: from natsu (unknown [IPv6:fd39::e99e:8f1b:cfc9:ccb8])
 by len.romanrm.net (Postfix) with SMTP id 2712220283;
 Thu, 18 Jul 2019 06:56:15 +0000 (UTC)
Date: Thu, 18 Jul 2019 11:56:14 +0500
From: Roman Mamedov <rm@romanrm.net>
To: Janne Johansson <icepic.dz@gmail.com>
Subject: Re: Speed on Raspberry Pi 4
Message-ID: <20190718115614.60b7927a@natsu>
In-Reply-To: <CAA6-MF8gzQOdo9qxhpBJdcOUZ57bfdA8fCPZTi15XbYvG1pATA@mail.gmail.com>
References: <CAKJniYRn7ZkV9tGOpK=mZoDb24TfMyq44zgE0c5uPo+Ac-sZsA@mail.gmail.com>
 <20190718015027.00e6010f@natsu>
 <CAA6-MF8gzQOdo9qxhpBJdcOUZ57bfdA8fCPZTi15XbYvG1pATA@mail.gmail.com>
MIME-Version: 1.0
Cc: Christopher Bachner <hello@chrisbox.org>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
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

On Thu, 18 Jul 2019 08:38:54 +0200
Janne Johansson <icepic.dz@gmail.com> wrote:

> With taskset you should be able to:
> https://www.howtoforge.com/linux-taskset-command/

It appears "taskset" only works on regular programs, not kernel threads:

# taskset -p -c 1 2128
pid 2128's current affinity list: 0
taskset: failed to set pid 2128's affinity: Invalid argument

# taskset -p -c 1 2129
pid 2129's current affinity list: 1
taskset: failed to set pid 2129's affinity: Invalid argument

As the above shows, WG threads are already bound to a particular CPU and this
can't be changed.

-- 
With respect,
Roman
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
