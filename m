Return-Path: <SRS0=ZlE4=N7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0D56C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  9 Sep 2021 01:56:29 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CBD0610E9
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  9 Sep 2021 01:56:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2CBD0610E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=effective-light.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aecce65a;
	Thu, 9 Sep 2021 01:56:27 +0000 (UTC)
Received: from MTA-09-3.privateemail.com (mta-09-3.privateemail.com
 [68.65.122.19])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id eb48b1c6
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 9 Sep 2021 01:56:23 +0000 (UTC)
Received: from mta-09.privateemail.com (localhost [127.0.0.1])
 by mta-09.privateemail.com (Postfix) with ESMTP id DDF701800227;
 Wed,  8 Sep 2021 21:56:20 -0400 (EDT)
Received: from [192.168.0.46] (unknown [10.20.151.225])
 by mta-09.privateemail.com (Postfix) with ESMTPA id F23511800209;
 Wed,  8 Sep 2021 21:56:18 -0400 (EDT)
Date: Wed, 08 Sep 2021 21:56:12 -0400
From: Hamza Mahfooz <someguy@effective-light.com>
Subject: Re: [PATCH] wireguard: convert index_hashtable and pubkey_hashtable
 into rhashtables
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: LKML <linux-kernel@vger.kernel.org>, "David S. Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>, Netdev
 <netdev@vger.kernel.org>, Thomas Graf <tgraf@suug.ch>, Herbert Xu
 <herbert@gondor.apana.org.au>
Message-Id: <OD95ZQ.FW5WHNPSV04F@effective-light.com>
In-Reply-To: <CAHmME9oSo=4BtfO+=327n=gsor5gWcvhzAMS_BpqQ-6=6yxVRA@mail.gmail.com>
References: <20210806044315.169657-1-someguy@effective-light.com>
 <OD24ZQ.IQOQXX8U0YST@effective-light.com>
 <CAHmME9oSo=4BtfO+=327n=gsor5gWcvhzAMS_BpqQ-6=6yxVRA@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
X-Virus-Scanned: ClamAV using ClamSMTP
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

Hey Jason,
On Wed, Sep 8 2021 at 01:27:12 PM +0200, Jason A. Donenfeld 
<Jason@zx2c4.com> wrote:
> - What's performance like? Does the abstraction of rhashtable
> introduce overhead? These are used in fast paths -- for every packet
> -- so being quick is important.

Are you familiar with any (micro)benchmarks (for WireGuard) that, you
believe would be particularly informative in assessing the outlined
performance characteristics?

> - How does this interact with the timing side channel concerns in the
> comment of the file? Will the time required to find an unused index
> leak the number of items in the hash table? Do we need stochastic
> masking? Or is the construction of rhashtable such that we always get
> ball-park same time?

I think the maintainers of rhashtable are best positioned to answer 
these
questions (I have cc'd them).


