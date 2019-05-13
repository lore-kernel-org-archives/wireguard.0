Return-Path: <SRS0=YdU4=TN=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4550DC04AA7
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 13 May 2019 20:27:07 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0342E20862
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 13 May 2019 20:27:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0342E20862
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=wolff.to
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1aef5659;
	Mon, 13 May 2019 20:27:05 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id af842e27
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 May 2019 20:27:04 +0000 (UTC)
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id b5ee5d9f
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 May 2019 20:27:04 +0000 (UTC)
Received: (qmail 30707 invoked by uid 500); 13 May 2019 20:24:53 -0000
Date: Mon, 13 May 2019 15:24:53 -0500
From: Bruno Wolff III <bruno@wolff.to>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: Working on change for: genetlink: make policy common to family
Message-ID: <20190513202453.GA30656@wolff.to>
References: <20190513195213.GA30315@wolff.to>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190513195213.GA30315@wolff.to>
User-Agent: Mutt/1.11.4 (2019-03-13)
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

On Mon, May 13, 2019 at 14:52:13 -0500,
  Bruno Wolff III <bruno@wolff.to> wrote:
>Wireguard isn't building on 5.2 right now because of commit:
>3b0f31f2b8c9fb348e4530b88f6b64f9621f83d6 genetlink: make policy common to family
>
>I've got Wireguard building, but need to do basic testing, then add a 
>kernel version test in and do some other testing. If that all goes OK 
>I'll submit a signed off patch to the list.
>
>It looks to be a very simple change to netlink.c, but I could have 
>easily missed something subtle.

wg (the config tool) doesn't work with my change, so there probably is more 
needed than just moving .policy to the family structure in the kernel. I'll 
continue looking at it, but it might need someone better than me to look at it 
eventually.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
