Return-Path: <SRS0=zPJk=RR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74B04C43381
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 Mar 2019 12:33:03 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDE98206BA
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 Mar 2019 12:33:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDE98206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=wolff.to
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 03ba8507;
	Thu, 14 Mar 2019 12:21:31 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a8e93b0f
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Mar 2019 12:21:29 +0000 (UTC)
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id 3116bb80
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Mar 2019 12:21:29 +0000 (UTC)
Received: (qmail 20991 invoked by uid 500); 14 Mar 2019 12:32:11 -0000
Date: Thu, 14 Mar 2019 07:32:11 -0500
From: Bruno Wolff III <bruno@wolff.to>
To: wireguard@lists.zx2c4.com
Subject: Re: [PATCH] Merge two rcu types
Message-ID: <20190314123211.GA20943@wolff.to>
References: <20190314051608.9798-1-bruno@wolff.to>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190314051608.9798-1-bruno@wolff.to>
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

On Thu, Mar 14, 2019 at 00:16:08 -0500,
  Bruno Wolff III <bruno@wolff.to> wrote:
>Paul McKenney made it harder to mess up ending rcu sections with an
>incorrect function call by using the same functions to end multiple
>types of rcu sections.

There are a number of commits involved in this change, but this commit 
has a pretty explicit comment about doing the renames I did.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c8d1da4000b0b95bf95d3e13b7450eec5428da1e
netfilter: Replace call_rcu_bh(), rcu_barrier_bh(), and synchronize_rcu_bh()
Now that call_rcu()'s callback is not invoked until after bh-disable
regions of code have completed (in addition to explicitly marked
RCU read-side critical sections), call_rcu() can be used in place
of call_rcu_bh().  Similarly, rcu_barrier() can be used in place of
rcu_barrier_bh() and synchronize_rcu() in place of synchronize_rcu_bh().
This commit therefore makes these changes.

In case it isn't obvious, the patch I supplied is only good for 5.1+ 
kernels. I'm not sure how you wanted to handle doing compatibility for 
older kernels and didn't even have a good idea how to start.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
