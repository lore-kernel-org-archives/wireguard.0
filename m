Return-Path: <SRS0=veHU=KP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90772C433ED
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 20 May 2021 13:49:09 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 677BE611AB
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 20 May 2021 13:49:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 677BE611AB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=i-love.sakura.ne.jp
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ebafc2ea;
	Thu, 20 May 2021 13:49:07 +0000 (UTC)
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id af8db543
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 20 May 2021 05:02:48 +0000 (UTC)
Received: from fsav107.sakura.ne.jp (fsav107.sakura.ne.jp [27.133.134.234])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 14K5228p049599;
 Thu, 20 May 2021 14:02:02 +0900 (JST)
 (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav107.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav107.sakura.ne.jp);
 Thu, 20 May 2021 14:02:02 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav107.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 14K522Xq049596
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 20 May 2021 14:02:02 +0900 (JST)
 (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: [syzbot] BUG: MAX_LOCKDEP_KEYS too low! (2)
To: Dmitry Vyukov <dvyukov@google.com>, Randy Dunlap <rdunlap@infradead.org>, 
 David Miller <davem@davemloft.net>
Cc: syzbot <syzbot+a70a6358abd2c3f9550f@syzkaller.appspotmail.com>,
 Peter Zijlstra <peterz@infradead.org>, "Jason A. Donenfeld"
 <Jason@zx2c4.com>,
 Jakub Kicinski <kuba@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 netdev <netdev@vger.kernel.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <0000000000003687bd05c2b2401d@google.com>
 <CACT4Y+YJDGFN4q-aTPritnjjHEXiFovOm9eO6Ay4xC1YOa5z3w@mail.gmail.com>
 <c545268c-fe62-883c-4c46-974b3bb3cea1@infradead.org>
 <CACT4Y+aEtYPAdrU7KkE303yDw__QiG7m1tWVJewV8C_Mt9=1qg@mail.gmail.com>
From: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <208cd812-214f-ef2f-26ec-cc7a73953885@i-love.sakura.ne.jp>
Date: Thu, 20 May 2021 14:02:00 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CACT4Y+aEtYPAdrU7KkE303yDw__QiG7m1tWVJewV8C_Mt9=1qg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 20 May 2021 13:49:03 +0000
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

On 2021/05/20 5:09, Dmitry Vyukov wrote:
> On Wed, May 19, 2021 at 9:58 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>>
>> On 5/19/21 12:48 PM, Dmitry Vyukov wrote:
>>> On Wed, May 19, 2021 at 7:35 PM syzbot
>>> <syzbot+a70a6358abd2c3f9550f@syzkaller.appspotmail.com> wrote:
>>>>
>>>> Hello,
>>>>
>>>> syzbot found the following issue on:
>>>>
>>>> HEAD commit:    b81ac784 net: cdc_eem: fix URL to CDC EEM 1.0 spec
>>>> git tree:       net
>>>> console output: https://syzkaller.appspot.com/x/log.txt?x=15a257c3d00000
>>>> kernel config:  https://syzkaller.appspot.com/x/.config?x=5b86a12e0d1933b5
>>>> dashboard link: https://syzkaller.appspot.com/bug?extid=a70a6358abd2c3f9550f
>>>>
>>>> Unfortunately, I don't have any reproducer for this issue yet.
>>>>
>>>> IMPORTANT: if you fix the issue, please add the following tag to the commit:
>>>> Reported-by: syzbot+a70a6358abd2c3f9550f@syzkaller.appspotmail.com
>>>>
>>>> BUG: MAX_LOCKDEP_KEYS too low!
>>>
>>
>> include/linux/lockdep.h
>>
>> #define MAX_LOCKDEP_KEYS_BITS           13
>> #define MAX_LOCKDEP_KEYS                (1UL << MAX_LOCKDEP_KEYS_BITS)
> 
> Ouch, so it's not configurable yet :(

I didn't try to make this value configurable, for

> Unless, of course, we identify the offender that produced thousands of
> lock classes in the log and fix it.

number of currently active locks should decrease over time.
If this message is printed, increasing this value unlikely helps.

We have https://lkml.kernel.org/r/c099ad52-0c2c-b886-bae2-c64bd8626452@ozlabs.ru
which seems to be unresolved.

Regarding this report, cleanup of bonding device is too slow to catch up to
creation of bonding device?

We might need to throttle creation of BPF, bonding etc. which involve WQ operation for clean up ?
