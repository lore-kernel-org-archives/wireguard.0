Return-Path: <SRS0=zPJk=RR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F985C43381
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 Mar 2019 12:42:40 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0AD82085A
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 Mar 2019 12:42:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0AD82085A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=wolff.to
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 56eabab6;
	Thu, 14 Mar 2019 12:30:53 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e1d20a9c
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Mar 2019 12:30:51 +0000 (UTC)
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id 786ab34b
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Mar 2019 12:30:51 +0000 (UTC)
Received: (qmail 21025 invoked by uid 500); 14 Mar 2019 12:41:34 -0000
Date: Thu, 14 Mar 2019 07:41:34 -0500
From: Bruno Wolff III <bruno@wolff.to>
To: Aleksa Sarai <cyphar@cyphar.com>
Subject: Re: [PATCH] net/netfilter/nf_nat_core.h was removed by
 d2c5c103b1337f590b7edf1509a6e294bdf22402
Message-ID: <20190314124134.GB20943@wolff.to>
References: <20190314052150.9968-1-bruno@wolff.to>
 <20190314053402.GA10226@wolff.to>
 <20190314071024.i2iz6l4rc3jnlzaq@yavin>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190314071024.i2iz6l4rc3jnlzaq@yavin>
User-Agent: Mutt/1.11.3 (2019-02-01)
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

On Thu, Mar 14, 2019 at 18:10:24 +1100,
  Aleksa Sarai <cyphar@cyphar.com> wrote:
>
>For future reference, you want to send a patch series. The way I do it
>is I first generate all of the patches:

Thanks. That isn't what I was trying to do here, but something I might 
do in the future. Here the two patches were separate, nit part of the 
series. I got confused in that I thought the mail wasn't getting set 
and tried a few different varients of the --smtp-server= option, most 
of which actually worked.

>You're also missing a Signed-off-by:, but I'm not sure if WireGuard
>contributions require those (you can add them with `git commit -s`).

Can you set up your config to do that automatically or are you supposed 
to do that manually for each commit to make sure you really mean it?

In this case, one patch is trivial and the other needs to be reworked, 
so I doubt it matters.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
