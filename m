Return-Path: <SRS0=P56g=HA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 689A3C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 29 Jan 2021 00:39:33 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6678461481
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 29 Jan 2021 00:39:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6678461481
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pineview.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dd70d973;
	Fri, 29 Jan 2021 00:39:27 +0000 (UTC)
Received: from mail.pineview.net (mail.pineview.net [203.33.246.11])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2f85abb5
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 29 Jan 2021 00:39:25 +0000 (UTC)
Received: from abovetime.pineview.net (abovetime.pineview.net [203.33.246.37])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.pineview.net (Postfix) with ESMTPSA id 26C0E800B9;
 Fri, 29 Jan 2021 11:09:21 +1030 (ACDT)
Subject: Re: WireGuard for Windows tunnel deactivation after prolonged
 resolution failure during startup
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Joshua Sjoding <joshua.sjoding@scjalliance.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <CALaUSuuB=+ZDTsTaVs-pswd6fsu6CvZgO4b76HPGQZmwxssN0w@mail.gmail.com>
 <CAHmME9q5a1MVUQU3Hr=T32pjoW-=Hz+KyoBvvKgLgwQwWNoCYw@mail.gmail.com>
From: Mike O'Connor <mike@pineview.net>
Message-ID: <af71a4b2-989a-da04-2fa6-9467ec58997f@pineview.net>
Date: Fri, 29 Jan 2021 11:09:20 +1030
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <CAHmME9q5a1MVUQU3Hr=T32pjoW-=Hz+KyoBvvKgLgwQwWNoCYw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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

Hi Jason

I'm not a windows users so can not test, but it seems to me that 
Microsoft have API's to indicate the network status.

This to indicate if there is a connection
https://docs.microsoft.com/en-us/windows/win32/api/wininet/nf-wininet-internetgetconnectedstate
This to indicate if there is route-able service. It seem this is 
deprecated for windows 10.
https://docs.microsoft.com/en-us/windows/win32/api/wininet/nf-wininet-internetcheckconnectiona
There is reference to a win10 version, in the notes.

Not sure if this helps

Cheers
Mike


On 29/1/21 10:53 am, Jason A. Donenfeld wrote:
> Hi Joshua,
>
> Thanks for the bug report. Windows is usually all about heuristics.
> Here's the current algorithm:
>
> - If the system has booted within the last 4 minutes, it retries 40
> times. Otherwise it retries 10 times.
> - If the resolution fails with a temporary error, or if it fails with
> a permanent error but there's no available internet connection, then
> we sleep for 4 seconds and try again.
> - If we try the 40 or 10 times over the 160 or 40 seconds and don't
> succeed, then we fail and shut down the service.
>
> It sounds like that set of heuristics isn't working out so great for
> your use case. How long do those computers usually take to obtain an
> Internet connection? If you could run some estimates on that, and come
> up with some reasonable length of time ("not more than 3 minutes" for
> example) then maybe we could just double that and make it the new
> timeout? Or maybe you have a different idea?
>
> Jason


