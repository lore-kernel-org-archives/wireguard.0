Return-Path: <SRS0=L39c=CA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81343C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 22 Aug 2020 21:15:17 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAF2E207CD
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 22 Aug 2020 21:15:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AAF2E207CD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pallas.us
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 368a9959;
	Sat, 22 Aug 2020 20:48:20 +0000 (UTC)
Received: from telperion.info (<unknown> [2600:3c01::f03c:91ff:fe96:a052])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 80bcd12a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 22 Aug 2020 20:48:17 +0000 (UTC)
Received: from [192.168.127.224] (184-23-8-77.dsl.static.fusionbroadband.com
 [::ffff:184.23.8.77]) (AUTH: LOGIN pallas, )
 by telperion.info with ESMTPSA
 id 000000000004438C.000000005F418AF1.00005003; Sat, 22 Aug 2020 14:15:28 -0700
Subject: Re: Python Wrapper for wireguard-tools
To: wireguard@lists.zx2c4.com
References: <CAF-5xiCzvHFLtLFpw5FNOR5w7=bEBNjDtVgedRjGNzBigk4cZw@mail.gmail.com>
 <CAHmME9qoWSURAqdQJuOdo9xCBgrtENNOGgf_o1uRep66xRWzJw@mail.gmail.com>
From: Derrick Lyndon Pallas <derrick@pallas.us>
Message-ID: <abdfb441-3df9-3ab5-dae2-7ed4f648e40c@pallas.us>
Date: Sat, 22 Aug 2020 14:14:27 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAHmME9qoWSURAqdQJuOdo9xCBgrtENNOGgf_o1uRep66xRWzJw@mail.gmail.com>
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

Andrew, if you'd like help creating a truly cross-platform library in 
python, I'm happy to help. The reasons wgnlpy is currently Netlink-only 
is that I was developing it for a Linux system and pyroute2 didn't 
support Wireguard yet. If embeddable-wg-library supported UAPI and BSD 
too, then hooking it up to Pyhton via CFFI would make a lot of sense, 
and I'm potentially able to help with that as well. ~Derrick


On 8/22/20 12:05 PM, Jason A. Donenfeld wrote:
> Hey Andrew,
>
> The most complete "library" is actually the wgctrl-go one from Matt
> (CC'd). It's complete because it supports all the same interfaces as
> wg(8) -- Linux Netlink, OpenBSD IOCTL, and x-platform UAPI. The
> embeddable-wg-library is just for Linux Netlink, but I should maybe
> refactor that to be more modular. And as you pointed out, the wgnlpy
> stuff is Netlink also.
>
> If you wanted to start a new cross-platform library, and essentially
> "clone" Matt's Go library into a pure Python one, I'd certainly
> welcome that effort and would be happy to help.
>
> Jason
