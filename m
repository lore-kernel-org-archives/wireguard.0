Return-Path: <SRS0=LBMS=NH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE8BAC43214
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 16 Aug 2021 09:53:14 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC96161B7C
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 16 Aug 2021 09:53:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DC96161B7C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=null.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 72f1ba41;
	Mon, 16 Aug 2021 09:53:12 +0000 (UTC)
Received: from b.rekudos.net (b.rekudos.net [2a03:da40:0:3e7::70])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 64da22a2
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 16 Aug 2021 08:15:50 +0000 (UTC)
Received: from localhost (b.rekudos.net [local])
 by b.rekudos.net (OpenSMTPD) with ESMTPA id de3d2139
 for <wireguard@lists.zx2c4.com>;
 Mon, 16 Aug 2021 08:15:49 +0000 (UTC)
Date: Mon, 16 Aug 2021 10:15:49 +0200
From: nomad@null.net
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [ANNOUNCE] WireGuardNT, a high-performance WireGuard
 implementation for the Windows kernel
Message-ID: <20210816081549.GA17757@b.rekudos.net>
References: <YQgrCfqIL2SWfF6G@zx2c4.com>
 <CAHmME9p8WLAzd=W+Z6MKtke5PYb_T6iMbvBFirmCeUQzxycRwQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAHmME9p8WLAzd=W+Z6MKtke5PYb_T6iMbvBFirmCeUQzxycRwQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Mon, 16 Aug 2021 09:53:09 +0000
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

On Fri Aug 13, 2021 at 01:52:39PM +0200, Jason A. Donenfeld wrote:
>this will make it easier for alpha testers to give it a spin and
>report findings. If you have been testing the driver, and it's been
>working well for you, please write in to say so, simply as a signal
>that it is being tested.

No issues on Windows 8.1 so far, using the NT kernel version from
0.4.5.

-- 
Mark Lawrence
