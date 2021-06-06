Return-Path: <SRS0=ObIi=LA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90FC7C47096
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  6 Jun 2021 12:39:57 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 681AE60C40
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  6 Jun 2021 12:39:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 681AE60C40
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fiberdirekt.se
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5f9a7a4e;
	Sun, 6 Jun 2021 12:37:37 +0000 (UTC)
Received: from smtp.layermesh.se (<unknown>
 [2a02:470:2a02:0:1089:95ff:fe7f:cb6e])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a6b2176e
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 6 Jun 2021 11:14:21 +0000 (UTC)
Received: from [192.168.86.23] (h-213-164-217-234.A357.priv.bahnhof.se
 [213.164.217.234]) (Authenticated sender: peter@fiberdirekt.se)
 by smtp.layermesh.se (Postfix) with ESMTPSA id 18DC320613E
 for <wireguard@lists.zx2c4.com>; Sun,  6 Jun 2021 11:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fiberdirekt.se;
 s=dkim; t=1622978061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3wz3QePgx5A8XYQub1HurTcV/WtOkvf3BrtpxiK31ng=;
 b=kXYEpiD9abgkpALp3UXJcVyuZv3xpsJaEwRKyvLwco+ftlPC3bmo3VqFvS4klJcUS6I4cc
 GkT65/6U8sGFJxHqATG3ZeBl9jqb2JNoer4J0wCwFMe3B1IeBbpYBRhUmamNbNDvLbtW1l
 mrJMT4x0E9R72tMhZZLPH1aC4tXwwLU=
Subject: Re: potentially disallowing IP fragmentation on wg packets, and
 handling routing loops better
To: wireguard@lists.zx2c4.com
References: <CAHmME9rNnBiNvBstb7MPwK-7AmAN0sOfnhdR=eeLrowWcKxaaQ@mail.gmail.com>
From: Peter Linder <peter@fiberdirekt.se>
Message-ID: <e86a2a76-1ff2-2272-f67b-555f36d8b444@fiberdirekt.se>
Date: Sun, 6 Jun 2021 13:14:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAHmME9rNnBiNvBstb7MPwK-7AmAN0sOfnhdR=eeLrowWcKxaaQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Mailman-Approved-At: Sun, 06 Jun 2021 12:37:36 +0000
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

This would break things for me. We're doing a lot of L2 over L3 site to 
site stuff and we are using wireguard as the outer layer. Inner layer is 
vxlan or l2tpv3.

In particular, people connect lots of stuff with no regard for MTU. For 
some things it's also very hard to change so we just assume people 
don't. Since the L3 network typically has the same MTU as the inner L2 
network, we need fragmentation. There is no practical way to be able to 
tell hosts on the L2 network about the limited mtu, for all we know they 
don't even run IP....

It really does work without a hassle, it is not very very slow at all. 
Performance is down perhaps by a factor of 3 compared to setting a 
smaller MTU/MSS, but we can still push 350mbit/s with an atom 2ghz cpu, 
and around 800mbit/s with a xeon cpu, with fragmentation for most 
packets. This is one case where wireguard really works well!

IMHO, having wireguard generating fragmentable packets adds a lot to its 
usefulness. With that said, it's not the end of the world for me as I 
can just compile my own but I'd rather not :-)


On 2021-06-06 11:13, Jason A. Donenfeld wrote:
> Hi,
>
> WireGuard is an encrypted point-to-multipoint tunnel, where onion
> layering of packets via a single interface or multiple is a useful
> feature. This makes handling routing loops very hard to manage and
> detect. I'm considering changing and simplifying loop mitigation to a
> different strategy, but not without some discussion of its
> implications.
>
> Specifically the change would be to not allow IP fragmentation of the
> encrypted UDP packets. This way, in the case of a loop, eventually the
> packet size exceeds MTU, and it gets dropped: dumb and effective.
> Depending on how this discussion goes, a compromise would be to not
> allow fragmentation, but only for forwarded and kernel-generated
> packets, not not for locally generated userspace packets. That's more
> complex and I don't like it as much as just disallowing IP
> fragmentation all together.
>
> Pros:
> - It solves the routing loop problem very simply.
> - Usually when people are fragmenting packets like that, things become
> very, very slow anyway, and it'd be better to just stop working
> entirely, so that people adjust their MTU.
> - Is anybody actually relying on this?
>
> Cons:
> - Maybe people are running
> wireguard-over-gre-over-vxlan-over-l2tp-over-pppoe-over-god-knows-what-else,
> and this reduces the MTU to below 1280, yet they still want to put
> IPv6 through wireguard, and are willing to accept the performance
> implications.
> - Some people don't know how to fix their MTUs, and breaking rather
> than just becoming really slow isn't the best outcome there, maybe.
> - Maybe people are relying on this?
>
> Before anybody asks: we're not going to add a knob for this, simply by
> virtue of this being a decision with pros and cons. Please don't bring
> that up.
>
> I'd be very interested in opinions about this. Are there additional
> pros and cons? I know the matter has come up a few times on the list,
> mostly with people _wanting_ fragmentation (I've CCd a few people from
> those threads - Roman, I expect you to vigorously argue the
> pro-fragmentation stance ;-). but I'm not convinced the outcome of
> those threads was correct, other than, "yea, that's easy enough to
> enable." But on the other hand, maybe the cons are real enough we
> should rethink this.
>
> Please let me know thoughts and ideas.
>
> Thanks,
> Jason
