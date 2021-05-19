Return-Path: <SRS0=r1yQ=KO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8BD9C433ED
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 May 2021 21:19:12 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1ADDD61244
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 May 2021 21:19:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1ADDD61244
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5b576c8b;
	Wed, 19 May 2021 21:18:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:e::133])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ddba1149
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 19 May 2021 19:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=pa6BrMj2NYTUx+FQfaM5GghsBa5Z3C6LhlWK7oeSwIQ=; b=CZmwYV3jYiu3u0QlcRAzcgEYp6
 N70ofExUBfFF1kwX1ipFzqpMyNGFnVPdiIvNBX2RaByyNGtsyQLk5GMGgB9+JWslTH6SmFTM3yHty
 3zvHdENLmlK1Mb9rPy4qYAuKRRMX63GFMGjnGlN28JXX7oTwMpK92hkCp8O8RBaMMs6+wz0Njge8m
 A6B/mGSWKhyjhnrQ1SvZT14sQWAJoP5aJ+hasMUL07tBlbP8vUWujWFQ1Gwghl2HhebyRezgKhiMW
 6Nbz+I/HWUOeReYO64FxZZGh3DQReLpnehy6prRR+2T22B4xPr7pMyATUFTU1qb8PfN/lrxnLhNqt
 DH+NzPPQ==;
Received: from [2601:1c0:6280:3f0::7376]
 by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1ljSKO-00Fklp-OW; Wed, 19 May 2021 19:58:00 +0000
Subject: Re: [syzbot] BUG: MAX_LOCKDEP_KEYS too low! (2)
To: Dmitry Vyukov <dvyukov@google.com>,
 syzbot <syzbot+a70a6358abd2c3f9550f@syzkaller.appspotmail.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, David Miller
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, netdev <netdev@vger.kernel.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <0000000000003687bd05c2b2401d@google.com>
 <CACT4Y+YJDGFN4q-aTPritnjjHEXiFovOm9eO6Ay4xC1YOa5z3w@mail.gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <c545268c-fe62-883c-4c46-974b3bb3cea1@infradead.org>
Date: Wed, 19 May 2021 12:57:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CACT4Y+YJDGFN4q-aTPritnjjHEXiFovOm9eO6Ay4xC1YOa5z3w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 19 May 2021 21:18:56 +0000
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

On 5/19/21 12:48 PM, Dmitry Vyukov wrote:
> On Wed, May 19, 2021 at 7:35 PM syzbot
> <syzbot+a70a6358abd2c3f9550f@syzkaller.appspotmail.com> wrote:
>>
>> Hello,
>>
>> syzbot found the following issue on:
>>
>> HEAD commit:    b81ac784 net: cdc_eem: fix URL to CDC EEM 1.0 spec
>> git tree:       net
>> console output: https://syzkaller.appspot.com/x/log.txt?x=15a257c3d00000
>> kernel config:  https://syzkaller.appspot.com/x/.config?x=5b86a12e0d1933b5
>> dashboard link: https://syzkaller.appspot.com/bug?extid=a70a6358abd2c3f9550f
>>
>> Unfortunately, I don't have any reproducer for this issue yet.
>>
>> IMPORTANT: if you fix the issue, please add the following tag to the commit:
>> Reported-by: syzbot+a70a6358abd2c3f9550f@syzkaller.appspotmail.com
>>
>> BUG: MAX_LOCKDEP_KEYS too low!
> 

include/linux/lockdep.h

#define MAX_LOCKDEP_KEYS_BITS		13
#define MAX_LOCKDEP_KEYS		(1UL << MAX_LOCKDEP_KEYS_BITS)

Documentation/locking/lockdep-design.rst:

Troubleshooting:
----------------

The validator tracks a maximum of MAX_LOCKDEP_KEYS number of lock classes.
Exceeding this number will trigger the following lockdep warning::

	(DEBUG_LOCKS_WARN_ON(id >= MAX_LOCKDEP_KEYS))

By default, MAX_LOCKDEP_KEYS is currently set to 8191, and typical
desktop systems have less than 1,000 lock classes, so this warning
normally results from lock-class leakage or failure to properly
initialize locks.  These two problems are illustrated below:

> 
> What config controls this? I don't see "MAX_LOCKDEP_KEYS too low" in
> any of the config descriptions...
> Here is what syzbot used:
> 
> CONFIG_LOCKDEP=y
> CONFIG_LOCKDEP_BITS=16
> CONFIG_LOCKDEP_CHAINS_BITS=17
> CONFIG_LOCKDEP_STACK_TRACE_BITS=20
> CONFIG_LOCKDEP_STACK_TRACE_HASH_BITS=14
> CONFIG_LOCKDEP_CIRCULAR_QUEUE_BITS=12
> 
> We already bumped most of these.
> The log contains dump of the lockdep debug files, is there any offender?
> 
> Also looking at the log I noticed a memory safety bug in lockdep implementation:

...

-- 
~Randy

