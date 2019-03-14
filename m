Return-Path: <SRS0=zPJk=RR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B31EC43381
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 Mar 2019 17:11:25 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AAE321855
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 Mar 2019 17:11:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AAE321855
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=wolff.to
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0abafdc4;
	Thu, 14 Mar 2019 16:59:53 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 66dbaba9
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Mar 2019 16:59:51 +0000 (UTC)
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id 685bb5c6
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Mar 2019 16:59:51 +0000 (UTC)
Received: (qmail 23136 invoked by uid 500); 14 Mar 2019 17:10:33 -0000
Date: Thu, 14 Mar 2019 12:10:33 -0500
From: Bruno Wolff III <bruno@wolff.to>
To: wireguard@lists.zx2c4.com
Subject: Re: [PATCH] Merge two rcu types
Message-ID: <20190314171033.GB23073@wolff.to>
References: <20190314051608.9798-1-bruno@wolff.to>
 <20190314123211.GA20943@wolff.to>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190314123211.GA20943@wolff.to>
User-Agent: Mutt/1.11.3 (2019-02-01)
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

On Thu, Mar 14, 2019 at 07:32:11 -0500,
  Bruno Wolff III <bruno@wolff.to> wrote:
>
>In case it isn't obvious, the patch I supplied is only good for 5.1+ 
>kernels. I'm not sure how you wanted to handle doing compatibility for 
>older kernels and didn't even have a good idea how to start.

If I want to try to rework this myself so that the main code is going to 
be usable upstream, but it still works with older kernels, is there a 
suggested approach. Using the old names in the main code using macros 
to make it work isn't going to fly upstream. I'm not sure that replicating 
large chunks of code in compat is a good idea either.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
