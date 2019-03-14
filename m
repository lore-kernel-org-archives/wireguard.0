Return-Path: <SRS0=zPJk=RR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EB9BC43381
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 Mar 2019 20:06:45 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B85BF2082F
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 Mar 2019 20:06:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B85BF2082F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=wolff.to
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1d2923cf;
	Thu, 14 Mar 2019 19:55:11 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 14caee26
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Mar 2019 19:55:08 +0000 (UTC)
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id 32fa1eab
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Mar 2019 19:55:08 +0000 (UTC)
Received: (qmail 24338 invoked by uid 500); 14 Mar 2019 20:05:50 -0000
Date: Thu, 14 Mar 2019 15:05:49 -0500
From: Bruno Wolff III <bruno@wolff.to>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH] Merge two rcu types
Message-ID: <20190314200549.GA23870@wolff.to>
References: <20190314051608.9798-1-bruno@wolff.to>
 <20190314123211.GA20943@wolff.to> <20190314171033.GB23073@wolff.to>
 <CAHmME9r-CrGs8JFPnWSkd8kKwgJqokOwFbi5g_DfVk+MKFXPzQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHmME9r-CrGs8JFPnWSkd8kKwgJqokOwFbi5g_DfVk+MKFXPzQ@mail.gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On Thu, Mar 14, 2019 at 12:58:41 -0600,
  "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:
>IIRC, the _bh variant of those functions has been aliased to non-_bh
>since a few versions. Do you know the first time it was the same?

At this point I don't know. I knew of the change because I usually like to 
watch Paul's talks and watched his LCA talk not too long ago. I got the 
impression that he started working on the change in the last year, so it 
probably doesn't go back too many kernels.

I should be able to look at this some this weekend. It might be beyond my skill 
to do acceptibly, but I'm interested in giving it a shot. rc1 won't be out 
until the end of the weekend so there is a bit of time yet.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
