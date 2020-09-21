Return-Path: <SRS0=UBEJ=C6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09E06C43466
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 21 Sep 2020 15:19:27 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95DEA20756
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 21 Sep 2020 15:19:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95DEA20756
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pallas.us
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fdaca0ee;
	Mon, 21 Sep 2020 14:47:36 +0000 (UTC)
Received: from telperion.info (<unknown> [2600:3c01::f03c:91ff:fe96:a052])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 280dedae
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 21 Sep 2020 14:47:34 +0000 (UTC)
Received: from [192.168.127.224] (184-23-8-77.dsl.static.fusionbroadband.com
 [::ffff:184.23.8.77]) (AUTH: LOGIN pallas, )
 by telperion.info with ESMTPSA
 id 00000000000441E4.000000005F68C452.00006B44; Mon, 21 Sep 2020 08:18:41 -0700
Subject: Re: Interest in adding multicast support to Wireguard?
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <9b4ba85a-633a-04ed-ca15-eb29d476cd57@pallas.us>
 <CAHmME9rU3AhppjN+6OM8vYHHbpK1Fxj2chVCCyHQBL-XvKk2uA@mail.gmail.com>
From: Derrick Lyndon Pallas <derrick@pallas.us>
Message-ID: <e5031f21-01ee-d3f1-fc27-4140fc1da363@pallas.us>
Date: Mon, 21 Sep 2020 08:17:37 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAHmME9rU3AhppjN+6OM8vYHHbpK1Fxj2chVCCyHQBL-XvKk2uA@mail.gmail.com>
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

On 9/21/20 4:24 AM, Jason A. Donenfeld wrote:

> We've discussed this extensively and repeatedly. I made a few
> proposals a few years ago that we discussed. It doesn't fit into
> WireGuard's strong binding model.
>
> Jason

As I mentioned, I looked through the archives before starting this 
thread. Specifically, I looked for mentions of multicast and followed 
the threads, but I didn't find a concrete resolution. Maybe I missed 
something.

I understand the theoretical argument. However, the practical 
implication is that a widely deployed discovery mechanism on at least 
one very population hardware platform is hamstrung without jumping 
through pretty significant accounting hoops.

Given the other responses to this thread, it sounds like there is 
interest in an opt-in feature but that a pull request would likely not 
be accepted. Have I misunderstood?

~Derrick


